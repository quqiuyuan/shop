package com.aishang.po;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {
    private Map<Integer,CartItem> cartItems = new LinkedHashMap<Integer, CartItem>();
    private Double subTotal = 0.0;

    public Double getSubTotal() {
        return subTotal;
    }

    //返回list  获取购物车
    public Collection<CartItem> getCartItems() {
        return cartItems.values();
    }

    //添加购物项
    public String addCartItem(CartItem cartItem){
        Integer pid = cartItem.getProduct().getPid();
        if (isCountent(pid)){
            CartItem cartItem1 = cartItems.get(pid);
            Integer oldCount = cartItem1.getCount();
            Integer newCount = cartItem.getCount();
            if (oldCount+newCount<100){
                cartItem1.setCount(oldCount+newCount);
                subTotal = subTotal + cartItem.getTotal();
            }
            if (oldCount+newCount>100){
                cartItem1.setCount(oldCount);
            }
        }else {
            cartItems.put(pid,cartItem);
            subTotal = subTotal + cartItem.getTotal();
        }
        return ""+subTotal;
    }

    //删除购物项
    public String removeCartItem(Integer pid){
        if (isCountent(pid)){
            CartItem remove = cartItems.remove(pid);
            subTotal = subTotal - remove.getTotal();
        }
        return "";
    }

    //判断购物车是否包含购物项
    public boolean isCountent(Integer pid){
        return cartItems.containsKey(pid);
    }

    //修改购物车商品数量
    public void changeCount(Integer pid,Integer newcount){
        if (isCountent(pid)){
            CartItem cartItem = cartItems.get(pid);
            subTotal = subTotal - cartItem.getTotal();
            cartItem.setCount(newcount);
            subTotal = subTotal + cartItem.getTotal();
        }
    }

    //清空购物车
    public void clear(){
        cartItems.clear();
        subTotal = 0.0;
    }
}
