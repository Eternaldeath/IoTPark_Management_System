<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>后台管理页面</title>
    <c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
    <link rel="stylesheet" href="${path}/plugins/bootstrap/css/bootstrap.min.css" />
    <link href="${path}/css/bootstrap.min.css" />

</head>
<body>
<form action="test" method="post">
    <input type="radio"  value="10" name="submit_num" style="height: 100%;width: 100%;display: none" > 20￥
    <input type="radio"  value="20" name="submit_num" style="height: 100%;width: 100%;display: none" > 20￥
    <input type="radio"  value="50" name="submit_num" style="height: 100%;width: 100%;display: none" > 20￥

</form>


</body>
</html>
