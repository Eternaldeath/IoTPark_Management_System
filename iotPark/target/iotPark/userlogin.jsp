<%--
  Created by IntelliJ IDEA.
  User: 23380
  Date: 2020/3/6
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html lang="en">
<head>
    <title>智慧停车场后台管理系统</title>
    <!-- meta tags -->
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="keywords" content="IOT_Park"
    />
    <!-- /meta tags -->
    <!-- custom style sheet -->
    <link href="css/userStyle.css" rel="stylesheet" type="text/css" />
    <!-- /custom style sheet -->
    <!-- fontawesome css -->
    <link href="css/fontawesome-all.css" rel="stylesheet" />
    <!-- bootstrap.css -->
    <link href="css/bootstrap.min.css" />
    <link href="plugins/bootstrap/css/ltestyle.css" />
    <!-- /fontawesome css -->
    <!-- google fonts-->
<%--    <link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"--%>
<%--          rel="stylesheet">--%>
    <!-- /google fonts-->

</head>


<body>
<h1>用户登录页面</h1>
<div class=" w3l-login-form">
    <h2>在这里登录</h2>
    <form action="userlogin/userLogin" method="POST">

        <div class=" w3l-form-group">
            <label>Nickname:</label>
            <div class="group">
                <input id="nickname" type="text" name="nickname" class="form-control" placeholder="昵称" required="required" />
            </div>
        </div>
        <div class=" w3l-form-group">
            <label>Password:</label>
            <div class="group">
                <input id="password" type="password" name="password" class="form-control" placeholder="密码" required="required" />
            </div>
        </div>
        <div class="forgot">
<%--             使用隐藏域解决向后台传值的 null 问题--%>
            <p><input type="checkbox" name="rememberMe">记住我</p>
            <p><input type="hidden" name="rememberMe" value="off"></p>
             <a href="rej.jsp" style="color: red">成为 VIP</a>
        </div>
        <button type="submit">点击登录</button>
    </form>
</div>
<footer>
    <p class="copyright-agileinfo"> &copy; 2020 智慧停车场 by  <i>noname</i></p>
</footer>

<script>

    var nickname=document.cookie.split("#")[0].split("=")[1];
    var password=document.cookie.split("#")[1];
    console.log(nickname);
    console.log(password);
    document.getElementById("nickname").value = nickname;
    document.getElementById("password").value = password;

    // var password=document.cookie.split(";")[1];
        // console.log(username);
        // console.log(password);
        //
        // if(username!=""&&password!=""){
        //     document.getElementById("nickName").value = username;
        //     document.getElementById("password").value = password;
        // }

    // 设置 sessionStorage
    sessionStorage.setItem('key','on');
</script>
</body>


</html>
