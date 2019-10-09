package com.aishang.dao;

import com.aishang.po.CategoryExt;
import com.aishang.po.Product;
import com.aishang.po.ProductForPageBean;

import java.util.List;
import java.util.Map;

public interface IProductDao {

    //获取热门商品集合
    List<Product> getHotProducts(Integer csid);

    //商品符合查询分页
    List<Product> searchProducts(ProductForPageBean productForPageBean);

    //查询分页商品总记录数
    Integer getRowCount(ProductForPageBean productForPageBean);

    //查询三个热门商品
    List<Product> theHot(ProductForPageBean productForPageBean);

    //单个商品全部信息
    Product productDetail(Integer pid);
}
