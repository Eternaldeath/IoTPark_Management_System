<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">




    <title>VIP 详情</title>
    <meta name="description" content="VIP 详情">
    <meta name="keywords" content="VIP 详情">




    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">

    <c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
    <link rel="stylesheet" href="${path}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${path}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${path}/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="${path}/plugins/morris/morris.css">
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
            <span class="logo-lg"><b>用户</b>详情</span>
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
                    <a href="returnAdmin">
                        <i class="fa fa-pie-chart"></i> <span>管理员首页</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                </li>

                <li class="treeview">
                    <a href="vipDetail">
                        <i class="vipDetail"></i> <span>会员详情页面</span>
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
                    <a href="parkInfo">
                        <i class="parkDetail"></i> <span>停车场详情页面</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                </li>

                <li class="treeview">
                    <a href="income">
                        <i class="profitDetail"></i> <span>盈收页面</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                </li>

                <li class="treeview">
                    <a href="allOrderDetail">
                        <i class="allOrderDetail"></i> <span>所有订单</span>
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
    <!-- @@master = admin-layout.html-->
    <!-- @@block = content -->

    <div class="content-wrapper">

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                用户信息
                <small>用户详情信息</small>
            </h1>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <!-- 用户信息区域 -->
            <div class="box-body">

                <!--tab页-->
                <div class="nav-tabs-custom">
                    <!--tab内容-->
                    <div class="tab-content">

                        <!--label显示的内容-->
                        <div class="tab-pane active" id="tab-label">
                            <h5>用户详情</h5>
                            <div class="row data-type">

                                <div class="col-md-2 title">VIP 编号</div>
                                <div class="col-md-4 data text">
                                    ${oneVipList[0].id}
                                </div>

                                <div class="col-md-2 title">VIP 姓名</div>
                                <div class="col-md-4 data text">
                                    ${oneVipList[0].name}
                                </div>

                                <div class="col-md-2 title">用户密码</div>
                                <div class="col-md-4 data text">
                                    ${oneVipList[0].password}
                                </div>

                                <div class="col-md-2 title">用户昵称</div>
                                <div class="col-md-4 data text">
                                    ${oneVipList[0].nickname}
                                </div>

                                <div class="col-md-2 title">用户权限</div>
                                <div class="col-md-10 data text">
                                    <c:if test="${oneVipList[0].permission==2}">
                                        会员用户
                                    </c:if>
                                </div>

                                <div class="col-md-2 title">用户车牌</div>
                                <div class="col-md-10 data text">
                                    ${oneVipList[0].license}
                                </div>

                                <div class="col-md-2 title">用户邮箱</div>
                                <div class="col-md-10 data text">
                                    ${oneVipList[0].email}
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

            <!-- 订单详情 -->
            <div class="box-body">

                <!-- 数据表格 -->
                <div class="table-box">
                    <!--数据列表-->
                    <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                        <thead>
                        <tr>
                            <th class="sorting_asc">订单号</th>
                            <th class="sorting_desc">VIP 编号</th>
                            <th class="sorting_asc sorting_asc_disabled">下单时间</th>
                            <th class="sorting_desc sorting_desc_disabled">预定时间</th>
                            <th class="sorting_desc sorting_desc_disabled">结束时间</th>
                            <th class="sorting_desc sorting_desc_disabled">预定停车场</th>
                            <th class="sorting_desc sorting_desc_disabled">预定停车位</th>
                            <th class="sorting_desc sorting_desc_disabled">订单费用</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${myOrder}" var="cur">
                            <tr>
                                <td>${cur.id}</td>
                                <td>${cur.vipId}</td>
                                <td>${cur.startTime}</td>
                                <td>${cur.scheduledTime}</td>
                                <td>
                                    <c:if test="${cur.orderValid==1}">进行中</c:if>
                                    <c:if test="${cur.orderValid==0}">已结束</c:if>
                                </td>
                                <td>${cur.parkNum} 号停车场</td>
                                <td>${cur.parkLotNum} 号车位</td>
                                <td>￥${cur.orderFee}</td>
                                <td class="text-center">
                                    <button type="button" class="btn btn-block btn-danger"
                                            onclick='window.location.href="oneVipList?deleteId=${cur.vipId}&vipId=${cur.vipId}"'>删除订单
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>

                        </tbody>
                    </table>
                    <!--数据列表/-->
                </div>
                <!-- 数据表格 /-->
            </div>
            <!-- /.box-body -->

        </section>
        <!-- 正文区域 /-->

    </div>
    <!-- @@close -->
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
    $(document).ready(function() {
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



    $(document).ready(function() {

        // 颜色选取器
        $(".my-colorpicker1").colorpicker();
        $(".my-colorpicker2").colorpicker();

    });




    $(document).ready(function() {
        // 选择框
        $(".select2").select2();
    });




    $(document).ready(function() {

        //Date picker
        $('#datepicker').datepicker({
            autoclose: true,
            language: 'zh-CN'
        });

        // datetime picker
        $('#dateTimePicker').datetimepicker({
            format: "mm/dd/yyyy - hh:ii",
            autoclose: true,
            todayBtn: true,
            language: 'zh-CN'
        });

        //Date range picker
        $('#reservation').daterangepicker({
            locale: {
                applyLabel: '确认',
                cancelLabel: '取消',
                fromLabel: '起始时间',
                toLabel: '结束时间',
                customRangeLabel: '自定义',
                firstDay: 1
            },
            opens: 'left', // 日期选择框的弹出位置
            separator: ' 至 '
            //showWeekNumbers : true,     // 是否显示第几周
        });

        //Date range picker with time picker
        $('#reservationtime').daterangepicker({
            timePicker: true,
            timePickerIncrement: 30,
            format: 'MM/DD/YYYY h:mm A',
            locale: {
                applyLabel: '确认',
                cancelLabel: '取消',
                fromLabel: '起始时间',
                toLabel: '结束时间',
                customRangeLabel: '自定义',
                firstDay: 1
            },
            opens: 'right', // 日期选择框的弹出位置
            separator: ' 至 '
        });

        //Date range as a button
        $('#daterange-btn').daterangepicker({
                locale: {
                    applyLabel: '确认',
                    cancelLabel: '取消',
                    fromLabel: '起始时间',
                    toLabel: '结束时间',
                    customRangeLabel: '自定义',
                    firstDay: 1
                },
                opens: 'right', // 日期选择框的弹出位置
                separator: ' 至 ',
                ranges: {
                    '今日': [moment(), moment()],
                    '昨日': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    '最近7日': [moment().subtract(6, 'days'), moment()],
                    '最近30日': [moment().subtract(29, 'days'), moment()],
                    '本月': [moment().startOf('month'), moment().endOf('month')],
                    '上个月': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                },
                startDate: moment().subtract(29, 'days'),
                endDate: moment()
            },
            function(start, end) {
                $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
            }
        );

    });




    $(document).ready(function() {

        /*table tree*/
        $("#collapse-table").treetable({
            expandable: true
        });

    });




    $(document).ready(function() {

        CKEDITOR.replace('editor1');

        // $(".textarea").wysihtml5({
        //     locale:'zh-CN'
        // });

        $("#markdown-textarea").markdown({
            language: 'zh',
            autofocus: false,
            savable: false
        });

    });



    $(document).ready(function() {

        // 激活导航位置
        setSidebarActive("admin-dataform");

    });

    // 存储 sessionStroage
    // 用户名跨页面传递
    // 获取用户名
    let addName = sessionStorage.getItem("username");
    document.getElementById("username").innerText=addName;
</script>
</body>

</html>