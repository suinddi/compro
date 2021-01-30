<%@ page language="java" pageEncoding="UTF-8" contentType="text/html" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경</title>
    <link rel="stylesheet" href="/stylesheets/common.css">
    <link rel="stylesheet" href="/stylesheets/reset.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
    <script defer src="/scripts/reset.js"></script>
    <script defer src="/scripts/common.js"></script>
</head>
<body>
    <div class="wrap">
        <%@include file="../header.jsp" %>
        <div class="container" style="padding-top: 110px;">
            <div class="contents">
                <h2 class="h2_title_img">FIND  PASSWORD</h2>
                <div class="con_find">
                    <div class="title_box">
                        <h3 class="sec_tit">비밀번호 찾기</h3>
                    </div>
                    <div class="form_area code">
                        <fieldset>
                            <!-- 인증번호 요청 후 -->
                            <form id="reset-code-form" method="post">
                            <div class="row con_find" id="smsCertInputArea">
                                <label class="ftit">인증번호 입력</label>
                                <div class="fdata">
                                    <div class="auth_timer">
                                        <input type="text" name="code" class="ip_text md">
                                        <div class="num" id="remainingSecond">03:00</div>
                                    </div>
                                    <input type="submit" class="btn_ty_bface sm" value="인증하기" id="btnAuthNumberConfirm"></a>
                                </div>
                                <div class="fdata">
                                    <p class="auth_5numb">
                                        <span id="smsMessage" class="point_r"></span><br>
                                        3분 이내에 인증번호 6자리를 입력하셔야 합니다. 인증번호를 입력해주세요.<br>
                                        인증번호가 오지 않을 경우 재요청을 선택해주세요.<br>
                                    </p>
                                </div>
                            </div>
                            </form>
                            <!-- // 인증번호 요청 후 -->
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <!--// container -->
        <%@include file="../footer.jsp" %>
    </div>
</body>
</html>