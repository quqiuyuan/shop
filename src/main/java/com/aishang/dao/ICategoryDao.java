package com.aishang.dao;

import com.aishang.po.CategoryExt;

import java.util.List;

public interface ICategoryDao {

    //获取全部一二级类目
    List<CategoryExt> getAllCategory();
}
