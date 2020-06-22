<%--
  Created by IntelliJ IDEA.
  User: 23380
  Date: 2020/3/7
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html lang="en">
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户系统</title>
    <meta name="description" content="用户">
    <meta name="keywords" content="用户">
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

    <c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
    <link rel="stylesheet" href="${path}/plugins/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${path}/plugins/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${path}/plugins/ionicons/css/ionicons.min.css" />
    <link rel="stylesheet" href="${path}/plugins/iCheck/square/blue.css" />
    <link rel="stylesheet" href="${path}/plugins/morris/morris.css" />
    <link rel="stylesheet" href="${path}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="${path}/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="${path}/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="${path}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="${path}/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="${path}/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="${path}/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="${path}/plugins/select2/select2.css">
    <link rel="stylesheet" href="${path}/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="${path}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="${path}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${path}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${path}/css/style.css">
    <link rel="stylesheet" href="${path}/plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="${path}/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="${path}/plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="${path}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
    <%--额外引入，不知道为什么和源码不同--%>
    <link rel="stylesheet" href="${path}/css/ltestyle.css">
</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

    <!-- 页面头部 -->
    <header class="main-header">


        <!-- Logo -->
        <a href="#" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"><b>用户</b></span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>用户</b>后台管理</span>
        </a>


        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
        </nav>
    </header>
    <!-- 页面头部 /-->

    <!-- 导航侧栏 -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="${path}/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info" >
                    <p id="username">${adminName}</p>
                </div>
            </div>



            <!-- 侧栏菜单: style can be found in sidebar.less -->
            <ul class="sidebar-menu">
                <li class="header">菜单</li>

                <li id="admin-index"><a href="${path}/index.jsp"><i class="fa fa-dashboard"></i> <span>主页面</span></a>
                </li>

                <!-- 菜单 -->



                <li class="treeview">
                    <a href="returnUserAdmin?nickname=${oneVipByNickName.nickname}">
                        <i class="fa fa-pie-chart"></i> <span>用户首页</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                </li>

                <li class="treeview">
                    <a href="userInformationchange?nickname=${oneVipByNickName.nickname}">
                        <i class="vipDetail"></i> <span>用户信息修改</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                </li>

                <li class="treeview">
                    <a href="mapPark">
                        <i class="mapDetial"></i> <span>地图页面</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                </li>


                <li class="treeview">
                    <a href="userAccount?nickname=${oneVipByNickName.nickname}">
                        <i class="profitDetail"></i> <span>充值中心</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                </li>

                <li class="treeview">
                    <a href="userTransaction?nickname=${oneVipByNickName.nickname}">
                        <i class="profitDetail"></i> <span>交易记录</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                </li>

                <li class="treeview">
                    <a href="userOrder">
                        <i class="allOrderDetail"></i> <span>预定车位</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                </li>
                <!-- 菜单 /-->

            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>
    <!-- 导航侧栏 /-->

    <!-- 内容区域 -->
    <div class="content-wrapper">
        <!-- 正文区域 -->
        <section class="content">
            <div class="box-body">
                <div class="nav-tabs-custom">
                    <form action="returnOrderinfo" method="post">
                        <div class="box-header">
                        <i class="fa fa-paypal"></i>
                        <h3 class="box-title">预定车位</h3>&nbsp;
                        <span style="color: red;font-size: 12px">温馨提示：1. 因测试需要，停车位信息 1 min 更改一次，请快速选择。</span>
                        <span style="color: red;font-size: 12px">2. 停车位资源紧缺，目前只提供提前一天预定</span>
                    </div>
                        <!--tab内容-->
                        <div class="tab-content">
                        <!--下拉框-->
                        <div class="tab-pane active" id="tab-select">
                            <div class="row data-type">

                                <div class="col-md-2 title">预定停车场</div>
                                <div class="col-md-4 data">
                                    <select class="form-control" name="parking">
                                        <option>桂系公园园内停车场</option>
                                    </select>
                                </div>

                                <div class="col-md-2 title">预定车位</div>
                                <div class="col-md-4 data">
                                    <select class="form-control" id="orderLot" name="parkLot">
                                    </select>
                                </div>


                            </div>
                        </div>
                        <!--下拉框/-->

                        <!--日期控件-->
                        <div class="tab-pane active" id="tab-date">
                            <div class="row data-type">

                                <div class="col-md-2 title">预约时间</div>
                                <div class="col-md-4 data">
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" class="form-control pull-right" id="datepicker" name="datePicker">
                                        <input type="hidden" id="host" name="host" value="">
                                    </div>
                                </div>
                                <div class="col-md-2 title">支付费用</div>
                                <div class="col-md-4 data" style="display: flex;align-items: center">40 ￥</div>
                            </div>
                        </div>
                        <!--日期控件/-->

                        <div class="tab-pane active" id="tab-common">
                            <div class="row data-type">
                                <div class="col-md-12 data text-center">
                                    <button type="submit" class="btn bg-maroon" style="width:15%">预定</button>
                                    <button type="button" class="btn bg-default" style="width:15%" onclick="window.location.href='returnUserAdmin'">返回首页</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </section>
        <!-- 正文区域 /-->



    </div>
    <!-- 内容区域 /-->

    <!-- 底部导航 -->
    <footer class="main-footer">
        <strong>Copyright &copy; 2020 <b>IoT--Park</b></strong>
    </footer>
    <!-- 底部导航 /-->

</div>


<script src="${path}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${path}/plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="${path}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${path}/plugins/raphael/raphael-min.js"></script>
<script src="${path}/plugins/morris/morris.min.js"></script>
<script src="${path}/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="${path}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="${path}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="${path}/plugins/knob/jquery.knob.js"></script>
<script src="${path}/plugins/daterangepicker/moment.min.js"></script>
<script src="${path}/plugins/daterangepicker/daterangepicker.js"></script>
<script src="${path}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="${path}/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="${path}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="${path}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="${path}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="${path}/plugins/fastclick/fastclick.js"></script>
<script src="${path}/plugins/iCheck/icheck.min.js"></script>
<script src="${path}/plugins/adminLTE/js/app.min.js"></script>
<script src="${path}/plugins/treeTable/jquery.treetable.js"></script>
<script src="${path}/plugins/select2/select2.full.min.js"></script>
<script src="${path}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="${path}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="${path}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="${path}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="${path}/plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="${path}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="${path}/plugins/ckeditor/ckeditor.js"></script>
<script src="${path}/plugins/input-mask/jquery.inputmask.js"></script>
<script src="${path}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="${path}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="${path}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${path}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="${path}/plugins/chartjs/Chart.min.js"></script>
<script src="${path}/plugins/flot/jquery.flot.min.js"></script>
<script src="${path}/plugins/flot/jquery.flot.resize.min.js"></script>
<script src="${path}/plugins/flot/jquery.flot.pie.min.js"></script>
<script src="${path}/plugins/flot/jquery.flot.categories.min.js"></script>
<script src="${path}/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="${path}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="${path}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="${path}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>


<script>
    $(document).ready(function () {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
    });


    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }


    $(document).ready(function () {
        // 激活导航位置
        setSidebarActive("admin-index");
    });

    // 存储 sessionStroage
    // 用户名跨页面传递
    // 获取用户名
    var name = "${adminName}";
    console.log(name);

    // 如果名字存在，则存储到 sessionStroge 中
        let addName = sessionStorage.getItem("username");
        document.getElementById("username").innerText=addName;
        $("#host").val(addName);

    // 设置激活日期选择器
    //Date picker
    $('#datepicker').datepicker({
        autoclose: true,
        todayBtn: "linked",
        todayHighlight: true,
        language: 'zh-CN'
    });


    // 设置起始日期
    $('#datepicker').datepicker("setStartDate",new Date());
    // 设置结束日期
    var dateTime = new Date();
    dateTime = dateTime.setDate(dateTime.getDate()+1);
    dateTime = new Date(dateTime);
    $('#datepicker').datepicker("setEndDate",dateTime);




    // ajax 获取停车位信息
    function update() {
        $.ajax({
            url:"queryCarLot",
            type:"post",
            data:{"parkName":"桂系生态公园园内停车场"},
            cache: "false",   //设置为false将不会从浏览器中加载请求信息
            async: "true",    //true所有请求均为异步请求
            success:function (result,testStatus) {
                console.log(result);
                // 删除子元素
                $("#orderLot").empty();
                var j=0;
                for(var i=0;i<20;i++){
                    if(result[i]==1){
                        j=i+1;
                        var lotNum = $('<option>'+j+' 号车位</option>');
                        $("#orderLot").append(lotNum);
                    }
                }
                console.log("更新了");
            }
        })
    }
    update();

    setInterval(update,1000*60)
</script>
<%--<script src="${path}/js/namPass.js"></script>--%>
</body>

</html>
<!---->
