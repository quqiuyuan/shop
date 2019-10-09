package com.aishang.service.impl;

import com.aishang.dao.IProductDao;
import com.aishang.po.CategoryExt;
import com.aishang.po.CategorySecond;
import com.aishang.po.Product;
import com.aishang.po.ProductForPageBean;
import com.aishang.service.IProductService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductService implements IProductService {

    @Resource
    private IProductDao produceDao;

    //获取热门商品集合
    @Override
    public Map<Integer, List<Product>> getHotProducts(List<CategoryExt> allCategory) {
        Map<Integer, List<Product>> hotProductMap = new HashMap<Integer, List<Product>>();
        //循环一二级类目集合
        for (CategoryExt categoryExt : allCategory) {
            //遍历所有二级类目
            for (CategorySecond categorySecond : categoryExt.getCategorySecondList()) {
                List<Product> products = produceDao.getHotProducts(categorySecond.getCsid());
                hotProductMap.put(categorySecond.getCsid(),products);
            }
        }
        return hotProductMap;
    }

    //商品复合查询分页
    @Override
    public ProductForPageBean searchProducts(ProductForPageBean productForPageBean) {
        Integer pageNow;
        //1，查询商品总数
        Integer rowCount = produceDao.getRowCount(productForPageBean);
        if (productForPageBean.getPageNow()>rowCount){
            pageNow = rowCount;
            productForPageBean.setPageNow(pageNow);
        }
        //2，查询商品集合
        List<Product> products = produceDao.searchProducts(productForPageBean);
        productForPageBean.setRowCount(rowCount);
        productForPageBean.setList(products);
        return productForPageBean;
    }

    //查询三个热门商品
    @Override
    public List<Product> theHot(ProductForPageBean productForPageBean) {
        List<Product> list = produceDao.theHot(productForPageBean);
        return list;
    }

    //商品详情页
    @Override
    public Product productDetail(Integer pid) {
        Product product = produceDao.productDetail(pid);
        return product;
    }
}
