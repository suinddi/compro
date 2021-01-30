<%@ page language="java" pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>수제 양복점, 모던클로즈&reg;</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap">
    <link rel="stylesheet" type="text/css" href="/stylesheets/common.css" />
    <link rel="stylesheet" type="text/css" href="/stylesheets/reset.css" />
    <script defer src="/scripts/common.js"></script>
    <script defer src="/scripts/product-upload.js"></script>
    <script defer src="/scripts/product-event.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

</head>
<body>
<div class="wrap">
    <!-- pop01 -->
    <div class="dimm_pop01 hidden" id="layerProductQuickViewPopupDimmed" style="position: fixed;"></div>
    <div class="layer_pop w700 hidden" style="position: absolute; top: 270px; left: 0px;" id="basketListPopup" >
        <div class="pop_inner">
            <div class="completion">
                <div class="scroll">
                    <strong class="comp_txt1">총 <span class="point_r">1</span>개의 상품이 장바구니에 추가 되었습니다.</strong>
                    <div class="result">
                        <div class="inner">
                            <p id="basket-item-name">상품 이름</p>
                            <ul class="sub_info" id="basket-Info"><li>(19)Black/(090)S 1개 <span class="ml15">159,000원</span></li></ul>
                        </div>
                    </div>
                </div>
                <div class="btn_area wid140">
                    <a href="/product" id="shoppingContinue" class="btn_ty_rface sm">쇼핑 계속하기</a>
                    <a href="/mybasket" class="btn_ty_bline sm">장바구니 확인하기</a>
                </div>
            </div>
            <button type="button" class="close" id="btnCloseCartPopup">
                <img src="/images/btn_pop_close.png" alt="팝업 닫기">
            </button>
        </div>
    </div>
    <!--// pop02 -->

    <!-- pop02 -->
    <div class="dimm_pop hidden" id="quickViewPopupDimmed" style="position: fixed;"></div>
    <div class="layer_pop w900 hidden" style="position: absolute; top: 10px; left: 0px;" id="productQuickView">
        <div class="pop_inner">
            <div class="quick_view">
                <p class="style_code">스타일코드 <strong id="item-code">MOAT1234</strong></p>

                <!-- pr_visual -->
                <div class="pr_visual">
                    <div class="img">
                        <div class="inner">
                            <img src="/images/product/suit01-475px.jpg" alt="클래식 정장 자켓" id="item-image">
                        </div>
                        <div class="thumb">
                            <span class="active" data-type="image"><img src="/images/product/no-image.png"></span>
                            <span data-type="image"><img src="/images/product/no-image.png"></span>
                            <span data-type="image"><img src="/images/product/no-image.png"></span>
                            <span data-type="image"><img src="/images/product/no-image.png"></span>
                            <span data-type="image"><img src="/images/product/no-image.png"></span>
                            <span data-type="image"><img src="/images/product/no-image.png"></span>
                            <span data-type="image"><img src="/images/product/no-image.png"></span>
                            <span data-type="image"><img src="/images/product/no-image.png"></span>
                            <span data-type="image"><img src="/images/product/no-image.png"></span>
                            <span data-type="image"><img src="/images/product/no-image.png"></span>
                        </div>
                    <a href="#" class="info_go"><span>상품 정보 자세히 보기</span></a>
                    </div>
                </div>
                <!-- // pr_visual -->

                <!-- pr_option -->
                <div class="pr_option">
                    <div class="pr_info">
                        <h2 class="title" id="item-name">클래식 정장 자켓</h2>
                        <div class="marketing" id="iconOpt">
                            <img src="/images/new-badge.png" alt="">
                        </div>
                        <div class="box">
                            <div class="star_score">
                                <span class="star"><span style="width:0.0%"></span></span>
                                <em class="num">0.0/5</em>
                            </div>
                            <div class="price">
                                <span class="won"><strong id="item-price"></strong> 원</span>
                                <em class="saving">적립 <strong>1,287 (3%)</strong></em>
                            </div>
                        </div>
                    </div>

                    <div class="pr_select">
                        <form id="pr-select-form">
                        <div class="color" id="optSection">
                            <input type="hidden" name="pr_index" id="item-index">
                            <input type="hidden" name="pr_name">
                            <input type="hidden" name="pr_code">
                            <input type="hidden" name="pr_price">
                            <p class="tit">색상</p>
                            <ul class="items">
                                <li>
                                    <input type="radio" name="pr_color" value="" checked="checked">
                                    <label title="Ivory" id="item-color">
                                        <img src="/images/product/no-image.png" alt="Ivory">
                                    </label>
                                </li>
                            </ul>
                        </div>
                        <div class="size" id="optSection">
                            <p class="tit" >사이즈</p>
                            <ul class="items" id="item-size">
                                <li>
                                    <input type="radio" id="size_XS" name="pr_size" value="XS">
                                    <label for="size_XS" title="085">XS</label>
                                </li>
                                <li>
                                    <input type="radio" id="size_S" name="pr_size" value="S">
                                    <label for="size_S" title="090">S</label>
                                </li>
                                <li>
                                    <input type="radio" id="size_M" name="pr_size" value="M">
                                    <label for="size_M" title="095">M</label>
                                </li>
                                <li>
                                    <input type="radio" id="size_L" name="pr_size" value="L">
                                    <label for="size_L" title="100">L</label>
                                </li>
                                <li>
                                    <input type="radio" id="size_XL" name="pr_size" value="XL" >
                                    <label for="size_XL" title="105">XL</label>
                                </li>
                            </ul>
                        </div>
                        </form>
                        <div class="choice" >
                            <ul id="prodOptAdd" class="prodOptAdd hidden">
                                <li class="clearfix">
                                    <em>Ivory/(090)S</em>
                                    <div class="plusminus_wrap" id="plusminusWrap">
                                        <input type="text" id="prodAmount" name="pr_count" maxlength="2" readonly="readonly" class="text"
                                               title="수량설정" value="1">
                                        <button type="button" class="numbtn_minus" id="btnMinus">
                                            <span class="blind">수량감소</span>
                                        </button>
                                        <button type="button" class="numbtn_plus" id="btnPlus" stock="5">
                                            <span class="blind">수량증가</span>
                                        </button>
                                    </div>
                                    <p class="price">
                                        <strong id="prodPrice">42900 </strong> 원
                                    </p>
                                    <a href="#" class="delete" name="btnDelChoiceItem" id="btnDelChoiceItem"></a>
                                </li>
                            </ul>
                        </div>
                        <div class="total_price" id="add_opt_guide" >
                            <div class="total">
                                <div class="ttl">합계</div>
                                <div class="won"><strong id="totPrice">0</strong>원</div>
                            </div>
                            <div class="delivery mb_17" style="display: none;" id="delivery_price_guide">
                                <div class="ttl"><span class="icon_delivery">배송비</span></div>
                                <div class="won">
                                    <p class="tooltip"><span class="blind">?</span>
                                        <span class="text">
                                            <strong>배송비</strong>
                                            구매 금액이 3만원 이상일 경우 무료 배송,<br>미만일 경우 2,500원이 부과 됩니다.
                                        </span>
                                    </p>
                                </div>
                            </div>
                            <div class="delivery mb_30" style="display: none;" id="credit_benifit_guide">
                                <div class="ttl"><span class="icon_credit">카드혜택</span></div>
                                <div class="won"><a href="javascript:;" id="btnBenifitCard">자세히 보기</a></div>
                            </div>
                            <div class="pr_btn_area">
                                <a href="#" class="btn_ty_bline md fl" id="goBasket">장바구니</a>
                                <a href="#" class="btn_ty_rface md fr" >구매하기</a>
                            </div>
                            <p class="noti mb_30">* 주문/배송/반품 등 일반 문의는 1:1 문의를 이용해 주시기 바랍니다.</p>
                        </div>
                    </div>
                </div>
                <!-- // pr_option -->
                </div>
            <a href="#" class="close" id="btnLayerPopupClose">
                <img src="/images/btn_pop_close.png" alt="팝업 닫기"></a>
        </div>
    </div>
    <!--// pop02 -->

    <!-- pop03 -->
    <div class="dimm_pop hidden" id="uploadPopupDimmed" style="position: fixed;"></div>
    <div class="layer_pop w900 hidden" style="position: absolute; top: 10px; left: 0px;" id="uploadView">

        <div class="pop_inner">
            <div>
                <strong class="upload_item">상품 업로드</strong>
            </div>
            <div class="contents question11">
                <ul class="sub_info">
                    <li>* 본 사이트는 단품 등록만 가능합니다. </li>
                    <li>* 상품 이미지 크기는 이래야한다.  </li>
                    <li>* 상품 이름은 이런식으로 지으면 안된다. </li>
                </ul>

                <!-- FormArea -->
                <div class="form_area" id="item-Upload" >
                    <form id="upload-form" method="post" enctype="multipart/form-data">
                        <fieldset>
                            <legend>상품 업로드 양식</legend>
                            <div class="row">
                                <label for="srch_file" class="ftit">상품 이미지</label>
                                <div class="fdata">
                                    <div class="file">
                                        <input id="srch_file" type="text" value="" title="파일명" class="ip_text" readonly="">
                                        <em class="btn_ty_form">파일찾기 <input type="file" title="파일찾기" name="up_file" id="up_image"></em>
                                    </div>
                                    <em class="ip_info point_g" style="margin-bottom:0">이미지 사이즈 760px / jpg, png 파일만 등록 가능합니다.</em>
                                </div>
                            </div>
                            <div class="row">
                                <label class="ftit">상품 이름</label>
                                <div class="fdata">
                                    <input type="text" name="up_name" class="ip_text" maxlength="30" placeholder="상품 이름은 최대 30자까지 가능합니다.">
                                </div>
                            </div>
                            <div class="row">
                                <label class="ftit">상품 코드</label>
                                <div class="fdata">
                                    <input type="text" name="up_code" class="ip_text" maxlength="100"
                                            placeholder="상품 코드를 입력해주세요.">
                                </div>
                            </div>
                            <div class="row">
                                <label class="ftit">상품 색상</label>
                                <div class="fdata">
                                    <span class="select_box" style="width:200px">
                                        <select id="upload-kind" name="up_color" title="색상계열 분류">
                                            <option value="">선택</option>
                                            <option value="White">White</option>
                                            <option value="Ivory">Ivory</option>
                                            <option value="Light-Yellow">Light-Yellow</option>
                                            <option value="Yellow">Yellow</option>
                                            <option value="Light-Brown">Light-Brown</option>
                                            <option value="Brown">Brown</option>
                                            <option value="Dark-Brown">Dark-Brown</option>
                                            <option value="Red">Red</option>
                                            <option value="Orange">Orange</option>
                                            <option value="Light-Green">Light-Green</option>
                                            <option value="Green">Green</option>
                                            <option value="Dark-Green">Dark-Green</option>
                                            <option value="Light-Blue">Light-Blue</option>
                                            <option value="Blue">Blue</option>
                                            <option value="Navy">Navy</option>
                                            <option value="Violet">Violet</option>
                                            <option value="Pink">Pink</option>
                                            <option value="Light-Gray">Light-Gray</option>
                                            <option value="Gray">Gray</option>
                                            <option value="Charcoal">Charcoal</option>
                                            <option value="Black">Black</option>
                                        </select>
                                    </span>
                                </div>
                            </div>
                            <div class="row">
                                <label class="ftit">상품 사이즈</label>
                                <div class="fdata">
                                    <span class="select_box" style="width:200px">
                                        <select id="upload-kind" name="up_size" title="사이즈 분류" >
                                            <option value="">선택</option>
                                            <option value="XS">XS</option>
                                            <option value="S">S</option>
                                            <option value="M">M</option>
                                            <option value="L">L</option>
                                            <option value="XL">XL</option>
                                        </select>
                                    </span>
                                </div>
                            </div>
                            <div class="row">
                                <label class="ftit">상품 금액</label>
                                <div class="fdata">
                                    <input type="text" name="up_price" class="ip_text" maxlength="30"
                                            placeholder="'원' 을 제외한 상품 금액을 숫자로 입력해주세요.   ex) 10000 ">
                                </div>
                            </div>
                        </fieldset>
                    </form>
                </div>
                <!-- // FormArea -->
                <div class="btn_area">
                    <a href="#" id="UploadItemBtn" class="btn_ty_bface sm">등록하기</a>
                </div>
            </div>
            <button type="button" class="close" id="btnUploadPopupClose">
                <img src="/images/btn_pop_close.png" alt="팝업 닫기">
            </button>
        </div>
    </div>
    <!--// pop03 -->

    <%@include file="../header.jsp" %>
    <div class="container" style="padding-top: 0px;">
        <div class="contents">

            <!-- category title -->
            <div class="category_title" data-depth="3">
            <span><a href="#">남성정장</a></span>
            <h2>캐주얼 정장</h2>
            </div>
            <!-- //category title -->

            <!-- filter -->
            <div class="filter">
                <ul class="filter_title">
                    <!-- [D] 선택한 옵션의 선택 항목 개수 표시 : 주석처리 -->
                    <li><a href="#"><span class="tit">ITEM <span id="itemCnt" data-count="1">(1)</span> </span></a></li>
                    <li><a href="#"><span class="tit">COLOR <span id="colorCnt" data-count="0">(0)</span> </span></a></li>
                    <li><a href="#"><span class="tit">SIZE <span id="sizeCnt" data-count="0">(0)</span> </span></a></li>
                    <li><a href="#"><span class="tit">PRICE <span id="priceCnt" data-count="0">(0)</span> </span></a></li>
                </ul>
            </div>
            <!-- //filter -->

            <!-- gathering & sorting -->
            <div class="option_area">
            <div class="gathering">
                <ul>
                    <li class="on"><a href="javascript:;">전체 <span>(98)</span></a></li>
                </ul>
            </div>
            <div class="sorting">
                <span class="select_box" style="width:221px">
                    <select title="정렬" name="resultSort" id="resultSort">
                        <option data-desc="" value="" selected="selected">전체</option>
                        <option data-desc="newRelease" value="01">신상품순</option>
                        <option data-desc="popular" value="02">인기순</option>
                        <option data-desc="highPrice" value="03">낮은 가격순</option>
                        <option data-desc="lowPrice" value="04">높은 가격순</option>
                        <option data-desc="highGrade" value="05">높은 평점순</option>
                        <option data-desc="rowGrade" value="06">낮은 평점순</option>
                    </select>
                </span>
            </div>
            </div>
            <!-- //gathering & sorting -->

            <!-- 리스트 목록 -->
            <div class="list_area" id="item-list">
                <form method="post">
                <ul class="goods_list02" id="ulList">
                    <li>
                        <a id="productImg" class="pro_area">
                            <img src="/images/product/suit01-475px.jpg" alt="클래식 정장 자켓" class="img_goods" name="image_id">
                            <div class="badge">
                                <img src="/images/new-badge.png" alt="new">
                                <img src="/images/best-badge.png" alt="best">
                            </div>
                            <p class="trade_name">클래식 정장 자켓</p>
                            <div class="price">
                                <p>46,900<span>원</span></p>
                            </div>
                            <div class="chkBox">자세히 보기</div>
                        </a>
                    </li>
                </ul>
                </form>
                <div class="button-wrapper-item center">
                    <div class="object-page-number-button selected">1</div>
                    <div class="object-page-number-button">2</div>
                    <div class="object-page-number-button">3</div>
                </div>
            </div>
            <!-- //리스트 목록 -->
            <% if (userVo != null && userVo.isAdmin()) { %>
            <a id="btnUpload" class="btn_ty_bface lg uploadBtn">상품 업로드</a>
            <% } %>
        </div>
    </div>
    <%@include file="../footer.jsp" %>
</div>
</body>
</html>