package com.webproject.compro.web.services;

import com.webproject.compro.utility.Converter;
import com.webproject.compro.web.daos.ApiDao;
import com.webproject.compro.web.daos.ResourceDao;
import com.webproject.compro.web.daos.UserDao;
import com.webproject.compro.web.enums.GetItemResult;
import com.webproject.compro.web.vos.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

@Service
public class ApiService {
    private final ResourceDao resourceDao;
    private final DataSource dataSource;
    private final ApiDao apiDao;

    @Autowired
    public ApiService(ResourceDao resourceDao, DataSource dataSource, ApiDao apiDao) {
        this.resourceDao = resourceDao;
        this.dataSource = dataSource;
        this.apiDao = apiDao;
    }

    public GetItemVo getItem(int pageNumber) throws SQLException {
        try (Connection connection = this.dataSource.getConnection()) {
            return this.apiDao.selectItems(connection, pageNumber);
        }
    }

    public void uploadItem(UploadItemVo uploadItemVo) throws SQLException, IOException {
        try (Connection connection = this.dataSource.getConnection()) {
            this.apiDao.uploadItems(connection, uploadItemVo);
            int index = this.apiDao.selectLastIndex(connection);
            String image = Converter.imageToString(uploadItemVo.getItemImage());
            this.resourceDao.insertImage(connection, image, index, uploadItemVo);
        }
    }

    public GetArticleVo getArticle(int pageNumber) throws SQLException {
        try (Connection connection = this.dataSource.getConnection()) {
            return this.apiDao.selectArticles(connection, pageNumber);
        }
    }

    public void writeArticle(WriteArticleVo writeArticleVo) throws SQLException {
        try (Connection connection = this.dataSource.getConnection()) {
            this.apiDao.writeArticle(connection, writeArticleVo);
        }
    }

    public GetFaqVo getFaq(int pageNumber) throws SQLException {
        try (Connection connection = this.dataSource.getConnection()) {
            return this.apiDao.selectFaqs(connection, pageNumber);
        }
    }

    // 검색 결과
    public ArrayList<FaqVo> search(SearchVo searchVo) throws SQLException {
        try (Connection connection = this.dataSource.getConnection()) {
            return this.apiDao.selectFaqs(connection, searchVo);
        }
    }

    // 장바구니에 아이템을 담음
    public GetItemResult getBasketItem(BasketItemVo basketItemVo, UserVo userVo) throws SQLException {
        try (Connection connection = this.dataSource.getConnection()) {
            boolean success = this.apiDao.insertItems(connection, userVo, basketItemVo);
            return success ?
                GetItemResult.SUCCESS :
                GetItemResult.FAILURE;
        }
    }

    // 장바구니에 아이템 리스트를 가져옴
    public GetBasketItemVo getBasketItemList(int pageNumber, UserVo userVo) throws SQLException {
        try (Connection connection = this.dataSource.getConnection()) {
            return this.apiDao.selectBasketItems(connection, pageNumber, userVo);
        }
    }

    // 장바구니 아이템 삭제
    public void deleteBasketItem(DeleteBasketItemVo deleteBasketItemVo, UserVo userVo) throws SQLException {
        try (Connection connection = this.dataSource.getConnection()) {
            this.apiDao.deleteBasketItem(connection, deleteBasketItemVo, userVo);
        }
    }

}
