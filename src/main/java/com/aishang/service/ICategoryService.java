package com.aishang.service;

import com.aishang.po.CategoryExt;

import java.util.List;

public interface ICategoryService {

    //获取所有一二级类目
    List<CategoryExt> getAllCategory();
}
