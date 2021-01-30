<%@ page language="java" pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>수제 양복점, 모던클로즈&reg;</title>
    <meta name="description" content="수제 양복점, 모던클로즈">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta property="og:title" content="Modern Clothes">
    <meta property="og:description" content="수제 양복점">
    <meta property="og:type" content="website">
    <link rel="stylesheet" type="text/css" href="/stylesheets/common.css">
    <link rel="stylesheet" type="text/css" href="/stylesheets/reset.css" >
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&subset=korean" rel="stylesheet">
</head>
<body>
    <div class="wrap main">
        <%@include file="header.jsp" %>
        <!--// header -->

        <div class="container">
            <div class="main_visual">
                <div class="bx-wrapper" style="max-width: 100%;">
                    <div class="bx-viewport">
                        <ul class="slide-wrap">
                            <li>
                                <img src="images/main-bg2-1280.jpg" alt="">
                            </li>
                            <li>
                                <img src="images/main-bg1-1920.jpg" alt="">
                            </li>
                            <li>
                                <img src="images/main-bg2-1280.jpg" alt="">
                            </li>
                        </ul>
                    </div>
                    <div class="bx-controls bx-has-pager bx-has-controls-direction bx-has-controls-auto">
                        <div class="bx-pager bx-default-pager">
                            <div class="bx-pager-item">
                                <a href="#" data-slide-index="0" class="bx-pager-link active">1</a>
                            </div>
                            <div class="bx-pager-item">
                                <a href="#" data-slide-index="1" class="bx-pager-link">2</a>
                            </div>
                            <div class="bx-pager-item">
                                <a href="#" data-slide-index="2" class="bx-pager-link">3</a>
                            </div>
                        </div>
                        <div class="bx-controls-direction">
                            <a class="bx-prev" href="">Prev</a>
                            <a class="bx-next" href="">Next</a>
                        </div>
                    </div>
                </div>
            </div>
            <!--// main_visual -->

            <div class="category">
                <div class="inner">
                    <div>
                        <a href="/product">
                            <em>SHOP ALL</em>
                            <span>ORDER</span>
                        </a>
                    </div>
                    <div>
                        <a href="/login">
                            <em>FASTER</em>
                            <span>DELIVERY</span>
                        </a>
                    </div>
                    <div>
                        <a href="/faq">
                            <em>DIRECT</em>
                            <span>FAQ</span>
                        </a>
                    </div>
                </div>
            </div>
            <!--// category -->
            
            <div class="collection">
                <div class="inner">
                    <div class="bg_area">
                    </div>
                </div>
            </div>
            <!--// collection -->
        </div>
        <!--// container -->

        <%@include file="footer.jsp" %>
        <!--// footer -->

    </div>
    <!--// wrap main -->
</body>
</html>