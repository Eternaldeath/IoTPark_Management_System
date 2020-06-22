<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>模拟测试</title>
    <meta name="description" content="模拟测试">
    <meta name="keywords" content="模拟测试">
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <c:set value="${pageContext.request.contextPath}" var="path" scope="page"/>
    <link href="${path}/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${path}/css/runIn.css" rel="stylesheet" />
    <link href="${path}/css/buttons.css" rel="stylesheet" />
    <style>
        .fapiaoContainer{
            display: flex;
            flex-direction: column;
            border: 1px solid black;
            font-size: 12px;
        }
        #fHeader{
            display: flex;
            justify-content: center;
        }
        #fHeader,#fBody,#fProduct{
            padding-left: 10px;

        }

        #fFooter{
            border-top: 1px dashed black;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        #frog{
            position: absolute;
            width: 100%;
            height: 100%;
            display: none;
        }
        #parkPic{
            position: relative;
            width: 100%;
            height: 60%;
            display: none;
            padding: 3px;
        }
    </style>
</head>
<body>
<%--引入 bootstrap 的模态框--%>
<!-- 正在扫描提示框 -->
<div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">通知信息</h4>
            </div>
            <div class="modal-body">
                车牌号扫描完成
            </div>
            <div class="modal-footer">
                <button id="nextStep" type="button" class="btn btn-default" data-dismiss="modal">下一步</button>
<%--                <button type="button" class="btn btn-primary">Save changes</button>--%>
            </div>
        </div>
    </div>
</div>

<%--刷卡登录--%>
<div class="modal fade bs-example-modal-sm" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel4">车主正在刷卡</h4>
            </div>
            <div class="modal-body">
                <img width="100%" height="100%" src="${path}/img/card.png" />
            </div>
            <div class="modal-footer">
                <button id="nextStep2" type="button" class="btn btn-default" data-dismiss="modal">确认刷卡</button>
                <%--                <button type="button" class="btn btn-primary">Save changes</button>--%>
            </div>
        </div>
    </div>
</div>

<div class="modal fade bs-example-modal-lg" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel3">打印发票</h4>
            </div>
            <div class="modal-body">
                <div class="fapiaoContainer">
                    <div id="fHeader">
                        <h3>交易明细</h3>&nbsp
                        <br />
                        <h3>桂溪公园园内停车场</h3>
                    </div>
                    <div id="fBody">
                        <p id="curTime"></p>
                        <p>机器号&nbsp;<span>381002</span></p>
                        <p>序号&nbsp;<span>2810</span></p>
                    </div>
                    <div id="fProduct">
                        <p>数量&nbsp;<span>1</span></p>
                        <p>产品&nbsp;<span>停车票证</span></p>
                        <p>费用<span>￥ 40</span></p>
                    </div>

                    <div id="fFooter">
                        <p>发票日期未实际开具当日</p>
                        <p>发票消费仅在当日有效</p>
                        <img src="${path}/img/fapiao.png" alt="" width="20%">
                        <p>欢迎您再次光临</p>
                        <p>咨询热线：<span>400-9200-111</span></p>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button id="nextStep" type="button" class="btn btn-default" data-dismiss="modal">下一步</button>
                <%--                <button type="button" class="btn btn-primary">Save changes</button>--%>
            </div>
        </div>
    </div>
</div>

<%--支付界面--%>
<div class="modal fade bs-example-modal-sm" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel2">在线支付</h4>
            </div>
            <div class="modal-body">
                <img src="${path}/img/alipay.png">
            </div>
            <div class="modal-footer">
                <button id="checkPay" type="button" class="btn btn-default" data-dismiss="modal">确认支付</button>
<%--                <button id="dismissPay" type="button" class="btn btn-primary" data-dismiss="modal">取消支付</button>--%>
            </div>
        </div>
    </div>
</div>

<%--正文内容--%>
    <div id="container">
        <div class="leftContainer">
            <div id="device"></div>
            <div id="deviceDown">
                <div id="deviceContain">
                    <div id="screen">
                        <div id="screenUp">
                            <div id="innerInfo">
                                <div id="head">桂溪公园园内停车场</div>
                                <div id="headInfo">
                                    <p>车位总数：20</p>
                                    <p>普通车位：<span>10</span>/10</p>
                                    <p>VIP车位：<span>10</span>/10</p>
                                </div>
                                <img id="parkPic" src="${path}/img/parkPic.png">
                            </div>
                        </div>
                        <div id="screenDown">
                            <div id="downStack"></div>
                        </div>
                    </div>
                    <div id="stack">
                        <img  src="${path}/img/stack.png" />
                    </div>
                </div>
            </div>
        </div>
        <div class="rightContainer">
            <div class="btnGroup">
                <div class="btnRow">
                    <button id="frogDay" class="button button-large button-plain button-border">大雾天气</button>
                    <button id="sunDay" class="button button-large button-plain button-border" style="display: none">万里无云</button>
                </div>
                <div class="btnRow">
                    <button id="runTo" class="button button-large button-plain button-border" >进行检查</button>
                    <button id="runIn" class="button button-large button-plain button-border" style="display: none" onclick="window.location.href='testPage/testPark'">进入停车场</button>
                </div>
            </div>
            <div class="carPic">
                <img id="myCar" src="${path}/img/carr05.png" />
            </div>

        </div>
        <img id="frog" src="${path}/img/frog2.png">
    </div>


<script src="${path}/js/anime.min.js"></script>
<script src="${path}/js/jquery.min.js"></script>
<script src="${path}/js/bootstrap.min.js"></script>
<script>
    var date = new Date();
    document.getElementById("curTime").innerHTML = date;
</script>
<script src="${path}/js/runIn.js"></script>


</body>
</html>
