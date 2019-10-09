package com.aishang.service.impl;

import com.aishang.dao.ICategoryDao;
import com.aishang.po.CategoryExt;
import com.aishang.service.ICategoryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CategoryService implements ICategoryService {

    @Resource
    private ICategoryDao categoryDao;

    //获取所有一二级类目
    @Override
    public List<CategoryExt> getAllCategory() {
        return categoryDao.getAllCategory();
    }
}
