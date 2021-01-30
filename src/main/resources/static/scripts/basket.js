if (window.document.body.querySelector("#basket-list") !== null) {
    getBasketItems();
}

function getBasketItems(pageNumber) {
    if (typeof (pageNumber) !== "number") {
        pageNumber = 1;
    }

    function callback(response) {
        let basketItemList = window.document.body.querySelector("#basket-list");
        let basketItemTable = basketItemList.querySelector("table.tbl_basket");
        let basketItemTableBody = basketItemTable.querySelector("tbody");
        basketItemTableBody.innerHTML = "";

        let jsonBasketItems = JSON.parse(response);
        let startPage = parseInt(jsonBasketItems["startPage"]);
        let endPage = parseInt(jsonBasketItems["endPage"]);
        let requestPage = parseInt(jsonBasketItems["requestPage"]);
        let basketItemListPages = basketItemList.querySelector("div.center");
        basketItemListPages.innerHTML = "";

        for (let i = startPage; i <= endPage; i++) {
            let page = window.document.createElement("div");
            page.classList.add("object-page-number-button");
            page.innerText = i;
            if (i == requestPage) {
                page.classList.add("selected");
            } else {
                page.addEventListener("click", function () {
                    getBasketItems(i);
                });
            }
            basketItemListPages.append(page);
        }

        for (let i = 0; i < jsonBasketItems["basketItems"].length; i++) {
            let tr = window.document.createElement("tr");
            let tdChkBox = window.document.createElement("td");
            let tdItemIndex = window.document.createElement("td");
            let tdItemInfo = window.document.createElement("td");
            let tdCount = window.document.createElement("td");
            let tdPrice = window.document.createElement("td");
            let tdControl = window.document.createElement("td");

            let emChk = window.document.createElement("em");
            let emLabel = window.document.createElement("label");
            let emInput = window.document.createElement("input");
            let emSpan = window.document.createElement("span");

            let tdItemImg = window.document.createElement("div");
            let tdItemImgI = window.document.createElement("img");
            let tdItemPr = window.document.createElement("div");
            let tdItemPrName = window.document.createElement("a");
            let tdItemPrOpt = window.document.createElement("p");

            let tdCountBox = window.document.createElement("span");
            let tdCountBoxSelect = window.document.createElement("select");
            let tdCountBoxSelectOpt1 = window.document.createElement("option");
            let tdCountBoxSelectOpt2 = window.document.createElement("option");
            let tdCountBoxSelectOpt3 = window.document.createElement("option");
            let tdCountBoxSelectOpt4 = window.document.createElement("option");
            let tdCountBoxSelectOpt5 = window.document.createElement("option");
            let tdCountChange = window.document.createElement("a");

            let tdPriceText = window.document.createElement("strong");
            let tdControlOrder = window.document.createElement("a");
            let tdControlDel = window.document.createElement("a");

            // css
            tdChkBox.classList.add("chkbox");
            tdPrice.classList.add("price");
            tdControl.classList.add("control");

            emChk.classList.add("chk");
            emInput.classList.add("ip_chekbox");
            emSpan.classList.add("select");

            tdItemIndex.classList.add("index");
            tdItemImg.classList.add("img");
            tdItemPr.classList.add("pr");
            tdItemPrName.classList.add("p_name");
            tdItemPrOpt.classList.add("p_opt");

            tdCountBox.classList.add("select_box");
            tdCountBox.classList.add("small");
            tdCountChange.classList.add("btn_line");

            tdControlOrder.classList.add("btn_ty_rface");
            tdControlOrder.classList.add("xs");
            tdControlDel.classList.add("btn_ty_bline");
            tdControlDel.classList.add("xs");
            tdControlDel.classList.add("each_delete");

            emInput.setAttribute('type', 'checkbox');
            emInput.setAttribute('checked', 'true');

            tdItemIndex.style.display = 'none';
            tdCountBoxSelectOpt1.setAttribute('value', '1');
            tdCountBoxSelectOpt2.setAttribute('value', '2');
            tdCountBoxSelectOpt3.setAttribute('value', '3');
            tdCountBoxSelectOpt4.setAttribute('value', '4');
            tdCountBoxSelectOpt5.setAttribute('value', '5');
            tdCountBoxSelectOpt1.innerText = '1';
            tdCountBoxSelectOpt2.innerText = '2';
            tdCountBoxSelectOpt3.innerText = '3';
            tdCountBoxSelectOpt4.innerText = '4';
            tdCountBoxSelectOpt5.innerText = '5';

            tdCountChange.innerText = '변경';
            tdControlOrder.innerText = '주문하기';
            tdControlDel.innerText = '삭제하기';

            tdItemIndex.innerText = jsonBasketItems["basketItems"][i]["basketItemIndex"];
            tdItemInfo.innerText = jsonBasketItems["basketItems"][i]["basketItemName"] + '/' + jsonBasketItems["basketItems"][i]["basketItemColor"] + '/' + jsonBasketItems["basketItems"][i]["basketItemSize"];
            tdPrice.innerText = jsonBasketItems["basketItems"][i]["basketItemPrice"];

            tr.append(tdChkBox);
            tr.append(tdItemIndex);
            tr.append(tdItemInfo);
            tr.append(tdCount);
            tr.append(tdPrice);
            tr.append(tdControl);

            tdChkBox.append(emChk);
            emChk.append(emLabel);
            emLabel.append(emInput);
            emLabel.append(emSpan);

            tdItemImg.append(tdItemImgI);
            tdItemPr.append(tdItemPrName);
            tdItemPr.append(tdItemPrOpt);

            tdCount.append(tdCountBox);
            tdCountBox.append(tdCountBoxSelect);
            tdCountBoxSelect.append(tdCountBoxSelectOpt1);
            tdCountBoxSelect.append(tdCountBoxSelectOpt2);
            tdCountBoxSelect.append(tdCountBoxSelectOpt3);
            tdCountBoxSelect.append(tdCountBoxSelectOpt4);
            tdCountBoxSelect.append(tdCountBoxSelectOpt5);
            tdCount.append(tdCountChange);

            tdPrice.append(tdPriceText);
            tdControl.append(tdControlOrder);
            tdControl.append(tdControlDel);

            tdCountBoxSelect.selectedIndex = parseInt(jsonBasketItems["basketItems"][i]["basketItemCount"]) - 1;
            tdPrice.innerText *= (parseInt(jsonBasketItems["basketItems"][i]["basketItemCount"]));

            basketItemTableBody.append(tr);

            function attachEvent() {
                let totalCount = window.document.body.querySelector("p.count > strong");
                let choiceCount = window.document.body.querySelector("#choiceCount");
                let price = window.document.body.querySelectorAll("td.price");
                let totalPriceEl = window.document.body.querySelector("#totalPrice");
                let totalPrice = 0;
                let rows = basketItemTableBody.querySelectorAll("tr");
                let orderPrice = window.document.body.querySelector("#orderPrice");
                let dlvyPrice = window.document.body.querySelector("#dlvyPrice");
                choiceCount.innerText = (parseInt(rows.length));
                totalCount.innerText = (parseInt(rows.length));

                for (let i = 0; i < price.length; i++) {
                    totalPrice += parseInt(price[i].innerText);
                }
                // .toLocaleString() 사용하여 숫자 사이 콤마 추가
                dlvyPrice.innerText = 2500;
                orderPrice.innerText = totalPrice;
                totalPriceEl.innerText = (parseInt)(orderPrice.innerText) + (parseInt)(dlvyPrice.innerText);
            }

            attachEvent();

            tdControlDel.addEventListener("click", function () {
                if (confirm(`상품을 장바구니에서 삭제하시겠습니까 ?`)) {
                    function callback(response) {
                        if (response === "SUCCESS") window.location.reload();
                        else fallback();
                    }

                    function fallback(status) {
                        alert("알 수 없는 이유로 삭제에 실패하였습니다. 다시 시도해주세요.");
                    }

                    let formData = new FormData();
                    formData.append("basketItemIndex", jsonBasketItems["basketItems"][i]["basketItemIndex"]);
                    xhr("POST", "/apis/delete-basket-item", callback, fallback, formData);
                }
            });
        }
        let label = window.document.body.querySelectorAll("label");
        let checkInput = window.document.body.querySelectorAll("input.ip_chekbox");
        checkInput[0].addEventListener("change", function () {
            if (label.length > 1) {
                for (let i = 1; i < label.length; i++) {
                    checkInput[i].checked = checkInput[0].checked;
                }
            }
        });

        let deleteButton = window.document.body.querySelector("#deleteCartBtn");
        let rows = basketItemTableBody.querySelectorAll("tr");
        deleteButton.addEventListener("click", function () {
            let selectedCount = rows.length;
            let toDelete = "";

            for (let i = 0; i < rows.length; i++) {
                // check 된 rows 의 개수만큼 삭제
                if (rows[i].querySelector("input.ip_chekbox").checked) {
                    selectedCount += 1;
                    toDelete += `${rows[i].querySelector("td.index").innerText},`;
                }
            }
            if (selectedCount === 0) {
                alert("삭제할 품목을 선택해 주세요.");
            } else {
                toDelete = toDelete.substring(0, toDelete.length - 1);

                function callback(response) {
                    if (response == "SUCCESS") window.location.href = "/mybasket";
                    else fallback();
                }

                function fallback(status) {
                    alert("삭제 실패");
                }

                let formData = new FormData();
                formData.append("basketItemIndex", toDelete);
                xhr("POST", "/apis/delete-basket-item", callback, fallback, formData);
            }
        });
    }

    function fallback(status) {
    }

    let formData = new FormData();
    formData.append("page", pageNumber);
    xhr("POST", "/apis/get-basket-item", callback, fallback, formData);
}



















