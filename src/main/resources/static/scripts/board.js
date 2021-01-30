// 게시판
if (window.document.body.querySelector("#article-list") !== null) {
    getArticles();
}

let editor = null;

function getArticles(pageNumber) {
   if (typeof(pageNumber) !== "number") {
       pageNumber = 1;
   }
   function callback(response) {
       let articleList = window.document.body.querySelector("#article-list");
       let articleListTable = articleList.querySelector("table.table");
       let articleListTableBody = articleListTable.querySelector("tbody");
       articleListTableBody.innerHTML = "";

       let jsonArticles = JSON.parse(response);
       let startPage = parseInt(jsonArticles["startPage"]);
       let endPage = parseInt(jsonArticles["endPage"]);
       let requestPage = parseInt(jsonArticles["requestPage"]);
       let articleListPages = articleList.querySelector("div.center");
       articleListPages.innerHTML = "";
       for(let i = startPage; i <= endPage; i++) {
            let page = window.document.createElement("div");
            page.classList.add("object-page-number-button");
            page.innerText = i;
            if (i == requestPage) {
                page.classList.add("selected");
            } else {
                page.addEventListener("click", function() {
                    getArticles(i);
                });
            }
            articleListPages.append(page);
       }

       let dimmPop = window.document.body.querySelector("#layerPopupDimmed02");
       let quickView = window.document.body.querySelector("#articlePopupLayer");
       let btnLayerPopupClose = window.document.body.querySelector("#btnLayerPopupClose");
       for (let i=0; i < jsonArticles["articles"].length; i++) {
            let tr = window.document.createElement("tr");
            let tdIndex = window.document.createElement("td");
            let tdTitle = window.document.createElement("td");
            let tdArticleName= window.document.createElement("td");
            let tdContent= window.document.createElement("td");
            let tdWrittenAt = window.document.createElement("td");
            let tdHit = window.document.createElement("td");

            tdIndex.innerText = jsonArticles["articles"][i]["index"];
            tdTitle.innerText = jsonArticles["articles"][i]["title"];
            tdArticleName.innerText = jsonArticles["articles"][i]["articleName"];
            tdWrittenAt.innerText = jsonArticles["articles"][i]["writtenAt"];
            tdHit.innerText = jsonArticles["articles"][i]["hit"];

            tdTitle.addEventListener("click", function() {
               dimmPop.classList.remove("hidden");
               quickView.classList.remove("hidden");
               if (!dimmPop.classList.contains("after")) {
                   dimmPop.classList.add("after");
               }

               let popupArticleCont = window.document.body.querySelector("#article-content");
               popupArticleCont.innerHTML = jsonArticles["articles"][i]["content"];
            });

            btnLayerPopupClose.addEventListener("click", function() {
               dimmPop.classList.remove("after");
               quickView.classList.add("hidden");
            });

            tdIndex.style.display = 'none';
            tdTitle.classList.add("title");
            tdContent.classList.add("content");

            tr.append(tdTitle);
            tr.append(tdArticleName);
            tr.append(tdWrittenAt);
            tr.append(tdHit);
            tr.append(tdContent);

            articleListTableBody.append(tr);
       }
   }

   function fallback(status) {
   }

   let formData = new FormData();
   formData.append("page", pageNumber);
   xhr("POST", "/apis/get-article", callback, fallback, formData);
}

function boardAttachEvents() {
   let dimmPop = window.document.body.querySelector("#layerPopupDimmed02");
   let writeView = window.document.body.querySelector("#uploadView");
   let btnLayerPopupClose = window.document.body.querySelector("#btnLayerPopupClose");
   let btnWriteClose = window.document.body.querySelector("#btnUploadPopupClose");

   let writeBtn = window.document.body.querySelector("#btnUpload");
   writeBtn.addEventListener("click", function() {
       dimmPop.classList.remove("hidden");
       writeView.classList.remove("hidden");
       if (!dimmPop.classList.contains("after")) {
           dimmPop.classList.add("after");
       }
   });

   btnWriteClose.addEventListener("click", function() {
       dimmPop.classList.remove("after");
       writeView.classList.add("hidden");
       window.location.href="/board";
   });

   let writeForm = window.document.body.querySelector("#write-form");
   ClassicEditor.create(writeForm.querySelector("textarea"))
       .then( newEditor => {
              editor = newEditor;
       });

   let insertArticle = window.document.body.querySelector("#insertArticle");
   insertArticle.addEventListener("click", function() {
        if (writeForm.elements["article_title"].value === "") {
            alert("게시글 제목을 입력해주세요.");
            writeForm.elements["article_title"].focus();
        } else if (writeForm.elements["article_kind"].value === "") {
            alert("게시글 분류를 선택해주세요.");
            writeForm.elements["article_kind"].focus();
        } else if (editor.getData() === "") {
            alert("게시글 내용을 입력해주세요.");
            writeForm.elements["article_content"].focus();
        } else {
           function callback(responseText) {
               if (responseText === "IMAGE_NOT_ALLOWED") {
                   alert ("jpg 또는 png 형식의 이미지 파일을 등록해주세요.");
               } else if (responseText === "FAILURE") {
                   alert ("올바른 형식의 내용을 기입해주세요.");
               } else if (responseText === "SUCCESS") {
                   alert ("새 게시글이 등록되었습니다.");
                   getArticles();
                   window.location.href="/board";
               }
           }
           function fallback() {
               alert("예상치 못한 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
           }

           let formData = new FormData();
           formData.append("article_title", writeForm.elements["article_title"].value);
           formData.append("article_kind", writeForm.elements["article_kind"].value);
           formData.append("article_content", editor.getData());
           xhr("POST", "/apis/write-article", callback, fallback, formData);
       }
   });

   let cancelArticle = window.document.body.querySelector("#cancelArticle");
    cancelArticle.addEventListener("click", function() {
       if (confirm(`글 작성을 취소하시겠습니까?`)) {
           dimmPop.classList.remove("after");
           writeView.classList.add("hidden");
       }
   });


}
boardAttachEvents();