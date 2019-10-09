package com.aishang.po;

import lombok.Data;

import java.util.List;
@Data
public class CategoryExt extends Category{
    private List<CategorySecond> categorySecondList;
}
