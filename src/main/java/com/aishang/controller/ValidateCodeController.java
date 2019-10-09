package com.aishang.controller;

import cn.dsna.util.images.ValidateCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/validateCodeController")
public class ValidateCodeController {

    @Resource
    private HttpSession session;


    //获取图形验证码
    @RequestMapping("/getCode")
    public void getCode(HttpServletResponse response){
        try {
            ValidateCode validateCode = new ValidateCode(163,64,4,0);
            String code = validateCode.getCode();
            session.setAttribute("imgCode",code);
            validateCode.write(response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return;
    }


    //校验图形验证码
    @RequestMapping("/checkCode")
    @ResponseBody
    public String checkCode(String imgCode){
        String msg = "no";
        if (imgCode!=null){
            if (imgCode.equalsIgnoreCase((String) session.getAttribute("imgCode"))){
                msg = "yes";
            }
        }
        return msg;
    }
}
