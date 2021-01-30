package com.webproject.compro.web.vos;

public class WriteArticleVo {
    private final String articleTitle;
    private final String articleKind;
    private final String articleContent;

    public WriteArticleVo(String articleTitle, String articleKind, String articleContent) {

        this.articleTitle = articleTitle;
        this.articleKind = articleKind;
        this.articleContent = articleContent;
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public String getArticleKind() {
        return articleKind;
    }

    public String getArticleContent() {
        return articleContent;
    }
}
