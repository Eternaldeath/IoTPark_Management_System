<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>停车场地图</title>
    <c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
    <style type="text/css">
        html{height:100%}
        body{height:100%;margin:0px;padding:0px}
        #container{height:100%}
    </style>

    <script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=E8l8PZ5yE2F8A7qogL1Y3qCu41gcG8MH">
        //v3.0版本的引用方式：src="http://api.map.baidu.com/api?v=3.0&ak=您的密钥"
    </script>
</head>

<body>
    <div id="container"></div>

<script src="${path}/js/mapInit.js"></script>
<%--<script src="${path}/plugins/jQuery/jquery-2.2.3.min.js"></script>--%>
<script>
    // 设置停车场位置
    // 自定义图标
    var myIcon = new BMap.Icon('${path}/img/parking.png', new BMap.Size(30,30), {
        // 指定定位位置。
        // 当标注显示在地图上时，其所指向的地理位置距离图标左上
        // 角各偏移10像素和25像素。您可以看到在本例中该位置即是
        // 图标中央下端的尖角位置。
        // anchor: new BMap.Size(50, 50),
        // imageOffset: new BMap.Size(0, 0 - index * 25)   // 设置图片偏移
    });
    // 创建标注对象并添加到地图
    var point2 = new BMap.Point(104.0748735001, 30.5703183701);
    var point3 = new BMap.Point(104.0248735001, 30.5203183701);

    var marker = new BMap.Marker(point, {icon: myIcon});    // 创建标注
    var marker2 = new BMap.Marker(point2, {icon: myIcon});
    var marker3 = new BMap.Marker(point3, {icon: myIcon});
    map.addOverlay(marker);
    map.addOverlay(marker2);
    map.addOverlay(marker3);


    // 设置信息窗口
    var opts = {
        width : 250,     // 信息窗口宽度
        height: 100,     // 信息窗口高度
        title : "桂系生态公园园内停车场"  // 信息窗口标题
    }

    var opts2 = {
        width : 250,     // 信息窗口宽度
        height: 100,     // 信息窗口高度
        title : "桂系生态公园公共停车场"  // 信息窗口标题
    }

    var opts3 = {
        width : 250,     // 信息窗口宽度
        height: 100,     // 信息窗口高度
        title : "三江公园停车场"  // 信息窗口标题
    }

    // 获取车位数据
    var normal = ${normalLot};
    var vipLot = ${vipLot};
    var infoWindow = new BMap.InfoWindow("车位信息<br/>普通车位("+normal+"/10)<br/>VIP 车位 ("+vipLot+"/10)", opts);  // 创建信息窗口对象
    var infoWindow2 = new BMap.InfoWindow("车位信息<br/>普通车位 (2/10)<br/>VIP 车位 (3/10)", opts2);  // 创建信息窗口对象
    var infoWindow3 = new BMap.InfoWindow("车位信息<br/>普通车位 (5/10)<br/>VIP 车位 (1/10)", opts3);  // 创建信息窗口对象


    // 标注的事件监听
    marker.addEventListener("mouseover", function(){
        map.openInfoWindow(infoWindow, point);
    });

    marker.addEventListener("mouseout", function(){
        map.closeInfoWindow();
    });

    // 园内停车场点击事件
    marker.addEventListener("click", function(){
        var parkName = infoWindow.getTitle();
        var carContent = infoWindow.getContent();
        console.log(parkName+" "+carContent);
        top.location.href="park?parkName="+parkName+"&"+"carContent="+carContent;
    });

    marker2.addEventListener("mouseover", function(){
        map.openInfoWindow(infoWindow2, point2);
    });

    marker2.addEventListener("mouseout", function(){
        map.closeInfoWindow();
    });

    marker3.addEventListener("mouseover", function(){
        map.openInfoWindow(infoWindow3, point3);
    });

    marker3.addEventListener("mouseout", function(){
        map.closeInfoWindow();
    });
</script>
</body>
</html>
