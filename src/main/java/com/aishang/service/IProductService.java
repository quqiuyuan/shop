package com.aishang.service;

import com.aishang.po.CategoryExt;
import com.aishang.po.Product;
import com.aishang.po.ProductForPageBean;

import java.util.List;
import java.util.Map;

public interface IProductService {
    //获取热门商品
    Map<Integer, List<Product>> getHotProducts(List<CategoryExt> allCategory);

    //商品符合查询分页
    ProductForPageBean searchProducts(ProductForPageBean productForPageBean);

    //查询3个热门商品
    List<Product> theHot(ProductForPageBean productForPageBean);

    //单个商品全部信息
    Product productDetail(Integer pid);
}
