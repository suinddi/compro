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
                        <strong class="tit">Introduction</strong>
                        <ul>
                            <li class=""><a href="/contact">Contact</a></li>
                            <li class="on"><a href="/concept">About Project</a></li>
                        </ul>
                    </div>
                </div>
                <!-- // lnb -->

                <!-- my_cont -->
                <div class="my_cont">
                    <div class="title_area">
                        <h3 class="page_tit">쇼핑몰 사이트</h3>
                    </div>
                    <h4 class="sec_tit_concept">간단 소개</h4>
                    <div class="basic_box">
                        <p>본 사이트는 <strong>maven + 스프링 MVC 패턴</strong>을 활용한 가상의 쇼핑몰 입니다.
                        <br> 결제기능을 제외한 장바구니, 1:1문의, 게시판 등 다양한 기능을 구현하였습니다.
                        </p>
                    </div>
                    <h4 class="sec_tit_concept">구현 목록</h4>
                    <div class="basic_box concept">
                        <div class="box">
                            <div class="level">
                                <img src="images/numbers/icons8-1-96.png" alt="">
                                <strong>로그인</strong>
                                <p>로그인 기능입니다.</p>
                                <span><a href="/login">바로가기</a></span>
                            </div>
                            <ul>
                                <li>- 폼 우측에 [비밀번호 변경]을 포함하고 있습니다.</li>
                                <li>- [관리자]로 로그인 시 상품업로드 및 게시글등록이 가능합니다.</li>
                                <li class="plus_info"><em style="color: #cf0a2c; font-weight: 500">※ 관리자 email/password : admin@sample.com/test</em></li>
                            </ul>
                        </div>
                        <div class="box">
                            <div class="level">
                                <img src="images/numbers/icons8-2-96.png" alt="">
                                <strong>회원가입</strong>
                                <p>회원가입 기능입니다.</p>
                                <span><a href="/register">바로가기</a></span>
                            </div>
                            <ul>
                                <li>- 각 항목별 정규화 검사를 합니다.</li>
                                <li>- 회원가입 완료 시 메인 페이지로 이동합니다.</li>
                            </ul>
                        </div>
                        <div class="box">
                            <div class="level">
                                <img src="images/numbers/icons8-3-96.png" alt="">
                                <strong>비밀번호 찾기/변경</strong>
                                <p>비밀번호 분실 시 비밀번호를 변경할 수 있습니다.</p>
                                <span><a href="/reset">바로가기</a></span>
                            </div>
                            <ul>
                                <li>1.  본 사이트에 등록된 회원인지 검사합니다.</li>
                                <li>2.  비밀번호 변경을 위한 고유 인증번호를 부여합니다.</li>
                                <li>3.  비밀번호를 변경합니다.</li>
                                <li>4.  비밀번호 변경 시 로그인 페이지로 이동합니다.</li>
                                <li>※  비밀번호 변경은 [마이페이지] 에서도 가능합니다.</li>
                            </ul>
                        </div>
                        <div class="box">
                            <div class="level">
                                <img src="images/numbers/icons8-4-96.png" alt="">
                                <strong>상품 페이지</strong>
                                <p>상품 목록을 확인할 수 있습니다.</p>
                                <span><a href="/product">바로가기</a></span>
                            </div>
                            <ul>
                                <li>- 상품 사진 클릭 시 상세정보(팝업창)를 확인할 수 있습니다.</li>
                                <li>- 팝업창에서 해당 상품을 장바구니에 담을 수 있습니다. </li>
                                <li>- [관리자]로 로그인 시 상품업로드를 할 수 있습니다.</li>
                                <li><em class="black" style="font-weight: 500; color: #232323;">※ DB에서 이미지를 불러오는 과정이 10초간 소요됩니다.</em></li>
                                <li class="plus_info"><em style="color: #cf0a2c; font-weight: 500">※ 관리자 email/password : admin@sample.com/test</em></li>
                            </ul>
                        </div>
                        <div class="box">
                            <div class="level">
                                <img src="images/numbers/icons8-5-96.png" alt="">
                                <strong>장바구니 페이지</strong>
                                <p>장바구니 내역을 확인할 수 있습니다.</p>
                                <span><a href="/mybasket">바로가기</a></span>
                            </div>
                            <ul>
                                <li>- [로그인] 해야만 해당 페이지로 이동합니다.</li>
                                <li>- 장바구니 상품을 개별/전체 삭제할 수 있습니다.</li>
                            </ul>
                        </div>
                        <div class="box">
                            <div class="level">
                                <img src="images/numbers/icons8-6-96.png" alt="">
                                <strong>게시판 페이지</strong>
                                <p>게시판 목록을 확인할 수 있습니다.</p>
                                <span><a href="/board">바로가기</a></span>
                            </div>
                            <ul>
                                <li>- 게시글 제목을 클릭하면 내용을 확일 할 수 있습니다.</li>
                                <li>- [관리자]로 로그인 시 게시글등록을 할 수 있습니다.</li>
                                <li><em class="black" style="font-weight: 500; color: #232323;">※ DB에서 이미지를 불러오는 과정이 10초간 소요됩니다.</em></li>
                                <li class="plus_info"><em style="color: #cf0a2c; font-weight: 500">※ 관리자 email/password : admin@sample.com/test</em></li>
                            </ul>
                        </div>
                        <div class="box">
                            <div class="level">
                                <img src="images/numbers/icons8-7-96.png" alt="">
                                <strong>FAQ 페이지</strong>
                                <p>검색기능을 가지는 FAQ 페이지 입니다.</p>
                                <span><a href="/faq">바로가기</a></span>
                            </div>
                            <ul>
                                <li>- 검색 기능을 통해 내용을 확인할 수 있습니다.</li>
                                <li>- 각 항목 클릭 시 내용을 확일 할 수 있습니다.</li>
                            </ul>
                        </div>
                        <div class="box">
                            <div class="level">
                                <img src="images/numbers/icons8-8-96.png" alt="">
                                <strong>마이페이지</strong>
                                <p>회원정보를 확인할 수 있습니다.</p>
                                <span><a href="/mypage">바로가기</a></span>
                            </div>
                            <ul>
                                <li>- [로그인] 해야만 해당 페이지로 이동합니다.</li>
                                <li>- [회원정보변경] 과 [1:1 문의] 기능을 포함하고 있습니다.</li>
                            </ul>
                        </div>
                        <div class="box">
                            <div class="level">
                                <img src="images/numbers/icons8-9-96.png" alt="">
                                <strong>1:1 문의 페이지</strong>
                                <p>문의글을 등록할 수 있습니다.</p>
                                <span><a href="/qna">바로가기</a></span>
                            </div>
                            <ul>
                                <li>- [로그인] 해야만 해당 페이지로 이동합니다.</li>
                                <li>- [마이페이지]를 통해 해당 페이지로 이동할 수 있습니다.</li>
                                <li>- 하단의 [1:1 문의 작성] 버튼으로 문의글을 등록 할 수 있습니다.</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- // my_cont -->
            </div>
            <!-- // my_wrap -->
        </div>
    </div>
    <!--// container-->
    <%@include file="../footer.jsp" %>
</div>
</body>
</html>