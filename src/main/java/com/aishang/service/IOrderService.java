package com.aishang.service;

import com.aishang.po.*;

import java.util.List;

public interface IOrderService {
    //添加订单
    void addOrder(Order order);
    //添加订单到订单表
    void addOrderItem(OrderItem orderItem);
    //创建订单项+事务
    Integer createOrder(Order order, Cart cart);
    //改变订单支付状态
    void changePayState(Order order);
    //商品回显详情
    List<OrderExt> getOrderDetail(Integer oid);
    //我的订单
    OrderForPageBean myOrders(OrderForPageBean orderForPageBean);
    //删除order订单
    void delOrder(Integer oid);
}
