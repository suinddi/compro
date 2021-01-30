package com.webproject.compro.web.vos;

import java.util.ArrayList;

public class GetBasketItemVo {
    private final int startPage;
    private final int endPage;
    private final int requestPage;
    private final ArrayList<BasketItemVo> basketItemVos;

    public GetBasketItemVo(int startPage, int endPage, int requestPage, ArrayList<BasketItemVo> basketItemVos) {
        this.startPage = startPage;
        this.endPage = endPage;
        this.requestPage = requestPage;
        this.basketItemVos = basketItemVos;
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

    public ArrayList<BasketItemVo> getBasketItemVos() {
        return basketItemVos;
    }
}
