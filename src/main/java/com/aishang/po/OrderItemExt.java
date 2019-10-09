package com.aishang.po;

import lombok.Data;

@Data
public class OrderItemExt extends OrderItem{
    private Product product;
}
