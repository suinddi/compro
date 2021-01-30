package com.webproject.compro.web.services;

import com.webproject.compro.web.daos.ApiDao;
import com.webproject.compro.web.daos.ResourceDao;
import com.webproject.compro.web.vos.UploadItemVo;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import javax.xml.bind.DatatypeConverter;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

@Service
public class ResourceService {
    private final DataSource dataSource;
    private final ResourceDao resourceDao;
    private final ApiDao apiDao;

    @Autowired
    public ResourceService(DataSource dataSource, ResourceDao resourceDao, ApiDao apiDao) {
        this.dataSource = dataSource;
        this.resourceDao = resourceDao;
        this.apiDao = apiDao;
    }

    public byte[] getImage(int id) throws IOException, SQLException {
        try (Connection connection = this.dataSource.getConnection()) {
            String imageData = this.resourceDao.selectImage(connection, id);
            imageData = imageData.split(",")[1];
            byte[] imageDataBytes = Base64.decodeBase64(imageData);
            BufferedImage image = ImageIO.read(new ByteArrayInputStream(imageDataBytes));
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            ImageIO.write(image, "jpg", byteArrayOutputStream);
            return byteArrayOutputStream.toByteArray();
        }
    }

    public int uploadImage(String imageData) throws
            SQLException {
        try (Connection connection = this.dataSource.getConnection()) {
            this.apiDao.insertImage(connection, imageData);
            return this.apiDao.selectLastIndex(connection);
        }
    }

    public byte[] downloadImage(int id) throws
            SQLException, IOException {
        try (Connection connection = this.dataSource.getConnection()) {
            String imageData = this.apiDao.selectImage(connection, id).split(",")[1];
            byte[] imageBytes = DatatypeConverter.parseBase64Binary(imageData);
            BufferedImage image = ImageIO.read(new ByteArrayInputStream(imageBytes));
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            ImageIO.write(image, "png", byteArrayOutputStream);
            return byteArrayOutputStream.toByteArray();
        }
    }
}
