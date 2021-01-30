<%@ page language="java" pageEncoding="UTF-8" contentType="text/html" %>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경 페이지</title>
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
                        <h3 class="sec_tit">비밀번호 변경</h3>
                    </div>
                    <div class="form_area reset">
						<!-- 인증번호 요청 후 -->
						<form id="change-password-form" method="post">
							<fieldset>
								<div class="row">
									<label class="ftit">새 비밀번호</label>
									<div class="fdata">
										<input type="password" name="new" class="ip_text md" maxlength="100">
									</div>
								</div>                        
								<div class="row">
									<label class="ftit">새 비밀번호 확인</label>
									<div class="fdata">
										<input type="password" name="new_check" class="ip_text md" maxlength="100">
										<em class="ip_info">※ 4~12자 이내 영문,숫자,특수문자(“”-+/\:; 제외)</em>
									</div>
								</div>
							</fieldset>
							<!-- // 인증번호 요청 후 -->
							<div class="form_bottom">
								<input type="submit" id="pwChange" value="비밀번호 입력" class="btn_ty_bface lg resetBtn">
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