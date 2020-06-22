<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">


    <title>注册</title>



    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <link rel="stylesheet" href="${path}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${path}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${path}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${path}/plugins/iCheck/square/blue.css">
    <style>
        body {
            margin: 0;
            padding: 0;
            background: url("${path}/img/car03.jpg"),no-repeat,100%,center,scroll;
            min-height: 100vh;
            background-size: cover;
            font-family: 'Raleway', sans-serif;
        }
    </style>
</head>

<body class="hold-transition register-page">
<div class="register-box">
    <div class="register-logo">


        <a href="all-admin-index.html"><b>新用户</b>注册</a>


    </div>

    <div class="register-box-body">
        <p class="login-box-msg">新用户注册</p>

        <form action="userlogin/rejvip" method="post">
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="姓名" name="name">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div id="check" class="form-group has-feedback">
                <input id="nickname" type="text" class="form-control" placeholder="昵称(不能重复）" name="nickname">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" placeholder="密码" name="password">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="车牌号" name="license">
                <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="邮箱" name="email">
                <span class="glyphicon glyphicon-send form-control-feedback"></span>
            </div>
            <div class="row">
                <div class="col-xs-8">

                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">注册</button>
                </div>
                <!-- /.col -->
            </div>
        </form>

        <div class="social-auth-links text-center">
            <p>- （暂不支持） -</p>
            <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-qq"></i> 腾讯QQ用户登录</a>
            <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-weixin"></i> 微信用户登录</a>
        </div>

        <a href="userlogin.jsp" class="text-center">我有账号，现在就去登录</a>
    </div>
    <!-- /.form-box -->
</div>
<!-- /.register-box -->

<!-- jQuery 2.2.3 -->
<!-- Bootstrap 3.3.6 -->
<!-- iCheck -->
<script src="${path}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${path}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${path}/plugins/iCheck/icheck.min.js"></script>
<script>
    $(function() {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });

    // 处理昵称重复的问题
    $("#nickname").blur(function(){
        var nickname = $("#nickname").val();
        $.ajax({
            url:"userlogin/nicknameRepeat",
            type:"post",
            data: {"nickname":nickname},
            cache: "false",   //设置为false将不会从浏览器中加载请求信息
            async: "true",    //true所有请求均为异步请求
            success:function (result,testStatus) {
                // alert(1);
                if(result==1){
                    $(".just").remove();
                    var rigth = $('<span class="just" style="color: green">可以使用</span>');
                    // $(".just").css("padding","5px");
                    $("#check").append(rigth);
                }else if(result==0){
                    var wrong = $('<span class="just" style="color: red">昵称重复</span>');
                    $(".just").remove();
                    $("#check").append(wrong);
                    // $(".just").css("padding","5px");
                }
            }
        })
    })
</script>
</body>

</html>
