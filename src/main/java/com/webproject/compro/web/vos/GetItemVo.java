package com.webproject.compro.web.vos;

import java.util.ArrayList;

public class GetItemVo {
    private final int startPage;
    private final int endPage;
    private final int requestPage;
    private final ArrayList<ItemVo> itemVos;

    public GetItemVo(int startPage, int endPage, int requestPage, ArrayList<ItemVo> itemVos) {
        this.startPage = startPage;
        this.endPage = endPage;
        this.requestPage = requestPage;
        this.itemVos = itemVos;
    }

    public int getStartPage() {
        return startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public int getRequestPage() {
        return requestPage;
    }

    public ArrayList<ItemVo> getItemVos() {
        return itemVos;
    }
}
