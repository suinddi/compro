package com.webproject.compro.web.vos;

public class DeleteBasketItemVo {
    private String itemIndex;
    private int[] indexArray;
    private boolean isNormalized;

    public DeleteBasketItemVo(String itemIndex) {
        try {
            this.itemIndex = itemIndex;
            String[] tempArray = this.itemIndex.split(",");
            indexArray = new int[tempArray.length];
            for (int i=0; i < indexArray.length; i++) {
                indexArray[i] = Integer.parseInt(tempArray[i]);
            }
            this.isNormalized = true;
        } catch (NumberFormatException numberFormatException) {
            this.isNormalized = false;
            this.itemIndex = null;
            this.indexArray = null;
        }
    }

    public String getItemIndex() {
        return itemIndex;
    }

    public int[] getIndexArray() {
        return indexArray;
    }

    public boolean isNormalized() {
        return isNormalized;
    }
}

