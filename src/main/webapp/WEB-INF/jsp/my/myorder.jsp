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
    <script defer src="/scripts/pop-up.js"></script>
    <script defer src="/scripts/common.js"></script>
</head>
<body>
<%@include file="../header.jsp" %>
    <div class="wrap">
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
                                <li class=""><a href="/myinfo">회원정보확인/수정</a></li>
                                <li class=""><a href="#">배송지 관리</a></li>
                                <li class=""><a href="#">환불계좌 관리</a></li>
                            </ul>
                        </div>
                        <div class="category">
                            <strong class="tit">구매내역</strong>
                            <ul>
                                <li class="on"><a href="/myorder">주문/배송 조회</a></li>
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
                                <li class=""><a href="/faq">FAQ</a></li>
                                <li class=""><a href="/qna">1:1 문의</a></li>
                                <li class=""><a href="#">A/S 처리현황</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- // lnb -->
                        
                        <form name="sendform" method="get">
                            <input type="hidden" name="orderNo">
                            <input type="hidden" name="sDateAdd">
                            <input type="hidden" name="eDateAdd">
                            <input type="hidden" name="selectPeriod" value="months1">
                            <input type="hidden" name="pageNo">
                        </form>
                        
                        <form name="searchSendform" method="post">
                            <input type="hidden" name="sDateAdd">
                            <input type="hidden" name="eDateAdd">
                            <input type="hidden" name="selectPeriod" value="months1">
                        </form>
                        
                        <input type="hidden" name="totalCount" value="0">
                        <input type="hidden" name="pageSize" value="5">
        
                        <!-- my_cont -->
                        <div class="my_cont">
                            <div class="title_area">
                                <h3 class="page_tit">주문/배송 조회</h3>
                                <ul class="page_txt_info">
                                    <li>주문 내역을 클릭하면 상세 내역을 확인 하실 수 있으며, 주문 상태에 따라 <strong class="point">취소/교환/반품 신청이 가능</strong>합니다.</li>
                                    <li>신청하신 취소/교환/반품 처리 내역은 <strong class="point">‘ 취소/교환/반품 내역 ’</strong> 메뉴에서 확인 가능합니다.</li>
                                </ul>
                            </div>
                            <div class="sort_area">
                                <fieldset class="clearfix">
                                    <legend>Modern Clothes 활동 내역 기간 선택</legend>
                                    <div class="period">
                                        <input type="radio" id="months1" name="period" checked="checked">
                                        <label for="months1">1개월</label>
                                        <input type="radio" id="months3" name="period">
                                        <label for="months3">3개월</label>
                                        <input type="radio" id="months6" name="period">
                                        <label for="months6">6개월</label>
                                        <input type="radio" id="year" name="period">
                                        <label for="year">1년</label>
                                    </div>
                                    <div class="right-wrap">
                                        <div class="date">
                                            <span class="datepicker">
                                                <input type="text" title="시작일자" class="ip_text hasDatepicker" name="sDate" id="sDate" value="2020-09-06">
                                                <a href="" class="btn_date" id="sDate2">
                                                    <span class="blind">일자선택</span>
                                                </a>
                                            </span>
                                            <span class="unit">~</span>
                                            <span class="datepicker">
                                                <input type="text" title="종료일자" class="ip_text hasDatepicker" name="eDate" id="eDate" value="2020-10-06">
                                                <a href="" class="btn_date" id="eDate2">
                                                    <span class="blind">일자선택</span>
                                                </a>
                                            </span>
                                        </div>
                                        <a href="" class="btn_ty_gface xs" id="searchOrder">조회</a>
                                    </div>
                                </fieldset>
                            </div>
                            <!-- 상품 정보 -->
                            <div class="my_prinfo">
                                <div class="tbl_y">
                                    <table class="tbl_basket" id="orderProdList">
                                        <caption>상품 정보 확인</caption>
                                        <colgroup>
                                            <col style="width:135px">
                                            <col style="width:205px">
                                            <col style="width:200px">
                                            <col style="width:140px">
                                            <col style="width:110px">
                                            <col style="width:110px">
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th scope="col" colspan="2">상품정보</th>
                                                <th scope="col">주문번호</th>
                                                <th scope="col">결제금액</th>
                                                <th scope="col">주문일시</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- [D] 배송조회 내역 없을 때 -->
                                            <tr>
                                                <td colspan="6" class="no_data">
                                                    <p class="txt01">주문 / 배송 내역이 없습니다.</p>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- //상품 정보 -->
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