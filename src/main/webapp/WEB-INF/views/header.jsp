<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2019/9/25
  Time: 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="zl-header">
    <div class="zl-hd w1200">
        <c:if test="${empty user}">
            <p class="hd-p1 f-l">
                Hi!您好，欢迎来到宅客微购，请<a href="${pageContext.request.contextPath}/user/tologin.do">登录</a> <a href="${pageContext.request.contextPath}/user/toRegister.do">【免费注册】</a>
            </p>
        </c:if>
        <c:if test="${!empty user}">
            <p class="hd-p1 f-l">
                用户名:   ${sessionScope.user.userName}
            </p>
        </c:if>
        <p class="hd-p2 f-r">
            <a href="${pageContext.request.contextPath}/index/index.do">返回首页</a><span>|</span>
            <a href="${pageContext.request.contextPath}/user/toUser.do">个人中心</a><span>|</span>
            <a href="${pageContext.request.contextPath}/cart/toCart.do">我的购物车</a><span>|</span>
            <a href="${pageContext.request.contextPath}/order/toMyOrders.do?uid=${sessionScope.user.uid}">我的订单</a>
            <c:if test="${user!=null}">
                <span>|</span><a href="${pageContext.request.contextPath}/user/exit.do">退出登录</a>
            </c:if>
        </p>
        <div style="clear:both;"></div>
    </div>
</div>
