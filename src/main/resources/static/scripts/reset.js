let url = new URL(window.location.href);  //현재 주소를 이용하여 URI 객체를 만든다
let result = url.searchParams.get("result");  // 전달이 되었다면 no_matching_user 가 나옴
if (result !== null) {
    if (result === "no_matching_user") {
        alert("일치하는 회원을 찾을 수 없습니다.");
        window.location.href="/reset";
    }
    if (result === "code_none") {
        alert("잘못된 코드 입니다.");
        window.location.href = "/reset?step=2&code_key="+url.searchParams.get("code_key");
    }
}

let resetForm = window.document.body.querySelector("#reset-form");
if (resetForm !== null) {
    resetForm.onsubmit = function() {
        //TODO : 정규화
        if (resetForm.elements["email"].value === "") {
            alert("이메일을 입력해주세요.");
            resetForm.elements["email"].focus();
            return false;
        } else if (resetForm.elements["name"].value === "") {
            alert("이름을 입력해주세요.");
            resetForm.elements["name"].focus();
            return false;
        } else if (resetForm.elements["contact"].value === "") {
            alert("연락처를 입력해주세요.");
            resetForm.elements["contact"].focus();
            return false;
        } else {
            return true;
        }
    }
}

let resetCodeForm = window.document.body.querySelector("#reset-code-form");
if (resetCodeForm !== null) {
    resetCodeForm.onsubmit = function() {
        if(resetCodeForm.elements["code"].value === "") {
            alert("인증 번호를 입력해주세요.");
            resetForm.elements["code"].focus();
            return false;
        } else {
            return true;
        }
    }
}

let changePwForm = window.document.body.querySelector("#change-password-form");
if (changePwForm !== null) {
    changePwForm.onsubmit = function() {
        if(changePwForm.elements["new"].value === "") {
            alert("새 비밀번호를 입력해주세요.");
            changePwForm.elements["new"].focus();
        } else if (changePwForm.elements["new_check"].value === "") {
            alert("새 비밀번호를 다시 입력해주세요.");
            changePwForm.elements["new_check"].focus();
        } else {
            function callback(response) {
                if (response === "CHANGE_FAILURE") {
                    alert("비밀번호 변경을 실패하였습니다. 다시 시도해 주세요.");
                    window.location.href="/reset";
                } else if (response === "CHANGE_SUCCESS") {
                    alert("비밀번호가 변경되었습니다.");
                    window.location.href="/login";
                }
            }
            function fallback(status) {
                alert("예상치 못한 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
            }
            let url = new URL(window.location.href);
            let formData = new FormData(changePwForm);
            formData.append("step", "3");
            formData.append("code", url.searchParams.get("code"));
            formData.append("code_key", url.searchParams.get("code_key"));
            xhr("POST", "/reset", callback, fallback, formData);
        }
        return false;
    }
}








