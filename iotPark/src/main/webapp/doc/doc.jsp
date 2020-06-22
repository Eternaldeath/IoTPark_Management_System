<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>说明文档</title>
    <link rel="stylesheet" href="${path}/css/docute.css">
</head>
<body>
<div id="docute">

</div>
<script src="${path}/js/docute.js"></script>
<script>
    new Docute({
        target: '#docute',
        title: '说明文档',
        nav: [
            {
                title: 'Home',
                link: 'http://localhost:8080/iotPark_war_exploded/doc/doc.jsp#/'
            },
            {
                title: 'Github',
                link: '#'
            },
        ],
        sidebar: [
            // A sidebar item, with child links
            {
                title: '产品说明',
                children:[
                    {
                        title:'产品详细情况介绍',
                        link: '/productDetailInfo.md'
                    }
                    ],

            },
            // An external link
            {
                title: '返回主页',
                link: 'http://localhost:8080/iotPark_war_exploded/'
            }
        ],
    })
</script>
</body>
</html>
