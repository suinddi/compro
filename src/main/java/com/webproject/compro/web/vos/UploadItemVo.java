package com.webproject.compro.web.vos;

import org.springframework.web.multipart.MultipartFile;

public class UploadItemVo {
    private final String itemName;
    private final String itemCode;
    private final String itemColor;
    private final String itemSize;
    private final int itemPrice;
    private final MultipartFile itemImage;

    public UploadItemVo(String itemName, String itemCode, String itemColor, String itemSize, String itemPrice, MultipartFile itemImage) {
        this.itemImage = itemImage;

        int itemPriceNum;
        try {
            itemPriceNum = Integer.parseInt(itemPrice);
        } catch (NumberFormatException ignored) {
            itemPriceNum = 0;
        }
        this.itemName = itemName;
        this.itemCode = itemCode;
        this.itemColor = itemColor;
        this.itemSize = itemSize;
        this.itemPrice = itemPriceNum;
    }

    public MultipartFile getItemImage() {
        return itemImage;
    }

    public String getItemName() {
        return itemName;
    }

    public String getItemCode() {
        return itemCode;
    }

    public String getItemColor() {
        return itemColor;
    }

    public String getItemSize() {
        return itemSize;
    }

    public int getItemPrice() {
        return itemPrice;
    }
}
