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
    <script defer src="/scripts/common.js"></script>
</head>
<body>
    <div class="wrap">
        <%@include file="../header.jsp" %>
        <form action="post" name="joinForm"> 
             <div class="container">
                <div class="contents">
                    <h2 class="h2_title_img">SIGN UP</h2>
                    <div class="con_join register">
                        <fieldset>
                            <div class="title_box">
                                <h3 class="sec_tit">회원정보</h3>
                                <span class="txt_info"></span>
                            </div>
                            <div class="form_area register">
                                <div class="row">
                                    <label class="ftit">
                                        이메일<em class="compulsory">필수</em>
                                    </label>
                                    <div class="fdata">
                                        <input type="text" id="register-body-input-email" class="ip_text md" maxlength="100" title="이메일">
                                    </div>
                                </div>
                                <div class="row">
                                    <label class="ftit">
                                        비밀번호<em class="compulsory">필수</em>
                                    </label>
                                    <div class="fdata">
                                        <input type="password" id="register-body-input-password" class="ip_text md" title="비밀번호" maxlength="100">
                                        <em class="ip_info">※ 4~12자 이내 영문,숫자,특수문자(“”-+/\:; 제외)</em>
                                    </div>
                                </div>
                                <div class="row">
                                    <label class="ftit">
                                        비밀번호 확인<em class="compulsory">필수</em>
                                    </label>
                                    <div class="fdata">
                                        <input type="password" id="register-body-input-password-check" class="ip_text md" title="비밀번호 확인" maxlength="100">
                                    </div>
                                </div>
                                <div class="row">
                                    <label class="ftit">
                                        이름<em class="compulsory">필수</em>
                                    </label>
                                    <div class="fdata">
                                        <input type="text" id="register-body-input-name" class="ip_text md" maxlength="100">
                                    </div>
                                </div>
                                <div class="row">
                                    <label class="ftit">
                                        닉네임<em class="compulsory">필수</em>
                                    </label>
                                    <div class="fdata">
                                        <input type="text" id="register-body-input-nickname" class="ip_text md" maxlength="100">
                                    </div>
                                </div>
                                <div class="row">
                                    <label class="ftit">
                                        휴대폰번호<em class="compulsory">필수</em>
                                    </label>
                                    <div class="fdata">
                                        <input type="text" id="register-body-input-contact" class="ip_text md" maxlength="11">
                                    </div>
                                </div>
                                <div class="row">
                                    <label class="ftit">
                                        주소<em class="compulsory">필수</em>
                                    </label>
                                    <div class="fdata">
                                        <!-- <a href="#" class="btn_ty_form" id="postFind">우편번호 찾기</a> -->
                                        <!-- <input type="text" id="register-body-input-address" class="ip_text xl"  title="기본 주소" value maxlength="120"> -->
                                        <input type="text" id="register-body-input-address" class="ip_text md" maxlength="100">
                                    </div>
                                </div>
                                <div class="row">
                                    <strong class="ftit">
                                        생년월일<em class="compulsory">필수</em>
                                    </strong>
                                    <div class="fdata">
                                        <input type="text" id="register-body-input-birth" class="ip_text md" maxlength="6">
                                    </div>
                                </div>
                            </div>   
                            <div class="btn_area" style="margin-top:30px">
                                <div class="btn_ty_bface lg" id="register-body-button">회원가입</div>
                            </div> 
                        </fieldset>
                    </div>
                    <!-- // join -->
                </div>
            </div>
            <!-- // container -->
        </form>
        <%@include file="../footer.jsp" %>
    </div>
</body>
</html>