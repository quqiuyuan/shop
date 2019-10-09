package com.aishang.controller;

import com.aishang.po.Cart;
import com.aishang.po.CartItem;
import com.aishang.po.Product;
import com.aishang.service.IProductService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Resource
    private IProductService productService;
    @Resource
    private HttpSession session;

    //跳到购物车页面
    @RequestMapping("/toCart")
    public String toCart(){
        return "cart";
    }

    //添加购物项
    @ResponseBody
    @RequestMapping("/addCartItem")
    public String addCartItem(Integer pid, Integer count){
        //封装购物项
        CartItem cartItem = new CartItem();
        Product product = productService.productDetail(pid);
        cartItem.setCount(count);
        cartItem.setProduct(product);

        //将购物项添加到购物车里
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart!=null){
            cart.addCartItem(cartItem);
        }else {
            cart = new Cart();
            cart.addCartItem(cartItem);
            session.setAttribute("cart",cart);
        }
        return ""+cart.getSubTotal();
    }

    //修改购物车商品数量
    @ResponseBody
    @RequestMapping("/changeCount")
    public String changeCount(Integer pid, Integer count){
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart!=null){
            cart.changeCount(pid,count);
        }
        return ""+cart.getSubTotal();
    }

    //删除购物项
    @ResponseBody
    @RequestMapping("/removeCartItem")
    public String removeCartItem(Integer pid){
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart!=null){
            cart.removeCartItem(pid);
        }
        return ""+cart.getSubTotal();
    }

    //清空购物项
    @ResponseBody
    @RequestMapping("/clear")
    public String clear(){
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart!=null) {
            cart.clear();
        }
        return "0.0";
    }
}
