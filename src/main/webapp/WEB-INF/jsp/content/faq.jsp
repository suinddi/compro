<%@ page import="com.webproject.compro.web.vos.FaqVo" %>
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
    <script defer src="/scripts/faq.js"></script>
</head>

<body>
    <div class="wrap">
        <%@include file="../header.jsp" %>
        <div class="container" style="padding-top: 0px;">
            <div class="contents">
                <div class="my_wrap">
                    <!-- lnb -->
                    <div class="lnb">
                        <h2>SUPPORT</h2>
                        <div class="category">
                            <strong class="tit">NEED HELP</strong>
                            <ul>
                                <li class=""><a href="">고객센터</a></li>
                                <li class="on"><a href="">FAQs</a></li>
                                <li class=""><a href="">공지사항</a></li>
                                <li class=""><a href="">1:1 문의</a></li>
                            </ul>
                        </div>
                        <div class="category">
                            <strong class="tit">INFORMATION</strong>
                            <ul>
                                <li class=""><a href="">팀/단체복 주문 안내</a></li>
                                <li class=""><a href="">배송 및 교환 반품 안내</a></li>
                                <li class=""><a href="">세탁 및 손질 방법 안내</a></li>
                                <li class=""><a href="">이용약관</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- // lnb -->
    
                    <!-- my_cont -->
                    <div class="my_cont">
                        <div class="title_area">
                            <h3 class="page_tit">FAQs</h3>
                        </div>
                        <!-- 검색영역 -->
                        <div class="sc_box">
                            <form id="search-form">
                                <legend>질문/답변 검색</legend>
                                <label>질문/답변 검색</label>
                                <input type="text" id="searchWord" name="searchWord" class="ip_text" autofocus>
                                <input type="submit" class="btn_ty_bface sm w80" value="검색">
                            </form>
                        </div>
                        <!-- // 검색영역 -->
    
                        <div class="tab_list">
                            <ul class="col8">
                                <li id="all" class="active"><a>전체</a></li>
                                <li id="2"><a>웹사이트</a></li>
                                <li id="3"><a>주문/배송</a></li>
                                <li id="4"><a>수선(A/S)</a></li>
                                <li id="5"><a>매장 관련</a></li>
                                <li id="6"><a>제품</a></li>
                            </ul>
                        </div>
                        <div class="tab_cont">
                            <!-- qna_list -->
                            <div class="qna_list">
                                <ul id="qnaUlList">
                                    <li>
                                        <div class="row_q">
                                            <a href="#" class="ttl">구매 후 착용하지 않은 제품을 다른 제품으로 교환하고 싶습니다</a>
                                        </div>
                                        <div class="row_a hidden">
                                            <div class="board_a">
                                                <p>구매 후 7일 이내로 제품에 손상이 없는 경우라면 교환이 가능합니다.
                                                <br>구입매장이 아니더라도 인근 매장에서 교환 가능하며,
                                                <br>상품에 하자가 있는 경우는 매장에 맡겨 주시면 상품의 하자 여부를 해당기관에 의뢰하여
                                                <br>상품 불량 여부를 확인해드립니다.
                                                </p>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <!-- // qna_list -->
                        </div>
                    </div>
                    <!-- // my_cont -->
                </div>
                <!-- // my_wrap -->
            </div>
        </div>
        <!--// container -->
        <%@include file="../footer.jsp" %>
    </div>
</body>
</html>