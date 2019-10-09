<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fu" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购物车</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
<style>
    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
    }
    input[type="number"]{
        -moz-appearance: textfield;
    }
</style>
<script type="text/javascript">
    $(function () {
        //修改商品数量
        $("[name='count']").change(function () {
            var count = $(this).val();
            var pid = $(this).attr("id");
            if (count<1){
                alert("购买件数不能为负数");
                $("#"+pid).val(1);
                count = 1;
            }
            if (count>100){
                alert("最多购买100件");
                $("#"+pid).val(100);
                count = 100;
            }
            $.ajax({
                url:"${pageContext.request.contextPath}/cart/changeCount.do",
                data:{
                  count:count,
                  pid:pid
                },
                success:function (data) {
                    $("#subTotal").html(data);
                    var price = Number($("#price"+pid).html());
                    $("#total"+pid).html(price*Number(count));
                }
            })
        })
       //加减处理
        $("[name='change']").click(function () {
            var count = $(this).parent().find("[name='count']").val();
            var pid = $(this).parent().find("[name='count']").attr("id");
            if (count<1){
                alert("购买件数不能为负数");
                $("#"+pid).val(1);
                count = 1;
            }
            if (count>100){
                alert("最多购买100件");
                $("#"+pid).val(100);
                count = 100;
            }
            $.ajax({
                url:"${pageContext.request.contextPath}/cart/changeCount.do",
                data:{
                    count:count,
                    pid:pid
                },
                success:function (data) {
                    $("#subTotal").html(data);
                    var price = Number($("#price"+pid).html());
                    $("#total"+pid).html(price*Number(count));
                }
            })
        })
        //删除购物项
        $("[name='removeCartItem']").click(function () {
            if (confirm("确认删除？")){
                var pid = $(this).attr("id");
                $.ajax({
                    url:"${pageContext.request.contextPath}/cart/removeCartItem.do",
                    data:{
                        pid:pid
                    },
                    success:function (data) {
                        $("#subTotal").html(data);
                        $("#div"+pid).remove();
                        $("#carNumber").html($("#carNumber").html()-1);
                    }
                })
            }
        })
        //清空购物车
        $("#clear").click(function () {
            if (confirm("清空购物车？")){
                $.ajax({
                    url:"${pageContext.request.contextPath}/cart/clear.do",
                    success:function (data) {
                        if (data!=null){
                            $("#subTotal").html(data);
                            $("#allCartItem").remove();
                            $("#all").remove();
                            $("#carNumber").html(0);
                        }
                    }
                })
            }
        })
    })
</script>    
</head>

<body style="position:relative;">

	<!--header-->
    <%@include file="header.jsp"%>
	
    <!--logo search weweima-->
    <%@include file="Logo.jsp"%>

    <!--内容开始-->
    <div class="cart-content w1200">
    	<ul class="cart-tit-nav">
        	<li class="current"><a href="#">全部商品   <span id="carNumber">${fn:length(cart.cartItems)}</span></a></li>
            <div style="clear:both;"></div>
        </ul>
        <div class="cart-con-tit">
        	<p class="p1">商品图片</p>
            <p class="p2">商品信息</p>
            <p class="p4">数量</p>
            <p class="p5">单价（元）</p>
            <p class="p6">金额（元）</p>
            <p class="p7">操作</p>
        </div>

        <span id="allCartItem">
            <c:forEach items="${cart.cartItems}" var="cartItem">
            <div class="cart-con-info" id="div${cartItem.product.pid}">
                <div class="info-top">
                </div>
                <div class="info-mid">
                    <div class="mid-tu f-l">
                        <a href="#"><img style="width: 80px;height: 80px;" src="${pageContext.request.contextPath}/${cartItem.product.image}" /></a>
                    </div>
                    <div class="mid-font f-l" style="width: 255px;">
                        <a href="#">${cartItem.product.pName}<br />${fn:substring(cartItem.product.pDesc,0 ,15)}...</a>
                        <span>满赠</span>
                    </div>
                    <div class="mid-sl f-l">
                        <a href="JavaScript:;" name="change" class="sl-left">-</a>
                        <input type="number" id="${cartItem.product.pid}" name="count" value="${cartItem.count}" />
                        <a href="JavaScript:;" name="change" class="sl-right">+</a>
                    </div>
                    <p class="mid-dj f-l">¥ <span id="price${cartItem.product.pid}">${cartItem.product.shopPrice}</span></p>
                    <p class="mid-je f-l">¥ <span id="total${cartItem.product.pid}">${cartItem.total}</span></p>
                    <div class="mid-chaozuo f-l">
                        <a href="JavaScript:;" id="${cartItem.product.pid}" name="removeCartItem">删除</a>
                    </div>
                    <div style="clear:both;"></div>
                </div>
            </div>
            </c:forEach>
        </span>


        <c:if test="${!empty sessionScope.cart.cartItems}">
            <div class="cart-con-footer" id="all">
                <div class="quanxuan f-l">
                    <a href="JavaScript:;" id="clear">清空购物车</a>
                    <p>（此处始终在屏幕下方）</p>
                </div>
                <div class="jiesuan f-r">
                    <div class="jshj f-l">
                        <p>合计（不含运费）</p>
                        <p class="jshj-p2">
                            ￥：<span id="subTotal">${empty cart.subTotal?"0.00":cart.subTotal}</span>
                        </p>
                    </div>
                    <a href="${pageContext.request.contextPath}/order/toConfirmOrder.do" class="js-a1 f-l">结算</a>
                    <div style="clear:both;"></div>
                </div>
                <div style="clear:both;"></div>
            </div>
        </c:if>
        <c:if test="${empty sessionScope.cart.cartItems}">
            购物车没有商品
        </c:if>
    </div>
    
    <!--底部一块-->
    <%@include file="bottom.jsp"%>
</body>
</html>
