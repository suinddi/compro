<%@ page import="com.webproject.compro.web.vos.QnaRegisterVo" %>
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
    <script defer src="/scripts/common.js"></script>
    <script defer src="/scripts/qna.js"></script>
</head>
<body>
<%@include file="../header.jsp" %>
    <div class="wrap">
        <!-- pop -->
        <div class="dimm_pop hidden" id="layerPopupDimmed01" style="display: block;"></div>
        <div class="layer_pop w700 hidden" id="qnaWriteForm" style="position: absolute; top: 0px; left: 43px; display: block;">
            <div class="pop_inner">
                <div>
                    <strong>1:1 문의</strong>
                </div>
                <div class="contents question11">
                    <ul class="sub_info">
                        <li>* 특별 상품에 대한 문의는 상품 정보 상세 페이지에서 문의하면 더 정확한 답변을 드릴 수 있습니다. </li>
                        <li>* 진행 중인 주문에 대한 문의는 주문번호를 입력해 주시면 더 정확한 답변을 드릴 수 있습니다. </li>
                        <li>* 1:1 문의 등록 후에는 수정 및 삭제가 불가능합니다.</li>
                        <li>* 1:1 문의에 주소, 연락처 등 개인정보 및 계좌정보를 남기실 경우, 질문이 삭제될 수 있습니다.</li>
                        <li>* 계좌정보는 MY &gt; 계정관리 &gt; 환불계좌관리에 등록해 주시기 바랍니다.
                    </li></ul>
        
                    <ul class="list cf">
                        <li><span class="txt_head">이름</span><span class="txt_content"><%= userVo.getName() %></li>
                        <li><span class="txt_head">휴대폰 번호</span><span class="txt_content"><%= userVo.getContact() %></li>
                        <li><span class="txt_head">E-mail</span><span class="txt_content"><%= userVo.getEmail() %></span></li>
                    </ul>

                    <!-- FormArea -->
                    <div class="form_area" id="qnaRegister">
                        <form>
                            <fieldset>
                                <legend>1:1 문의 입력 양식</legend>
                                <div class="row">
                                    <input type="hidden" name="qna_index">
                                    <label class="ftit">문의 분류</label>
                                    <div class="fdata">
                                        <span class="select_box" style="width:200px">
                                            <select id="register-kind" name="qna_kind" title="문의 대분류" >
                                                <option value="">선택</option>
                                                <option value="AS 및 취급방법">AS 및 취급방법 문의</option>
                                                <option value="상품 관련">상품 관련 문의</option>
                                                <option value="주문제작">주문제작 문의</option>
                                                <option value="단체주문">단체주문 문의</option>
                                                <option value="기타">기타 문의</option>
                                            </select>
                                        </span>
                                    </div>
                                </div>
                                <div class="row">
                                    <label class="ftit">제목</label>
                                    <div class="fdata">
                                        <input type="text" name="qna_title" id="register-title" class="ip_text" maxlength="100"
                                         placeholder="문의의 종류를 적어주시면 빠른 답변에 도움이 됩니다.">
                                    </div>
                                </div>
                                <div class="row">
                                    <label class="ftit">주문번호</label>
                                    <div class="fdata">
                                        <input type="text" name="qna_purIndex" id="register-purchase-index" class="ip_text" maxlength="100"
                                               placeholder="주문번호를 입력해주시면 빠른 답변에 도움이 됩니다.">
                                    </div>
                                </div>
                                <div class="row">
                                    <label class="ftit">문의 내용</label>
                                    <div class="fdata">
                                        <textarea id="register-content" name="qna_content" class="textarea" cols="30" rows="5" placeholder="문의하실 내용을 적어주세요."></textarea>
                                    </div>
                                </div>
<%--                                <div class="row">--%>
<%--                                    <label for="srch_file" class="ftit">파일 첨부</label>--%>
<%--                                    <div class="fdata">--%>
<%--                                        <div class="file">--%>
<%--                                            <input id="srch_file" type="text" value="" title="파일명" class="ip_text" readonly="">--%>
<%--                                            <em class="btn_ty_form">파일찾기 <input type="file" title="파일찾기" id="qnaImg" name="uploadfile"></em>--%>
<%--                                        </div>--%>
<%--                                        <em class="ip_info point_g" style="margin-bottom:0">파일 크기 20MB 이하 / jpg, gif 파일만 등록 가능합니다.</em>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                            </fieldset>
                        </form>
                    </div>
                    <!-- // FormArea -->

                    <div class="btn_area">
                        <a href="#" id="insertQna" class="btn_ty_bface sm">문의하기</a>
                        <a href="#" id="cancelQna" class="btn_ty_bline sm">취소하기</a>
                    </div>
                </div>
                <button type="button" class="close" id="btnLayerPopupClose">
                    <img src="/images/btn_pop_close.png" alt="팝업 닫기">
                </button>
            </div>
        </div>
        <!--// pop -->

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
									<li class=""><a href="#">회원정보확인/수정</a></li>
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
									<li class="on"><a href="#">1:1 문의</a></li>
									<li class=""><a href="#">A/S 처리현황</a></li>
								</ul>
							</div>
				</div>
				<!-- // lnb -->

				<div class="my_cont">
					<div class="title_area">
						<h3 class="page_tit">1:1 문의</h3>
						<ul class="page_txt_info">
							<li>등록된 문의는 수정 및 삭제가 불가능합니다.</li>
							<li>1:1 문의에 주소, 연락처 등 개인정보 및 계좌정보를 남기실 경우, 질문이 삭제될 수 있습니다.</li>
                            <li>계좌정보는 <strong class="point">MY &gt; 계정관리 &gt; 환불계좌관리</strong> 에 등록해 주시기 바랍니다.
						</li></ul>
					</div>
					<!-- Sorting -->
					<div class="sorting_area">
						<span class="select_box small">
							<select id="searchTypeCodeLarge" name="searchTypeCodeLarge" title="문의 대분류">
								<option value="all">전체</option>
									<option value="as">AS 및 취급방법 문의</option>
									<option value="product">상품 관련 문의</option>
									<option value="make">주문제작 문의</option>
									<option value="together">단체주문 문의</option>
									<option value="other">기타 문의</option>
							</select>
						</span>
					</div>
					<!-- //Sorting -->
					<!-- qna_list -->
					<div class="qna_list2">
						<ul id="ulList">
							<li class="no_data">
								<p class="txt01">1:1 문의 내역이 없습니다.</p>
							</li>
							<li>

							</li>
						</ul>
					</div>
					<!-- // qna_list -->
					<div class="button-wrapper-item center">
                    </div>
					<div class="btn_area">
						<a href="#" class="btn_ty_bface lg" id="btnQnaWrite">1:1 문의 작성</a>
					</div>

				</div>
				<!-- // my_cont -->
        	</div>
            </div>
        </div>
        <!--// container -->
        <%@include file="../footer.jsp" %>
    </div>
</body>
</html>