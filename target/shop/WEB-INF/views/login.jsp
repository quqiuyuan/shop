<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/zhonglingxm2.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script>
        window.onload =function(){
            var userName = document.getElementById("userName").value;
            userName = decodeURI(userName);
            document.getElementById("userName").value = userName;
        }
    </script>
</head>

<body>

<div class="sign-logo w1200">
    <h1 class="zl-h11"><a href="index.html" title="宅客微购"><img src="${pageContext.request.contextPath}/images/zl2-01.gif" /></a></h1>
</div>

<div class="sign-con w1200">
    <img src="${pageContext.request.contextPath}/images/logn-tu.gif" class="sign-contu f-l" />
    <form action="${pageContext.request.contextPath}/user/tologinok.do" method="post">
        <div class="sign-ipt f-l">
            <p>用户名</p>
            <input type="text" id="userName" name="userName" value="${cookie.userName.value}" placeholder="用户名" />
            <p>密码</p>
            <input type="password" id="passWord" name="passWord" value="${cookie.passWord.value}" placeholder="密码" /><br />
            <input type="checkbox" style="zoom:40%;margin-left:345px;" name='checkbox' value='on' ${!empty cookie.userName?"checked":""}/>
            <span style="color:#9199aa;margin-left:-50px;">一周内免登陆</span>
            <button type="submit" class="slig-btn">登录</button>
            <c:if test="${msg==0}">
                <P>用户名或者密码错误</P>
            </c:if>
            <p>没有账号？请<a href="${pageContext.request.contextPath}/user/toRegister.do">注册</a><a href="#" class="wj">忘记密码？</a></p>
            <div class="sign-qx">
                <a href="#" class="f-r"><img src="${pageContext.request.contextPath}/images/sign-xinlan.gif"/></a>
                <a href="#" class="qq f-r"><img src="${pageContext.request.contextPath}/images/sign-qq.gif"/></a>
                <div style="clear:both;"></div>
            </div>
        </div>
    </form>
    <div style="clear:both;"></div>
</div>

<!--底部一块-->
<%@include file="bottom.jsp"%>
</body>
</html>

