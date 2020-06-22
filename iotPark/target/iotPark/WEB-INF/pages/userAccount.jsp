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
    <link rel="stylesheet" href="${path}/css/amazeui.min.css">
    <link rel="stylesheet" href="${path}/css/main.css">
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
                    <a href="returnUserAdmin?nickname=${account.nickname}">
                        <i class="fa fa-pie-chart"></i> <span>用户首页</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                </li>

                <li class="treeview">
                    <a href="userInformationchange?nickname=${account.nickname}">
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
                    <a href="userAccount?nickname=${account.nickname}">
                        <i class="profitDetail"></i> <span>充值中心</span>
                        <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    </a>
                </li>

                <li class="treeview">
                    <a href="userTransaction?nickname=${account.nickname}">
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
            <div class="pay">
                <!--主内容开始编辑-->
                <div class="tr_recharge">
                    <div class="tr_rechtext">
                        <p class="te_retit"><img src="${path}/img/coin.png" alt="" />充值中心</p>
                        <p>智慧停车场充值中心</p>
                    </div>
                    <form action="userRecharge" method="post" class="am-form" id="doc-vld-msg">
                        <div class="tr_rechbox">
                            <div class="tr_rechhead">
                                <img src="${path}/img/ys_head2.jpg" />
                                <p>充值帐号：
                                    <a>${account.nickname}</a>
                                </p>
                                <div class="tr_rechheadcion">
                                    <img src="${path}/img/coin.png" alt="" />
                                    <span>当前余额：<span>${account.totalMoney}</span></span>
                                </div>
                            </div>
                            <div class="tr_rechli am-form-group">
                                <ul class="ui-choose am-form-group" id="uc_01">
                                <%--  li 标签中文字居中--%>
                                    <li style="text-align: center;color: black;font-weight: bold">
                                        <input  type="radio" value="10" name="submit_num" > 10￥
                                    </li>
                                    <li style="text-align: center;color: black;font-weight: bold">
                                        <input type="radio"  value="20" name="submit_num" > 20￥
                                    </li>
                                    <li style="text-align: center;color: black;font-weight: bold">
                                        <input type="radio"  value="50" name="submit_num" > 50￥
                                    </li>
<%--                                    <li style="text-align: center;color: black;font-weight: bold">--%>
<%--&lt;%&ndash;                                        <label class="am-radio-inline">&ndash;%&gt;--%>
<%--                                           其他金额--%>
<%--&lt;%&ndash;                                        </label>&ndash;%&gt;--%>
<%--                                    </li>--%>
                                </ul>
                            </div>
                            <div class="tr_rechoth am-form-group">
                                <span>其他金额：</span>
                                <input type="number" min="10" max="10000" value="0"  name="rangeMoney" class="othbox" data-validation-message="充值金额范围：10-10000元" />
                                <!--<p>充值金额范围：10-10000元</p>-->
                            </div>
                            <div class="tr_rechcho am-form-group">
                                <span>充值方式：</span>
                                <label class="am-radio">
                                    <input type="radio" name="paymethod" value="1" data-am-ucheck required data-validation-message="请选择一种充值方式"><img src="${path}/img/wechatpay.png">

                                </label>
                                <label class="am-radio" style="margin-right:30px;">
                                    <input type="radio" name="paymethod" value="2" data-am-ucheck data-validation-message="请选择一种充值方式"><img src="${path}/img/zfbpay.png">
                                </label>
                            </div>
                            <div class="tr_rechnum">
                                <span>应付金额：</span>
                                <p class="rechnum">0.00元</p>
                            </div>
                        </div>
                        <div class="tr_paybox">
                            <input type="hidden" name="nickname" value="${account.nickname}">
                            <input type="submit" value="确认支付" class="tr_pay am-btn" />
<%--                            <span style="color: red;font-weight: bold">温馨提示：充值金额限于 ￥10 ~ ￥10000</span>--%>
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

<script type="text/javascript" src="${path}/js/jquery.min.js"></script>
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

<script type="text/javascript" src="${path}/js/amazeui.min.js"></script>
<script type="text/javascript" src="${path}/js/ui-choose.js"></script>

<script>
    // $(document).ready(function () {
    //     // 选择框
    //     $(".select2").select2();
    //
    //     // WYSIHTML5编辑器
    //     $(".textarea").wysihtml5({
    //         locale: 'zh-CN'
    //     });
    // });

    // 验证用户充值成功
    <%--var flag = "${flag}";--%>
    <%--if(flag=="1"){--%>
    <%--    alert("充值成功");--%>
    <%--}else if(flag!="1"){--%>
    <%--    alert("充值失败，稍后重试");--%>
    <%--}--%>

    // test
    // $(".as").click(function(){
    //     alert(1);
    // })

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
        let addName = sessionStorage.getItem("username");
        document.getElementById("username").innerText=addName;


    // 充值部分代码
    // 将所有.ui-choose实例化
    $('.ui-choose').ui_choose();
    // uc_01 ul 单选
    var uc_01 = $('#uc_01').data('ui-choose'); // 取回已实例化的对象
    uc_01.click = function(index, item) {
        console.log('click', index, item.text())
    }
    uc_01.change = function(index, item) {
        console.log('change', index, item.text())
    }
    $(function() {
        $('#uc_01 li:eq(3)').click(function() {
            $('.tr_rechoth').show();
            $('.tr_rechoth').find("input").attr('required', 'true')
            $('.rechnum').text('10.00元');
        })
        $('#uc_01 li:eq(0)').click(function() {
            $('.tr_rechoth').hide();
            $('.rechnum').text('10.00元');
            $('.othbox').val('');
        })
        $('#uc_01 li:eq(1)').click(function() {
            $('.tr_rechoth').hide();
            $('.rechnum').text('20.00元');
            $('.othbox').val('');
        })
        $('#uc_01 li:eq(2)').click(function() {
            $('.tr_rechoth').hide();
            $('.rechnum').text('50.00元');
            $('.othbox').val('');
        })
        $(document).ready(function() {
            $('.othbox').on('input propertychange', function() {
                var num = $(this).val();
                $('.rechnum').html(num + ".00元");
            });
        });
    })

    $(function() {
        $('#doc-vld-msg').validator({
            onValid: function(validity) {
                $(validity.field).closest('.am-form-group').find('.am-alert').hide();
            },
            onInValid: function(validity) {
                var $field = $(validity.field);
                var $group = $field.closest('.am-form-group');
                var $alert = $group.find('.am-alert');
                // 使用自定义的提示信息 或 插件内置的提示信息
                var msg = $field.data('validationMessage') || this.getValidationMessage(validity);

                if(!$alert.length) {
                    $alert = $('<div class="am-alert am-alert-danger"></div>').hide().
                    appendTo($group);
                }
                $alert.html(msg).show();
            }
        });
    });
</script>
<%--<script src="${path}/js/namPass.js"></script>--%>
</body>

</html>
<!---->

