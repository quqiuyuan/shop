<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>搜索列表页(有品牌)</title>
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
        $("[name='addCart']").click(function () {
            var pid = $(this).attr("id");
            var count = $(this).parent().prev().find("[name='count']").html();
            if (count<1){
                count = 1;
                ("[name='count']").html(1);
            }
            if (count>100){
                count = 100;
                ("[name='count']").html(100);
            }
            $.ajax({
                url:"${pageContext.request.contextPath}/cart/addCartItem.do",
                data:{
                    pid:pid,
                    count:count,
                },
                success:function(data){
                    if (data!=""){
                        alert("添加购物车成功");
                    }else {
                        alert("添加购物车失败");
                    }
                }
            })
        })
    })
</script>
</head>

<body>

	<!--header-->
    <%@include file="header.jsp"%>
	
    <!--logo search weweima-->
    <%@include file="Logo.jsp"%>

	<!--nav-->
    <%@include file="nav.jsp"%>

    <c:set var="cname" value=""></c:set>
    <c:set var="csname" value=""></c:set>
    <c:set var="cid" value=""></c:set>
    <c:set var="csid" value=""></c:set>
    <c:forEach items="${categoryExts}" var="categoryExts">
        <c:if test="${categoryExts.cid==result.cid}">
            <c:set var="cname" value="${categoryExts.cname}"></c:set>
            <c:set var="cid" value="${categoryExts.cid}"></c:set>
        </c:if>
        <c:forEach items="${categoryExts.categorySecondList}" var="categorySecond">
            <c:if test="${categorySecond.csid==result.csid}">
                <c:set var="csname" value="${categorySecond.csname}"></c:set>
                <c:set var="csid" value="${categorySecond.csid}"></c:set>
            </c:if>
        </c:forEach>
    </c:forEach>
    <!--内容开始-->
    	<!--筛选结果-->
    <div class="screening-results w1200">
    	<p class="tiao">找到共 ${result.rowCount} 条</p>
    	<div class="results">
        	<p class="re-p1 f-l">
                <a href="${pageContext.request.contextPath}/product/searchProduct.do">全部结果</a>: <a href="${pageContext.request.contextPath}/product/searchProduct.do?cid=${cid}">${cname}</a>
                <c:if test="${!empty csname}">
                    >
                </c:if>
                <span> ${csname}　</span>
            </p>
            <div style="clear:both;"></div>
        </div>
    </div>
    
    <!--内容↓↑-->
    <div class="shop-page-con w1200">
    	<div class="shop-pg-left f-l" style="width:215px">
            <div class="shop-left-buttom" style="margin-top:0;">
            	<div class="sp-tit1">
                    <h3>商品推荐</h3>
                </div>
                <ul class="shop-left-ul">
                    <c:forEach items="${theHot}" var="theHot">
                        <li>
                            <div class="li-top">
                                <a href="${pageContext.request.contextPath}/product/toProductDetail.do?pid=${theHot.pid}" class="li-top-tu"><img style="width: 95px;height: 105px;" src="${pageContext.request.contextPath}/${theHot.image}" /></a>
                                <p class="jiage"><span class="sp1">${theHot.shopPrice}</span><span class="sp2">${theHot.marketPrice}</span></p>
                            </div>
                            <p class="miaoshu">${theHot.pName}</p>
                            <div class="li-md">
                                <div class="md-l f-l">
                                    <p class="md-l-l f-l" name="count" ap="">1</p>
                                    <div class="md-l-r f-l">
                                        <a href="JavaScript:;" class="md-xs" at="">∧</a>
                                        <a href="JavaScript:;" class="md-xx" ab="">∨</a>
                                    </div>
                                    <div style="clear:both;"></div>
                                </div>
                                <div class="md-r f-l">
                                    <button class="md-l-btn1">立即购买</button>
                                    <button class="md-l-btn2" id="${theHot.pid}" name="addCart">加入购物车</button>
                                </div>
                                <div style="clear:both;"></div>
                            </div>
                            <p class="pingjia">88888评价</p>
                            <p class="weike">微克宅购自营</p>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    	<div class="shop-pg-right f-r">
        	<div class="shop-right-cmp" style="margin-top:0;">
            	<ul class="shop-cmp-l f-l">
                	<li class="current"><a href="#">综合 ↓</a></li>
                	<li><a href="#">销量 ↓</a></li>
                	<li><a href="#">新品 ↓</a></li>
                	<li><a href="#">评价 ↓</a></li>
                    <div style="clear:both;"></div>
                </ul>
                <div class="shop-cmp-m f-l">
                	<span>价格</span><input type="text" /><span>-</span><input type="text" />
                </div>
                <div class="shop-cmp-r f-l">
                	<ul class="f-l">
                    	<li>
                        	<input type="checkbox" name="hobby" value=""></input>
                            <span>包邮</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" value=""></input>
                            <span>进口</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" value=""></input>
                            <span>仅显示有货</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" value=""></input>
                            <span>满赠</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" value=""></input>
                            <span>满减</span>
                        </li>
                        <div style="clear:both;"></div>
                    </ul>
                    <button>确定</button>
                </div>
                <div style="clear:both;"></div>
            </div>
            <div class="shop-right-con">
            	<ul class="shop-ul-tu shop-ul-tu1">
                    <c:forEach items="${result.list}" var="product">
                       <li style="${vs.count%4==0?"margin-right:0;":""}">
                           <div class="li-top">
                                <a href="${pageContext.request.contextPath}/product/toProductDetail.do?pid=${product.pid}" class="li-top-tu"><img style="width: 95px;height: 105px;" src="${pageContext.request.contextPath}/${product.image}" /></a>
                                <p class="jiage"><span class="sp1">￥${product.shopPrice}</span><span class="sp2">￥${product.marketPrice}</span></p>
                           </div>
                           <p class="miaoshu">${product.pName}</p>
                           <div class="li-md">
                               <div class="md-l f-l">
                                   <p class="md-l-l f-l" name="count" ap="">1</p>
                                   <div class="md-l-r f-l">
                                        <a href="JavaScript:;" class="md-xs" at="">∧</a>
                                        <a href="JavaScript:;" class="md-xx" ab="">∨</a>
                                   </div>
                                   <div style="clear:both;"></div>
                               </div>
                               <div class="md-r f-l">
                                   <button class="md-l-btn1">立即购买</button>
                                   <button class="md-l-btn2" id="${product.pid}" name="addCart">加入购物车</button>
                               </div>
                               <div style="clear:both;"></div>
                           </div>
                           <p class="pingjia">88888评价</p>
                           <p class="weike">微克宅购自营</p>
                       </li>
                    </c:forEach>
                    <div style="clear:both;"></div>
                </ul>
                
                <!--分页-->
                <div class="paging">
            	<div class="pag-left f-l">
                    <c:if test="${result.pageNow!=1}">
                        <a href="${pageContext.request.contextPath}/product/searchProduct.do?cid=${cid}&csid=${csid}&pageNow=${result.pageNow-1}&pname=${result.pname}" class="about left-r f-l"><</a>
                    </c:if>
                    <ul class="left-m f-l">
                        <c:if test="${result.pageCount<5}">
                            <c:forEach var="i" begin="1" end="${result.pageCount}" step="1">
                                <c:if test="${result.pageNow==i}">
                                    <li><a href='${pageContext.request.contextPath}/product/searchProduct.do?cid=${cid}&csid=${csid}&pageNow=${i}&pname=${result.pname}'   class="${pagenow == requestScope.pageProduct.pageNow?"current":""}">${i}    </a></li>
                                </c:if>
                                <c:if test="${result.pageNow!=i}">
                                    <li><a href='${pageContext.request.contextPath}/product/searchProduct.do?cid=${cid}&csid=${csid}&pageNow=${i}&pname=${result.pname}'  >${i}    </a></li>
                                </c:if>
                            </c:forEach>
                        </c:if>
<%--                        <c:if test="${result.pageNow != 1}">--%>
<%--                            <a href='${pageContext.request.contextPath}/product/searchProduct.do?cid=${cid}&csid=${csid}&pageNow=1'>【首页】    </a></li>--%>
<%--                            <a href='${pageContext.request.contextPath}/product/searchProduct.do?cid=${cid}&csid=${csid}&pageNow=${(result.pageNow-1)}'>【上一页】    </a></li>--%>
<%--                        </c:if>--%>
                        <c:if test="${result.pageCount>=5}">
                            <c:if test="${result.pageNow>=3&&result.pageNow<=(result.pageCount-2)}">
                                <c:forEach var="i" begin="${result.pageNow-2}" end="${result.pageNow+2}" step="1">
                                    <c:if test="${result.pageNow==i}">
                                        <li><a href='${pageContext.request.contextPath}/product/searchProduct.do?cid=${cid}&csid=${csid}&pageNow=${i}&pname=${result.pname}'   class="${pagenow == requestScope.pageProduct.pageNow?"current":""}">${i}    </a></li>
                                    </c:if>
                                    <c:if test="${result.pageNow!=i}">
                                        <li><a href='${pageContext.request.contextPath}/product/searchProduct.do?cid=${cid}&csid=${csid}&pageNow=${i}&pname=${result.pname}'  >${i}    </a></li>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <c:if test="${result.pageNow==1}">
                                <c:forEach var="i" begin="1" end="5" step="1">
                                    <c:if test="${result.pageNow==i}">
                                        <li><a href='${pageContext.request.contextPath}/product/searchProduct.do?cid=${cid}&csid=${csid}&pageNow=${i}&pname=${result.pname}'   class="${pagenow == requestScope.pageProduct.pageNow?"current":""}">${i}    </a></li>
                                    </c:if>
                                    <c:if test="${result.pageNow!=i}">
                                        <li><a href='${pageContext.request.contextPath}/product/searchProduct.do?cid=${cid}&csid=${csid}&pageNow=${i}&pname=${result.pname}'  >${i}    </a></li>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <c:if test="${result.pageNow==2}">
                                <c:forEach var="i" begin="1" end="5" step="1">
                                    <c:if test="${result.pageNow==i}">
                                        <li><a href='${pageContext.request.contextPath}/product/searchProduct.do?cid=${cid}&csid=${csid}&pageNow=${i}&pname=${result.pname}'   class="${pagenow == requestScope.pageProduct.pageNow?"current":""}">${i}    </a></li>
                                    </c:if>
                                    <c:if test="${result.pageNow!=i}">
                                        <li><a href='${pageContext.request.contextPath}/product/searchProduct.do?cid=${cid}&csid=${csid}&pageNow=${i}&pname=${result.pname}'  >${i}    </a></li>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <c:if test="${result.pageNow == (result.pageCount-1)}">
                                <c:forEach var="i" begin="${result.pageCount-4}" end="${result.pageCount}">
                                    <c:if test="${result.pageNow==i}">
                                        <li><a href='${pageContext.request.contextPath}/product/searchProduct.do?cid=${cid}&csid=${csid}&pageNow=${i}&pname=${result.pname}'   class="${pagenow == requestScope.pageProduct.pageNow?"current":""}">${i}    </a></li>
                                    </c:if>
                                    <c:if test="${result.pageNow!=i}">
                                        <li><a href='${pageContext.request.contextPath}/product/searchProduct.do?cid=${cid}&csid=${csid}&pageNow=${i}&pname=${result.pname}'  >${i}    </a></li>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <c:if test="${result.pageNow == result.pageCount}">
                                <c:forEach var="i" begin="${result.pageCount-4}" end="${result.pageCount}">
                                    <c:if test="${result.pageNow==i}">
                                        <li><a href='${pageContext.request.contextPath}/product/searchProduct.do?cid=${cid}&csid=${csid}&pageNow=${i}&pname=${result.pname}'   class="${pagenow == requestScope.pageProduct.pageNow?"current":""}">${i}    </a></li>
                                    </c:if>
                                    <c:if test="${result.pageNow!=i}">
                                        <li><a href='${pageContext.request.contextPath}/product/searchProduct.do?cid=${cid}&csid=${csid}&pageNow=${i}&pname=${result.pname}'  >${i}    </a></li>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                        </c:if>
<%--                        <c:if test="${result.pageNow!=result.pageCount&&result.pageCount>0}">--%>
<%--                            <li><a href='${pageContext.request.contextPath}/product/searchProduct.do?cid=${cid}&csid=${csid}&pageNow=${i}'>【下一页】    </a></li>--%>
<%--                            <li><a href='${pageContext.request.contextPath}/product/searchProduct.do?cid=${cid}&csid=${csid}&pageNow=${i}'>【尾页】    </a></li>--%>
<%--                        </c:if>--%>
                        <c:if test="${result.pageCount<1}">
                            此类目没商品
                        </c:if>
                        <div style="clear:both;"></div>
                    </ul>
                    <c:if test="${result.pageNow!=result.pageCount&&result.pageCount>0}">
                	    <a href="${pageContext.request.contextPath}/product/searchProduct.do?cid=${cid}&csid=${csid}&pageNow=${result.pageNow+1}&pname=${result.pname}" class="about left-l f-l">></a>
                    </c:if>
                    <div style="clear:both;"></div>
                </div>
                <c:if test="${result.pageCount>0}">
                    <div class="pag-right f-l">
                        <form action="${pageContext.request.contextPath}/product/searchProduct.do" method="get">
                            <div class="jump-page f-l">
                                到第<input type="number" name="pageNow" value="${result.pageNow}" min="1" max="${result.pageCount}"/>页
                                <input hidden="hidden" name="pname" value="${result.pname}"/>
                                <input hidden="hidden" name="cid" value="${cid}"/>
                                <input hidden="hidden" name="csid" value="${csid}"/>
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
</body>
</html>
