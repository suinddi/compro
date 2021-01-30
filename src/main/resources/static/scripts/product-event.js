function attachEvents() {
    // 상품 팝업창
    let productImg = window.document.body.querySelectorAll("#productImg");
    let btnLayerPopupClose = window.document.body.querySelector("#btnLayerPopupClose");
    let dimmPop = window.document.body.querySelector("#quickViewPopupDimmed");
    let quickView = window.document.body.querySelector("#productQuickView");
    let btnCloseCartPopup = window.document.body.querySelector("#btnCloseCartPopup");
    let basketOrShop = window.document.body.querySelector("#basketListPopup");
    let dimmPop01 = window.document.body.querySelector("#layerProductQuickViewPopupDimmed");

    if (productImg !== null) {
        for (let i = 0; i < productImg.length; i++) {
            productImg[i].addEventListener("click", function () {
                dimmPop.classList.remove("hidden");
                quickView.classList.remove("hidden");
                if (!dimmPop.classList.contains("after")) {
                    dimmPop.classList.add("after");
                } else {
                    dimmPop.classList.remove("after");
                }
            });
        }

        btnLayerPopupClose.addEventListener("click", function () {
            dimmPop.classList.remove("after");
            quickView.classList.add("hidden");
            window.location.href = "/product";
        });

        btnCloseCartPopup.addEventListener("click", function () {
            dimmPop01.classList.remove("after");
            basketOrShop.classList.add("hidden");
        });
    }
}

attachEvents();


// 아이템 db 에서 가져오기
if (window.document.body.querySelector("#item-list") !== null) {
    getItems();
}

function getItems(pageNumber) {
    if (typeof (pageNumber) !== "number") {
        pageNumber = 1;
    }

    function callback(response) {
        let itemList = window.document.body.querySelector("#item-list");
        let ulList = window.document.body.querySelector("#ulList");
        ulList.innerHTML = "";

        let jsonItems = JSON.parse(response);
        let startPage = parseInt(jsonItems["startPage"]);
        let endPage = parseInt(jsonItems["endPage"]);
        let requestPage = parseInt(jsonItems["requestPage"]);
        let itemListPages = window.document.body.querySelector("div.center");
        itemListPages.innerHTML = "";

        for (let i = startPage; i <= endPage; i++) {
            let page = window.document.createElement("div");
            page.classList.add("object-page-number-button");
            page.innerText = i;
            if (i == requestPage) {
                page.classList.add("selected");
            } else {
                page.addEventListener("click", function () {
                    getItems(i);
                });
            }
            itemListPages.append(page);
        }

        let dimmPop = window.document.body.querySelector("#quickViewPopupDimmed");
        let quickView = window.document.body.querySelector("#productQuickView");
        for (let i = 0; i < jsonItems["items"].length; i++) {
            let li = window.document.createElement("li");
            let liA = window.document.createElement("a");
            let liInput = window.document.createElement("input");
            let liImg = window.document.createElement("img");
            let liDiv = window.document.createElement("div");
            let liDivBadge = window.document.createElement("img");
            let liName = window.document.createElement("p");
            let liPrice = window.document.createElement("div");
            let liPriceP = window.document.createElement("p");
            let liPriceSpan = window.document.createElement("span");
            let liDetail = window.document.createElement("div");

            liA.classList.add("pro_area");
            liImg.classList.add("img_goods");
            liDiv.classList.add("badge");
            liName.classList.add("trade_name");
            liPrice.classList.add("price");
            liDetail.classList.add("chkBox");

            liInput.setAttribute('type', 'hidden');
            liInput.setAttribute('value', `${jsonItems["items"][i]["itemIndex"]}`);
            liImg.setAttribute('src', `/resource/get-image?image_id=${jsonItems["items"][i]["imageIndex"]}`);
            liDivBadge.setAttribute('src', '/images/new-badge.png');
            liName.innerText = jsonItems["items"][i]["itemName"];
            liPriceP.innerText = jsonItems["items"][i]["itemPrice"];
            liPriceSpan.innerText = ' 원';
            liDetail.innerText = '자세히 보기';

            li.addEventListener("click", function () {
                dimmPop.classList.remove("hidden");
                quickView.classList.remove("hidden");
                if (!dimmPop.classList.contains("after")) {
                    dimmPop.classList.add("after");
                } else {
                    dimmPop.classList.remove("after");
                }

                // 팝업창 고정 정보
                let quickItemImage = window.document.body.querySelector("#item-image");
                let quickItemIndex = window.document.body.querySelector("#item-index");
                let quickItemName = window.document.body.querySelector("#item-name");
                let quickItemCode = window.document.body.querySelector("#item-code");
                let quickItemColor = window.document.body.querySelector("#item-color");
                let quickItemPrice = window.document.body.querySelector("#item-price");

                quickItemImage.setAttribute('src', `/resource/get-image?image_id=${jsonItems["items"][i]["imageIndex"]}`);
                quickItemIndex.setAttribute('value', `${jsonItems["items"][i]["itemIndex"]}`);
                quickItemCode.innerText = jsonItems["items"][i]["itemCode"];
                quickItemName.innerText = jsonItems["items"][i]["itemName"];
                quickItemPrice.innerText = jsonItems["items"][i]["itemPrice"];
                quickItemColor.innerText = jsonItems["items"][i]["itemColor"];
                productColor.setAttribute('value', jsonItems["items"][i]["itemColor"]);

                // 팝업창 숨긴 value
                productName.setAttribute('value', jsonItems["items"][i]["itemName"]);
                productCode.setAttribute('value', jsonItems["items"][i]["itemCode"]);

                // 사이즈 값 disabled
                let quickItemSize = window.document.body.querySelectorAll("#item-size > li > input");
                for (let j = 0; j < quickItemSize.length; j++) {
                    quickItemSize[j].setAttribute('disabled', '');
                    if (jsonItems["items"][i]["itemSize"] === quickItemSize[j].value)
                        quickItemSize[j].removeAttribute('disabled');
                }

                // 사이즈 탭 생성
                for (let j = 0; j < productSize.length; j++) {
                    productSize[j].addEventListener("click", function () {
                        prodOptAdd.querySelector("em").innerText = jsonItems["items"][i]["itemColor"] + '/' + jsonItems["items"][i]["itemSize"];
                        productPrice.innerText = jsonItems["items"][i]["itemPrice"];
                        productSizeFin = productSize[j].value;

                        let btnDelChoiceItem = window.document.body.querySelector("#btnDelChoiceItem");
                        btnDelChoiceItem.onclick = function () {
                            let prodOptAdd = window.document.body.querySelector("#prodOptAdd");
                            if (!prodOptAdd.classList.contains("hidden")) {
                                prodOptAdd.classList.add("hidden");
                                productCount.value = "1";
                                productAddButton.classList.remove("disabled");
                                productSubtractButton.classList.remove("disabled");
                                console.log("dfdf");
                            } else {
                                prodOptAdd.classList.remove("hidden");
                                productPrice.innerText = '0 ';
                            }
                            productSize[j].checked = false;
                        };
                    });
                }

                //장바구니 결과 팝업 창 아이템 정보

            });

            li.append(liA);
            liA.append(liImg);
            liA.append(liInput);
            liA.append(liDiv);
            liA.append(liName);
            liA.append(liPrice);
            liA.append(liDetail);
            liDiv.append(liDivBadge);
            liPrice.append(liPriceP);
            liPriceP.append(liPriceSpan);

            ulList.append(li);
        }

        // 다른 옵션 선택(중복 선택)
        let clickForm = window.document.body.querySelector("#pr-select-form");
        let prodOptAdd = window.document.body.querySelector("#prodOptAdd");

        clickForm.addEventListener("click", function () {
            if (clickForm.elements["pr_color"].value === "" | clickForm.elements["pr_size"].value === "") {
                console.log("색상, 사이즈 선택하세요.");
                prodOptAdd.classList.add("hidden");
            } else {
                prodOptAdd.classList.remove("hidden");
            }
        });

        // 장바구니 아이템 정보
        let basketIndex = window.document.querySelector('input[name="basket_index"]');
        let productName = window.document.querySelector('input[name="pr_name"]');
        let productIndex = window.document.querySelector('input[name="pr_index"]');
        let productCode = window.document.querySelector('input[name="pr_code"]');
        let productColor = window.document.querySelector('input[name="pr_color"]');
        let productSize = window.document.querySelectorAll('input[name="pr_size"]');
        let productSizeFin;
        let productCount = window.document.querySelector('input[name="pr_count"]');
        let productPrice = window.document.querySelector("#prodPrice");

        // 사이즈 수량 증가,감소
        let productAddButton = window.document.querySelector("#btnPlus");
        let productSubtractButton = window.document.querySelector("#btnMinus");

        function calPriceEvents() {
            productAddButton.addEventListener("click", function () {
                let totPrice = window.document.body.querySelector("#item-price").innerText;
                if (!productAddButton.classList.contains("disabled")) {
                    let count = parseInt(productCount.value) + 1;
                    productCount.value = count;
                    productSubtractButton.classList.remove("disabled");
                    productPrice.innerText = totPrice * count;

                    console.log(count + " x " + totPrice);
                    if (count === 5) {
                        productAddButton.classList.add("disabled");
                    }
                }
            });

            productSubtractButton.addEventListener("click", function () {
                let totPrice = window.document.body.querySelector("#item-price").innerText;

                if (!productSubtractButton.classList.contains("disabled")) {
                    let count = parseInt(productCount.value) - 1;
                    productCount.value = count;
                    productAddButton.classList.remove("disabled");
                    productPrice.innerText = totPrice * count
                    if (count === 1)
                        productSubtractButton.classList.add("disabled");
                }
            });
        }

        calPriceEvents();

        //장바구니로 이동
        let goBasket = window.document.body.querySelector("#goBasket");
        let basketOrShop = window.document.body.querySelector("#basketListPopup");
        let dimmPop01 = window.document.body.querySelector("#layerProductQuickViewPopupDimmed");
        goBasket.addEventListener("click", function () {
            if (clickForm.elements[name = "pr_color"].value === "" || clickForm.elements[name = "pr_size"].value === "") {
                alert("사이즈를 선택해 주세요.");
            } else {
                let basketItemName = window.document.body.querySelector("#basket-item-name");
                let basketItemInfo = window.document.body.querySelector("#basket-Info");
                let basketItemAmount = window.document.body.querySelector("#prodAmount");
                basketItemName.innerText = productName.value;

                basketItemInfo.innerText = productColor.value + '/' + productSizeFin + '/' + basketItemAmount.value + '개';
                console.log(basketItemAmount.value);
                function callback(responseText) {
                    if (responseText === "SUCCESS") {
                        // 쇼핑 계속하기
                        if (!dimmPop01.classList.contains("after")) {
                            dimmPop01.classList.add("after");
                            basketOrShop.classList.remove("hidden");
                        } else {
                            dimmPop01.classList.remove("after");
                        }
                    }
                    if (responseText === "denied") {
                        window.location.href = "/login";
                    }
                }

                function fallback() {
                    alert("예상치 못한 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
                }

                let formData = new FormData();
                formData.append("pr_index", productIndex.value);
                formData.append("pr_name", productName.value);
                formData.append("pr_code", productCode.value);
                formData.append("pr_color", productColor.value);
                formData.append("pr_size", productSizeFin);
                formData.append("pr_price", productPrice.innerText);
                formData.append("pr_count", productCount.value);
                xhr("POST", "/apis/go-basket", callback, fallback, formData);
            }
        });
    }

    function fallback(status) {
        alert("예상치 못한 오류가 발생했습니다.");
    }

    let formData = new FormData();
    formData.append("page", pageNumber);
    xhr("POST", "/apis/get-item", callback, fallback, formData);
}

