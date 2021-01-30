package com.webproject.compro.web.daos;

import com.webproject.compro.web.vos.*;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;

@Repository
public class ApiDao {
    private static final int ROWS_PER_PAGE = 10; // 한 페이지 당 보여줄 게시글의 수
    private static final int ROWS_PER_PAGE_BASKET_ITEM = 6; // 한 페이지 당 보여줄 장바구니 아이템의 수
    private static final int ROWS_PER_PAGE_ITEM = 20;

    public GetItemVo selectItems(Connection connection, int pageNumber) throws SQLException {
        int startPage = pageNumber < 6 ? 1 : pageNumber - 5;
        int endPage = pageNumber < 6 ? 10 : pageNumber + 5;
        int requestPage = pageNumber;
        ArrayList<ItemVo> items = new ArrayList<>();

        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT COUNT(`item_index`) AS `count` FROM `compro`.`items`")) {
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int totalArticleCount = resultSet.getInt("count");
                    int maxPageNumber = (int) Math.ceil((double) totalArticleCount / ROWS_PER_PAGE_ITEM);
                    if (endPage > maxPageNumber) {
                        endPage = maxPageNumber;
                    }
                }
            }
        }

        // 아이템 리스트 보여주기
        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT  `item`.`item_index` AS `itemIndex`,\n" +
                        "`item`.`item_code` AS `itemCode`,\n" +
                        "`item`.`item_name` AS `itemName`,\n" +
                        "`item`.`item_color` AS `itemColor`,\n" +
                        "`item`.`item_size` AS `itemSize`,\n" +
                        "`item`.`item_price` AS `itemPrice`,\n" +
                        "IFNULL(`image`.`image_index`,0) AS `imageIndex`\n" +
                        "FROM `compro`.`items` AS `item`\n" +
                        "LEFT JOIN `compro`.`item_images` AS `image` ON `item`.`item_index` = `image`.`item_index` \n" +
                        "ORDER BY `itemIndex` DESC LIMIT ?, ?")) {
            preparedStatement.setInt(1, (pageNumber - 1) * ROWS_PER_PAGE_ITEM);
            preparedStatement.setInt(2, ROWS_PER_PAGE_ITEM);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    ItemVo itemVo = new ItemVo(
                            resultSet.getString("itemIndex"),
                            resultSet.getString("itemCode"),
                            resultSet.getString("itemName"),
                            resultSet.getString("itemColor"),
                            resultSet.getString("itemSize"),
                            resultSet.getString("itemPrice"),
                            resultSet.getInt("imageIndex"));
                    items.add(itemVo);
                }
            }
        }
        return new GetItemVo(startPage, endPage, requestPage, items);
    }

    // 아이템 업로드
    public void uploadItems(Connection connection, UploadItemVo uploadItemVo) throws SQLException {
        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO `compro`.`items`( item_name, item_code, item_color, item_size, item_price) \n" +
                        "VALUES(?,?,?,?,?)")) {
            preparedStatement.setString(1, uploadItemVo.getItemName());
            preparedStatement.setString(2, uploadItemVo.getItemCode());
            preparedStatement.setString(3, uploadItemVo.getItemColor());
            preparedStatement.setString(4, uploadItemVo.getItemSize());
            preparedStatement.setInt(5, uploadItemVo.getItemPrice());
            preparedStatement.execute();
        }
    }

    public void insertImage(Connection connection, String imageData) throws SQLException {
        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO `compro`.`item_images`(image_data) VALUES (?)")) {
            preparedStatement.setString(1, imageData);
            preparedStatement.execute();
        }
    }

    public int selectLastIndex(Connection connection) throws SQLException {
        int index = -1;
        String query = "SELECT LAST_INSERT_ID() AS `index`";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    index = resultSet.getInt("index");
                }
            }
        }
        return index;
    }

    public String selectImage(Connection connection, int id) throws
            SQLException {
        String imageData = null;
        String query = "SELECT `image_data` AS `imageData` FROM `compro`.`item-images` WHERE `image_index` = ?";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    imageData = resultSet.getString("imageData");
                }
            }
        }
        return imageData;
    }

    public void writeArticle(Connection connection, WriteArticleVo writeArticleVo) throws SQLException {
        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO `compro`.`articles`(article_title, article_name, article_content, article_hit, board_id) VALUES (?,?,?,0,'ntc')")) {
            preparedStatement.setString(1, writeArticleVo.getArticleTitle());
            preparedStatement.setString(2, writeArticleVo.getArticleKind());
            preparedStatement.setString(3, writeArticleVo.getArticleContent());
            preparedStatement.execute();
        }
    }

    public GetArticleVo selectArticles(Connection connection, int pageNumber) throws SQLException {
        int startPage = pageNumber < 6 ? 1 : pageNumber - 5;
        int endPage = pageNumber < 6 ? 10 : pageNumber + 5;
        int requestPage = pageNumber;
        ArrayList<ArticleVo> articles = new ArrayList<>();

        try (PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT(`article_index`) AS `count` FROM `compro`.`articles`")) {
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int totalArticleCount = resultSet.getInt("count");
                    int maxPageNumber = (int) Math.ceil((double) totalArticleCount / ROWS_PER_PAGE);
                    if (endPage > maxPageNumber) {
                        endPage = maxPageNumber;
                    }
                }
            }
        }

        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT article_index, article_title, article_name, article_content, article_written_at, article_hit FROM `compro`.`articles` ORDER BY `article_index` DESC LIMIT ?, ?")) {
            preparedStatement.setInt(1, (pageNumber - 1) * ROWS_PER_PAGE);
            preparedStatement.setInt(2, ROWS_PER_PAGE);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    ArticleVo articleVo = new ArticleVo(
                            resultSet.getInt("article_index"),
                            resultSet.getString("article_title"),
                            resultSet.getString("article_name"),
                            resultSet.getString("article_content"),
                            resultSet.getDate("article_written_at"),
                            resultSet.getInt("article_hit")
                    );
                    articles.add(articleVo);
                }
            }
        }
        return new GetArticleVo(startPage, endPage, requestPage, articles);
    }

    public GetFaqVo selectFaqs(Connection connection, int pageNumber) throws SQLException {
        int requestPage = pageNumber;
        ArrayList<FaqVo> faqs = new ArrayList<>();
        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT answer_title, answer_content FROM `compro`.`faqs_answers` WHERE `content_index` = ? LIMIT ?")) {
            preparedStatement.setInt(1, pageNumber);
            preparedStatement.setInt(2, ROWS_PER_PAGE);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    FaqVo faqVo = new FaqVo(
                            resultSet.getString("answer_title"),
                            resultSet.getString("answer_content")
                    );
                    faqs.add(faqVo);
                }
            }
        }
        return new GetFaqVo(requestPage, faqs);
    }

    // FAQ 검색
    public ArrayList<FaqVo> selectFaqs(Connection connection, SearchVo searchVo) throws SQLException {
        ArrayList<FaqVo> faqs = new ArrayList<>();
        String query = "...";
        query = "SELECT `answer`.`answer_index`     AS `answerIndex`,\n" +
                "`answer`.`answer_title`     AS `answerTitle`,\n" +
                "`answer`.`answer_content`   AS `answerContent`\n" +
                "FROM `compro`.`faqs_answers` AS `answer`\n" +
                "WHERE REPLACE(`answer_title`, ' ', '') LIKE '%" + searchVo.getSearchWord() + "%' \n" +
                "ORDER BY `answer_index` DESC";

        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.executeQuery();
            try (ResultSet resultSet = preparedStatement.getResultSet()) {
                while (resultSet.next()) {
                    FaqVo faqVo = new FaqVo(
                            resultSet.getString("answerTitle"),
                            resultSet.getString("answerContent"));
                    faqs.add(faqVo);
                }
            }
        }
        return faqs;
    }

    // FAQ 검색 결과 개수
    public int selectSearchFaqCount(Connection connection, SearchVo searchVo) throws SQLException {
        int count;
        String query = "...";
        // 전체 단어 검색 결과

        query = "SELECT COUNT(`answer_index`) AS `count`\n" +
                "FROM `compro`.`faqs_answers` AS `answer`\n" +
                "WHERE `content_index` = ? \n" +
                "AND REPLACE(`answer_title`, ' ', '') LIKE '%" + searchVo.getSearchWord() + "%' ";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, searchVo.getSearchWord());
            preparedStatement.executeQuery();
            try (ResultSet resultSet = preparedStatement.getResultSet()) {
                resultSet.next();
                count = resultSet.getInt("count");
            }
        }
        return count;
    }

    // 장바구니에 아이템 집어넣기
    public boolean insertItems(Connection connection, UserVo userVo, BasketItemVo basketItemVo) throws SQLException {
        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO `compro`.`baskets`(basket_item_color, basket_item_size, basket_item_count, user_index, item_index, item_code) \n" +
                        "VALUES(?,?,?,?,?,?)")) {

            preparedStatement.setString(1, basketItemVo.getBasketItemColor());
            preparedStatement.setString(2, basketItemVo.getBasketItemSize());
            preparedStatement.setInt(3, basketItemVo.getBasketItemCount());
            preparedStatement.setInt(4, userVo.getIndex());
            preparedStatement.setInt(5, basketItemVo.getItemIndex());
            preparedStatement.setString(6, basketItemVo.getItemCode());
            preparedStatement.execute();
        }
        return true;
    }

    // 장바구니에 아이템 리스트 보여주기
    public GetBasketItemVo selectBasketItems(Connection connection, int pageNumber, UserVo userVo) throws SQLException {
        int startPage = pageNumber < 6 ? 1 : pageNumber - 5;
        int endPage = pageNumber + 5;
        int requestPage = pageNumber;
        ArrayList<BasketItemVo> basketItems = new ArrayList<>();

        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT COUNT(`basket_index`) AS `count` FROM `compro`.`baskets` WHERE `user_index` = ?")) {
            preparedStatement.setInt(1, userVo.getIndex());

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int totalBasketItemsCount = resultSet.getInt("count");
                    int maxPageNumber = (int) Math.ceil((double) totalBasketItemsCount / ROWS_PER_PAGE_BASKET_ITEM);
                    if (endPage > maxPageNumber) endPage = maxPageNumber;
                }
            }
        }

        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT  `basket`.`basket_index` AS `basketItemIndex`,\n" +
                        "`basket`.`basket_item_color` AS `basketItemColor`,\n" +
                        "`basket`.`basket_item_size` AS `basketItemSize`,\n" +
                        "`basket`.`basket_item_count` AS `basketItemCount`,\n" +
                        "`item`.`item_name` AS `itemName`,\n" +
                        "`item`.`item_index` AS `itemIndex`,\n" +
                        "`item`.`item_code` AS `itemCode`,\n" +
                        "`item`.`item_price` AS `itemPrice`\n" +
                        "FROM `compro`.`baskets` AS `basket`\n" +
                        "INNER JOIN `compro`.`items` AS `item` ON `basket`.`item_index` = `item`.`item_index` \n" +
                        "WHERE `basket`.`user_index` = ? LIMIT ?, ?")) {

            preparedStatement.setInt(1, userVo.getIndex());
            preparedStatement.setInt(2, (pageNumber - 1) * ROWS_PER_PAGE_BASKET_ITEM);
            preparedStatement.setInt(3, ROWS_PER_PAGE_BASKET_ITEM);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    BasketItemVo basketItemVo = new BasketItemVo(
                            resultSet.getString("basketItemIndex"),
                            resultSet.getString("itemIndex"),
                            resultSet.getString("itemName"),
                            resultSet.getString("itemCode"),
                            resultSet.getString("itemPrice"),
                            resultSet.getString("basketItemColor"),
                            resultSet.getString("basketItemSize"),
                            resultSet.getString("basketItemCount"));
                    basketItems.add(basketItemVo);
                }
            }
        }
        return new GetBasketItemVo(startPage, endPage, requestPage, basketItems);
    }

    // 장바구니 리스트 삭제
    public void deleteBasketItem(Connection connection, DeleteBasketItemVo deleteBasketItemVo, UserVo userVo) throws SQLException {
        for (int basketItemIndex : deleteBasketItemVo.getIndexArray()) {
            try (PreparedStatement preparedStatement = connection.prepareStatement(
                    "DELETE FROM `compro`.`baskets` WHERE `basket_index` = ? AND `user_index` = ?")) {
                preparedStatement.setInt(1, basketItemIndex);
                preparedStatement.setInt(2, userVo.getIndex());
                preparedStatement.execute();
            }
        }
    }
}
