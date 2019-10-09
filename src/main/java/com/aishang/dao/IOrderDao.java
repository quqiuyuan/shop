package com.aishang.dao;

import com.aishang.po.Order;
import com.aishang.po.OrderExt;
import com.aishang.po.OrderForPageBean;
import com.aishang.po.OrderItem;

import java.util.List;

public interface IOrderDao {
    //添加订单
    void addOrder(Order order);
    //添加订单到订单表
    void addOrderItem(OrderItem orderItem);
    //改变订单支付状态
    void changePayState(Order order);
    //回显订单详情
    List<OrderExt> getOrderDetail(Integer oid);
    //我的订单
    List<OrderExt> myOrders(OrderForPageBean orderForPageBean);
    //我的订单页数
    Integer getRowCount(OrderForPageBean orderForPageBean);
    //删除order订单
    void delOrder(Integer oid);
}
