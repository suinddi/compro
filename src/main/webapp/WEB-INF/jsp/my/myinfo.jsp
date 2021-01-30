<%@ page language="java" pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수제 양복점, 모던클로즈&reg;</title>
    <link rel="stylesheet" href="/stylesheets/common.css">
    <link rel="stylesheet" href="/stylesheets/reset.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
    <script defer src="/scripts/user-modify-handler.js"></script>
    <script defer src="/scripts/common.js"></script>
</head>
<body>

    <div class="wrap">
        <%@include file="../header.jsp" %>
        <div class="container" style="padding-top: 0px;">
			<div class="contents">
				<!-- my_wrap -->
				<div class="my_wrap">

				<!-- lnb -->
				<div class="lnb">
					<h2>MY</h2>
							<div class="category">
								<strong class="tit">나의등급</strong>
								<ul>
									<li class=""><a href="#">회원등급</a></li>
									<li class=""><a href="#">마일리지</a></li>
									<li class=""><a href="#">쿠폰</a></li>
								</ul>
							</div>
							<div class="category">
								<strong class="tit">계정관리</strong>
								<ul>
									<li class="on"><a href="#">회원정보확인/수정</a></li>
									<li class=""><a href="#">배송지 관리</a></li>
									<li class=""><a href="#">환불계좌 관리</a></li>
								</ul>
							</div>
							<div class="category">
								<strong class="tit">구매내역</strong>
								<ul>
									<li class=""><a href="#">주문/배송 조회</a></li>
									<li class=""><a href="#">취소/교환/반품 내역</a></li>
									<li class=""><a href="#">상품리뷰</a></li>
								</ul>
							</div>
							<div class="category">
								<strong class="tit">상품내역</strong>
								<ul>
									<li class=""><a href="#">관심상품</a></li>
									<li class=""><a href="#">오늘 본 상품</a></li>
								</ul>
							</div>
							<div class="category">
								<strong class="tit">Q&amp;A</strong>
								<ul>
									<li class=""><a href="#">FAQ</a></li>
									<li class=""><a href="/qna">1:1 문의</a></li>
									<li class=""><a href="#">A/S 처리현황</a></li>
								</ul>
							</div>
				</div>
				<!-- // lnb -->

                <!-- my_cont -->
				<div class="my_cont confirm">
                    <div class="title_area">
                        <h3 class="page_tit">회원정보 확인</h3>
                        <ul class="page_txt_info">
                            <li>고객님의 소중한 개인정보 보호를 위해 비밀번호를 입력해 주시기 바랍니다.</li>
                        </ul>
                    </div>
                    <div class="con_my_confirm">
                        <div class="form_area" style="padding-bottom:0">
                            <fieldset>
                                <legend>로그인 입력 양식</legend>
                                <div class="row">
                                    <label class="ftit">이메일</label>
                                    <div class="fdata">
                                        <input type="text" id="inputEmailConfirm" class="ip_text md" title="아이디" value="<%= userVo.getEmail() %>" readonly="readonly">
                                    </div>
                                </div>
                                <div class="row row20">
                                    <label class="ftit">비밀번호</label>
                                    <div class="fdata">
                                        <input type="password" id="inputPasswordConfirm" class="ip_text md" title="비밀번호">
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <div class="btn_area">
                            <a id="btnMemberModify" class="btn_ty_bface lg">확인</a>
                        </div>
                    </div>
                </div>
                <!--// my_cont -->

						   <div id="modify" class="con_modify">
							   <form method="post" name="modifyForm" class="modifyForm hidden" id="modifyForm">
							   <fieldset>
								   <div class="title_box">
									   <h3 class="sec_tit modify">회원정보 수정</h3>
									   <span class="txt_info"></span>
								   </div>
								   <div class="form_area modify" style="padding-bottom: 0">
									   <div class="row">
										   <label class="ftit">
											   이메일<em class="compulsory">필수</em>
										   </label>
										   <div class="fdata">
											   <input type="text" id="modify-input-email" name="email" class="ip_text md" maxlength="100"
													  title="이메일" value="<%= userVo.getEmail() %>" readonly="readonly">
										   </div>
									   </div>
									   <div class="row" style="display:none">
										   <label class="ftit">
											    이전 비밀번호<em class="compulsory">필수</em>
										   </label>
										   <div class="fdata">
											   <input type="hidden" id="modify-input-old-password" class="ip_text md"
													  title="이전 비밀번호" maxlength="100" name="oldPassword" value="">
										   </div>
									   </div>
									   <div class="row">
										   <label class="ftit">
											   새 비밀번호<em class="compulsory">필수</em>
										   </label>
										   <div class="fdata">
											   <input type="password" id="modify-input-new-password" class="ip_text md"
													  title="새 비밀번호" maxlength="100" name="newPassword" value="">
										   </div>
									   </div>
									   <div class="row">
										   <label class="ftit">
											   새 비밀번호 확인<em class="compulsory">필수</em>
										   </label>
										   <div class="fdata">
											   <input type="password" id="modify-input-new-password-check" class="ip_text md"
													  title="새 비밀번호 확인" maxlength="100" value="">
										   </div>
									   </div>
									   <div class="row">
										   <label class="ftit">
											   이름<em class="compulsory">필수</em>
										   </label>
										   <div class="fdata">
											   <input type="text" id="modify-input-name" name="name" class="ip_text md" maxlength="100"
													  value="<%= userVo.getName() %>" readonly="readonly">
										   </div>
									   </div>
									   <div class="row">
										   <label class="ftit">
											   닉네임<em class="compulsory">필수</em>
										   </label>
										   <div class="fdata">
											   <input type="text" id="modify-input-nickname" name="nickname" class="ip_text md" maxlength="100"
													  value="<%= userVo.getNickName() %>">
                                               <a class="btn_ty_form" id="nickDuplicationTest">닉네임 중복검사</a>
										   </div>
									   </div>
									   <div class="row">
										   <label class="ftit">
											   휴대폰번호<em class="compulsory">필수</em>
										   </label>
										   <div class="fdata">
											   <input type="text" id="modify-input-contact" name="contact" class="ip_text md" maxlength="11" value="<%= userVo.getContact() %>">
										   </div>
									   </div>
									   <div class="row">
										   <label class="ftit">
											   주소<em class="compulsory">필수</em>
										   </label>
										   <div class="fdata">
											   <!-- <a href="#" class="btn_ty_form" id="postFind">우편번호 찾기</a> -->
											   <!-- <input type="text" id="modify-body-input-address" class="ip_text xl"  title="기본 주소" value maxlength="120"> -->
											   <input type="text" id="modify-input-address" name="address" class="ip_text md" maxlength="100" value="<%= userVo.getAddress() %>">
										   </div>
									   </div>
									   <div class="row">
										   <strong class="ftit">
											   생년월일<em class="compulsory">필수</em>
										   </strong>
										   <div class="fdata">
											   <input type="text" id="modify-input-birth" name="birth" class="ip_text md" maxlength="6" value="<%= userVo.getBirth() %>">

										   </div>
									   </div>
								   </div>
								   <div class="txt_secession">탈퇴를 원하실 경우 우측 회원탈퇴를 눌러주세요.&nbsp;&nbsp;&nbsp;<a href="#" class="btn_line">회원탈퇴</a></div>
								   <div class="btn_area">
									   <div class="btn_ty_bface lg" id="modify-body-button">회원정보 수정</div>
									   <div class="btn_ty_bline lg" id="cancel-body-button">취소하기</div>
								   </div> 
							   </fieldset>
							   </form>
						   </div>
						   <!-- // join -->

				</div>
				<!-- // my_wrap -->
        	</div>
        </div>
        <!--// container -->
        <%@include file="../footer.jsp" %>
    </div>
</body>
</html>