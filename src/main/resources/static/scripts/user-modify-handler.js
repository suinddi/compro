class Modify {
    static getElement = function() {
        return window.document.body.querySelector("#modify");
    }



    static attachEvents = function() {
        let passwordRegex = new RegExp("^([0-9a-zA-Z`~!@#$%^&*()\\-_=+\\[{\\]}\\\\|;:'\",<.>/?]{4,100})$");
        let btnMemberModify = window.document.body.querySelector("#btnMemberModify");
        let inputEmailConfirm = window.document.body.querySelector("#inputEmailConfirm");
        let inputPasswordConfirm = window.document.body.querySelector("#inputPasswordConfirm");
        let oldPassword = document.body.querySelector('#modifyForm > input[name="oldPassword"]');
        let newPassword = document.body.querySelector("#modify-input-new-password");
        let UserConfirm = window.document.body.querySelector("div.my_cont.confirm");
        let modifyForm = window.document.body.querySelector("#modifyForm");

        btnMemberModify.addEventListener("click", function() {
            if (inputPasswordConfirm.value === "") {
                alert("비밀번호를 입력해주세요.");
            } else {
                function callback(responseText) {
                    if (!passwordRegex.test(inputPasswordConfirm.value) | responseText === "LOGIN_FAILURE") {
                        alert("비밀번호가 올바르지 않습니다.");
                    } else if (responseText === "LOGIN_SUCCESS") {
                        modifyForm.classList.remove("hidden");
                        UserConfirm.classList.add("hidden");

//                        if (inputPasswordConfirm.value !== modifyForm.elements["newPassword"].value) {
//                           inputPasswordConfirm = oldPassword;
//                        }
                    }
                }
                function fallback() {
                    alert("예상치 못한 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
                }

                let formData = new FormData();
                formData.append("email", inputEmailConfirm.value);
                formData.append("password", inputPasswordConfirm.value);
                xhr("POST", "/user/login", callback, fallback, formData);
            }
        });

        let modify = Modify.getElement();
        let form = window.document.body.querySelector("form");
        let modifyEmail = document.body.querySelector("#modify-input-email");


        let newPasswordCheck = document.body.querySelector("#modify-input-new-password-check");
        let modifyName = document.body.querySelector("#modify-input-name");
        let modifyNickname = document.body.querySelector("#modify-input-nickname");
        let modifyContact = document.body.querySelector("#modify-input-contact");
        let modifyAddress = document.body.querySelector("#modify-input-address");
        let modifyBirth = document.body.querySelector("#modify-input-birth");


        modify.querySelector("#modify-body-button").addEventListener("click", function() {
            if (newPassword.value === "") {
                alert("새 비밀번호를 입력해주세요.");
            } else if (newPasswordCheck.value === "") {
                alert("새 비밀번호를 확인해 주세요");
            } else if (modifyNickname.value === "") {
                alert("닉네임을 입력해 주세요.");
            } else if (modifyContact.value === "") {
                alert("연락처를 입력해 주세요.");
            } else if (modifyAddress.value === "") {
                alert("주소를 입력해 주세요.");
            } else if (modifyBirth.value === "") {
                alert("생년월일을 입력해 주세요.");
            } else {
                function callback(responseText) {
                     if (responseText === "FAILURE") {
                         alert("잠시 후 다시 시도해주세요.");
                     } else if (responseText === "SUCCESS") {
                         alert("회원 정보가 수정되었습니다.");
                         window.location.href="/mypage"; //페이지 새로고침
                     }
                }
                function fallback() {
                    alert("예상치 못한 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
                }

                if (confirm(`회원 정보를 수정하시겠습니까?`)) {
                    let form = modify.querySelector("form");
                    let formData = new FormData(form);

                    xhr("POST", "/user/modify-user", callback, fallback, formData);
                }
            }
        });

        modify.querySelector("#cancel-body-button").addEventListener("click", function() {
            if (confirm(`글 작성을 취소하시겠습니까?`)) {
                window.location.href = "/mypage";
            }
        });
    }
}