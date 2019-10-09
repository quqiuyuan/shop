package com.aishang.po;

import lombok.Data;

import java.util.List;

@Data
public class OrderExt extends Order{
    private List<OrderItemExt> orderItemExtList;
}
