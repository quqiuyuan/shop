<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的订单</title>
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
    $(function(){
        $("#button1").click(function(){
            $("#button1").attr("disabled",true)
            $("#button1").text("今已提醒")
        })
    })
</script>
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
    	<div class="order-right f-r">
        	<div class="order-hd">
            	<dl class="f-l">
                	<dt>
                    	<a href="#"><img src="${pageContext.request.contextPath}/images/data-tu2.gif" /></a>
                    </dt>
                    <dd>
                    	<h3><a href="#">${sessionScope.user.name}</a></h3>
                        <p>${sessionScope.user.userName}</p>
                    </dd>
                    <div style="clear:both;"></div>
                </dl>
                <div class="ord-dai f-l">
                	<p>待付款<span>1</span></p>
                	<p>待发货<span>1</span></p>
                	<p>待收货<span>1</span></p>
                	<p>待评价<span>1</span></p>
                </div>
                <div style="clear:both;"></div>
            </div>
            <div class="order-md">
            	<div class="md-tit">
                	<h3>我的订单</h3>
                </div>
                <div class="md-hd">
                    <p class="md-p2" style="width: 454px;">商品信息</p>
                    <p class="md-p3">规格</p>
                    <p class="md-p4">单价（元）</p>
                    <p class="md-p5">金额（元）</p>
                </div>
                <c:if test="${myOrders.pageNow!=null}">
                    <c:set var="page" value="${myOrders.pageNow}"></c:set>
                </c:if>
                <c:forEach items="${myOrders.list}" var="myOrders">
                    <c:choose>
                        <c:when test="${myOrders.state==0}"><c:set var="status" value="待支付"></c:set></c:when>
                        <c:when test="${myOrders.state==1}"><c:set var="status" value="待发货"></c:set></c:when>
                        <c:when test="${myOrders.state==2}"><c:set var="status" value="待收货"></c:set></c:when>
                        <c:when test="${myOrders.state==3}"><c:set var="status" value="待评价"></c:set></c:when>
                    </c:choose>
                    <div style="background-color: #2a6496;width: 961px;height: 10px;" ></div>
                    <div class="md-info">
                        <div class="dai">
                            订单号：${myOrders.oid}   <span>${status}</span>
                        </div>
                        <c:forEach items="${myOrders.orderItemExtList}" var="orderItemExt">
                            <div class="dai-con">
                                <dl class="dl1">
                                    <dt>
                                        <a href="#" class="f-l"><img style="width: 80px;height: 80px;" src="${pageContext.request.contextPath}/${orderItemExt.product.image}" /></a>
                                        <div style="clear:both;"></div>
                                    </dt>
                                    <dd>
                                        <p>${orderItemExt.product.pName} ${fn:substring(orderItemExt.product.pDesc,0 ,15 )}...</p>
                                        数量：<span>X ${orderItemExt.count}</span>
                                    </dd>
                                    <div style="clear:both;"></div>
                                </dl>
                                <div class="dai-right f-l">
                                    <P class="d-r-p1">颜色：蓝色<br />尺码：XL</P>
                                    <p class="d-r-p2">¥ ${orderItemExt.product.shopPrice}</p>
                                    <p class="d-r-p3">¥ ${orderItemExt.subTotal}</p>
                                </div>
                                <div style="clear:both;"></div>
                            </div>
                        </c:forEach>
                        <div align="right">
                            <c:if test="${myOrders.state==0||myOrders.state==3}">
                                <button id="delbtn"><a href="${pageContext.request.contextPath}/order/toDelOrder.do?oid=${myOrders.oid}&pageNow=${page}&uid=${sessionScope.user.uid}">删除</a></button>
                            </c:if>
                            <c:if test="${myOrders.state==0}">
                                <button><a href="${pageContext.request.contextPath}/order/toOrderPay.do?oid=${myOrders.oid}">付款</a></button>
                            </c:if>
                            <c:if test="${myOrders.state==1}">
                                <button id="button1" onclick="alert('已提醒商家发货!!!')"><a href="JavaScript:;">提醒发货</a></button>
                            </c:if>
                            <c:if test="${myOrders.state==2}">
                                <button onclick="window.location.href='${pageContext.request.contextPath}/order/toConfirmPay.do?oid=${myOrders.oid}&pageNow=${page}&uid=${sessionScope.user.uid}'"><a href="#">确认收货</a></button>
                            </c:if>
                            <c:if test="${myOrders.state==3}">
                                <button><a href="JavaScript:;">去评价 </a></button>
                            </c:if>
                            <h2 style="color: red">订单总计:${myOrders.total}</h2>
                        </div>
                    </div>
                </c:forEach>
                <div style="background-color: #2a6496;width: 961px;height: 10px;" ></div>

                <!--分页-->
                <div class="paging">
                    <div class="pag-left f-l">
                        <c:if test="${myOrders.pageNow!=1}">
                            <a href="${pageContext.request.contextPath}/order/toMyOrders.do?pageNow=${myOrders.pageNow-1}&uid=${sessionScope.user.uid}" class="about left-r f-l"><</a>
                        </c:if>
                        <ul class="left-m f-l">
                            <c:if test="${myOrders.pageCount<5}">
                                <c:forEach var="i" begin="1" end="${myOrders.pageCount}" step="1">
                                    <c:if test="${myOrders.pageNow==i}">
                                        <li><a href='${pageContext.request.contextPath}/order/toMyOrders.do?pageNow=${i}&uid=${sessionScope.user.uid}'   class="${pagenow == requestScope.pageProduct.pageNow?"current":""}">${i}    </a></li>
                                    </c:if>
                                    <c:if test="${myOrders.pageNow!=i}">
                                        <li><a href='${pageContext.request.contextPath}/order/toMyOrders.do?pageNow=${i}&uid=${sessionScope.user.uid}'  >${i}    </a></li>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <c:if test="${myOrders.pageCount>=5}">
                                <c:if test="${myOrders.pageNow>=3&&myOrders.pageNow<=(myOrders.pageCount-2)}">
                                    <c:forEach var="i" begin="${myOrders.pageNow-2}" end="${myOrders.pageNow+2}" step="1">
                                        <c:if test="${myOrders.pageNow==i}">
                                            <li><a href='${pageContext.request.contextPath}/order/toMyOrders.do?pageNow=${i}&uid=${sessionScope.user.uid}'   class="${pagenow == requestScope.pageProduct.pageNow?"current":""}">${i}    </a></li>
                                        </c:if>
                                        <c:if test="${myOrders.pageNow!=i}">
                                            <li><a href='${pageContext.request.contextPath}/order/toMyOrders.do?pageNow=${i}&uid=${sessionScope.user.uid}'  >${i}    </a></li>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${myOrders.pageNow==1}">
                                    <c:forEach var="i" begin="1" end="5" step="1">
                                        <c:if test="${myOrders.pageNow==i}">
                                            <li><a href='${pageContext.request.contextPath}/order/toMyOrders.do?pageNow=${i}&uid=${sessionScope.user.uid}'   class="${pagenow == requestScope.pageProduct.pageNow?"current":""}">${i}    </a></li>
                                        </c:if>
                                        <c:if test="${myOrders.pageNow!=i}">
                                            <li><a href='${pageContext.request.contextPath}/order/toMyOrders.do?pageNow=${i}&uid=${sessionScope.user.uid}'  >${i}    </a></li>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${myOrders.pageNow==2}">
                                    <c:forEach var="i" begin="1" end="5" step="1">
                                        <c:if test="${myOrders.pageNow==i}">
                                            <li><a href='${pageContext.request.contextPath}/order/toMyOrders.do?pageNow=${i}&uid=${sessionScope.user.uid}'   class="${pagenow == requestScope.pageProduct.pageNow?"current":""}">${i}    </a></li>
                                        </c:if>
                                        <c:if test="${myOrders.pageNow!=i}">
                                            <li><a href='${pageContext.request.contextPath}/order/toMyOrders.do?pageNow=${i}&uid=${sessionScope.user.uid}'  >${i}    </a></li>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${myOrders.pageNow == (myOrders.pageCount-1)}">
                                    <c:forEach var="i" begin="${myOrders.pageCount-4}" end="${myOrders.pageCount}">
                                        <c:if test="${myOrders.pageNow==i}">
                                            <li><a href='${pageContext.request.contextPath}/order/toMyOrders.do?pageNow=${i}&uid=${sessionScope.user.uid}'   class="${pagenow == requestScope.pageProduct.pageNow?"current":""}">${i}    </a></li>
                                        </c:if>
                                        <c:if test="${myOrders.pageNow!=i}">
                                            <li><a href='${pageContext.request.contextPath}/order/toMyOrders.do?pageNow=${i}&uid=${sessionScope.user.uid}'  >${i}    </a></li>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${myOrders.pageNow == myOrders.pageCount}">
                                    <c:forEach var="i" begin="${myOrders.pageCount-4}" end="${myOrders.pageCount}">
                                        <c:if test="${myOrders.pageNow==i}">
                                            <li><a href='${pageContext.request.contextPath}/order/toMyOrders.do?pageNow=${i}&uid=${sessionScope.user.uid}'   class="${pagenow == requestScope.pageProduct.pageNow?"current":""}">${i}    </a></li>
                                        </c:if>
                                        <c:if test="${myOrders.pageNow!=i}">
                                            <li><a href='${pageContext.request.contextPath}/order/toMyOrders.do?pageNow=${i}&uid=${sessionScope.user.uid}'  >${i}    </a></li>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </c:if>
                            <c:if test="${myOrders.pageCount<1}">
                                你还没有订单
                            </c:if>
                            <div style="clear:both;"></div>
                        </ul>
                        <c:if test="${myOrders.pageNow!=myOrders.pageCount&&myOrders.pageCount>0}">
                            <a href="${pageContext.request.contextPath}/order/toMyOrders.do?pageNow=${myOrders.pageNow+1}&uid=${sessionScope.user.uid}" class="about left-l f-l">></a>
                        </c:if>
                        <div style="clear:both;"></div>
                    </div>
                    <c:if test="${myOrders.pageCount>0}">
                        <div class="pag-right f-l">
                            <form action="${pageContext.request.contextPath}/order/toMyOrders.do" method="get">
                                <div class="jump-page f-l">
                                    到第<input type="number" name="pageNow" value="${myOrders.pageNow}" min="1" max="${myOrders.pageCount}"/>页
                                    <input type="hidden" name="uid" value="${sessionScope.user.uid}">
                                </div>
                                <button class="f-l">确定</button>
                            </form>
                            <div style="clear:both;"></div>
                        </div>
                    </c:if>
                    <div style="clear:both;"></div>
                </div>
            </div>
        </div>
        <div style="clear:both;"></div>
    </div>

    
    <!--底部一块-->
    <%@include file="bottom.jsp"%>
    
    <!--查看物流 弹窗-->
    <div class="view-logistics">
    	<div class="view-bg"></div>
        <div class="view-con">
        	<div class="view-tit">
            	<h3>物流信息</h3>
                <a href="JavaScript:;" guanbi="">
                	<img src="${pageContext.request.contextPath}/images/close-select-city.gif" />
                </a>
                <div style="clear:both;"></div>
            </div>
            <div class="view-bd">
            	<ul>
                	<li class="bd-pdl-li after"><span>1</span>2015-08-06　周四　　14:06:53您的订单开始处理</li>
                	<li class="after"><span>2</span>14:08:44您的订单待配货</li>
                	<li><span>3</span>14:16:04您的包裹已出库</li>
                	<li><span>4</span>14:16:03商家正通知快递公司揽件</li>
                	<li><span>5</span>21:47:54【惠州市】圆通速递 广东省惠州市惠东县收件员 已揽件</li>
                	<li class="bd-pdb-li"><span>6</span>22:13:51广东省惠州市惠东县公司 已发出</li>
                    <li class="bd-pdl-li"><span>7</span>2015-08-07　周五　　04:57:33广州转运中心公司 已收入</li>
                	<li><span>8</span>04:58:54广州转运中心公司 已发出</li>
                	<li><span>9</span>2015-08-08周六22:46:43重庆转运中心公司 已收入</li>
                	<li class="bd-pdb-li"><span>10</span>23:01:49【重庆市】重庆转运中心 已发出</li>
                    <li class="bd-pdl-li"><span>11</span>2015-08-09　周日　　00:57:11【重庆市】快件已到达 重庆市南岸区</li>
                	<li><span>12</span>11:14:52重庆市南岸区 已收入</li>
                	<li><span>13</span>11:14:52【重庆市】重庆市南岸区派件员：李天生 13330284757正在为您派件</li>
                	<li class="bd-bd-li"><span>14</span>15:53:14【重庆市】重庆市南岸区公司 已签收 签收人：保安，感谢使用圆通速递，期待再次为您服务</li>
                </ul>
                <p class="sign">您的包裹已被签收！</p>
            </div>
        </div>
    </div>
    
</body>
</html>