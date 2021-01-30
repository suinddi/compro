function attachEvents() {

// 메인
// function mainSlide() {
//     let slideUl = window.document.body.querySelector(".slide-wrap");
//     let btnPrev = window.document.body.querySelector(".bx-prev");
//     let btnNext = window.document.body.querySelector(".bx-next");
//
//     btnPrev.addEventListener("click", function (){
//         slideUl.querySelector("li").style.display='none';
//     });
//
//
//
//     function move() {
//         let slideIndex = 0;
//
//         setInterval(function (){
//            slideUl.style.transition = '0.2s'
//            slideUl.style.transform = "translate3d(-" + 200 * (slideIndex+1) + "px, 0px, 0px";
//
//            slideIndex++;
//
//            if (slideIndex === 2) slideIndex = -1;
//
//         }, 1000);
//     }
//     move();
// }
// mainSlide();

// 로그인
let loginBodyButton = window.document.body.querySelector("#login-body-button");
    if (loginBodyButton != null) {
        loginBodyButton.addEventListener("click", function() {
            let loginBodyInputEmail = window.document.body.querySelector("#login-body-input-email");
            let loginBodyInputPassword = window.document.body.querySelector("#login-body-input-password");
            if (loginBodyInputEmail.value === "") {
                alert("이메일을 입력해주세요.");
                loginBodyInputEmail.focus();
            } else if (loginBodyInputPassword.value === "") {
                alert("비밀번호를 입력해주세요.");
                loginBodyInputPassword.focus();
            } else {
                function callback(responseText) {
                    if (responseText === "NORMALIZATION_FAILURE") {
                        alert ("올바른 이메일 혹은 비밀번호를 입력해주세요.");
                    } else if (responseText === "LOGIN_FAILURE") {
                        alert ("이메일 혹은 비밀번호가 올바르지 않습니다. 다시 한 번 확인해 주세요.");
                    } else if (responseText === "LOGIN_SUCCESS") {
                        window.location.href="/";
                    }
                }
                function fallback() {
                    alert("예상치 못한 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
                }

                let formData = new FormData();
                formData.append("email", loginBodyInputEmail.value);
                formData.append("password", loginBodyInputPassword.value);
                xhr("POST", "/user/login", callback, fallback, formData);
            }
        });
    }

//회원가입
let registerBodyButton = window.document.body.querySelector("#register-body-button");
if (registerBodyButton != null) {
    registerBodyButton.addEventListener("click", function () {
          let registerBodyInputEmail = window.document.body.querySelector("#register-body-input-email");
          let registerBodyInputPassword = window.document.body.querySelector("#register-body-input-password");
          let registerBodyInputPasswordCheck= window.document.body.querySelector("#register-body-input-password-check");
          let registerBodyInputName = window.document.body.querySelector("#register-body-input-name");
          let registerBodyInputNickname = window.document.body.querySelector("#register-body-input-nickname");
          let registerBodyInputContact = window.document.body.querySelector("#register-body-input-contact");
          let registerBodyInputAddress = window.document.body.querySelector("#register-body-input-address");
          let registerBodyInputBirth = window.document.body.querySelector("#register-body-input-birth");

          if (registerBodyInputEmail.value === "") {
                alert("이메일을 입력해주세요.");
                loginBodyInputEmail.focus();
          } else if (registerBodyInputPassword.value === "") {
                alert("비밀번호를 입력해주세요.");
                loginBodyInputPassword.focus();
          } else if (registerBodyInputPasswordCheck.value === "") {
                alert("비밀번호를 확인해주세요.");
                registerBodyInputPasswordCheck.focus();
          } else if (registerBodyInputName.value === "") {
                alert("이름을 입력해주세요.");
                registerBodyInputName.focus();
          } else if (registerBodyInputNickname.value === "") {
                alert("닉네임을 입력하세요.");
                registerBodyInputNickname.focus();
          } else if (registerBodyInputContact.value === "") {
                alert("연락처를 입력하세요.");
                registerBodyInputContact.focus();
          } else if (registerBodyInputAddress.value === "") {
                alert("주소를 입력하세요.");
                registerBodyInputAddress.focus();
          } else if (registerBodyInputBirth.value === "") {
                alert("생년월일을 입력하세요.");
                registerBodyInputBirth.focus();
          } else {
                  function callback(responseText) {
                      if (responseText === "NORMALIZATION_FAILURE") {
                          alert ("올바른 값을 입력해주세요.");
                      } else if (responseText === "EMAIL_DUPLICATE") {
                          alert("이미 사용 중인 이메일입니다. ");
                      } else if (responseText === "NICKNAME_DUPLICATE") {
                          alert("이미 사용 중인 닉네임입니다. ");
                      } else if (responseText === "FAILURE") {
                          alert("알 수 없는 이유로 회원가입을 못했습니다. 잠시 후 다시 시도해주세요.");
                      } else if (responseText === "SUCCESS") {
                          alert("축하합니다! 회원가입 되었습니다.");
                          window.location.href="/"; //페이지 새로고침
                      }
                  }

                  function fallback() {
                      alert("예상치 못한 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
                  }

                  let formData = new FormData();
                  formData.append("email", registerBodyInputEmail.value);
                  formData.append("password", registerBodyInputPassword.value);
                  formData.append("name", registerBodyInputName.value);
                  formData.append("nickname", registerBodyInputNickname.value);
                  formData.append("contact", registerBodyInputContact.value);
                  formData.append("address", registerBodyInputAddress.value);
                  formData.append("birth", registerBodyInputBirth.value);
                  xhr("POST","/user/register",callback, fallback, formData);
          }
     });
}

let LogoutBodyButton = window.document.body.querySelector("#user-menu-logout");
    if (LogoutBodyButton !== null) {
        LogoutBodyButton.addEventListener("click", function() {
            function callback() {
                window.location.reload();
            }
            function fallback() {
                alert("예상치 못한 오류가 발생하였습니다. 잠시 후 다시 시도해주세요.");
            }
            xhr("POST", "/user/logout", callback, fallback);
        });
    }

    function verifyPassword(loginForm, passwordInput) {
        let passwordRegex = new RegExp("^([0-9a-zA-Z`~!@#$%^&*()\\-_=+\\[{\\]}\\\\|;:'\",<.>/?]{4,100})$");
        if (!passwordRegex.test(inputPasswordConfirm.value)) {
            if (!passwordWarning.classList.contains("visible")) {
                passwordWarning.classList.add("visible");
            }
            if (!passwordInput.classList.contains("issue")) {
                passwordInput.classList.add("issue");
            }
            return false;
        } else {
            passwordWarning.classList.remove("visible");
            passwordInput.classList.remove("issue");
            return true;
        }
    }

    if(typeof(Modify) !== "undefined") {
        Modify.attachEvents();
    }

}
attachEvents();

function xhr(method, url, callback, fallback, formData) {
    let xhr = new XMLHttpRequest();
    xhr.open(method,url);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status >= 200 && xhr.status < 300) {

                callback(xhr.responseText);
            } else {

                fallback();
            }
        }
    };
    if (typeof(formData) == "undefined") {
        xhr.send();
    } else {
        xhr.send(formData);
    }

}