package com.aishang.controller;

import com.aishang.po.CategoryExt;
import com.aishang.po.Product;
import com.aishang.service.ICategoryService;
import com.aishang.service.IProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/index")
public class IndexController {

    @Resource
    private ICategoryService categoryService;
    @Resource
    private IProductService productService;

    //跳转到主页
    @RequestMapping("/index")
    public String index(Model model){
        //获取所有一二级目录
        List<CategoryExt> allCategory = categoryService.getAllCategory();
        //获得热门商品集合
        Map<Integer, List<Product>> productMap = productService.getHotProducts(allCategory);
        System.out.println(productMap);
        model.addAttribute("categoryExts",allCategory);
        model.addAttribute("hotProducts",productMap);
        return "index";
    }

}
