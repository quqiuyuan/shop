<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的订单(确认收货)</title>
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

	<!--nav-->
    <%@include file="nav.jsp"%>
    
    <!--内容开始-->
    <div class="personal w1200">
    	<div class="personal-left f-l">
        	<div class="personal-l-tit">
            	<h3>个人中心</h3>
            </div>
            <ul>
            	<li class="current-li per-li1"><a href="#">消息中心<span>></span></a></li>
            	<li class="per-li2"><a href="#">个人资料<span>></span></a></li>
            	<li class="per-li3"><a href="#">我的订单<span>></span></a></li>
            	<li class="per-li4"><a href="#">我的预约<span>></span></a></li>
            	<li class="per-li5"><a href="#">购物车<span>></span></a></li>
            	<li class="per-li6"><a href="#">管理收货地址<span>></span></a></li>
            	<li class="per-li7"><a href="#">店铺收藏<span>></span></a></li>
            	<li class="per-li8"><a href="#">购买记录<span>></span></a></li>
            	<li class="per-li9"><a href="#">浏览记录<span>></span></a></li>
            	<li class="per-li10"><a href="#">会员积分<span>></span></a></li>
            </ul>
        </div>
        <c:forEach items="${orderDetail}" var="order">
            <div class="f-r">
                <c:forEach items="${order.orderItemExtList}" var="orderItemList">
                    <div class="confirmation">
                        <div class="in-tit">
                            <h3>商品信息</h3>
                        </div>
                        <div class="commodity" style="border-bottom:0;">
                            <div class="matong f-l">
                                <a href="#"><img style="width: 220px;height: 220px;" src="${pageContext.request.contextPath}/${orderItemList.product.image}" /></a>
                            </div>
                            <div class="com-con f-l">
                                <h3>${orderItemList.product.pName}</h3>
                                <p class="pt">${fn:substring(orderItemList.product.pDesc,0 ,15 )}</p>
                                <dl>
                                    <dt>规格</dt>
                                    <dd>尺码：400mml坑距<br />颜色：白色</dd>
                                    <div style="clear:both;"></div>
                                </dl>
                                <dl>
                                    <dt>促销</dt>
                                    <dd><span class="sp1">满赠</span>      指定商品满1件，赠送卫欲无限 座便器配件三件套</dd>
                                    <div style="clear:both;"></div>
                                </dl>
                                <dl>
                                    <dt>送货至</dt>
                                    <dd>重庆南岸区（包邮）</dd>
                                    <div style="clear:both;"></div>
                                </dl>
                                <dl>
                                    <dt>数量</dt>
                                    <dd><span class="sp2">¥${orderItemList.count}</span></dd>
                                    <div style="clear:both;"></div>
                                </dl>
                                <dl>
                                    <dt>价格</dt>
                                    <dd><span class="sp2">¥${orderItemList.subTotal}</span></dd>
                                    <div style="clear:both;"></div>
                                </dl>
                            </div>
                            <div style="clear:both;"></div>
                        </div>
                    </div>
                </c:forEach>
                <div class="confirmation">
                    <div class="in-tit">
                        <h3>订单信息</h3>
                    </div>
                    <div class="odr-cf">
                        <p><span>收货人:</span> ${order.name}</p>
                        <p><span>收货电话:</span> ${order.phone}</p>
                        <p><span>收货地址:</span> ${order.addr}</p>
                        <p><span>邮编:</span> 000000</p>
                        <p><span>成交时间:</span> ${order.orderTime}</p>
                        <p><span>总计:</span> ${order.total}</p>
                        <p><span>订单号:</span> ${order.oid}</p>
                    </div>
                </div>
                <div class="confirmation">
                    <div class="in-tit">
                        <h3>确认收货</h3>
                    </div>
                    <div class="odr-sh">
                        <P class="reminder">温馨提示：请收到货后，再确认收货！否则您可能钱货两空！</P>
                        <div class="zfb">
                            <P class="zfmm">支付宝支付密码：</P>
                            <input type="text" /><input type="text" /><input type="text" /><input type="text" /><input type="text" /><input type="text" style="border-right:1px solid #E5E5E5;"/>
                            <p class="shuzi">请输入6位数字支付密码</p>
                            <button class="zfb-btn" onclick="window.location.href='${pageContext.request.contextPath}/order/toChangePayStateThree.do?oid=${order.oid}&uid=${order.uid}&pageNow=${pageNow}'">确认</button>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
        <div style="clear:both;"></div>
    </div>
    
    <!--底部一块-->
    <%@include file="bottom.jsp"%>
</body>
</html>
