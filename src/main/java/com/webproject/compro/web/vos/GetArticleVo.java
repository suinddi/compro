package com.webproject.compro.web.vos;

import java.util.ArrayList;

public class GetArticleVo {
    private final int startPage;
    private final int endPage;
    private final int requestPage;
    private final ArrayList<ArticleVo> articleVos;

    public GetArticleVo(int startPage, int endPage, int requestPage, ArrayList<ArticleVo> articleVos) {
        this.startPage = startPage;
        this.endPage = endPage;
        this.requestPage = requestPage;
        this.articleVos = articleVos;
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

    public ArrayList<ArticleVo> getArticleVos() {
        return articleVos;
    }
}

