package com.aishang.controller;

import com.aishang.po.*;
import com.aishang.service.ICategoryService;
import com.aishang.service.IOrderService;
import com.aishang.service.IProductService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import com.sun.org.apache.xpath.internal.operations.Or;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Resource
    private HttpSession session;
    @Resource
    private IOrderService orderService;
    @Resource
    private ICategoryService categoryService;
    @Resource
    private IProductService productService;

    //跳转确认订单页
    @RequestMapping("/toConfirmOrder")
    public String toConfirmOrder(){
        User user = (User) session.getAttribute("user");
        if (user==null){
            return "login";
        }else {
            return "confirmOrder";
        }
    }

    //跳转支付页
    @RequestMapping("/toPay")
    public String toPay(Order order, Model model){
        Cart cart = (Cart)session.getAttribute("cart");
        Integer oid = orderService.createOrder(order, cart);
        if (oid!=null){
            model.addAttribute("oid",order.getOid());
            cart.clear();
            return "pay";
        }
        return "confirmOrder";
    }

    //检测是否支付成功
    @RequestMapping("/toChangePay")
    public String toChangePay(Order order, Model model){
        //更改支付状态
        order.setState(1);
        orderService.changePayState(order);

        //回显订单详情
        List<OrderExt> list = orderService.getOrderDetail(order.getOid());
        model.addAttribute("orderDetail", list);
        return "paySuccess";
    }

    //改变订单状态至待评价
    @RequestMapping("/toChangePayStateThree")
    public String toChangePayStateThree(Order order, Model model,Integer pageNow){
        OrderForPageBean orderForPageBean = new OrderForPageBean();
        orderForPageBean.setUid(order.getUid());
        orderForPageBean.setPageNow(pageNow);
        //获取所有一二级目录
        List<CategoryExt> allCategory = categoryService.getAllCategory();
        //获得热门商品集合
        Map<Integer, List<Product>> productMap = productService.getHotProducts(allCategory);
        //改变订单状态
        order.setState(3);
        orderService.changePayState(order);
        //我的订单遍历
        OrderForPageBean orderForPageBean1 = orderService.myOrders(orderForPageBean);

        model.addAttribute("myOrders",orderForPageBean1);
        model.addAttribute("categoryExts",allCategory);
        model.addAttribute("hotProducts",productMap);
        return "myOrders";
    }

    //进入我的订单
    @RequestMapping("/toMyOrders")
    public String toMyOrders(Model model, OrderForPageBean orderForPageBean){
        //获取所有一二级目录
        List<CategoryExt> allCategory = categoryService.getAllCategory();
        //获得热门商品集合
        Map<Integer, List<Product>> productMap = productService.getHotProducts(allCategory);
        //我的订单遍历
        OrderForPageBean orderForPageBean1 = orderService.myOrders(orderForPageBean);

        model.addAttribute("myOrders",orderForPageBean1);
        model.addAttribute("categoryExts",allCategory);
        model.addAttribute("hotProducts",productMap);
        return "myOrders";
    }

    //我的订单付款
    @RequestMapping("/toOrderPay")
    public String toOrderPay(Order order, Model model){
        model.addAttribute("oid",order.getOid());
        return "pay";
    }

    //我的订单确认收货
    @RequestMapping("/toConfirmPay")
    public String toConfirmPay(Order order, Model model, Integer pageNow){
        //获取所有一二级目录
        List<CategoryExt> allCategory = categoryService.getAllCategory();
        //获得热门商品集合
        Map<Integer, List<Product>> productMap = productService.getHotProducts(allCategory);
        //回显订单详情
        List<OrderExt> list = orderService.getOrderDetail(order.getOid());

        model.addAttribute("pageNow",pageNow);
        model.addAttribute("orderDetail",list);
        model.addAttribute("categoryExts",allCategory);
        model.addAttribute("hotProducts",productMap);
        return "confirmPay";
    }

    //删除订单
    @RequestMapping("/toDelOrder")
    public String toDelOrder(Order order, Model model, OrderForPageBean orderForPageBean){
        //获取所有一二级目录
        List<CategoryExt> allCategory = categoryService.getAllCategory();
        //获得热门商品集合
        Map<Integer, List<Product>> productMap = productService.getHotProducts(allCategory);
        //删除所选的订单
        orderService.delOrder(order.getOid());
        //我的订单遍历
        OrderForPageBean orderForPageBean1 = orderService.myOrders(orderForPageBean);

        model.addAttribute("myOrders",orderForPageBean1);
        model.addAttribute("categoryExts",allCategory);
        model.addAttribute("hotProducts",productMap);
        return "myOrders";
    }
}
