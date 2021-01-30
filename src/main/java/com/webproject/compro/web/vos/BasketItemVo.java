package com.webproject.compro.web.vos;

public class BasketItemVo {
    private final int basketIndex;
    private final int itemIndex;
    private final String itemName;
    private final String itemCode;
    private final int itemPrice;
    private final String basketItemColor;
    private final String basketItemSize;
    private final int basketItemCount;

    public BasketItemVo(String itemIndex, String itemName, String itemCode, String itemPrice, String basketItemColor, String basketItemSize, String basketItemCount) {

        int itemIndexNum;
        int itemPriceNum;
        int basketItemCountNum;
        try {
            itemIndexNum = Integer.parseInt(itemIndex);
            itemPriceNum = Integer.parseInt(itemPrice);
            basketItemCountNum = Integer.parseInt(basketItemCount);
        } catch (NumberFormatException ignored) {
            itemIndexNum = 1;
            itemPriceNum = 0;
            basketItemCountNum = 0;
        }
        this.basketIndex = 0;
        this.itemIndex = itemIndexNum;
        this.itemName = itemName;
        this.itemCode = itemCode;
        this.itemPrice = itemPriceNum;
        this.basketItemColor = basketItemColor;
        this.basketItemSize = basketItemSize;
        this.basketItemCount = basketItemCountNum;
    }

    public BasketItemVo(String basketIndex, String itemIndex, String itemName, String itemCode, String itemPrice, String basketItemColor, String basketItemSize, String basketItemCount) {

        int basketIndexNum;
        int itemIndexNum;
        int itemPriceNum;
        int basketItemCountNum;

        try {
            basketIndexNum = Integer.parseInt(basketIndex);
            itemIndexNum = Integer.parseInt(itemIndex);
            itemPriceNum = Integer.parseInt(itemPrice);
            basketItemCountNum = Integer.parseInt(basketItemCount);
        } catch (NumberFormatException ignored) {
            basketIndexNum = 1;
            itemIndexNum = 1;
            itemPriceNum = 0;
            basketItemCountNum = 0;

        }
        this.basketIndex = basketIndexNum;
        this.itemIndex = itemIndexNum;
        this.itemName = itemName;
        this.itemCode = itemCode;
        this.itemPrice = itemPriceNum;
        this.basketItemColor = basketItemColor;
        this.basketItemSize = basketItemSize;
        this.basketItemCount = basketItemCountNum;

    }

    public int getBasketIndex() {
        return basketIndex;
    }

    public String getBasketItemColor() {
        return basketItemColor;
    }

    public String getBasketItemSize() {
        return basketItemSize;
    }

    public int getBasketItemCount() {
        return basketItemCount;
    }

    public int getItemIndex() {
        return itemIndex;
    }

    public String getItemCode() {
        return itemCode;
    }

    public int getItemPrice() {
        return itemPrice;
    }

    public String getItemName() {
        return itemName;
    }
}
