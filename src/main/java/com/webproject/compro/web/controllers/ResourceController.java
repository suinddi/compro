package com.webproject.compro.web.controllers;

import com.webproject.compro.utility.Converter;
import com.webproject.compro.web.services.ResourceService;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@Controller
@RequestMapping(value = "/resource")
public class ResourceController {
    private final ResourceService resourceService;

    @Autowired
    public ResourceController(ResourceService resourceService) {
        this.resourceService = resourceService;
    }

    @ResponseBody
    @RequestMapping(value = "get-image", method = RequestMethod.GET, produces = MediaType.IMAGE_PNG_VALUE)
    public byte[] getImage(HttpServletRequest request, HttpServletResponse response,
                           @RequestParam(name = "image_id", defaultValue = "") String imageIdTextString) throws SQLException, IOException {
        int imageIndex = Converter.stringToInt(imageIdTextString, 0);
        return this.resourceService.getImage(imageIndex);
    }

    @RequestMapping(
            value = "upload-image",
            method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public String uploadImage(HttpServletRequest request, HttpServletResponse response,
                            @RequestParam(name = "upload") MultipartFile image,
                            @RequestParam(name = "ckCsrfToken", defaultValue = "") String token) throws SQLException, IOException {
        String imageData = Converter.imageToString(image);
        int index = this.resourceService.uploadImage(imageData);

        JSONObject jsonResponse = new JSONObject();
        if (index > 0) {
            jsonResponse.put("uploaded", true);
            jsonResponse.put("url", String.format("/resource/download-image?id=%d", index));
        } else {
            jsonResponse.put("uploaded", false);
        }
        return jsonResponse.toString(4);
    }

    @RequestMapping(
            value = "download-image",
            method = RequestMethod.GET,
            produces = MediaType.IMAGE_PNG_VALUE)
    @ResponseBody
    public byte[] downloadImage(HttpServletRequest request, HttpServletResponse response,
                                @RequestParam(name = "id", defaultValue = "") String idText) throws SQLException, IOException {
        int index = Converter.stringToInt(idText, -1);
        if (index > 0) {
            return this.resourceService.downloadImage(index);
        } else {
            return null;
        }
    }
}