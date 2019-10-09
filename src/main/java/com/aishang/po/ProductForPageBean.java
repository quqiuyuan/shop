package com.aishang.po;

import lombok.Data;

@Data
public class ProductForPageBean extends PageBean<Product> {
    private Integer cid;
    private Integer csid;
    private String pname;
}
