package com.webproject.compro.web.vos;

public class SearchVo  {
    private final String searchWord;
    private final int page;

    public SearchVo(String page, String searchWord) {
        int pageNumber;
        try {
            pageNumber = Integer.parseInt(page);
        } catch (NumberFormatException ignored) {
            pageNumber = 1;
        }
        this.page = pageNumber;
        this.searchWord = searchWord.replace(" ", "");
    }

    public String getSearchWord() {
        return searchWord;
    }

    public int getPage() {
        return page;
    }

}
