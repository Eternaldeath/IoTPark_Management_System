<%--
  Created by IntelliJ IDEA.
  User: 23380
  Date: 2020/3/21
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>智慧出行，智能生活</title>
    <meta name="description" content="IoT 智慧停车场">
    <meta name="keywords" content="IoT 智慧停车场">
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
    <%-- button 样式库 ，兼容 bootstrap--%>
    <link href="${path}/css/buttons.css" rel="stylesheet" />
    <link href="${path}/css/index.css" rel="stylesheet" />
</head>
<body>
<%--    <h1>智慧出行</h1>--%>
<%--对于高级浏览器，设置 muted 之后可以流畅播放视频--%>
<div id="container">
    <video id="background_video" loop muted autoplay></video>
    <div id="video_cover"></div>
    <div id="overlay"></div>


    <section id="main_content">
        <div id="head">
            <h1>智慧出行，智能停车</h1>
            <p class="sub_head">IoT-智慧停车场服务供应商</p>
            <p class="info">
                <button class="button  button-plain button-border" onclick="window.location.href='userlogin.jsp'">用户登录</button>
                <button class="button   button-plain button-border" onclick="window.location.href='login.jsp'">管理员登录</button>
                <button class="button   button-plain button-border" onclick="window.location.href='doc/doc.jsp'">官方文档</button>
                <button class="button   button-plain button-border" onclick="window.location.href='runIn.jsp'">模拟测试</button>
            </p>
            <input type="hidden" id="pageContext" value="pageContext.request.contextPath">
        </div>
    </section>
</div>

<script src="${path}/js/bideo.js"></script>
<script>
    (function () {
        var bv = new Bideo();
        bv.init({
            // Video元素
            videoEl: document.querySelector('#background_video'),

            // 容器元素
            container: document.querySelector('body'),

            // 自适应调整
            resize: true,

            // autoplay: false,

            isMobile: window.matchMedia('(max-width: 768px)').matches,


            // 加载视频源, 根据实际业务更换自己的视频源文件
            src: [
                {
                    src: '${path}/video/index.mp4',
                    type: 'video/mp4'
                }
            ],

            // 一旦视频加载后即将视频封面隐藏
            onLoad: function () {
                document.querySelector('#video_cover').style.display = 'none';
            }
        });
    }());
</script>
</body>
</html>
