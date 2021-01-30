package com.webproject.compro.web.daos;

import com.webproject.compro.web.vos.UploadItemVo;
import org.springframework.stereotype.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Repository
public class ResourceDao {
    public String selectImage(Connection connection, int index) throws SQLException {
        String imageData = null;
        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "SELECT `image_data` AS `imageData` FROM `compro`.`item_images` WHERE `image_index` = ? ")) {
            preparedStatement.setInt(1, index);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while(resultSet.next()) {
                    imageData = resultSet.getString("imageData");
                }
            }
        }
        return imageData;
    }

    public void insertImage(Connection connection, String itemImage, int itemIndex, UploadItemVo uploadItemVo) throws SQLException {
        try (PreparedStatement preparedStatement = connection.prepareStatement(
                "INSERT INTO `compro`.`item_images`(image_name, image_data, item_index) VALUES (?,?,?)")) {
            preparedStatement.setString(1, uploadItemVo.getItemName());
            preparedStatement.setString(2, itemImage);
            preparedStatement.setInt(3, itemIndex);
            preparedStatement.execute();
        }
    }
}
