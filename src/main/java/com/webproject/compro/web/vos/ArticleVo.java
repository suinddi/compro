package com.webproject.compro.web.vos;

import java.util.Date;

public class ArticleVo {
    private final int index;
    private final String title;
    private final String articleName;
    private final String content;
    private final Date writtenAt;
    private final int hit;

    public ArticleVo(int index, String title, String articleName, String content, Date writtenAt, int hit) {
        this.index = index;
        this.title = title;
        this.articleName = articleName;
        this.content = content;
        this.writtenAt = writtenAt;
        this.hit = hit;
    }

    public int getArticleIndex() {
        return index;
    }

    public String getTitle() {
        return title;
    }

    public String getArticleName() {
        return articleName;
    }

    public String getContent() {
        return content;
    }

    public Date getWrittenAt() {
        return writtenAt;
    }

    public int getHit() {
        return hit;
    }
}
