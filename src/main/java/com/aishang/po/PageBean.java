package com.aishang.po;

import org.springframework.stereotype.Component;

import java.util.List;

public class PageBean<T> {
    private Integer pageNow=1;
    private Integer pageSize=12;
    private Integer pageCount;
    private Integer rowCount;
    private Integer start;
    private List<T> list;

    public Integer getPageNow() {
        return pageNow;
    }

    public void setPageNow(Integer pageNow) {
        this.pageNow = pageNow;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageCount() {
        if (rowCount%pageSize==0){
            pageCount = rowCount/pageSize;
        }else {
            pageCount = rowCount/pageSize+1;
        }
        return pageCount;
    }

    public Integer getRowCount() {
        return rowCount;
    }

    public void setRowCount(Integer rowCount) {
        this.rowCount = rowCount;
    }

    public Integer getStart() {
        if (pageNow==null||pageNow<1){
            pageNow=1;
        }
        return (pageNow-1)*pageSize;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }
}
