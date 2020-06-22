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
ji
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

        <!-- 内容头部 -->
        <section class="content-header">
            <h1 style="color:black">
                控制面板
                <small>首页</small>
            </h1>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">


            <!-- 统计数值 -->
            <div class="row">
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-aqua">
                        <div class="inner">
                            <h3>${allOrderNumInOne}</h3>

                            <p>订单数</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-bag"></i>
                        </div>
                    </div>
                </div>
                <!-- ./col -->
                <div class="col-lg-3 col-xs-6">
                    <!-- small box -->
                    <div class="small-box bg-green">
                        <div class="inner">
                            <h3>${account.totalMoney}</h3>

                            <p>账户余额</p>
                        </div>
                        <div class="icon">
                            <i class="ion ion-stats-bars"></i>
                        </div>
<%--                        <a href="curOrderInfo" class="small-box-footer">详细 <i--%>
<%--                                class="fa fa-arrow-circle-right"></i></a>--%>
                    </div>
                </div>
                <!-- ./col -->
                <!-- ./col -->
                <!-- ./col -->
            </div>
            <!-- /.row -->

            <!-- 用户信息区域 -->
            <div class="box-body box-primary">

                <!--tab页-->
                <div class="nav-tabs-custom">
                    <!--tab内容-->
                    <div class="tab-content">

                        <!--label显示的内容-->
                        <div class="tab-pane active" id="tab-label">
                            <div class="box-header with-border">
                                <i class="fa fa-info"></i>
                                <h3 class="box-title">我的信息</h3>
                            </div>
                            <div class="row data-type">

                                <div class="col-md-2 title">VIP 编号</div>
                                <div class="col-md-4 data text">
                                    ${oneVipByNickName.id}
                                </div>

                                <div class="col-md-2 title">VIP 姓名</div>
                                <div class="col-md-4 data text">
                                    ${oneVipByNickName.name}
                                </div>

                                <div class="col-md-2 title">用户密码</div>
                                <div class="col-md-4 data text">
                                    ${oneVipByNickName.password}
                                </div>

                                <div class="col-md-2 title">用户昵称</div>
                                <div class="col-md-4 data text">
                                    ${oneVipByNickName.nickname}
                                </div>

                                <div class="col-md-2 title">用户权限</div>
                                <div class="col-md-10 data text">
                                    <c:if test="${oneVipByNickName.permission==2}">
                                        会员用户
                                    </c:if>
                                </div>

                                <div class="col-md-2 title">用户车牌</div>
                                <div class="col-md-10 data text">
                                    ${oneVipByNickName.license}
                                </div>

                                <div class="col-md-2 title">用户邮箱</div>
                                <div class="col-md-10 data text">
                                    ${oneVipByNickName.email}
                                </div>

                                <div class="col-md-2 title rowHeight2x">备注</div>
                                <div class="col-md-10 data rowHeight2x">
                                    <textarea class="form-control" rows="3" placeholder="该功能暂未开启" disabled="disabled"></textarea>
                                </div>

                            </div>
                        </div>
                        <!--label显示的内容/-->

                    </div>
                    <!--tab内容/-->

                </div>
                <!--tab页/-->


                <!-- .box-footer
    <div class="box-footer"></div>
    -->
                <!-- /.box-footer-->

            </div>


            <!-- 待处理订单 -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <i class="fa fa-cube"></i>
                    <h3 class="box-title">我的订单</h3>
                </div>

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">

                        <!--数据列表-->
                        <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th class="">订单号</th>
                                <th class="">vip 编号</th>
                                <th class="">下单时间</th>
                                <th class="">预定时间</th>
                                <th class="">结束时间</th>
                                <th class="">预定停车场</th>
                                <th class="">预定停车位</th>
                                <th class="">订单费用</th>
                                <%--                                <th class="text-center">操作</th>--%>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${myOrderList}" var="cur">
                                <tr>
                                    <td>${cur.id}</td>
                                    <td>${cur.vipId}</td>
                                    <td>${cur.startTime}</td>
                                    <td>${cur.scheduledTime}</td>
                                    <td>
                                        <c:if test="${cur.orderValid==1}">进行中</c:if>
                                        <c:if test="${cur.orderValid==0}">已经结束</c:if>
                                    </td>
                                    <td>${cur.parkNum} 号停车场</td>
                                    <td>${cur.parkLotNum} 号车位</td>
                                    <td>￥${cur.orderFee}</td>
                                        <%--                                    <td class="text-center">--%>
                                        <%--                                        <button type="button" class="btn btn-danger  btn-xs"--%>
                                        <%--                                                onclick='location.href="deleteOrder?vipId=${cur.vipId}"'>删除--%>
                                        <%--                                        </button>--%>
                                        <%--                                    </td>--%>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <!--数据列表/-->

                    </div>
                    <!-- 数据表格 /-->

                </div>
                <!-- /.box-body -->

                <!-- .box-footer-->
<%--                <div class="box-footer">--%>
<%--                    <div class="box-tools pull-right">--%>
<%--                        <ul class="pagination">--%>
<%--                            <li>--%>
<%--                                <a href="userLogin?startPage=0&userId=${oneVipByNickName.id}" aria-label="Previous">首页</a>--%>
<%--                            </li>--%>
<%--                            <c:forEach var="i" begin="1" end="${(orderOneVipNum/5)+1}" step="1">--%>
<%--                                <li><a href="userLogin?startPage=${(i-1)*5}&userId=${oneVipByNickName.id}">${i}</a></li>--%>
<%--                            </c:forEach>--%>
<%--                            &lt;%&ndash;                            <li>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                                <a href="vipDetail?startPage=${vipNum/5}" aria-label="Next">尾页</a>&ndash;%&gt;--%>
<%--                            &lt;%&ndash;                            </li>&ndash;%&gt;--%>
<%--                        </ul>--%>
<%--                    </div>--%>
<%--            </div>--%>
            <!-- 待处理订单 /-->
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
    if(name!=""){
        sessionStorage.setItem("username",name);
    }else {
        let addName = sessionStorage.getItem("username");
        document.getElementById("username").innerText=addName;

    }
</script>
<%--<script src="${path}/js/namPass.js"></script>--%>
</body>

</html>
<!---->
