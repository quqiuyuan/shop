<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2019/9/24
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="nav-box">
    <div class="nav-kuai w1200">
        <div class="nav-kuaijie yjp-hover1 f-l">
            <a href="JavaScript:;" class="kj-tit1">商品分类快捷</a>
            <div class="kuaijie-box yjp-show1" style="display:none;">
                <c:forEach items="${categoryExts}" var="categoryExts" begin="0" end="5">
                    <div class="kuaijie-info">
                        <dl class="kj-dl1">
                            <dt><img src="${pageContext.request.contextPath}/images/zl2-07.gif" /><a href="${pageContext.request.contextPath}/product/searchProduct.do?cid=${categoryExts.cid}">${categoryExts.cname}</a></dt>
                            <dd>
                                <c:forEach items="${categoryExts.categorySecondList}" var="categorySecond" begin="0" end="2" varStatus="vs">
                                    <a href="${pageContext.request.contextPath}/product/searchProduct.do?cid=${categoryExts.cid}&csid=${categorySecond.csid}">${categorySecond.csname}</a>
                                    <c:if test="${!vs.last}">
                                        <span>|</span>
                                    </c:if>
                                </c:forEach>
                            </dd>
                        </dl>
                        <div class="kuaijie-con">
                            <dl class="kj-dl2" style="display:inline-block">
                                <dt><a href="${pageContext.request.contextPath}/product/searchProduct.do?cid=${categoryExts.cid}">${categoryExts.cname}</a></dt>
                                <dd>
                                    <c:forEach items="${categoryExts.categorySecondList}" var="categorySecond" varStatus="vs">
                                        <a href="${pageContext.request.contextPath}/product/searchProduct.do?cid=${categoryExts.cid}&csid=${categorySecond.csid}">${categorySecond.csname}</a>
                                        <c:if test="${!vs.last}">
                                            <span>|</span>
                                        </c:if>
                                    </c:forEach>
                                </dd>
                            </dl>
                            <div style="clear:both;"></div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <ul class="nav-font f-l">
            <c:forEach items="${categoryExts}" var="categoryExts" begin="0" end="7" varStatus="vs">
                <li><a href="${pageContext.request.contextPath}/product/searchProduct.do?cid=${categoryExts.cid}">${categoryExts.cname}</a>
                    <c:if test="${vs.last}">
                        <span><img src="${pageContext.request.contextPath}/images/zl2-05.gif" /></span>
                    </c:if>
                </li>
            </c:forEach>
            <div style="clear:both;"></div>
        </ul>
        <div style="clear:both;"></div>
    </div>
</div>
