function getQnas(pageNumber) {
    if (typeof(pageNumber) !== "number") pageNumber = 1;

    function callback(response) {
        let qnaList = window.document.body.querySelector("#qna_list2");
        let ulList = window.document.body.querySelector("#ulList");
        ulList.innerHTML = "";

        let jsonQnas = JSON.parse(response);
        let startPage = parseInt(jsonQnas["startPage"]);
        let endPage = parseInt(jsonQnas["endPage"]);
        let requestPage = parseInt(jsonQnas["requestPage"]);
        let qnaListPages = window.document.body.querySelector("div.center");
        qnaListPages.innerHTML = "";

        for (let i = startPage; i<= endPage; i++) {
            let page = window.document.createElement("div");
            page.classList.add("object-page-number-button");
            page.innerText = i;
            if (i == requestPage) {
                page.classList.add("selected");
            } else {
                page.addEventListener("click", function() {
                    getQnas(i);
                });
            }
            qnaListPages.append(page);
        }

        for (let i =0; i<jsonQnas["qnas"].length; i++) {
            let li = window.document.createElement("li");
            let rowQ =  window.document.createElement("div");
            let rowTh =  window.document.createElement("div");
            let Col1 =  window.document.createElement("div");
            let Col1Em =  window.document.createElement("em");
            let Col2 =  window.document.createElement("div");
            let Col3 =  window.document.createElement("div");
            let Col3Strong =  window.document.createElement("strong");
            let Board =  window.document.createElement("div");
            let BoardP =  window.document.createElement("p");
            let BoardDiv =  window.document.createElement("div");

            rowQ.classList.add("row_q");
            rowTh.classList.add("row_th");
            Col1.classList.add("col_path");
            Col2.classList.add("col_date");
            Col3.classList.add("col_state");
            Col3Strong.classList.add("point_r");
            Board.classList.add("board_q");
            BoardP.classList.add("tit");
            BoardDiv.classList.add("txt");

            Col1Em.innerText = jsonQnas["qnas"][i]["qnaKinds"];
            Col3Strong.innerText = '접수';
            BoardP.innerText = jsonQnas["qnas"][i]["qnaTitle"];
            BoardDiv.innerText = jsonQnas["qnas"][i]["qnaContent"];

            li.append(rowQ);
            rowQ.append(rowTh);
            rowQ.append(Board);
            rowTh.append(Col1);
            rowTh.append(Col2);
            rowTh.append(Col3);
            Col1.append(Col1Em);
            Col3.append(Col3Strong);
            Board.append(BoardP);
            Board.append(BoardDiv);

            ulList.append(li);
        }
    }

    function fallback(status) {}

    let formData = new FormData();
    formData.append("page", pageNumber);
    xhr("POST", "/user/get-qna", callback, fallback, formData);
}


function attachEvents() {
    let qnaInsert = window.document.body.querySelector("#insertQna");
        if (qnaInsert !== null) {
            qnaInsert.addEventListener("click", function() {
            let registerQnaKind = window.document.body.querySelector("#register-kind");
            let registerQnaTitle = window.document.body.querySelector("#register-title");
            let registerPurchaseIndex = window.document.body.querySelector("#register-purchase-index");
            let registerQnaContent= window.document.body.querySelector("#register-content");

            if (registerQnaKind.value === "") {
                    alert("분류를 선택해주세요.");
                    registerQnaKind.focus();
                    return false;
            } else if (registerQnaTitle.value === "") {
                    alert("제목을 입력해주세요.");
                    registerQnaTitle.focus();
                    return false;
            } else if (registerPurchaseIndex.value === "") {
                    alert("주문번호를 입력해주세요.");
                    registerPurchaseIndex.focus();
                    return false;
            } else if (registerQnaContent.value === "") {
                    alert("내용을 입력해주세요.");
                    registerQnaContent.focus();
                    return false;
            } else {
                function callback(response) {

                    if (response === "FAILURE") {
                        alert("알 수 없는 이유로 문의글을 작성하지 못했습니다.");
                    } else if (response === "SUCCESS") {
                        alert("문의글을 작성하였습니다.");
                        getQnas();
                        window.location.href="/qna";
                    }
                }

                function fallback() {
                    alert("작성 도중 예상치 못한 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
                }

                let formData = new FormData();
                formData.append("qna_kind", registerQnaKind.value);
                formData.append("qna_title", registerQnaTitle.value);
                formData.append("qna_purIndex", registerPurchaseIndex.value);
                formData.append("qna_content", registerQnaContent.value);
                xhr("POST", "/user/qna-register", callback, fallback, formData);
            }
        });
    }

    let btnQnaWrite = window.document.querySelector("#btnQnaWrite");
    let btnLayerPopupClose = window.document.body.querySelector("#btnLayerPopupClose");
    let dimmPop = window.document.body.querySelector("#layerPopupDimmed01");
    let quickView = window.document.body.querySelector("#qnaWriteForm");
    let cancelQna = window.document.body.querySelector("#cancelQna");
    if (btnQnaWrite != null) {
        btnQnaWrite.addEventListener("click", function() {

            dimmPop.classList.remove("hidden");
            quickView.classList.remove("hidden");
            if (!dimmPop.classList.contains("after")) {
                dimmPop.classList.add("after");
            } else {
                dimmPop.classList.remove("after");
            }
        });

        btnLayerPopupClose.addEventListener("click", function() {

            dimmPop.classList.remove("after");
            quickView.classList.add("hidden");
        });

        cancelQna.addEventListener("click", function() {
            if (confirm(`글 작성을 취소하시겠습니까?`)) {
                dimmPop.classList.remove("after");
                quickView.classList.add("hidden");
            }
        });
    }
}
attachEvents();

getQnas(1);