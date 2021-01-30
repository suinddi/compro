package com.webproject.compro.web.vos;

import java.util.ArrayList;

public class GetFaqVo {
    private final int requestPage;
    private final ArrayList<FaqVo> faqVos;

    public GetFaqVo(int requestPage, ArrayList<FaqVo> faqVos) {
        this.requestPage = requestPage;
        this.faqVos = faqVos;
    }

    public int getRequestPage() {
        return requestPage;
    }

    public ArrayList<FaqVo> getFaqVos() {
        return faqVos;
    }
}

