<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>支付成功</title>
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
    
    <!--内容开始-->
    <div class="payment w1200">
    	<div class="payment-hd">
        	<h3 class="success">支付成功</h3>
        </div>

        <c:forEach items="${orderDetail}" var="order">
            <c:forEach items="${order.orderItemExtList}" var="orderItemList">
                <div class="payment-bd">
                    <dl class="dl-hd">
                        <dt><a href="#"><img style="width: 122px;height: 122px;" src="${pageContext.request.contextPath}/${orderItemList.product.image}" /></a></dt>
                        <dd>
                            <h3><a href="#">${orderItemList.product.pName}</a></h3>
                            <P>${fn:substring(orderItemList.product.pDesc,0 ,15)}...</P>
                        </dd>
                        <div style="clear:both;"></div>
                    </dl>
                    <ul class="ul-bd">
                        <li><span>购买数量</span><p>${orderItemList.count}</p></li>
                        <li><span>价格</span><p><i>${orderItemList.subTotal}</i></p></li>
                    </ul>
                </div>
            </c:forEach>
                <div class="payment-bd">
                    <ul class="ul-bd">
                        <li><span>收货人</span><p> ${order.name}</p></li>
                        <li><span>收货电话</span><p>${order.phone}</p></li>
                        <li><span>收货地址</span><p>${order.addr}</p></li>
                        <li><span>邮编</span><p>000000</p></li>
                        <li><span>成交时间</span><p>${order.orderTime}</p></li>
                        <li><span>总计</span><p>${order.total}</p></li>
                        <li><span>订单号</span><p>${order.oid}</p></li>
                    </ul>
                </div>
        </c:forEach>

        <div class="payment-ft">
        	<button class="btn2"><a href="${pageContext.request.contextPath}/order/toMyOrders.do?uid=${sessionScope.user.uid}">我的订单</a></button>
        </div>
    </div>
    
    <!--底部一块-->
    <%@include file="bottom.jsp"%>
</body>
</html>
