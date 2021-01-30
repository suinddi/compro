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
    <script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/classic/ckeditor.js"></script>
    <script defer src="/scripts/common.js"></script>
    <script defer src="/scripts/board.js"></script>
</head>
<body>

    <div class="wrap">
    <!-- pop01 -->
        <div class="dimm_pop hidden" id="layerPopupDimmed02" style="position: fixed;"></div>
        <div class="layer_pop w700 hidden" id="articlePopupLayer" style="position: absolute; top: 191.5px; left: 0px;">
            <div class="pop_inner">
                <div class="title_pop700">
                    <strong>공지사항</strong>
                </div>
                <div class="contents">
                    <!-- FormArea -->
                    <form method="post" name="articleForm">
                        <input type="hidden" id="articleIndex" name="articleIndex">
                        <div class="form_area article">
                            <fieldset>
                                <div class="row">
                                    <div class="fdata" id="article-content">
                                        게시글 내용입니다.
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </form>
                    <!-- // FormArea -->
                </div>
                <button type="button" id="btnLayerPopupClose" class="close">
                    <img src="/images/btn_pop_close.png" alt="팝업 닫기">
                </button>
            </div>
        </div>
        <!--// pop01 -->

        <!-- pop02 -->
        <div class="dimm_pop hidden" id="uploadPopupDimmed" style="position: fixed;"></div>
        <div class="layer_pop w900 hidden" style="position: absolute; top: 10px; left: 0px;" id="uploadView">
            <div class="pop_inner">
                <div>
                    <strong class="upload_item">게시글 업로드</strong>
                </div>
                <div class="contents question11">
                    <ul class="sub_info">
                        <li>* 게시글 제목은 30자 내외로 작성해주세요.</li>
                        <li>* 게시글 내용은 1000자 내외로 작성해 주세요.</li>
                    </ul>
                    <!-- FormArea -->
                    <div class="form_area" id="item-Upload" >
                        <form id="write-form" method="post" enctype="multipart/form-data">
                            <fieldset>
                                <legend>게시글 업로드</legend>
                                <div class="row">
                                    <label class="ftit">글 제목</label>
                                    <div class="fdata">
                                        <input type="text" name="article_title" class="ip_text" maxlength="30" placeholder="글 제목을 30자 내외로 입력해 주세요.">
                                    </div>
                                </div>
                                <div class="row">
                                    <label class="ftit">글 구분</label>
                                    <div class="fdata">
                                        <span class="select_box" style="width:200px">
                                            <select id="upload-kind" name="article_kind" title="게시글 분류">
                                                <option value="">선택</option>
                                                <option value="공지">공지</option>
                                                <option value="이벤트">이벤트</option>
                                            </select>
                                        </span>
                                    </div>
                                </div>
                                <div class="row">
                                    <label class="ftit">글 내용</label>
                                    <div class="fdata">
                                        <textarea id="register-content" name="article_content" class="textarea" cols="30" rows="13"
                                        maxlength="10000" placeholder="※ 텍스트 에디터를 활용해 보세요."></textarea>
                                    </div>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                    <!-- // FormArea -->
                    <div class="btn_area">
                        <a href="#" id="insertArticle" class="btn_ty_bface sm">등록하기</a>
                        <a href="#" id="cancelArticle" class="btn_ty_bline sm">취소하기</a>
                    </div>
                </div>
                <button type="button" class="close" id="btnUploadPopupClose">
                    <img src="/images/btn_pop_close.png" alt="팝업 닫기">
                </button>
            </div>
        </div>
        <!--// pop02 -->

        <%@include file="../header.jsp" %>
        <div class="container">
            <div class="contents">
                <!-- my_wrap -->
                <div class="my_wrap">
                <!-- lnb -->
                    <div class="lnb">
                        <h2>SUPPORT</h2>
                        <div class="category">
                            <strong class="tit">NEED HELP</strong>
                            <ul>
                                <li class=""><a href="">고객센터</a></li>
                                <li class=""><a href="">FAQs</a></li>
                                <li class="on"><a href="">공지사항</a></li>
                                <li class=""><a href="">1:1 문의</a></li>
                            </ul>
                        </div>
                        <div class="category">
                            <strong class="tit">INFORMATION</strong>
                            <ul>
                                <li class=""><a href="">온라인 회원 등급 안내</a></li>
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
                            <h3 class="page_tit">공지사항</h3>
                        </div>
                        <!-- 공지사항 리스트 -->
                        <div class="tbl_y" id="article-list">
                            <table class="basic table">
                                <caption>공지사항 리스트</caption>
                                <colgroup>
                                    <col style="width:65%">
                                    <col style="width:12%">
                                    <col style="width:12.5%">
                                    <col style="width:10.5%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col">제목</th>
                                        <th scope="col">구분</th>
                                        <th scope="col">등록일</th>
                                        <th scope="col">조회수</th>
                                    </tr>
                                </thead>
                                <tbody id="tbodyList" class="board-list">
                                    <tr>
                                        <td class="title"><a href="#">제목</a></td>
                                        <td>구분</td>
                                        <td>2020-10-12</td>
                                        <td>조회수</td>
                                        <td class="content">내용</td>
                                    </tr>
                                    <tr>
                                        <td class="title"><a href="#">제목</a></td>
                                        <td>구분</td>
                                        <td>2020-10-10</td>
                                        <td>조회수</td>
                                        <td class="content">내용</td>
                                    </tr>
                                    <tr>
                                        <td class="title"><a href="#">제목</a></td>
                                        <td>구분</td>
                                        <td>2020-10-10</td>
                                        <td>조회수</td>
                                        <td class="content">내용</td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="button-wrapper-item center">
                                <div class="object-page-number-button selected">1</div>
                                <div class="object-page-number-button">2</div>
                                <div class="object-page-number-button">3</div>
                            </div>
                        </div>
                        <!-- // 공지사항 리스트 -->
                        <% if (userVo != null && userVo.isAdmin()) { %>
                        <a id="btnUpload" class="btn_ty_bface lg uploadBtn">글 쓰기</a>
                        <% } %>
                    </div>
                    <!-- // my_cont -->
                </div>
                <!--// my_wrap -->
            </div>
        </div>
        <!--// container-->
        <%@include file="../footer.jsp" %>
    </div>
</body>
</html>