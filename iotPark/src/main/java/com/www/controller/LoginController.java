package com.www.controller;

import com.www.domain.*;
import com.www.service.impl.*;
import com.www.utils.*;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.CookieStore;
import java.util.*;

@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private loginSercie loginSercie;
    @Autowired
    private OrderServiceImpl orderService;
    @Autowired
    private ParkServiceImpl parkService;
    // 控制 vipList
    @Autowired
    private VipServiceImpl vipServiceImpl;
    @Autowired
    private IncomeServiceImpl incomeService;

    private DateBeau dateBeau = new DateBeau();
//    List<String> bDateList = new ArrayList<String>();



    // 控制登录
    @RequestMapping("/adminLogin")
    public ModelAndView adminLogin(String nickname, String password, String rememberMe, HttpServletResponse response, HttpSession session) throws UnsupportedEncodingException {
        System.out.println("表单数据"+nickname+" "+password+" "+rememberMe);
        // 验证管理员权限
        int result = loginSercie.VeriAdmini(nickname, password);
        // 返回会员数量
        int vipnum = loginSercie.findVipNum();
        // 返回当前订单数量
        int curOrderNum = loginSercie.findCurOrderNum();
        // 返回当前订单详情
        List<Order> curOrder = orderService.findAllCurOrder();
        // 返回所有订单数量
        int allOrderNum = orderService.findAllOrderNum();

        // 设置session
        // 在 session 中增加 nickname
        session.setAttribute("nickname",nickname);
        System.out.println("从seesion取 nickname"+nickname);

        if(rememberMe.equals("on")){
            RememberUtil.rememberCookie(nickname,password,response);
        }

        Map<String,Object> data = new HashMap<String,Object>();
        data.put("vipnum",vipnum);
        data.put("curOrderNum",curOrderNum);
        data.put("curOrder",curOrder);
        data.put("allOrderNum",allOrderNum);
        data.put("adminName",nickname);

        if(result==1){
            return new ModelAndView("adminIndex",data);
        }else {
            return new ModelAndView("error", (Map<String, ?>) null);
        }

    }

    // ----菜单跳转----
    // 返回管理员首页
    @RequestMapping("/returnAdmin")
    public ModelAndView returnAdmin(){
        // 返回会员数量
        int vipnum = loginSercie.findVipNum();
        // 返回当前订单数量
        int curOrderNum = loginSercie.findCurOrderNum();
        // 返回当前订单详情
        List<Order> curOrder = orderService.findAllCurOrder();
        // 返回所有订单数量
        int allOrderNum = orderService.findAllOrderNum();


        Map<String,Object> data = new HashMap<String,Object>();
        data.put("vipnum",vipnum);
        data.put("curOrderNum",curOrderNum);
        data.put("curOrder",curOrder);
        data.put("allOrderNum",allOrderNum);

        System.out.println("执行了返回管理员首页操作");

        return new ModelAndView("adminIndex",data);
    }

    // 查询所有停车场信息
    @RequestMapping("/parkInfo")
    public ModelAndView showParkInfo(){
        List<ParkAllInfo> parkAllInfos = parkService.parkAllInfo();
        System.out.println(parkAllInfos);

        Map<String,Object> data = new HashMap<>();
        data.put("parkAllInfos",parkAllInfos);

        return new ModelAndView("parkInfo",data);
    }

    // 查询收入页面
    @RequestMapping("/income")
    public @ResponseBody ModelAndView findIncome(){
        List<Income> income = incomeService.findIncome();
        JSONArray jsonIncome = JSONArray.fromObject(income);
        System.out.println(jsonIncome);
        Map<String,Object> data = new HashMap<>();
        data.put("jsonIncome",jsonIncome);
        return new ModelAndView("income",data);
    }


    // ----/菜单跳转----


    // 当前订单详情页面
    @RequestMapping("/curOrderInfo")
    public ModelAndView showCurOrderInfo(){
        // 返回当前订单详情
        List<Order> curOrder = orderService.findAllCurOrder();

        Map<String,Object> data = new HashMap<String,Object>();
        data.put("curOrder",curOrder);

        return new ModelAndView("curOrder",data);
    }

    // 在当前订单详情页面中删除订单
    @RequestMapping("/deleteOrder")
    public ModelAndView deleteOrder(HttpServletRequest request){
        String vipId = request.getParameter("vipId");
        orderService.deletOrder(Integer.parseInt(vipId));
        // 返回当前订单详情
        List<Order> curOrder = orderService.findAllCurOrder();

        Map<String,Object> data = new HashMap<String,Object>();
        data.put("curOrder",curOrder);

        return new ModelAndView("curOrder",data);

    }

    // 查询所有订单
    @RequestMapping("/allOrderDetail")
    public ModelAndView allOrderDetail(){
        List<Order> allOrder = orderService.findAllOrder();
        System.out.println(allOrder);

        Map<String , Object> data = new HashMap<>();
        data.put("allOrder",allOrder);

        return new ModelAndView("allOrder",data);
    }



    // 会员详情
    @RequestMapping("/vipDetail")
    public ModelAndView showVipDetail(HttpServletRequest request){
        // 接收 jsp 页面传回的请求页参数
        String startPage = request.getParameter("startPage");
        System.out.println(startPage+"页");

        List<Vip> vipList;

        // 所有会员信息
        if(startPage==null){
            vipList = vipServiceImpl.findAllVip(0,5);
            System.out.println("控制层："+vipList);
        }else{
            int startPageInt = Integer.parseInt(startPage);
            vipList = vipServiceImpl.findAllVip(startPageInt,5);
            System.out.println("控制层："+vipList);
        }


        // vip 总数
        int vipNum = vipServiceImpl.vipNum();

        // 将数据填充到 map 中
        Map<String,Object> data = new HashMap<String,Object>();
        data.put("vipList",vipList);
        data.put("vipNum",vipNum);
        return new ModelAndView("vipList",data);

    }

    // 会员详情
    @RequestMapping("/oneVipList")
    public ModelAndView showOneVipDetail(HttpServletRequest request){
        // 接收各种参数
        String vipId = request.getParameter("vipId");
        int vipid = Integer.parseInt(vipId);
        
        String deleteId = request.getParameter("deleteId");

        // 删除订单
        if(deleteId!=null){
            orderService.deletOrder(Integer.parseInt(deleteId));
            System.out.println("删除成功");
        }
        
        // 查询当前用户详情
        List<Vip> oneVipList = vipServiceImpl.findOneVip(vipid);

        // 查询当前用户订单
        List<Order> myOrder = orderService.findMyOrder(vipid);
        



        Map<String,Object> data = new HashMap<String,Object>();
        data.put("oneVipList",oneVipList);
        data.put("myOrder",myOrder);
//        data.put("deleteFlag",deleteResult);

        return new ModelAndView("oneVipList", data);

    }

    // 资料修改页面
    @RequestMapping("/changeInfo")
    public ModelAndView changeVipInfo(HttpServletRequest request){
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
        }


        // 查询用户详情
        List<Vip> chgOneVipList = vipServiceImpl.findOneVip(vipid);

        Map<String,Object> data = new HashMap<String,Object>();
        data.put("chgOneVipList",chgOneVipList);


        return new ModelAndView("changeVipInfo", data);

    }

    // 跳转到地图页面
    @RequestMapping("/mapPark")
    public ModelAndView mapPark(HttpServletRequest request){
        List<ParkOneInfo> parkOneInfos = parkService.parkOneInfo();
        // 帮助类：用于计算出普通车为和 VIP 车位
        int normalLot = CalLotNum.normalLot(parkOneInfos);
        int vipLot = CalLotNum.vipLot(parkOneInfos);

        System.out.println("normal:"+normalLot);
        System.out.println("vip:"+vipLot);

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
        int flag = 0;

        Map<String,Object> data = new HashMap<String,Object>();
        data.put("parkName",parkName);
        data.put("carContent",carContent);
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








}
