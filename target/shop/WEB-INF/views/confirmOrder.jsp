<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>确认订单</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
</head>

<body style="position:relative;">

	<!--header-->
    <%@include file="header.jsp"%>
	
    <!--logo search weweima-->
    <%@include file="Logo.jsp"%>

    <form action="${pageContext.request.contextPath}/order/toPay.do" method="post">
    <!--内容开始-->
    <div class="payment-interface w1200">
    	<div class="pay-info">
        	<div class="info-tit">
            	<h3>选择收货地址</h3>
            </div>
                收&nbsp&nbsp货&nbsp&nbsp人:<input type="text" name="name" value="${user.name}" required>
                收货电话:<input type="text" name="phone" value="${user.phone}" required>
                <input type="hidden" name="uid" value="${user.uid}">
                <p>收货地址:<input style="width: 374px;" type="text" name="addr" value="${user.addr}" required></p>
        </div>
        <div class="pay-info">
        	<div class="info-tit" style="border-bottom:0;">
            	<h3>订单信息</h3>
            </div>
        </div>
            <div class="cart-con-info">
                <div class="cart-con-tit" style="margin:20px 0 5px;">
                    <p class="p1" style="width:400px;">
                        <input type="checkbox" value="" name="hobby"></input>
                        <span>商家：向东服饰专卖店</span>
                    </p>
                    <p class="p4" style="width:130px;">数量</p>
                    <p class="p8" style="width:75px;">运费</p>
                    <p class="p5">单价（元）</p>
                    <p class="p6" style="width:173px;">金额（元）</p>
                </div>
            <c:forEach items="${cart.cartItems}" var="cartItem">
                <div class="info-mid">
                    <div class="mid-tu f-l">
                        <a href="#"><img style="width: 80px;height: 80px;" src="${pageContext.request.contextPath}/${cartItem.product.image}" /></a>
                    </div>
                    <div class="mid-font f-l" style="margin-right:40px;width: 255px;">
                        <a href="#">${cartItem.product.pName}<br />${fn:substring(cartItem.product.pDesc,0 ,15)}...</a>
                    </div>
                    <div class="mid-sl f-l" style="margin:10px 54px 0px 0px;">
                        <input type="text" value="${cartItem.count}" readonly="true"/>
                    </div>
                    <p class="mid-yunfei f-l">¥ 0.00</p>
                    <p class="mid-dj f-l">¥ ${cartItem.product.shopPrice}</p>
                    <p class="mid-je f-l" style="margin:10px 120px 0px 0px;">¥ ${cartItem.total}</p>
                    <div style="clear:both;"></div>
                </div>
            </c:forEach>
                <div class="info-tijiao">
                    <p class="p1">实付款：<span>¥${cart.subTotal}</span></p>
                    <button class="btn">提交订单</button>
                </div>
            </div>
    </div>
    </form>
    <!--底部一块-->
    <%@include file="bottom.jsp"%>
    
    <!--确认订单（新增地址）-->
    <div class="confirmation-tanchuang" xgdz1="">
    	<div class="tanchuang-bg"></div>
    	<div class="tanchuang-con">
        	<div class="tc-title">
            	<h3>新增地址</h3>
                <a href="JavaScript:;" dz-guan=""><img src="${pageContext.request.contextPath}/images/close-select-city.gif" /></a>
                <div style="clear:both;"></div>
            </div>
            <ul class="tc-con2">
            	<li class="tc-li1">
                	<p class="l-p">所在地区<span>*</span></p>
                    <div class="xl-dz">
                    	<div class="dz-left f-l">
                        	<p>新疆</p>
                            <ul>
                            	<li class="current"><a href="#">新疆</a></li>
                            	<li><a href="#">甘肃</a></li>
                            	<li><a href="#">宁夏</a></li>
                            	<li><a href="#">青海</a></li>
                            	<li><a href="#">重庆</a></li>
                            	<li><a href="#">长寿</a></li>
                            </ul>
                        </div>
                        <div class="dz-right f-l">
                        	<p>乌鲁木齐</p>
                            <ul>
                            	<li class="current"><a href="#">乌鲁木齐</a></li>
                            	<li><a href="#">昌吉</a></li>
                            	<li><a href="#">巴音</a></li>
                            	<li><a href="#">郭楞</a></li>
                            	<li><a href="#">伊犁</a></li>
                            	<li><a href="#">阿克苏</a></li>
                            	<li><a href="#">喀什</a></li>
                            	<li><a href="#">哈密</a></li>
                            	<li><a href="#">克拉玛依</a></li>
                            	<li><a href="#">博尔塔拉</a></li>
                            	<li><a href="#">吐鲁番</a></li>
                            	<li><a href="#">和田</a></li>
                            	<li><a href="#">石河子</a></li>
                            	<li><a href="#">克孜勒苏</a></li>
                            	<li><a href="#">阿拉尔</a></li>
                            	<li><a href="#">五家渠</a></li>
                            	<li><a href="#">图木舒克</a></li>
                            	<li><a href="#">库尔勒</a></li>
                                <div style="clear:both;"></div>
                            </ul>
                        </div>
                    	<div style="clear:both;"></div>
                    </div>
                    <div style="clear:both;"></div>
                </li>
            	<li class="tc-li1">
                	<p class="l-p">详细地址<span>*</span></p>
                    <textarea class="textarea1" placeholder="请如实填写您的详细信息，如街道名称、门牌号、楼层号和房间号。"></textarea>
                    <div style="clear:both;"></div>
                </li>
            	<li class="tc-li1">
                	<p class="l-p">邮政编码<span></span></p>
                    <input type="text" />
                    <div style="clear:both;"></div>
                </li>
            	<li class="tc-li1">
                	<p class="l-p">收货人姓名<span>*</span></p>
                    <input type="text" />
                    <div style="clear:both;"></div>
                </li>
            	<li class="tc-li1">
                	<p class="l-p">联系电话<span>*</span></p>
                    <input type="text" />
                    <div style="clear:both;"></div>
                </li>
            </ul>
            <button class="btn-pst2">保存</button>
        </div>
    </div>
    
    <!--修改地址-->
    <div class="confirmation-tanchuang" xgdz2="">
    	<div class="tanchuang-bg"></div>
    	<div class="tanchuang-con">
        	<div class="tc-title">
            	<h3>新增地址</h3>
                <a href="JavaScript:;" dz-guan=""><img src="${pageContext.request.contextPath}/images/close-select-city.gif" /></a>
                <div style="clear:both;"></div>
            </div>
            <ul class="tc-con2">
            	<li class="tc-li1">
                	<p class="l-p">所在地区<span>*</span></p>
                    <div class="xl-dz">
                    	<div class="dz-left f-l">
                        	<p>北京</p>
                            <ul>
                            	<li class="current"><a href="#">新疆</a></li>
                            	<li><a href="#">甘肃</a></li>
                            	<li><a href="#">宁夏</a></li>
                            	<li><a href="#">青海</a></li>
                            	<li><a href="#">重庆</a></li>
                            	<li><a href="#">长寿</a></li>
                            </ul>
                        </div>
                        <div class="dz-right f-l">
                        	<p>天安门</p>
                            <ul>
                            	<li class="current"><a href="#">乌鲁木齐</a></li>
                            	<li><a href="#">昌吉</a></li>
                            	<li><a href="#">巴音</a></li>
                            	<li><a href="#">郭楞</a></li>
                            	<li><a href="#">伊犁</a></li>
                            	<li><a href="#">阿克苏</a></li>
                            	<li><a href="#">喀什</a></li>
                            	<li><a href="#">哈密</a></li>
                            	<li><a href="#">克拉玛依</a></li>
                            	<li><a href="#">博尔塔拉</a></li>
                            	<li><a href="#">吐鲁番</a></li>
                            	<li><a href="#">和田</a></li>
                            	<li><a href="#">石河子</a></li>
                            	<li><a href="#">克孜勒苏</a></li>
                            	<li><a href="#">阿拉尔</a></li>
                            	<li><a href="#">五家渠</a></li>
                            	<li><a href="#">图木舒克</a></li>
                            	<li><a href="#">库尔勒</a></li>
                                <div style="clear:both;"></div>
                            </ul>
                        </div>
                    	<div style="clear:both;"></div>
                    </div>
                    <div style="clear:both;"></div>
                </li>
            	<li class="tc-li1">
                	<p class="l-p">详细地址<span>*</span></p>
                    <textarea class="textarea1" placeholder="请如实填写您的详细信息，如街道名称、门牌号、楼层号和房间号。"></textarea>
                    <div style="clear:both;"></div>
                </li>
            	<li class="tc-li1">
                	<p class="l-p">邮政编码<span></span></p>
                    <input type="text" />
                    <div style="clear:both;"></div>
                </li>
            	<li class="tc-li1">
                	<p class="l-p">收货人姓名<span>*</span></p>
                    <input type="text" class="shxm" />
                    <div style="clear:both;"></div>
                </li>
            	<li class="tc-li1">
                	<p class="l-p">联系电话<span>*</span></p>
                    <input type="text" class="lxdh" />
                    <div style="clear:both;"></div>
                </li>
            </ul>
            <button class="btn-pst2">保存</button>
        </div>
    </div>
</body>
</html>
