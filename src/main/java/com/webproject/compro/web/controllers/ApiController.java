package com.webproject.compro.web.controllers;

import com.webproject.compro.utility.Converter;
import com.webproject.compro.web.enums.GetItemResult;
import com.webproject.compro.web.services.ApiService;
import com.webproject.compro.web.vos.*;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@RestController
@RequestMapping(value = "/apis", method = RequestMethod.POST)
public class ApiController {
    private final ApiService apiService;

    @Autowired
    public ApiController(ApiService apiService) {
        this.apiService = apiService;
    }

    // 아이템 목록 불러오기
    @ResponseBody
    @RequestMapping(value = "/get-item", produces = MediaType.APPLICATION_JSON_VALUE)
    public String getProduct(HttpServletRequest request, HttpServletResponse response,
                           @RequestParam(name = "page", defaultValue = "1") String pageString) throws
            SQLException {

        int page = Converter.stringToInt(pageString, -1);

        GetItemVo getItemVo = this.apiService.getItem(page);
        JSONArray jsonItems = new JSONArray();
        for (ItemVo itemVo : getItemVo.getItemVos()) {
            JSONObject jsonItem = new JSONObject();
            jsonItem.put("itemIndex", itemVo.getItemIndex());
            jsonItem.put("itemCode", itemVo.getItemCode());
            jsonItem.put("itemName", itemVo.getItemName());
            jsonItem.put("itemColor", itemVo.getItemColor());
            jsonItem.put("itemSize", itemVo.getItemSize());
            jsonItem.put("itemPrice", itemVo.getItemPrice());
            jsonItem.put("imageIndex", itemVo.getImageIndex());
            jsonItems.put(jsonItem);
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("startPage", getItemVo.getStartPage());
        jsonObject.put("endPage", getItemVo.getEndPage());
        jsonObject.put("requestPage", getItemVo.getRequestPage());
        jsonObject.put("items", jsonItems);

        response.setCharacterEncoding("UTF-8");
        return jsonObject.toString(4);
    }

    // 아이템 업로드
    @RequestMapping(value = "/upload-item", produces = MediaType.TEXT_PLAIN_VALUE)
    public void uploadItem(HttpServletRequest request, HttpServletResponse response,
                           @RequestParam(name = "up_file") MultipartFile itemImage,
                           @RequestParam(name = "up_name", defaultValue = "") String itemName,
                           @RequestParam(name = "up_code", defaultValue = "") String itemCode,
                           @RequestParam(name = "up_color", defaultValue = "") String itemColor,
                           @RequestParam(name = "up_size", defaultValue = "") String itemSize,
                           @RequestParam(name = "up_price", defaultValue = "") String itemPrice) throws
            SQLException, IOException {
        UploadItemVo uploadItemVo = new UploadItemVo(itemName, itemCode, itemColor, itemSize, itemPrice, itemImage);
        this.apiService.uploadItem(uploadItemVo);
        // 파일 형식이 맞지 않는다면, IMAGE_NOT_ALLOWED
        response.getWriter().print("SUCCESS");
    }

    // 게시판 목록 불러오기
    @ResponseBody
    @RequestMapping(value = "/get-article", produces = MediaType.APPLICATION_JSON_VALUE)
    public String getArticle(HttpServletRequest request, HttpServletResponse response,
                        @RequestParam(name = "page", defaultValue = "1") String pageString) throws SQLException {
        int page = Converter.stringToInt(pageString, -1);

        GetArticleVo getArticleVo = this.apiService.getArticle(page);
        JSONArray jsonArticles = new JSONArray();
        for (ArticleVo articleVo : getArticleVo.getArticleVos()) {
            JSONObject jsonArticle = new JSONObject();
            jsonArticle.put("index", articleVo.getArticleIndex());
            jsonArticle.put("title", articleVo.getTitle());
            jsonArticle.put("articleName", articleVo.getArticleName());
            jsonArticle.put("writtenAt", articleVo.getWrittenAt());
            jsonArticle.put("hit", articleVo.getHit());
            jsonArticle.put("content", articleVo.getContent());
            jsonArticles.put(jsonArticle);
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("startPage", getArticleVo.getStartPage());
        jsonObject.put("endPage", getArticleVo.getEndPage());
        jsonObject.put("requestPage", getArticleVo.getRequestPage());
        jsonObject.put("articles", jsonArticles);

        response.setCharacterEncoding("UTF-8");
        return jsonObject.toString(4);
    }

    // 게시판 글 등록하기
    @RequestMapping(value = "/write-article", produces = MediaType.APPLICATION_JSON_VALUE)
    public void write(HttpServletRequest request, HttpServletResponse response,
                      @RequestParam(name = "article_title", defaultValue = "") String title,
                      @RequestParam(name = "article_kind", defaultValue = "") String kind,
                      @RequestParam(name = "article_content", defaultValue = "") String content) throws SQLException, IOException {
        WriteArticleVo writeArticleVo = new WriteArticleVo(title, kind, content);
        this.apiService.writeArticle(writeArticleVo);
        response.getWriter().print("SUCCESS");
    }

    // FAQ 목록 불러오기
    @ResponseBody
    @RequestMapping(value = "/get-faq", produces = MediaType.APPLICATION_JSON_VALUE)
    public String getFaqs(HttpServletRequest request, HttpServletResponse response,
                        @RequestParam(name = "page", defaultValue = "1") String pageString) throws SQLException {
        int page = Converter.stringToInt(pageString, 1);

        GetFaqVo getFaqVo = this.apiService.getFaq(page);
        JSONArray jsonFaqs = new JSONArray();
        for (FaqVo faqVo : getFaqVo.getFaqVos()) {
            JSONObject jsonFaq = new JSONObject();
            jsonFaq.put("answerTitle", faqVo.getAnswerTitle());
            jsonFaq.put("answerContent", faqVo.getAnswerContent());
            jsonFaqs.put(jsonFaq);
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("requestPage", getFaqVo.getRequestPage());
        jsonObject.put("faqs", jsonFaqs);

        response.setCharacterEncoding("UTF-8");
        return jsonObject.toString(4);
    }

    // FAQ 검색
    @ResponseBody
    @RequestMapping(value = "/search", produces = MediaType.APPLICATION_JSON_VALUE)
    public String searchGet(HttpServletRequest request, HttpServletResponse response,
                          @RequestParam(name = "page", defaultValue = "") String page,
                          @RequestParam(name = "searchWord", defaultValue = "") String searchWord) throws SQLException {
        SearchVo searchVo = new SearchVo(page, searchWord);
        ArrayList<FaqVo> faqVos = this.apiService.search(searchVo);

        JSONArray jsonFaqs = new JSONArray();
        for (FaqVo faqVo : faqVos) {
            JSONObject jsonFaq = new JSONObject();
            jsonFaq.put("answerTitle", faqVo.getAnswerTitle());
            jsonFaq.put("answerContent", faqVo.getAnswerContent());
            jsonFaqs.put(jsonFaq);
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("requestPage", searchVo.getPage());
        jsonObject.put("faqs", jsonFaqs);

        response.setCharacterEncoding("UTF-8");
        return jsonObject.toString(4);
    }

    // 장바구니에 담기
    @RequestMapping(value = "/go-basket", produces = MediaType.TEXT_PLAIN_VALUE)
    public void goBasket(HttpServletRequest request, HttpServletResponse response,
                         @RequestParam(name = "pr_color", defaultValue = "") String basketItemColor,
                         @RequestParam(name = "pr_size", defaultValue = "") String basketItemSize,
                         @RequestParam(name = "pr_count", defaultValue = "") String basketItemCount,
                         @RequestParam(name = "pr_name", defaultValue = "") String itemName,
                         @RequestParam(name = "pr_index", defaultValue = "") String itemIndex,
                         @RequestParam(name = "pr_code", defaultValue = "") String itemCode,
                         @RequestParam(name = "pr_price", defaultValue = "") String itemPrice
    ) throws IOException, SQLException {
        UserVo userVo = Converter.getUserVo(request);
        if (userVo != null) {
            BasketItemVo basketItemVo = new BasketItemVo(itemIndex, itemName, itemCode, itemPrice, basketItemColor, basketItemSize, basketItemCount);
            GetItemResult getItemResult = this.apiService.getBasketItem(basketItemVo, userVo);
            response.getWriter().print(getItemResult.name());
        } else {
            response.getWriter().print("denied");
        }
    }

    // 장바구니 목록 가져오기
    @ResponseBody
    @RequestMapping(value = "/get-basket-item", produces = MediaType.APPLICATION_JSON_VALUE)
    public String getItem(HttpServletRequest request, HttpServletResponse response,
                        @RequestParam(name = "page", defaultValue = "") String pageString) throws SQLException {
        UserVo userVo = Converter.getUserVo(request);
        int page = Converter.stringToInt(pageString, -1);

        GetBasketItemVo getBasketItemVo = this.apiService.getBasketItemList(page, userVo);
        JSONArray jsonBasketItems = new JSONArray();
        for (BasketItemVo basketItemVo : getBasketItemVo.getBasketItemVos()) {
            JSONObject jsonBasket = new JSONObject();
            jsonBasket.put("basketItemIndex", basketItemVo.getBasketIndex());
            jsonBasket.put("basketItemName", basketItemVo.getItemName());
            jsonBasket.put("basketItemColor", basketItemVo.getBasketItemColor());
            jsonBasket.put("basketItemSize", basketItemVo.getBasketItemSize());
            jsonBasket.put("basketItemCount", basketItemVo.getBasketItemCount());
            jsonBasket.put("basketItemPrice", basketItemVo.getItemPrice());
            jsonBasketItems.put(jsonBasket);
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("startPage", getBasketItemVo.getStartPage());
        jsonObject.put("endPage", getBasketItemVo.getEndPage());
        jsonObject.put("requestPage", getBasketItemVo.getRequestPage());
        jsonObject.put("basketItems", jsonBasketItems);

        response.setCharacterEncoding("UTF-8");
        return jsonObject.toString(4);
    }

    //장바구니 목록 삭제
    @RequestMapping(value = "delete-basket-item", produces = MediaType.TEXT_PLAIN_VALUE)
    public void deleteBasketItem(HttpServletRequest request, HttpServletResponse response,
                                 @RequestParam(name = "basketItemIndex", defaultValue = "") String basketItemIndex) throws SQLException, IOException {
        UserVo userVo = Converter.getUserVo(request);
        DeleteBasketItemVo deleteBasketItemVo = new DeleteBasketItemVo(basketItemIndex);
        if (!deleteBasketItemVo.isNormalized()) {
            response.getWriter().print("FAILURE");
        } else {
            this.apiService.deleteBasketItem(deleteBasketItemVo, userVo);
            response.getWriter().print("SUCCESS");
        }
    }
}