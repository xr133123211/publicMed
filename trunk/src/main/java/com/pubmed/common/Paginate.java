package com.pubmed.common;

import java.util.List;

public class Paginate {
    public static final int PAGE_NUMBER = 25;
    private List pageList;
    private int pageNo;
    private int totalPage;
    private int totalCount = 0;
    private int pageSize = 25;
    private int nextPage;
    private int prePage;

    public int getBeginNum() {
        return (this.pageNo - 1) * this.pageSize + 1;
    }

    public int getEndNum() {
        return this.pageNo * this.pageSize + 1;
    }

    public Paginate(int pageNo, int pageSize) {
        if(pageNo <= 0) {
            pageNo = 1;
        }

        this.pageNo = pageNo;
        this.pageSize = pageSize;
    }

    public List getPageList() {
        return this.pageList;
    }

    public void setPageList(List pageList) {
        this.pageList = pageList;
    }

    public int getPageNo() {
        return this.pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getTotalPage() {
        if(this.getTotalCount() == 0) {
            this.setTotalPage(1);
        } else if(this.getTotalCount() % this.getPageSize() == 0) {
            this.setTotalPage(this.getTotalCount() / this.getPageSize());
        } else {
            this.setTotalPage(this.getTotalCount() / this.getPageSize() + 1);
        }

        return this.totalPage;
    }

    private void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getTotalCount() {
        return this.totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getPageSize() {
        return this.pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getNextPage() {
        return this.isLastPage()?this.getTotalPage():this.getPageNo() + 1;
    }

    public int getPrePage() {
        return this.isFirstPage()?1:this.getPageNo() - 1;
    }

    public boolean isLastPage() {
        return this.getTotalPage() <= 0?true:this.getPageNo() >= this.getTotalPage();
    }

    public boolean isFirstPage() {
        return this.getPageNo() <= 1;
    }
}
