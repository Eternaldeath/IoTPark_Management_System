package com.www.controller;

import com.www.domain.*;
import com.www.service.IReChargeService;
import com.www.service.impl.*;
import com.www.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/userlogin")
public class UserLogin {
    @Autowired
    private loginSercie loginSercie;
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

    // 控制登录
    @RequestMapping("/userLogin")
    public ModelAndView adminLogin(String nickname, String password, String rememberMe, HttpServletResponse response, HttpSession session) throws UnsupportedEncodingException {
//        System.out.println("表单数据"+nickname+" "+password+" "+rememberMe);
        // 验证管理员权限
        int result = vipServiceImpl.findOneByPn(nickname, password);
        // 返回用户详情
        Vip oneVipByNickName = vipServiceImpl.findOneVipByNickName(nickname);
//        System.out.println(oneVipByNickName);
        // 查询用户订单
        List<Order> myOrder = orderService.findMyOrder(oneVipByNickName.getId());
        // 查询用户订单数
        int allOrderNumInOne = orderService.findAllOrderNumInOne(oneVipByNickName.getId());
        // 用户账户
        Account account = vipServiceImpl.findAccount(nickname);
        // 用户订单详情
//        List<Order> myOrderList = orderService.findOneVipOrder(0,5,oneVipByNickName.getId());

        // 用户订单数
//        int orderOneVipNum = orderService.findAllOrderNumInOne(oneVipByNickName.getId());
        // 用户所有订单
        List<Order> myOrderList = orderService.findMyOrder(oneVipByNickName.getId());

        // 在 session 中增加 nickname
        session.setAttribute("nickname",nickname);
        System.out.println("从seesion取 nickname"+nickname);

        if(rememberMe.equals("on")){
            RememberUtil.rememberCookie(nickname,password,response);
        }

        Map<String,Object> data = new HashMap<String,Object>();
        data.put("oneVipByNickName",oneVipByNickName);
        data.put("myOrder",myOrder);
        data.put("allOrderNumInOne",allOrderNumInOne);
        data.put("account",account);
        data.put("adminName",nickname);
        data.put("myOrderList",myOrderList);
//        data.put("myOrderList",myOrderList);
//        data.put("orderOneVipNum",orderOneVipNum);

        if(result==1){
            return new ModelAndView("userIndex",data);
        }else {
            return new ModelAndView("error", (Map<String, ?>) null);
        }

    }

    // ----菜单跳转----
    // 返回用户首页
    @RequestMapping("/returnUserAdmin")
    public ModelAndView returnAdmin(String nickname,HttpSession session){
        Map<String,Object> data = new HashMap<String,Object>();
        System.out.println("nickname"+nickname);
            nickname = (String) session.getAttribute("nickname");
            System.out.println("取得了nickname"+nickname);
        // 返回用户详情
//        System.out.println(nickname);
        Vip oneVipByNickName = vipServiceImpl.findOneVipByNickName(nickname);
        System.out.println(oneVipByNickName);
        System.out.println(oneVipByNickName.getId());
        // 查询用户订单
//        if (orderService.findMyOrder(oneVipByNickName.getId())==null){
//            int myOrder = 0;
//            data.put("myOrder",myOrder);
//        }else {
//            List<Order> myOrder = orderService.findMyOrder(oneVipByNickName.getId());
//            data.put("myOrder",myOrder);
//        }
        // 查询用户订单数
        int allOrderNumInOne = orderService.findAllOrderNumInOne(oneVipByNickName.getId());
        // 用户账户
        Account account = vipServiceImpl.findAccount(nickname);
        // 用户订单详情
//        List<Order> myOrderList = orderService.findOneVipOrder(0,5,oneVipByNickName.getId());
        // 用户订单数
//        int orderOneVipNum = orderService.findAllOrderNumInOne(oneVipByNickName.getId());
        // 用户所有订单
        List<Order> myOrderList = orderService.findMyOrder(oneVipByNickName.getId());



        data.put("oneVipByNickName",oneVipByNickName);

        data.put("allOrderNumInOne",allOrderNumInOne);
        data.put("account",account);
        data.put("adminName",nickname);
        data.put("myOrderList",myOrderList);
//        data.put("orderOneVipNum",orderOneVipNum);

        return new ModelAndView("userIndex",data);
    }

    // 跳转用户信息修改页面

    @RequestMapping("/userInformationchange")
    public ModelAndView userInformationchange(String nickname,HttpSession session){

            nickname = (String) session.getAttribute("nickname");

        // 返回用户详情
//        System.out.println(nickname);
        Vip oneVipByNickName = vipServiceImpl.findOneVipByNickName(nickname);


        Map<String,Object> data = new HashMap<String,Object>();
        data.put("oneVipByNickName",oneVipByNickName);
        data.put("adminName",nickname);



        return new ModelAndView("userInfoChange",data);
    }

    // 资料修改页面
    @RequestMapping("/changeInfo")
    public ModelAndView changeVipInfo(HttpServletRequest request,HttpSession session){
        // 接收各种参数
        String vipId = request.getParameter("vipId");
        int vipid;

        // 接收修改的参数
        String vipID = request.getParameter("vipID");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String nickname = request.getParameter("nickname");
        String permission = request.getParameter("permission");
        String license = request.getParameter("license");
        String email = request.getParameter("email");
        System.out.println(vipID+" "+password+" "+name+" "+nickname+" "+permission+" "+license);

        if(vipId!=null){
            vipid = Integer.parseInt(vipId);
        }else{
            vipid = Integer.parseInt(vipID);
        }

        // 权限转换
        if(permission!=null){
            int perInt = PerChange.PerchangePer(permission);
            // 封装数据
            Vip changeVip = new Vip(Integer.parseInt(vipID),name,password,nickname,perInt,license,email);
            // 更新数据
            vipServiceImpl.updateVip(changeVip);
            // 更新账户
//            vipServiceImpl.upda
        }


        // 查询当前用户详情
        Vip oneVipByNickName = vipServiceImpl.findOneVipByNickName(nickname);

        Map<String,Object> data = new HashMap<String,Object>();
        data.put("oneVipByNickName",oneVipByNickName);


        return new ModelAndView("userInfoChange", data);

    }

    // 跳转到地图页面
    @RequestMapping("/mapPark")
    public ModelAndView mapPark(HttpServletRequest request){
        List<ParkOneInfo> parkOneInfos = parkService.parkOneInfo();
        // 帮助类：用于计算出普通车为和 VIP 车位
        int normalLot = CalLotNum.normalLot(parkOneInfos);
        int vipLot = CalLotNum.vipLot(parkOneInfos);

//        System.out.println("normal:"+normalLot);
//        System.out.println("vip:"+vipLot);

        Map<String,Object> data = new HashMap<String,Object>();
        data.put("normalLot",normalLot);
        data.put("vipLot",vipLot);

        return new ModelAndView("mapPark", data);

    }

    // 跳转停车场页面
    @RequestMapping("/park")
    public ModelAndView park(HttpServletRequest request){
        String parkName = request.getParameter("parkName");
        String carContent = request.getParameter("carContent");
        // flag = 1 表示用户跳转车位
        // flag = 0 表示管理员跳转车位
        // flag = 2 表示测试跳转车位
        int flag = 1;

        Map<String,Object> data = new HashMap<String,Object>();
        data.put("parkName",parkName);
        data.put("carContent",carContent);
        data.put("flag",flag);

        return new ModelAndView("park", data);

    }

    // ajax 实时更新停车场情况
    @RequestMapping("/test")
    public @ResponseBody
    int[] test(@RequestParam("parkName") String parkName){
        List<ParkOneInfo> parkOneInfos = null;
        // 查询该停车场当前停车情况
//        System.out.println(parkName);
        if(parkName.equals("桂系生态公园园内停车场")){
            parkOneInfos = parkService.parkOneInfo();
//            System.out.println(parkOneInfos);
        }

        int[] cars = ShowCar.showCarOnPark(parkOneInfos);
        return cars;
    }

    // 查询所有停车场信息
    @RequestMapping("/parkInfo")
    public ModelAndView showParkInfo(){
        List<ParkAllInfo> parkAllInfos = parkService.parkAllInfo();
//        System.out.println(parkAllInfos);

        Map<String,Object> data = new HashMap<>();
        data.put("parkAllInfos",parkAllInfos);

        return new ModelAndView("userParkInfo",data);
    }

    // 充值中心
    @RequestMapping("/userAccount")
    public ModelAndView userAccount(String nickname,HttpSession session){

            nickname = (String) session.getAttribute("nickname");

        Account account = vipServiceImpl.findAccount(nickname);

        Map<String,Object> data = new HashMap<>();
        data.put("account",account);

        return new ModelAndView("userAccount",data);
    }

    // 用户充值
    @RequestMapping("/userRecharge")
    public ModelAndView userAccount(HttpServletRequest request,HttpSession session){

//        System.out.println(request.getParameter("submit_num"));
        int payMethod = Integer.parseInt(request.getParameter("paymethod"));
        int submit_num = Integer.parseInt(request.getParameter("submit_num"));


        String nickname = request.getParameter("nickname");

            nickname = (String) session.getAttribute("nickname");

        if(submit_num!=0){
            int i = iReChargeService.insertRecharge(nickname, submit_num, payMethod);
        }

        // 查询当前总金额
        Account account = vipServiceImpl.findAccount(nickname);
        submit_num = account.getTotalMoney()+submit_num;
        // 增加总金额
        vipServiceImpl.updateTotalMoney(submit_num,nickname);


        List<Recharge> recharges = iReChargeService.myRecharge(nickname);
//        System.out.println(recharges);
        Map<String,Object> data = new HashMap<>();
        data.put("recharges",recharges);


        return new ModelAndView("userTransaction", data);
    }

    // 跳转交易记录页面
    @RequestMapping("/userTransaction")
    public ModelAndView userTransaction(HttpServletRequest request,HttpSession session){
        String nickname = request.getParameter("nickname");

            nickname = (String) session.getAttribute("nickname");

        // 查询当前用户详情
        Vip oneVipByNickName = vipServiceImpl.findOneVipByNickName(nickname);


        List<Recharge> recharges = iReChargeService.myRecharge(nickname);
//        System.out.println(recharges);
        Map<String,Object> data = new HashMap<>();
        data.put("recharges",recharges);
        data.put("oneVipByNickName",oneVipByNickName);


        return new ModelAndView("userTransaction", data);
    }

    // 跳转预定车位页面 userOrder
    @RequestMapping("/userOrder")
    public ModelAndView userOrder(){

        return new ModelAndView("userOrder", (Map<String, ?>) null);
    }

    // ajax 查询车位
    @RequestMapping("/queryCarLot")
    public @ResponseBody int[] queryCarLot(@RequestParam("parkName") String parkName){
        List<ParkOneInfo> parkOneInfos = null;
        // 查询该停车场当前停车情况
//        System.out.println(parkName);
        if(parkName.equals("桂系生态公园园内停车场")){
            parkOneInfos = parkService.parkOneInfo();
//            System.out.println(parkOneInfos);
        }

        int[] cars = ShowCar.showOrderCar(parkOneInfos);
        return cars;
    }

    // 返回预定的车位信息
    @RequestMapping("/returnOrderinfo")
    public ModelAndView returnOrderinfo(HttpServletRequest request) throws ParseException {
        String parking = request.getParameter("parking");
        String parkLot = request.getParameter("parkLot");
        String datePicker = request.getParameter("datePicker");
        String host = request.getParameter("host");
//        System.out.println("控制层的数据"+datePicker);
        // 通过这个方法查询相关 Id
        Vip oneVipByNickName = vipServiceImpl.findOneVipByNickName(host);
        int vipId = oneVipByNickName.getId();
        int payMoney = 40;
        System.out.println(parkLot);

        // 对车位字符串进行截取并转换成 int 类型
        parkLot = parkLot.substring(0,parkLot.indexOf(" "));
        int parkLotNum = Integer.parseInt(parkLot);

        // 对日期的转换
        Date date = DateBeau.changePickerTime(datePicker);
        System.out.println(parking+" "+parkLotNum+" "+date+" "+host);

        // 判断是哪个停车场
        // 目前只有一个停车场可用

        // 添加订单数据
        orderService.insertOrder(vipId,new Date(),date,null,1,parkLotNum,1,payMoney);

        // 修改停车场信息
        List<ParkOneInfo> parkOneInfos = parkService.parkOneInfo();
        parkService.updateParkOneInfo(oneVipByNickName.getLicense(),1, date,parkLotNum);
        System.out.println("我要看日期啊啊啊啊啊"+oneVipByNickName.getLicense()+" "+date);
//        System.out.println("停车场信息修改成功");

        // 修改总收入
        // 查询当天收入情况
        Income income = incomeService.curIncomeInfo();
        income.setTotalIncome(income.getTotalIncome()+payMoney);
        income.setCurIncome(income.getCurIncome()+payMoney);
        income.setParkOneIncome(income.getParkOneIncome()+payMoney);
        income.setVipIncome(income.getVipIncome()+payMoney);
        incomeService.updateIncome(income);

        // 修改用户账户
        // 获取用户账户情况
        Account account = vipServiceImpl.findAccount(host);
//        System.out.println(account);
//        System.out.println(account.getTotalMoney()+payMoney);
        vipServiceImpl.updateTotalMoney(account.getTotalMoney()-payMoney,host);
//        System.out.println("账户更新完毕");

        Map<String,Object> data = new HashMap<>();
        data.put("nickname",host);

        return new ModelAndView("success",data);
    }

    // 注册页面 rejvip
    @RequestMapping("/rejvip")
    public void rejvip(HttpServletRequest request,HttpServletResponse response) throws ParseException, IOException {
        String name = request.getParameter("name");
        String nickname = request.getParameter("nickname");
        String password = request.getParameter("password");
        String license = request.getParameter("license");
        String email = request.getParameter("email");

        // 新增用户
        vipServiceImpl.insertVip(name,password,nickname,2,license,email);
//        System.out.println("新增用户");

        // 新增用户账户
        Vip oneVipByNickName = vipServiceImpl.findOneVipByNickName(nickname);
        vipServiceImpl.insertVipAccount(oneVipByNickName.getId(),nickname,0);

        response.sendRedirect(request.getContextPath()+"/userlogin.jsp");
//        return new ModelAndView("success", (Map<String, ?>) null);
    }

    // 解决昵称重复的问题 nicknameRepeat
    @RequestMapping("/nicknameRepeat")
    public @ResponseBody int nicknameRepeat(@RequestParam("nickname") String nickname) throws ParseException, IOException {
        System.out.println("开始查询");
        // 查询是否存在重复用户
        Vip oneVipByNickName = vipServiceImpl.findOneVipByNickName(nickname);
        if(oneVipByNickName==null){
            // 如果不重复则返回 1
            System.out.println("不重复");
            return 1;
        }
        else{
            System.out.println("重复");
            return 0;
        }

    }

    // 订单分页
    @RequestMapping("/userOrderPaging")
    public ModelAndView userOrderPaging(HttpServletRequest request){
        // 接收 jsp 页面传回的请求页参数
        String startPage = request.getParameter("startPage");
        String userId = request.getParameter("userId");
        int userIdInt = Integer.parseInt(userId);

        System.out.println(startPage+"页");

        List<Order> orderList;

        // 该用户的订单信息信息
        if(startPage==null){
            orderList = orderService.findOneVipOrder(0,5,userIdInt);
//            System.out.println("控制层："+vipList);
        }else{
            int startPageInt = Integer.parseInt(startPage);
            orderList = orderService.findOneVipOrder(startPageInt,5,userIdInt);
//            System.out.println("控制层："+vipList);
        }


        // vip 总数
        int vipNum = vipServiceImpl.vipNum();

        // 将数据填充到 map 中
        Map<String,Object> data = new HashMap<String,Object>();
        data.put("orderList",orderList);
//        data.put("vipNum",vipNum);
        return new ModelAndView("orderList",data);

    }

}
