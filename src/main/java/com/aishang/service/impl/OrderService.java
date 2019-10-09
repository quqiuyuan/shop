package com.aishang.service.impl;

import com.aishang.dao.IOrderDao;
import com.aishang.po.*;
import com.aishang.service.IOrderService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class OrderService implements IOrderService {

    @Resource
    private IOrderDao orderDao;

    //添加订单
    @Override
    public void addOrder(Order order) {
        orderDao.addOrder(order);
    }

    //添加订单到订单表
    @Override
    public void addOrderItem(OrderItem orderItem) {
        orderDao.addOrderItem(orderItem);
    }

    //创建订单+事务
    @Override
    @Transactional
    public Integer createOrder(Order order, Cart cart) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        order.setTotal(cart.getSubTotal());
        order.setOrderTime(sdf.format(date).toString());

        //添加订单
        this.addOrder(order);
        //添加订单到订单表
        for (CartItem cartItem : cart.getCartItems()) {
            OrderItem orderItem = new OrderItem();
            orderItem.setCount(cartItem.getCount());
            orderItem.setOid(order.getOid());
            orderItem.setPid(cartItem.getProduct().getPid());
            orderItem.setSubTotal(cartItem.getTotal());
            this.addOrderItem(orderItem);
        }

        return order.getOid();
    }

    //改变订单支付状态
    @Override
    public void changePayState(Order order) {
        orderDao.changePayState(order);
    }

    //回显订单详情
    @Override
    public List<OrderExt> getOrderDetail(Integer oid) {
        return orderDao.getOrderDetail(oid);
    }

    //我的订单
    @Override
    public OrderForPageBean myOrders(OrderForPageBean orderForPageBean) {
        Integer pageNow;
        orderForPageBean.setPageSize(3);
        //1，查询商品总数
        Integer rowCount = orderDao.getRowCount(orderForPageBean);
        if (orderForPageBean.getPageNow()>rowCount){
            pageNow = rowCount;
            orderForPageBean.setPageNow(pageNow);
        }
        //2，查询商品集合
        List<OrderExt> orderExtList = orderDao.myOrders(orderForPageBean);
        orderForPageBean.setRowCount(rowCount);
        orderForPageBean.setList(orderExtList);
        return orderForPageBean;
    }

    //删除order订单
    @Override
    public void delOrder(Integer oid) {
        orderDao.delOrder(oid);
    }

    //我的订单页数
    public Integer getRowCount(OrderForPageBean orderForPageBean){
        return orderDao.getRowCount(orderForPageBean);
    }
}
