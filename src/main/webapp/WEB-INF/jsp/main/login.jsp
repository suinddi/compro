
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Compro</title>
    <link rel="stylesheet" href="/stylesheets/common.css">
    <link rel="stylesheet" href="/stylesheets/reset.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
    <script defer src="/scripts/common.js"></script>
</head>
<body>
    <div class="wrap">
        <%@include file="../header.jsp" %>
        <form name="loginForm" action="post">
            <div class="container" style="padding-top: 110px">
                <div class="contents">
                    <h2 class="h2_title_img">LOG IN</h2>
                    <div class="con_login">
                        <span class="placeholder">
                            <label class="assi"></label>
                            <input type="text" id="login-body-input-email" name="webID" value class="ip_text" maxlength="50" placeholder="이메일">
                        </span>
                        <span class="placeholder">
                            <label class="assi" style="display: block;"></label>
                            <input type="password" id="login-body-input-password" name="webPW" class="ip_text" maxlength="50" placeholder="비밀번호">
                        </span>
                        <div class="etc_box">
                            <p class="save_id">
                                <input type="checkbox" id="" name="saveId" class="ip_check">
                                <label>이메일 저장하기</label>
                            </p>
                            <ul>
                                <li>
                                    <a href="/register">회원가입</a>
                                </li>
                                <li>
                                    <a href="/reset">이메일/비밀번호 찾기</a>
                                </li>
                            </ul>
                        </div>
                        <div class="btn_area center">
                            <a href="#" id ="login-body-button" class="btn_ty_bface lg">로그인</a>
                        </div>
                    </div>
                </div>
            </div>
            <!--// container -->
        </form>
        <%@include file="../footer.jsp" %>
    </div>
</body>
</html>