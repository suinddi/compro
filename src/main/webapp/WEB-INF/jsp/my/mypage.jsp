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
        <div class="container">
            <div class="contents">
                <div class="my_wrap home">
                    <h2>MY</h2>
                    <div class="user_infobox">
                        <div class="grade bronze">
                            <p class="name"><strong class="f_bold"><%= userVo.getName() %></strong>님</p>
                            <a href="#" class="level">BRONZE</a>
                        </div>
                        <ul class="info">
                            <li><strong>쿠폰</strong><a href="#">2</a></li>
                            <li><strong>마일리지</strong><a href="#">0</a></li>
                            <li><strong>관심상품</strong><a href="#">0</a></li>
                            <li><strong>주문/배송</strong><a href="#">0</a></li>
                        </ul>
                    </div>
                    <div class="my_menu">
                        <div class="category">
                            <strong class="tit">나의등급</strong>
                            <ul>
                                <li><a href="#">회원등급</a></li>
                                <li><a href="#">마일리지</a></li>
                                <li><a href="#">쿠폰</a></li>
                            </ul>
                        </div>
                        <div class="category">
                            <strong class="tit">계정관리</strong>
                            <ul>
                                <li><a href="/myinfo">회원정보확인/수정</a></li>
                                <li><a href="#">배송지 관리</a></li>
                                <li><a href="#">환불계좌 관리</a></li>
                            </ul>
                        </div>
                        <div class="category">
                            <strong class="tit">구매내역</strong>
                            <ul>
                                <li><a href="/myorder">주문/배송 조회</a></li>
                                <li><a href="#">취소/교환/반품 내역</a></li>
                                <li><a href="#">상품리뷰</a></li>
                            </ul>
                        </div>
                        <div class="category">
                            <strong class="tit">상품내역</strong>
                            <ul>
                                <li><a href="#">관심상품</a></li>
                                <li><a href="#">오늘 본 상품</a></li>
                                <li><a href="#">재입고 알림 상품</a></li>
                            </ul>
                        </div>
                        <div class="category">
                            <strong class="tit">Q&amp;A</strong>
                            <ul>
                                <li><a href="/faq">FAQ</a></li>
                                <li><a href="/qna">1:1 문의</a></li>
                                <li><a href="#">A/S 처리현황</a></li>
                            </ul>
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