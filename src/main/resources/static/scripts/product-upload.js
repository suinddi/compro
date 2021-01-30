function attachEvents() {
    let itemUpload = window.document.body.querySelector("#btnUpload");
    let btnClose = window.document.body.querySelector("#btnUploadPopupClose");
    let dimmPop = window.document.body.querySelector("#uploadPopupDimmed");
    let quickView = window.document.body.querySelector("#uploadView");

    itemUpload.addEventListener("click", function() {
        dimmPop.classList.remove("hidden");
        quickView.classList.remove("hidden");
        if (!dimmPop.classList.contains("after")) {
            dimmPop.classList.add("after");
        } else {
            dimmPop.classList.remove("after");
        }
    });
    btnClose.addEventListener("click", function() {
        dimmPop.classList.remove("after");
        quickView.classList.add("hidden");
    });

    // 이미지 업로드
    let uploadImage = window.document.body.querySelector("#up_image");
    let searchFile = window.document.body.querySelector("#srch_file");
    uploadImage.onchange = function() {
        let rmFront = uploadImage.value.split('\\');
        searchFile.value = rmFront[rmFront.length-1];
    }

    let upload = window.document.body.querySelector("#UploadItemBtn");
    upload.addEventListener("click", function() {
        let uploadForm = window.document.body.querySelector("#upload-form");
        let upFile = uploadForm.elements["up_file"];
        let upName = uploadForm.elements["up_name"];
        let upCode = uploadForm.elements["up_code"];
        let upColor = uploadForm.elements["up_color"];
        let upSize = uploadForm.elements["up_size"];
        let upPrice = uploadForm.elements["up_price"];
        if (upFile.value === "") {
            alert("상품 이미지를 등록해 주세요.");
        } else if (upName.value === "") {
            alert("상품명을 입력해주세요.");
            upName.focus();
        } else if (upCode.value === "") {
            alert("상품 코드를 입력해주세요.");
            upCode.focus();
        } else if (upColor.value === "") {
            alert("상품 색상을 입력해주세요.");
            upColor.focus();
        } else if (upSize.value === "") {
            alert("상품 사이즈를 입력해주세요.");
            upSize.focus();
        } else if (upPrice.value === "") {
            alert("상품 가격을 입력해주세요.");
            upPrice.focus();
        } else {
            function callback(responseText) {
                if (responseText === "IMAGE_NOT_ALLOWED") {
                    alert ("jpg 또는 png 형식의 이미지 파일을 등록해주세요.");
                } else if (responseText === "SUCCESS") {
                    alert ("새로운 상품이 등록되었습니다.");
                    getItems();
                    window.location.href="/product";
                }
            }
            function fallback() {
                alert("예상치 못한 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
            }

            let formData = new FormData(uploadForm);
            xhr("POST", "/apis/upload-item", callback, fallback, formData);
        }
    });
}
attachEvents();