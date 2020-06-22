<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>预定成功页面</title>
    <c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
    <meta http-equiv="refresh" content="5;url=http://localhost:8080/iotPark_war_exploded/userlogin/returnUserAdmin?nickname=${nickname}">
</head>
<body>
    <h1>预定成功 3 秒后跳转回首页 ... </h1>
</body>
</html>
