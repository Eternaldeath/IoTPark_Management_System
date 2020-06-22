<%--
  Created by IntelliJ IDEA.
  User: 23380
  Date: 2020/3/15
  Time: 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>停车场详情</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*" />
    <c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
    <link rel="stylesheet" href="${path}/css/parkStyle.css">
</head>
<body>
<div class="container">
    <div class="parkName">${parkName}</div>
    <div class="parkZone">
        <div class="rowContainer">
            <div class="rowOne">
                <div class="normal">1</div>
                <div class="normal">2</div>
                <div class="normal">3</div>
                <div class="normal">4</div>
                <div class="normal">5</div>
                <div class="normal">6</div>
                <div class="normal">7</div>
                <div class="normal">8</div>
                <div class="normal">9</div>
                <div class="normal">10</div>
            </div>
            <div class="rowTwo">
                <div class="normal vip">11</div>
                <div class="normal vip">12</div>
                <div class="normal vip">13</div>
                <div class="normal vip">14</div>
                <div class="normal vip">15</div>
                <div class="normal vip">16</div>
                <div class="normal vip">17</div>
                <div class="normal vip">18</div>
                <div class="normal vip">19</div>
                <div class="normal vip">20</div>
            </div>
        </div>
    </div>
    <div class="info">
        <p>停车场信息板</p>
        <div class="detail">${carContent}</div>
        <p>停车场模拟测试为 1 min 更新一次信息</p>
        <a href="returnAdmin" class="returnAdmin" id="returnAdmin">返回首页</a>
    </div>
<%--    <button onclick="update()">测试</button>--%>
</div>

<script src="${path}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${path}/js/anime.min.js"></script>
<script>
    var imgSort = ["bigGrey.png","bigYellow.png","black.png","grey.png","pink.png","vip.png","yellow.png"];
    var i=0;
    var j=1;

    var normalCar = 0;
    var vipCar = 0;

    // 获取进场时间
    var startTime = new Date();

    function update() {
        $.ajax({
            url:"test",
            type:"post",
            data:{"parkName":"桂系生态公园园内停车场"},
            cache: "false",   //设置为false将不会从浏览器中加载请求信息
            async: "true",    //true所有请求均为异步请求
            success:function (result,testStatus) {
                console.log(result);
                // 初始化信息
                normalCar = 0;
                vipCar = 0;
                j=1;
                // alert(result);

                $(".normal").each(function(){
                    // 因为车辆图片一共七张，超过七张从头开始
                    if(i==7)
                    {
                        i=0;
                    }
                    // 如果车位标志位为 1，则增加车辆图片
                    if(j<=10){
                        if(result[j-1]==1){
                            var img = $("<img src=${path}/img/"+imgSort[i]+"></img>");
                            i++;
                            $(this).text("");
                            // 添加子元素
                            $(this).append(img);
                            $(this).addClass("addRed");
                            normalCar++;
                        }
                        else{
                            // 否则该车位无车
                            $(this).removeClass("addRed");
                            $(this).empty();
                            $(this).text(j);
                        }
                    }else if(j>10){
                        if(result[j-1]==1){
                            var img = $("<img src=${path}/img/"+imgSort[i]+"></img>");
                            i++;
                            $(this).text("");
                            // 添加子元素
                            $(this).append(img);
                            $(this).addClass("addRed");
                            // 统计 vip 车数量
                            vipCar++;
                        }else if(result[j-1]==2){
                            $(this).empty();
                            $(this).text("已预定");
                            $(this).css("font-size","12px");
                        }
                        else{
                            $(this).empty();
                            $(this).text(j);
                            $(this).removeClass("addRed");
                        }
                    }
                    j++;
                    <%--var img = $("<img src='${path}/img/pink.png'></img>")--%>
                    // console.log(img[i]);

                });
                console.log(j);
                // 添加车位信息
                $(".detail").html("车位信息<br/>普通车位("+normalCar+"/10)<br/>VIP 车位("+vipCar+"/10)");
                // alert('ajax 更新了');
            }
        })
    }
    update();

    setInterval(update,1000*60);

    // 获取 sessionStorge 数据
    // 若为 on 则表明处于用户会话
    let sessionData = sessionStorage.getItem('key');
    var flag = ${flag}
    var flagTest = 0;
    if(flag==1){
        $("#returnAdmin").remove();
        var toOrder = $("<a href='userOrder' class='returnAdmin'>前往预定</a>");
        $(".info").append(toOrder);

        var nickname = sessionStorage.getItem("username");

        var toIndex = $("<a href='returnUserAdmin?nickname="+ nickname +"'class='returnAdmin'>返回首页</a>");
        $(".info").append(toIndex);
    }
    else if(flag==0){
        $("#returnAdmin").remove();
        var nickname = sessionStorage.getItem("username");
        var toIndex = $("<a href='returnAdmin' class='returnAdmin'>返回首页</a>");
        $(".info").append(toIndex);
    }else if(flag==2){
        $("#returnAdmin").remove();
        // var nickname = sessionStorage.getItem("username");
        var toIn = $("<a id='inPark' class='returnAdmin'>进入停车场</a>");
        var toout = $("<a id='outPark' class='returnAdmin'>离开停车场</a>");
        $(".info").append(toIn);
        $(".info").append(toout);
        flagTest=1;
    }

    // 设置变量，用于确认汽车进场、
    var flagCar = 0;
    // 进入停车场代码
    $("#inPark").on("click",function () {
        if(flagTest==1){
            $("#vipCar").remove();
            var img = $("<img id='vipCar' style='width: 5%;\n" +
                "    height: 18%;' src=${path}/img/"+imgSort[5]+"></img>");
            $('.parkZone').append(img);
            setTimeout(function () {
                flagCar = 1;
            },1000);
        }
    });

    // 离开停车场响应事件
    $("#outPark").on("click",function () {
        if(flagTest==1){
            <%--alert(1);--%>
            <%--var img = $("<img id='vipCar' src=${path}/img/"+imgSort[5]+"></img>");--%>
            <%--$('.parkZone').append(img);--%>
            $("#vipCar").remove();
            $(".normal").removeClass("addRedAlone");
            $.ajax({
                url:"removeParkInfo",
                type:"post",
                data:{
                    "nickname":"老李",
                    "lotNum":parkLot,
                    "startTime": startTime,
                    "endTime":new Date(),
                    "targetQQ":"390353137@qq.com",
                },
                cache: "false",   //设置为false将不会从浏览器中加载请求信息
                async: "true",    //true所有请求均为异步请求
                success:function (result,testStatus) {
                }
            });
        }

    });


    // 方向移动参数，默认垂直
    var flagRotate = 0;
    $("body").on("click",function () {
        if(flagCar==1&&flagTest==1){
            let e = event || window.event;
            // 当前的y位置
            var top = document.getElementById("vipCar").offsetTop;
            // 当前的x位置
            var left = document.getElementById("vipCar").offsetLeft;
            // 当前
            var tct = top-e.clientY;
            var lcl = left-e.clientX;

            if(Math.abs(tct)<Math.abs(lcl)){
                if(flagRotate==0){
                    if(lcl>0){
                        rotateTo(-90);
                    }else if(lcl<0){
                        rotateTo(90);
                    }
                    flagRotate=1;
                }
                // x 轴移动
                setTimeout(test1(),3000);
            }else {
                if(flagRotate==1){
                    if(tct>0){
                        rotateTo(0);
                    }else if(tct<0){
                        rotateTo(180);
                    }
                    flagRotate=0;
                }
                // y 轴移动
                setTimeout(test2(),3000);
            }
        }

    });

    function test1(){
        if(flagCar==1){
            var e = event || window.event;
            // console.log(e.clientX,e.clientY);
            // $("#vipCar").css("left",e.clientX);
            // $("#vipCar").css("top",e.clientY);

            anime({
                targets: '#vipCar',
                left: e.clientX-23,
                // top: e.clientY-40,
                easing: 'linear',
                // delay: anime.stagger(1000)
            });
        }
    };

    // 转向函数
    function rotateTo(r){
        anime({
            targets: '#vipCar',
            rotate: {
                value: r,
                duration: 50,
                easing: 'easeInOutSine'
            },
        });
    }

    // // 从 x 转向 y
    // function rotateToY(r){
    //     anime({
    //         targets: '#vipCar',
    //         rotate: {
    //             value: r,
    //             duration: 50,
    //             easing: 'easeInOutSine'
    //         },
    //     });
    // }

    // 沿 y 轴移动
    function test2(){
        if(flagCar==1){
            var e1 = event || window.event;
            // console.log(e1.clientX,e1.clientY);
            // $("#vipCar").css("left",e.clientX);
            // $("#vipCar").css("top",e.clientY);

            anime({
                targets: '#vipCar',
                // left: e.clientX,
                top: e1.clientY-40,
                easing: 'linear'
            });
        }
    };

    // 进入车位响应事件
    var parkLot;
    $(".normal").on("click",function () {
        if(flagTest==1){
            console.log($(this).text());
            parkLot = $(this).text();
            $(this).addClass("addRedAlone");
            if(parkLot=="已预定"){
                console.log("已预定");
                $.ajax({
                    url:"changeParkInfoByOrder",
                    type:"post",
                    data:{
                        "nickname":"老李",
                        "lotNum":parkLot,
                    },
                    cache: "false",   //设置为false将不会从浏览器中加载请求信息
                    async: "true",    //true所有请求均为异步请求
                    success:function (result,testStatus) {
                        if(result==0){
                            alert("车位已经预定，请离开")
                        }
                    }
                });
            }
            else {
                console.log("未预定");
                $.ajax({
                    url:"changeParkInfo",
                    type:"post",
                    data:{
                        "nickname":"老李",
                        "lotNum":parkLot,
                    },
                    cache: "false",   //设置为false将不会从浏览器中加载请求信息
                    async: "true",    //true所有请求均为异步请求
                    success:function (result,testStatus) {

                    }
                });
            }
        }

    });







//    测试代码
<%--    function change(){--%>
<%--        $(document).ready(function(){--%>
<%--            $(".normal").each(function(){--%>
<%--                if(i==7)--%>
<%--                {--%>
<%--                    i=0;--%>
<%--                }--%>
<%--                var img = $("<img src=${path}/img/"+imgSort[i]+"></img>");--%>
<%--                &lt;%&ndash;var img = $("<img src='${path}/img/pink.png'></img>")&ndash;%&gt;--%>
<%--                // console.log(img[i]);--%>
<%--                i++;--%>
<%--                $(this).text("");--%>
<%--                // 添加子元素--%>
<%--                $(this).append(img);--%>
<%--            });--%>
<%--        });--%>
<%--    }--%>
</script>
</body>
</html>
