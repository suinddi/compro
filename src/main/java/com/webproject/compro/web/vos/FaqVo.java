package com.webproject.compro.web.vos;

public class FaqVo{
    private final String answerTitle;
    private final String answerContent;

    public FaqVo(String answerTitle, String answerContent) {
        this.answerTitle = answerTitle;
        this.answerContent = answerContent;
    }

    public String getAnswerTitle() {
        return answerTitle;
    }

    public String getAnswerContent() {
        return answerContent;
    }

}
