// 实时更新空闲车位状态
function update() {
    $.ajax({
        url:"testPage/test",
        type:"post",
        data:{"parkName":"桂系生态公园园内停车场"},
        cache: "false",   //设置为false将不会从浏览器中加载请求信息
        async: "true",    //true所有请求均为异步请求
        success:function (result,testStatus) {
            console.log(result);
            // 初始化信息
            normalCar = 0;
            vipCar = 0;
            j=0;
            for(var j=0;j<20;j++){
                if(result[j]==1&&j<10){
                    normalCar++;
                }else if(result[j]==1&&j>=10){
                    vipCar++;
                }
            }

            // 添加车位信息
            $("#headInfo").html("<p>车位总数：20</p><p>普通车位("+normalCar+"/10)</p><p>VIP 车位("+vipCar+"/10)</p>");
            // alert('ajax 更新了');
        }
    })
}
update();

setInterval(update,1000*60);



// 汽车驶入方法
$("#runTo").on("click",function(){
    anime({
        targets: '#myCar',
        left: 300,
        easing: 'easeInOutCubic'
    });



    setTimeout(function(){$.delay();},2000);

});

$("#nextStep").on("click",function () {
    // 查询用户信息，这里写死了用户
    $.ajax({
        url:"testPage/findOrder",
        type:"post",
        //此处将数据写死
        data: {"nickname":"老李"},
        cache: "false",   //设置为false将不会从浏览器中加载请求信息
        async: "true",    //true所有请求均为异步请求
        success:function (result,testStatus) {
            if(result==0){
             // 表示没有预定车位且余额不足
            $.showInfoPay()
            }else if(result==1){
                // 表示余额充足
                $.showInfoNoPay()
            }else if(result==2){
                // 表示已经预定
                $.showInfoOrder()
            }
        }
    });
    $("#runTo").hide();
    $("#runIn").show();
});

$("#nextStep2").on("click",function () {
    // 查询用户信息，这里写死了用户
    $.ajax({
        url:"testPage/findOrder",
        type:"post",
        //此处将数据写死
        data: {"nickname":"老李"},
        cache: "false",   //设置为false将不会从浏览器中加载请求信息
        async: "true",    //true所有请求均为异步请求
        success:function (result,testStatus) {
            if(result==0){
                // 表示没有预定车位且余额不足
                $.showInfoPay()
            }else if(result==1){
                // 表示余额充足
                $.showInfoNoPay()
            }else if(result==2){
                // 表示已经预定
                $.showInfoOrder()
            }
        }
    });
    $("#runTo").hide();
    $("#runIn").show();
});



// 确认支付
$("#checkPay").on("click",function () {
    $("#headInfo").html(
        "<p>支付成功，欢迎入库</p>"
    );
    $.showFapiao();
});

// 取消支付
$("#dismissPay").on("click",function () {
    $("#headInfo").html(
        "<p>取消支付</p>"
    );
});

// 打印发票
$.showFapiao = function(){
    $("#myModal3").modal();
};



// 加载模态框
$.delay = function(){
    if(weatherFlag==1){
        $("#myModal").modal();
    }else if (weatherFlag==0){
        $("#myModal4").modal();
    }
}
// 显示车主信息（没有预定车位，余额不充足）
$.showInfoPay = function () {
    $("#headInfo").html(
        "<p>欢迎 vip 用户入库</p>" +
        "<p>您的余额不足，请扫码支付入库</p>"
    );
    $("#myModal2").modal();
    setTimeout(function () {
        $.showParkPic();
    },10000);

};

// 显示车主信息（已经预定了车位）
$.showInfoOrder = function () {
    $("#headInfo").html(
        "<p>欢迎 vip 用户入库</p>" +
        "<p>您已经预定了车位</p>"
    );
    setTimeout(function () {
        $.showParkPic();
    },10000);
};

// 显示车主信息（没有预定车位，但余额充足）
$.showInfoNoPay = function () {
    $("#headInfo").html(
        "<p>欢迎 vip 用户入库</p>" +
        "<p>您的余额充足，将自动扣款</p>"
    );
    setTimeout(function () {
        $.showParkPic();
    },10000);
};

// 设置全局变量，用于确定不同天气下
// 采用哪一种方式验证用户
// 0 表示采用刷卡登录
// 1 表示采用扫描登录

var weatherFlag = 1;

// 切换雾天
$("#frogDay").on("click",function () {
    $("#frogDay").hide();
    $("#sunDay").show();
    $("#frog").show();
    weatherFlag = 0;
});

$("#sunDay").on("click",function () {
    $("#frogDay").show();
    $("#sunDay").hide();
    $("#frog").hide();
    weatherFlag = 1;
});

$.showParkPic = function () {
    $("#headInfo").html("");
    $("#parkPic").show();
}