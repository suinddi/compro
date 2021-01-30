package com.webproject.compro.web.vos;

public class ItemVo {
    private final int imageIndex;
    private final int itemIndex;
    private final String itemCode;
    private final String itemName;
    private final String itemColor;
    private final String itemSize;
    private final int itemPrice;

    public ItemVo(String itemIndex, String itemCode, String itemName, String itemColor, String itemSize, String itemPrice, int imageIndex) {
        int itemIndexNum;
        int itemPriceNum;
        try {
            itemIndexNum = Integer.parseInt(itemIndex);
            itemPriceNum = Integer.parseInt(itemPrice);
        } catch (NumberFormatException ignored) {
            itemIndexNum = 1;
            itemPriceNum = 1;
        }
        this.imageIndex = imageIndex;
        this.itemIndex = itemIndexNum;
        this.itemCode = itemCode;
        this.itemName = itemName;
        this.itemColor = itemColor;
        this.itemSize = itemSize;
        this.itemPrice = itemPriceNum;
    }

    public int getItemIndex() { return itemIndex; }

    public String getItemCode() {
        return itemCode;
    }

    public String getItemName() {
        return itemName;
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

    public int getImageIndex() {
        return imageIndex;
    }
}
