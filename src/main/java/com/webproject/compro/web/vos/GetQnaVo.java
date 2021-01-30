package com.webproject.compro.web.vos;

import java.util.ArrayList;

public class GetQnaVo {
    private final int startPage;
    private final int endPage;
    private final int requestPage;
    private final ArrayList<QnaRegisterVo> qnaRegisterVos;

    public GetQnaVo(int startPage, int endPage, int requestPage, ArrayList<QnaRegisterVo> qnaRegisterVos) {
        this.startPage = startPage;
        this.endPage = endPage;
        this.requestPage = requestPage;
        this.qnaRegisterVos = qnaRegisterVos;
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

    public ArrayList<QnaRegisterVo> getQnaRegisterVos() {
        return qnaRegisterVos;
    }
}
