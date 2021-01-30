function attachEvents() {
    let tabList = window.document.body.querySelectorAll(" div.tab_list > ul > li ");
    let tabContent = window.document.body.querySelector(" div.tab_cont > ul > li ");
    let qnaList = window.document.body.querySelectorAll(" div.qna_list > ul > li ");

    function faqSearchType() {
        for (let i=0; i<tabList.length; i++) {
            tabList[i].addEventListener("click", function() {
                for (let j=0; j<tabList.length; j++) {
                    tabList[j].classList.remove("active");
                }
                if (!tabList[i].classList.contains("active")) {
                     tabList[i].classList.add("active");
                     getFaqs(i + 1);
                }
            });
        }
    }
    faqSearchType();

    let searchForm = window.document.body.querySelector("#search-form");
    if (searchForm != null) {
        searchForm.onsubmit = function() {
            if (searchForm.elements["searchWord"].value === "") {
                alert("검색어를 입력해 주세요.");
                searchForm.elements["searchWord"].focus();
            } else {
                // 검색한 결과 나온다
                for (let i=0; i<tabList.length; i++) {
                    if (tabList[i].classList.contains("active"))
                    getSearchFaqs();
                }
            }
            return false;
        }
    }

    // FAQ
    if (window.document.body.querySelector("div.qna_list") !== null) {
        getFaqs();
    }

    function getFaqs(pageNumber) {
        if (typeof(pageNumber) !== "number") {
            pageNumber = 1;
        }
        function callback(response) {
            let faqTabList = window.document.body.querySelector("div.tab_list");
            let faqTabLists = faqTabList.querySelectorAll("ul > li");
            let faqTabContent = window.document.body.querySelector("div.tab_cont");
            let faqList = faqTabContent.querySelector("div.qna_list");
            let faqListUl = faqList.querySelector("ul");
            faqListUl.innerHTML = "";

            let jsonFaqs = JSON.parse(response);
            let requestPage = parseInt(jsonFaqs["requestPage"]);

            for (let i=0; i < jsonFaqs["faqs"].length; i++) {
                let li = window.document.createElement("li");
                let liRowQ = window.document.createElement("div");
                let liRowQa = window.document.createElement("a");
                let liRowA = window.document.createElement("div");
                let liRowBoard = window.document.createElement("div");
                let liRowBoardP = window.document.createElement("p");

                liRowQ.classList.add("row_q");
                liRowA.classList.add("row_a");
                liRowA.classList.add("hidden");
                liRowBoard.classList.add("board_a");

                liRowQa.innerText = jsonFaqs["faqs"][i]["answerTitle"];
                liRowBoardP.innerText = jsonFaqs["faqs"][i]["answerContent"];

                li.append(liRowQ);
                li.append(liRowA);
                liRowQ.append(liRowQa);
                liRowA.append(liRowBoard);
                liRowBoard.append(liRowBoardP);

                faqListUl.append(li);
            }

            let rowQ = window.document.body.querySelectorAll(" div.row_q ");
            let rowA = window.document.body.querySelectorAll(" div.row_a ");
            for (let i =0; i<rowQ.length; i++) {
                rowQ[i].addEventListener("click", function() {
                    if (!rowA[i].classList.contains("hidden"))
                        rowA[i].classList.add("hidden");
                    else
                        rowA[i].classList.remove("hidden");
                });
            }
        }

        function fallback(status) {
        }

        let formData = new FormData();
        formData.append("page", pageNumber);
        xhr("POST", "/apis/get-faq", callback, fallback, formData);
    }

    //FAQ 검색결과
    if (window.document.body.querySelector("div.qna_list") !== null) {
        getSearchFaqs();
    }

    function getSearchFaqs(pageNumber) {
        if (typeof(pageNumber) !== "number") {
            pageNumber = 1;
        }
        function callback(response) {
            let faqTabList = window.document.body.querySelector("div.tab_list");
            let faqTabLists = faqTabList.querySelectorAll("ul > li");
            let faqTabContent = window.document.body.querySelector("div.tab_cont");
            let faqList = faqTabContent.querySelector("div.qna_list");
            let faqListUl = faqList.querySelector("ul");
            faqListUl.innerHTML = "";

            let jsonFaqs = JSON.parse(response);
            let requestPage = parseInt(jsonFaqs["requestPage"]);

            for (let i=0; i < jsonFaqs["faqs"].length; i++) {
                let li = window.document.createElement("li");
                let liRowQ = window.document.createElement("div");
                let liRowQa = window.document.createElement("a");
                let liRowA = window.document.createElement("div");
                let liRowBoard = window.document.createElement("div");
                let liRowBoardP = window.document.createElement("p");

                liRowQ.classList.add("row_q");
                liRowA.classList.add("row_a");
                liRowA.classList.add("hidden");
                liRowBoard.classList.add("board_a");

                liRowQa.innerText = jsonFaqs["faqs"][i]["answerTitle"];
                liRowBoardP.innerText = jsonFaqs["faqs"][i]["answerContent"];

                li.append(liRowQ);
                li.append(liRowA);
                liRowQ.append(liRowQa);
                liRowA.append(liRowBoard);
                liRowBoard.append(liRowBoardP);

                faqListUl.append(li);
            }

            let rowQ = window.document.body.querySelectorAll(" div.row_q ");
            let rowA = window.document.body.querySelectorAll(" div.row_a ");
            for (let i =0; i<rowQ.length; i++) {
                rowQ[i].addEventListener("click", function() {
                    if (!rowA[i].classList.contains("hidden"))
                        rowA[i].classList.add("hidden");
                    else
                        rowA[i].classList.remove("hidden");
                });
            }
        }

        function fallback(status) {
        }

        let formData = new FormData();
        formData.append("searchWord", searchWord.value);
        formData.append("page", pageNumber);
        xhr("POST", "/apis/search", callback, fallback, formData);
    }

}
attachEvents();




















