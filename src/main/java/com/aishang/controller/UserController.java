package com.aishang.controller;

import com.aishang.po.CategoryExt;
import com.aishang.po.Product;
import com.aishang.po.ProductForPageBean;
import com.aishang.po.User;
import com.aishang.service.ICategoryService;
import com.aishang.service.IProductService;
import com.aishang.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.List;

//@RestController
@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private IUserService userService;
    @Resource
    private IProductService productService;
    @Resource
    private ICategoryService categoryService;
    @Resource
    private HttpSession session;

    @RequestMapping("/index")
    public String add(){
        return "index";
    }

    //跳转注册页
    @RequestMapping("toRegister")
    public String toRegister(){
        return "register";
    }

    //登录跳转页
    @RequestMapping("tologin")
    public String tologin(){
        return "login";
    }

    //ajax校验用户名是否重复
    @RequestMapping("/checkUserName")
    @ResponseBody
    public String checkUserName(String userName){
        Integer count = userService.checkUserName(userName);
        if (count>0){
            return "no";
        }else {
            return "yes";
        }
    }

    //注册用户
    @RequestMapping("/doRegister")
    public String doRegister(User user, Model model){
        System.out.println("----------"+user);
        if (user.getUserName()==null||"".equals(user.getUserName())){
            System.out.println("----------"+1);
            return "redirect:/user/toRegister.do";
        }
        if (user.getPassWord()==null||"".equals(user.getPassWord())){
            System.out.println("----------"+2);
            return "redirect:/user/toRegister.do";
        }
        if (user.getPhone()==null||"".equals(user.getPhone())){
            System.out.println("----------"+3);
            return "redirect:/user/toRegister.do";
        }
        try {
            userService.doRegister(user);
        }catch (Exception e){
            System.out.println(e);
            System.out.println("----------"+4);
            return "redirect:/user/toRegister.do";
        }
        model.addAttribute("user",user);
        return "redirect:/user/tologin.do";
    }

    //登录用户
    @RequestMapping("/tologinok")
    public String toLoginok(User user, HttpServletRequest request, HttpServletResponse response, String checkbox, Model model){
        User user1 = userService.loginok(user);
        ProductForPageBean productForPageBean = new ProductForPageBean();
        ProductForPageBean productForPageBean1 = productService.searchProducts(productForPageBean);
        List<CategoryExt> allCategory = categoryService.getAllCategory();
        model.addAttribute("categoryExts",allCategory);
        model.addAttribute("result",productForPageBean1);
        if (user1!=null){
            session.setAttribute("user", user1);
            String username = user1.getUserName();
            String password = user1.getPassWord();
            try {
                username = URLEncoder.encode(username,"utf-8");
                password = URLEncoder.encode(password,"utf-8");
            }catch (Exception e){
                e.printStackTrace();
            }
            Cookie cookie = new Cookie("userName", username);
            Cookie cookie2 = new Cookie("passWord", password);
            if ("on".equals(checkbox)) {
                cookie.setMaxAge(60 * 60 * 24 * 7);
                cookie2.setMaxAge(60 * 60 * 24 * 7);
            } else {
                cookie.setMaxAge(0);
                cookie2.setMaxAge(0);
            }
            response.addCookie(cookie);
            response.addCookie(cookie2);
            return "index";
        }else {
            request.setAttribute("msg", 0);
            return "login";
        }
    }

    @RequestMapping("/updateuser")
    //修改用户信息
    public String updateUser(User user){
        System.out.println("-------------------"+user+"----------------------");
        userService.updateUser(user);
        return "login";
    }

    @RequestMapping("/toUser")
    public String toUser(Model model){
        if (session.getAttribute("user")==null){
            return "login";
        }else {
            ProductForPageBean productForPageBean = new ProductForPageBean();
            ProductForPageBean productForPageBean1 = productService.searchProducts(productForPageBean);
            List<CategoryExt> allCategory = categoryService.getAllCategory();
            model.addAttribute("categoryExts",allCategory);
            model.addAttribute("result",productForPageBean1);
            return "user";
        }
    }

    //退出登录
    @RequestMapping("/exit")
    public String exit(){
        session.invalidate();
        return "login";
    }
}
