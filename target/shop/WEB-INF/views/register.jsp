<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <script>
        $(function () {
            //校验用户名是否重复
          $("#userName").change(function () {
            if ($("#userName").val().trim()!=""){
                $.ajax({
                    url:'${pageContext.request.contextPath}/user/checkUserName.do',
                    type:'post',
                    data:{
                        userName:$("#userName").val(),
                    },
                    success:function (data) {
                        console.log(data)
                        if (data=="yes"){
                            $("#userNameMsg").attr("class","dui");
                            $("#userNameMsg").text("用户名可用");
                        }else {
                            $("#userNameMsg").attr("class","cuo");
                            $("#userNameMsg").text("用户名重复");
                        }
                    }
                })
            }else {
                $("#userNameMsg").attr("class","cuo");
                $("#userNameMsg").text("用户名不能为空");
            }
          })
            //检查密码是否合格
          $("#passWord").change(function () {
              var patten = /^(?=.*[\d])(?=.*[a-zA-Z])[a-zA-Z\d\W]{6,16}$/;
              if (patten.test($("#passWord").val())){
                  $("#passWordMsg").attr("class","dui");
                  $("#passWordMsg").text("密码可用");
              }else {
                  $("#passWordMsg").attr("class","cuo");
                  $("#passWordMsg").text("密码错误，请按正确格式写入");
              }
            })

            //验证两次密码是否一致
          $("#passWord2").change(function () {
              if ($("#passWord").val()==$("#passWord2").val()){
                  $("#passWord2Msg").attr("class","dui");
                  $("#passWord2Msg").text("两次密码一致");
              }else {
                  $("#passWord2Msg").attr("class","cuo");
                  $("#passWord2Msg").text("两次密码不一致");
              }
          })
            
            //更换验证码图片
          $("#changeCode").click(function () {
              $("#imgCodePic").attr("src","${pageContext.request.contextPath}/validateCodeController/getCode.do?msg="+Math.random())
              $("#imgCodeMsg").attr("class","cuo");
          })

            //图片验证码校验
          $("#imgCode").change(function () {
              $.ajax({
                  url:'${pageContext.request.contextPath}/validateCodeController/checkCode.do',
                  type:'get',
                  data:{
                        imgCode:$(this).val()
                  },
                  success:function (data) {
                      if (data=='yes'){
                          $("#imgCodeMsg").attr("class","dui");
                          $("#imgCodeMsg").text("验证码正确");
                      }else {
                          $("#imgCodeMsg").attr("class","cuo");
                          $("#imgCodeMsg").text("验证码不正确");
                      }
                  }
              })
          })

        })

        //表单提交前验证
        function sub() {
            var flag = true;
            $("[name='msg']").each(function () {
                if ($(this).attr("class")=='cuo'){
                    flag = false;
                }
            })
            return flag;
        }
    </script>
</head>

<body>

<!--header-->
<%@include file="header.jsp"%>

<!--logo search weweima-->
<%@include file="Logo.jsp"%>

<!--内容开始-->
<form action="${pageContext.request.contextPath}/user/doRegister.do" method="post" onsubmit="return sub()">
<div class="password-con registered">
    <div class="psw">
        <p class="psw-p1">用户名</p>
        <input id="userName" name="userName" type="text" placeholder="请输入用户名" required/>
        <span name="msg" id="userNameMsg"></span>
    </div>
    <div class="psw">
        <p class="psw-p1">输入密码</p>
        <input id="passWord" name="passWord" type="passWord" placeholder="请输入密码" required/>
        <span name="msg" id="passWordMsg"></span>
    </div>
    <div class="psw">
        <p class="psw-p1">确认密码</p>
        <input id="passWord2" name="passWord2" type="passWord" placeholder="请再次确认密码" required/>
        <span name="msg" id="passWord2Msg"></span>
    </div>
    <div class="psw">
        <p class="psw-p1">手机号</p>
        <input id="phone" name="phone" type="text" pattern="1[3-9]\d{9}" placeholder="请输入手机号" required/>
    </div>
    <div class="psw psw3">
        <p class="psw-p1">验证码</p>
        <input id="imgCode" type="text" placeholder="请输入验证码" required/>
        <span name="msg" id="imgCodeMsg"></span>
    </div>
    <div class="yanzhentu">
        <div class="yz-tu f-l">
            <img id="imgCodePic" src="${pageContext.request.contextPath}/validateCodeController/getCode.do" />
        </div>
        <p class="f-l">看不清？<a href="JavaScript:;" id="changeCode">换张图</a></p>
        <div style="clear:both;"></div>
    </div>
    <div class="agreement">
        <input type="checkbox" name="hobby" required></input>
        <p>我有阅读并同意<span>《宅客微购网站服务协议》</span></p>
    </div>
    <button type="submit" class="psw-btn">立即注册</button>
    <p class="sign-in">已有账号？请<a href="${pageContext.request.contextPath}/user/tologin.do">登录</a></p>
</div>
</form>
<!--底部一块-->
<div class="footer-box">
    <ul class="footer-info1 w1200">
        <li>
            <div class="ft-tu1">
                <a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-86.gif" /></a>
            </div>
            <h3><a href="JavaScript:;">号码保障</a></h3>
            <P>所有会员，手机短信验证</P>
        </li>
        <li>
            <div class="ft-tu1">
                <a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-87.gif" /></a>
            </div>
            <h3><a href="JavaScript:;">6*12小时客服</a></h3>
            <P>有任何问题随时免费资讯</P>
        </li>
        <li>
            <div class="ft-tu1">
                <a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-88.gif" /></a>
            </div>
            <h3><a href="JavaScript:;">专业专攻</a></h3>
            <P>我们只专注于建筑行业的信息服务</P>
        </li>
        <li>
            <div class="ft-tu1">
                <a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-89.gif" /></a>
            </div>
            <h3><a href="JavaScript:;">注册有礼</a></h3>
            <P>随时随地注册有大礼包</P>
        </li>
        <li>
            <div class="ft-tu1">
                <a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-90.gif" /></a>
            </div>
            <h3><a href="JavaScript:;">值得信赖</a></h3>
            <P>专业的产品，专业的团队</P>
        </li>
        <div style="clear:both;"></div>
    </ul>
    <div class="footer-info2 w1200">
        <div class="ft-if2-left f-l">
            <dl>
                <dt><a href="6-1服务协议.html">新手上路</a></dt>
                <dd>
                    <a href="6-1服务协议.html">购物流程</a>
                    <a href="6-1服务协议.html">在线支付</a>
                    <a href="6-1服务协议.html">投诉与建议</a>
                </dd>
            </dl>
            <dl>
                <dt><a href="6-1服务协议.html">配送方式</a></dt>
                <dd>
                    <a href="6-1服务协议.html">货到付款区域</a>
                    <a href="6-1服务协议.html">配送费标准</a>
                </dd>
            </dl>
            <dl>
                <dt><a href="6-1服务协议.html">购物指南</a></dt>
                <dd>
                    <a href="6-1服务协议.html">订购流程</a>
                    <a href="6-1服务协议.html">购物常见问题</a>
                </dd>
            </dl>
            <dl>
                <dt><a href="6-1服务协议.html">售后服务</a></dt>
                <dd>
                    <a href="6-1服务协议.html">售后服务保障</a>
                    <a href="6-1服务协议.html">退换货政策总则</a>
                    <a href="6-1服务协议.html">自营商品退换细则</a>
                </dd>
            </dl>
            <div style="clear:both;"></div>
        </div>
        <div class="ft-if2-right f-r">
            <h3>400-2298-223</h3>
            <p>周一至周日  9:00-24:00</p>
            <p>（仅收市话费）</p>
        </div>
        <div style="clear:both;"></div>
    </div>
    <div class="footer-info3 w1200">
        <p>
            <a href="#">免责条款</a><span>|</span>
            <a href="#">隐私保护</a><span>|</span>
            <a href="#">咨询热点</a><span>|</span>
            <a href="#">联系我们</a><span>|</span>
            <a href="#">公司简介</a>
        </p>
        <p>
            <a href="#">沪ICP备13044278号</a><span>|</span>
            <a href="#">合字B1.B2-20130004</a><span>|</span>
            <a href="#">营业执照</a><span>|</span>
            <a href="#">互联网药品信息服务资格证</a><span>|</span>
            <a href="#">互联网药品交易服务资格证</a>
        </p>
        <div class="ft-if3-tu1">
            <a href="#"><img src="${pageContext.request.contextPath}/images/zl2-91.gif" /></a>
            <a href="#"><img src="${pageContext.request.contextPath}/images/zl2-92.gif" /></a>
            <a href="#"><img src="${pageContext.request.contextPath}/images/zl2-93.gif" /></a>
        </div>
    </div>
</div>

</body>
</html>
