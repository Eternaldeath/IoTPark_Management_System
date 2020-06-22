package com.www.controller;

import com.www.domain.*;
import com.www.service.IReChargeService;
import com.www.service.impl.*;
import com.www.utils.MailUtil;
import com.www.utils.RememberUtil;
import com.www.utils.ShowCar;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/testPage")
public class testController {
    @Autowired
    private com.www.service.impl.loginSercie loginSercie;
    @Autowired
    private VipServiceImpl vipServiceImpl;
    @Autowired
    private OrderServiceImpl orderService;
    @Autowired
    private ParkServiceImpl parkService;
    @Autowired
    private IReChargeService iReChargeService;
    @Autowired
    private IncomeServiceImpl incomeService;

    // runIn 页面检查预定信息情况
    @RequestMapping("/findOrder")
    public @ResponseBody
    int findOrder(@RequestParam("nickname") String nickname){
        Vip nickname1 = vipServiceImpl.findOneVipByNickName(nickname);
        int vipId = nickname1.getId();
        // 是否存在预定订单
        int orderByValidAndId = orderService.findOrderByValidAndId(vipId);
        if(orderByValidAndId>0){
            //修改预定标志位
            // 此处不能修改，因为后面 ajax 利用 isOrder 显示图片
//            orderService.changeIsOrder(nickname1.getLicense());
//            orderService.changeOrderValid(vipId);
            System.out.println("修改了标志位");
            return 2;
        }else{
            Account account = vipServiceImpl.findAccount(nickname);
            if(account.getTotalMoney()>40){
                // 余额扣款
                int submitMoney = account.getTotalMoney()-40;
                vipServiceImpl.updateTotalMoney(submitMoney,nickname);
                // 插入停车消费的记录
                iReChargeService.insertRecharge(nickname,40,3);
                // 总金额增加
                Income income = incomeService.curIncomeInfo();
                income.setTotalIncome(income.getTotalIncome()+40);
                income.setCurdate(income.getCurdate());
                income.setCurIncome(income.getCurIncome()+40);
                income.setParkOneIncome(income.getParkOneIncome()+40);
                income.setParkTwoIncome(income.getParkTwoIncome());
                income.setParkThreeIncome(income.getParkThreeIncome());
                income.setNormalIncome(income.getNormalIncome());
                income.setVipIncome(income.getVipIncome()+40);
                incomeService.updateIncome(income);
                System.out.println("余额扣款完成");
               return 1;
          }else{
                // 插入停车消费的记录
                // 4 表示在线缴费
                // 5 表示普通用户在线缴费
                iReChargeService.insertRecharge(nickname,40,4);
                // 总金额增加
                Income income = incomeService.curIncomeInfo();
                income.setTotalIncome(income.getTotalIncome()+40);
                income.setCurdate(income.getCurdate());
                income.setCurIncome(income.getCurIncome()+40);
                income.setParkOneIncome(income.getParkOneIncome()+40);
                income.setParkTwoIncome(income.getParkTwoIncome());
                income.setParkThreeIncome(income.getParkThreeIncome());
                income.setNormalIncome(income.getNormalIncome());
                income.setVipIncome(income.getVipIncome()+40);
                incomeService.updateIncome(income);
                System.out.println("余额扣款完成");

                return 0;
            }


        }

    }

    // 模拟测试中跳转车位
    @RequestMapping("/testPark")
    public ModelAndView userOrder(){
        // flag 为 2 表示模拟测试

        int flag = 2;
        Map<String,Object> data = new HashMap<String,Object>();
        data.put("flag",flag);
        return new ModelAndView("park", data);
    }

    // ajax 实时更新停车场情况
    @RequestMapping("/test")
    public @ResponseBody int[] test(@RequestParam("parkName") String parkName){
        List<ParkOneInfo> parkOneInfos = null;
        // 查询该停车场当前停车情况
        System.out.println(parkName);
        if(parkName.equals("桂系生态公园园内停车场")){
            parkOneInfos = parkService.parkOneInfo();
            System.out.println(parkOneInfos);
        }

        int[] cars = ShowCar.showCarOnPark(parkOneInfos);
        return cars;
    }

    // 处理模拟事件，修改数据库数据
    // 模拟未预定情况下的停车
    @RequestMapping("/changeParkInfo")
    public @ResponseBody int changeParkInfo(@RequestParam("nickname") String nickname,@RequestParam("lotNum")String lotNum){
        // 修改
        Vip oneVipByNickName = vipServiceImpl.findOneVipByNickName(nickname);
        String license = oneVipByNickName.getLicense();

        int id = Integer.parseInt(lotNum);
        parkService.updateParkLog(id,license);
        System.out.println("数据修改成功");
        return 1;
    }

    // 移除停车事件
    @RequestMapping("/removeParkInfo")
    public @ResponseBody int removeParkInfo(@RequestParam("nickname")String nickname,
                                            @RequestParam("lotNum")String lotNum,
                                            @RequestParam("startTime")String startTime,
                                            @RequestParam("endTime")String endTime,
                                            @RequestParam("targetQQ")String targetQQ) throws GeneralSecurityException, MessagingException {
        int id=0;
        Vip oneVipByNickName = null;
        // 发送邮件帮助类
        MailUtil mailUtil = new MailUtil();
        mailUtil.sendMail(startTime,endTime,targetQQ);
        if(lotNum.equals("已预定")){
            oneVipByNickName = vipServiceImpl.findOneVipByNickName(nickname);
            String lisence = oneVipByNickName.getLicense();
            parkService.removeParkLotByLisence(lisence);
            // 取消预定订单
            orderService.changeOrderValid(oneVipByNickName.getId());
        }
        else{
            id = Integer.parseInt(lotNum);
            parkService.removeParkLog(id);
            System.out.println("数据修改成功");
        }


        return id;
    }

    // 针对预定车辆的停车操作 changeParkInfoByOrder
    @RequestMapping("/changeParkInfoByOrder")
    public @ResponseBody int changeParkInfoByOrder(@RequestParam("nickname") String nickname,@RequestParam("lotNum")String lotNum){
//        int id = Integer.parseInt(lotNum);
//        parkService.removeParkLog(id);
        System.out.println("进入预定车辆停车操作");
        Vip oneVipByNickName = vipServiceImpl.findOneVipByNickName(nickname);
        // 返回预定的停车位序号
        int entailOrder = orderService.findEntailOrder(oneVipByNickName.getId());
        System.out.println("可用订单的车位号"+entailOrder);

        if(entailOrder!=0){
            orderService.changeIsOrder(oneVipByNickName.getLicense());
            System.out.println("外层车位号"+oneVipByNickName.getLicense());
            parkService.updateParkLot(entailOrder);
            // 订单完成
            orderService.changeOrderValid(oneVipByNickName.getId());
            System.out.println("完成车位更新");
        }else{
            return 0;
        }
        return 1;
    }
}
