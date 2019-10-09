package com.aishang.controller;

import com.aishang.po.CategoryExt;
import com.aishang.po.Product;
import com.aishang.po.ProductForPageBean;
import com.aishang.service.ICategoryService;
import com.aishang.service.IProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Resource
    private IProductService productService;
    @Resource
    private ICategoryService categoryService;

    //商品符合查询分页
    @RequestMapping("/searchProduct")
    public String searchProduct(ProductForPageBean productForPageBean, Model model){
        String pname = productForPageBean.getPname();
        if (pname!=null||"".equals(pname)){
            try {
                pname = new String(pname.getBytes("iso-8859-1"),"utf-8");
                pname = pname.replace(" ","");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        System.out.println("----------"+productForPageBean+"-------------");
        System.out.println("----------"+productForPageBean.getPageNow()+"-------------");
        System.out.println("----------"+productForPageBean.getRowCount()+"-------------");
        productForPageBean.setPname(pname);
        ProductForPageBean productForPageBean1 = productService.searchProducts(productForPageBean);
        List<CategoryExt> allCategory = categoryService.getAllCategory();
        List<Product> theHot = productService.theHot(productForPageBean);

        System.out.println("------------"+productForPageBean1.getPageCount()+"-----------------");

        model.addAttribute("theHot",theHot);
        model.addAttribute("categoryExts",allCategory);
        model.addAttribute("result",productForPageBean1);
        return "searchProduct";
    }

    //每个商品页面
    @RequestMapping("/toProductDetail")
    public String toProductDetail(ProductForPageBean productForPageBean, Model model,Integer pid){
        ProductForPageBean results = productService.searchProducts(productForPageBean);
        List<CategoryExt> allCategory = categoryService.getAllCategory();
        List<Product> theHot = productService.theHot(productForPageBean);
        Product productDetail = productService.productDetail(pid);
        model.addAttribute("productDetail",productDetail);
        model.addAttribute("theHot",theHot);
        model.addAttribute("categoryExts",allCategory);
        model.addAttribute("result",results);
        return "productDetail";
    }

}
