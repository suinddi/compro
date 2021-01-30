<%@ page import="com.webproject.compro.web.vos.UserVo" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Compro</title>
    <link rel="stylesheet" href="/stylesheets/common.css">
    <link rel="stylesheet" href="/stylesheets/reset.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
    <script defer src="/scripts/reset.js"></script>

</head>
<body>
    <div class="wrap">
        <%@include file="../header.jsp" %>
        <div class="container" style="padding-top: 120px;">
            <div class="contents">
                <h2 class="h2_title_img">FIND  PASSWORD</h2>
                <div class="con_find">
                    <div class="title_box">
                        <h3 class="sec_tit">비밀번호 찾기</h3>
                    </div>
                    <div class="form_area reset">
                        <form id="reset-form" method="post">
                        <fieldset>
                            <legend>회원 정보 아이디 찾기 입력양식</legend>
                            <div class="row">
                                <label class="ftit">이메일</label>
                                <div class="fdata">
                                    <input type="text" name="email" class="ip_text md" maxlength="100">
                                </div>
                            </div>                        
                            <div class="row">
                                <label class="ftit">이름</label>
                                <div class="fdata">
                                    <input type="text" name="name" class="ip_text md" maxlength="50">
                                </div>
                            </div>
                            <div class="row">
                                <label class="ftit">휴대폰번호</label>
                                <div class="fdata">
                                    <input type="text" name="contact" class="ip_text md" maxlength="11">
                                </div>
                            </div>
                        </fieldset>
                        <div class="form_bottom">
                            <p class="txt_note">* 회원가입 시 사용하신 휴대폰 번호를 통해 비밀번호를 찾으실 수 있습니다.</p>
                            <input type="submit" id="btnAuthNumberRequest" value="비밀번호 찾기" class="btn_ty_bface lg resetBtn">
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--// container -->
        <%@include file="../footer.jsp" %>
    </div>
</body>
</html>