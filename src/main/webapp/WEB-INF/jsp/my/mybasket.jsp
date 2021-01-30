<%@ page language="java" pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@ page import = "com.webproject.compro.web.vos.BasketItemVo" %>

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
    <script defer src="/scripts/basket.js"></script>
</head>
<body>
<%@include file="../header.jsp" %>
    <div class="wrap">
        <div class="container" style="padding-top: 0px;">
            <div class="contents">
                <!-- basket_wrap -->
                <div class="basket_wrap">
                    <div class="title_area">
                        <h2 class="page_tit">장바구니</h2>
                    </div>
                    <div class="tbl_count">
                        <p class="count">총 <strong>0</strong> 개</p>
                    </div>
                    <div class="tbl_y" id="basket-list">
                        <form id="" action="" method="post">
                        <table class="tbl_basket">
                            <caption>장바구니 담긴 내역</caption>
                            <colgroup>
                                <col style="width:38px">
                                <col style="width:auto">
                                <col style="width:190px">
                                <col style="width:180px">
                                <col style="width:120px">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th scope="col" class="chkbox">
                                        <em class="chk">
                                            <label>
                                            <input type="checkbox" class="ip_chekbox" checked="">
                                                <span class="select"></span>
                                            </label>
                                        </em>
                                    </th>
                                    <th scope="col">상품/옵션 정보</th>
                                    <th scope="col">수량</th>
                                    <th scope="col">주문금액</th>
                                    <th scope="col"><span class="blind">내역 제어</span></th>
                                </tr>
                            </thead>

                            <tbody>
                                <tr>
                                    <td class="chkbox">
                                        <em class="chk">
                                            <input type="checkbox" style="display: none;">
                                            <input type="checkbox" class="ip_chekbox">
                                            <label>
                                                 <span class="blind">상품선택</span>
                                            </label>
                                        </em>
                                    </td>
                                    <td>
                                        <div class="img">
                                            <img src="" alt="">
                                        </div>
                                        <div class="pr">
                                            <a href="" class="p_name"></a>
                                            <p class="p_opt"></p>
                                            <p class="p_opt"></p>
                                            <a href="#none" class="btn_line">변경</a>
                                        </div>
                                    </td>
                                    <td>
                                        <span class="select_box small" style="width:82px">
                                            <select id="selectbox" name="selectbox" title="수량 선택" data-stock-qty="2">
                                                <option value="1" selected="">1</option>
                                                <option value="2">2</option>
                                            </select>
                                        </span>
                                        <a href="#none" class="btn_line">변경</a>
                                    </td>
                                    <td class="price">
                                        <strong id="price"></strong>원
                                    </td>
                                    <td class="control">
                                        <a href="#none" class="btn_ty_rface xs">주문하기</a>
                                        <a class="btn_ty_bline xs">삭제하기</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        </form>
                        <div class="button-wrapper-item center">
                            <div class="object-page-number-button selected">1</div>
                            <div class="object-page-number-button">2</div>
                            <div class="object-page-number-button">3</div>
                            <div class="object-page-number-button">4</div>
                            <div class="object-page-number-button">5</div>
                            <div class="object-page-number-button">6</div>
                        </div>
                    </div>
                    
                    <div class="tbl_btm">
                        <div class="tbl_control">
                            <span>선택상품 <strong id="choiceCount">0</strong> 개</span>
                            <a href="#none" id="deleteCartBtn" class="btn_ty_bline xs">삭제하기</a>
                        </div>
                        <p class="info_txt">* 장바구니에 담긴 상품은 30일 동안 보관됩니다. 더 오래 상품을 보관하시려면 관심 상품에 담아주시기 바랍니다.</p>
                    </div>
    
                    <div class="sec_price">
                        <div class="calc">
                            <div class="clearfix">
                                <p>
                                    <span class="ttl">주문금액</span>
                                    <span class="price"><em id="orderPrice">0</em> 원</span>
                                </p>
                            </div>
                            <div class="clearfix">
                                <p>
                                    <span class="ttl">배송료</span>
                                    <span class="price"><em id="dlvyPrice">0</em> 원</span>
                                </p>
                            </div>
                        </div>
                        <div class="total">
                            <p class="txt1">결제 예정 금액</p>
                            <span class="txt2">주문금액 + 배송료</span>
                            <strong class="txt3"><em id="totalPrice">0</em> 원</strong>
                        </div>
                    </div>
    
                    <div class="btn_area">
                        <a href="#none" class="btn_ty_rface lg" id="totalProductOrder">전체 상품 주문하기</a>
                        <a href="#none" class="btn_ty_bline lg" id="choiceProductOrder">선택 상품 주문하기</a>
                    </div>
                    
                </div>
                <!-- // basket_wrap -->
            </div>
        </div>
        <!--// container -->
<%@include file="../footer.jsp" %>
    </div>
</body>
</html>