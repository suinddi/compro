package com.webproject.compro.web.vos;

public class QnaRegisterVo {
    private final int qnaIndex;
    private final String qnaKind;
    private final String qnaTitle;
    private final String qnaContent;
    private final int purchaseIndex;

    public QnaRegisterVo(String qnaIndex, String qnaKind, String qnaTitle, String qnaContent, String purchaseIndex) {

        int qnaIndexNum;
        int purchaseIndexNum;
        try {
            qnaIndexNum = Integer.parseInt(qnaIndex);
            purchaseIndexNum = Integer.parseInt(purchaseIndex);
        } catch (NumberFormatException ignored) {
            qnaIndexNum = 1;
            purchaseIndexNum = 1;
        }
        this.qnaIndex = qnaIndexNum;
        this.qnaKind = qnaKind;
        this.qnaTitle = qnaTitle;
        this.qnaContent = qnaContent;
        this.purchaseIndex = purchaseIndexNum;
    }

    public int getQnaIndex() {
        return qnaIndex;
    }

    public String getQnaKind() {
        return qnaKind;
    }

    public String getQnaTitle() {
        return qnaTitle;
    }

    public String getQnaContent() {
        return qnaContent;
    }

    public int getPurchaseIndex() {
        return purchaseIndex;
    }
}
