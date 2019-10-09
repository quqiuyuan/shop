<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人资料</title>
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
    <%--<div class="nav-box">
        <div class="nav-kuai w1200">
            <div class="nav-kuaijie yjp-hover1 f-l">
                <a href="JavaScript:;" class="kj-tit1">商品分类快捷</a>
                <div class="kuaijie-box yjp-show1" style="display:none;">
                    <c:forEach items="${categoryExts}" var="categoryExts" begin="0" end="5">
                        <div class="kuaijie-info">
                            <dl class="kj-dl1">
                                <dt><img src="images/zl2-07.gif" /><a href="搜索列表(有品牌).html">食品/饮料/酒水</a></dt>
                                <dd>
                                    <a href="搜索列表(有品牌).html">饼干糕点</a><span>|</span>
                                    <a href="搜索列表(有品牌).html">冲调保健</a><span>|</span>
                                    <a href="搜索列表(有品牌).html">酒水</a>
                                </dd>
                            </dl>
                            <div class="kuaijie-con">
                                <dl class="kj-dl2">
                                    <dt><a href="搜索列表(有品牌).html">洗浴用品/身体护理</a></dt>
                                    <dd>
                                        <a href="搜索列表(有品牌).html">护手霜</a><span>|</span>
                                        <a href="搜索列表(有品牌).html">香皂</a><span>|</span>
                                        <a href="搜索列表(有品牌).html">沐浴露</a><span>|</span>
                                        <a href="搜索列表(有品牌).html">花露水</a><span>|</span>
                                        <a href="搜索列表(有品牌).html">泡浴/盐浴</a><span>|</span>
                                        <a href="搜索列表(有品牌).html">洗手液</a>
                                    </dd>
                                </dl>
                                <div style="clear:both;"></div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <ul class="nav-font f-l">
                <li><a href="在线商城首页.html">在线商城</a></li>
                <li><a href="餐饮娱乐首页.html">餐饮娱乐</a></li>
                <li><a href="家政服务首页.html">家政服务</a></li>
                <li><a href="美容美发首页.html">美容美发</a></li>
                <li><a href="教育培训首页.html">教育培训</a></li>
                <li><a href="汽车房产首页.html">汽车房产</a></li>
                <li><a href="家居建材首页.html">家居建材</a></li>
                <li><a href="二手市场首页.html">二手市场</a><span><img src="images/zl2-05.gif" /></span></li>
                <div style="clear:both;"></div>
            </ul>
            <div style="clear:both;"></div>
        </div>
    </div>--%>
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
    	<div class="personal-r f-r">
        	<div class="personal-right">
                <div class="personal-r-tit">
                    <h3>个人资料</h3>
                </div>
                <form action="${pageContext.request.contextPath}/user/updateuser.do" method="post">
                    <div class="data-con">
                        <div class="dt1">
                            <p class="f-l">当前头像：</p>
                            <div class="touxiang f-l">
                                <div class="tu f-l">
                                    <a href="#">
                                        <img src="${pageContext.request.contextPath}/images/data-tu.gif" />
                                        <input type="file" name="" id="" class="img1" />
                                    </a>
                                </div>
                                <a href="JavaScript:;" class="sc f-l" shangchuang="">上传头像</a>
                                <div style="clear:both;"></div>
                            </div>
                            <div style="clear:both;"></div>
                        </div>
                        <input name="uid" type="hidden" value="${sessionScope.user.uid}" />
                        <div class="dt1">
                            <p class="dt-p f-l">昵称：</p>
                            <input name="name" type="text" placeholder="${sessionScope.user.name}" value="${sessionScope.user.name}" />
                            <div style="clear:both;"></div>
                        </div>
                        <div class="dt1">
                            <p class="dt-p f-l">用户名：</p>
                            <input name="userName" type="text" value="${sessionScope.user.userName}" />
                            <div style="clear:both;"></div>
                        </div>
                        <div class="dt1">
                            <p class="dt-p f-l">手机号：</p>
                            <input name="phone" type="text" value="${sessionScope.user.phone}" />
                            <div style="clear:both;"></div>
                        </div>
                        <div class="dt1">
                            <p class="dt-p f-l">验证码：</p>
                            <input type="text" value="" />
                            <div style="clear:both;"></div>
                        </div>
                        <div class="dt1">
                            <p class="dt-p f-l">邮箱：</p>
                            <input name="email" type="text" value="${sessionScope.user.email}" />
                            <div style="clear:both;"></div>
                        </div>
                        <div class="dt1">
                            <p class="dt-p f-l">地址：</p>
                            <input name="addr" type="text" value="${sessionScope.user.addr}" />
                            <div style="clear:both;"></div>
                        </div>
                        <div class="dt1 dt4">
                            <p class="dt-p f-l">密码：</p>
                            <input name="passWord" type="text" value="${sessionScope.user.passWord}" />
                            <button>修改密码</button>
                            <div style="clear:both;"></div>
                        </div>
                        <button type="submit" class="btn-pst">保存</button>
                    </div>
                </form>
            </div>
        </div>
        <div style="clear:both;"></div>
    </div>
    
    <!--上传头像弹窗
    <div class="tanchuang">
    	<div class="t-c-bg"></div>
    	<div class="t-c-con">
        	<div class="tc-tit">
            	<h3>上传头像</h3>
                <a href="JavaScript:;" delete=""><img src="${pageContext.request.contextPath}/images/t-c-del.gif" /></a>
                <div style="clear:both;"></div>
            </div>
            <div class="tc-con">
            	<a href="#"><img src="${pageContext.request.contextPath}/images/tc-tu.gif" /></a>
                <button>保存头像</button>
            </div>
        </div>
    </div>-->
    
    <!--底部一块-->
    <%@include file="bottom.jsp"%>
</body>
</html>
