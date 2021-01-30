<%@ page language="java" pageEncoding="UTF-8" contentType="text/html" trimDirectiveWhitespaces="true"%>
<%@ page import = "com.webproject.compro.web.vos.UserVo" %>
<%
Object userVoObject = session.getAttribute("UserVo");
UserVo userVo = userVoObject instanceof UserVo ? (UserVo) userVoObject : null;
%>
<div class="header on">
    <div class="top_menu">
        <div class="inner">
            <a href="#" class="mynb">
                About Project
            </a>
            <a href="#" class="made">
                About more
            </a>
            <ul class="clearfix">
                <li><a href="/faq">FAQ</a></li>
                <li><a href="/mybasket">장바구니</a></li>
                <li><a href="/mypage">마이페이지</a></li>
            </ul>
        </div>
    </div>
    <!--// top_menu -->
    <div class="gnb">
        <div class="inner">
            <h1 class="logo">
                <a href="/">MOCLO</a>
            </h1>
            <div class="menu">
                <ul class="clearfix">
                    <li class="nav">
                        <a href="/concept" class="menu_tit">CONCEPT</a>
                    </li>
                    <!--// CONCEPT -->
                    <li class="nav">
                        <a href="/product" class="menu_tit">PRODUCT</a>
                    </li>
                    <!--// PRODUCT -->
                    <li class="nav">
                        <a href="/board" class="menu_tit">BOARD</a>
                    </li>
                    <!--// BOARD -->
                    <li class="nav">
                        <a href="/contact" class="menu_tit">CONTACT</a>
                    </li>
                    <!--// CONTACT -->
                </ul>
            </div>
            <!--// menu -->
            <div class="customer">
                <div class="mymenu">
                    <% if (userVo == null) { %>
                    <a href="/login">로그인</a>
                    <a href="/register" id="user-menu-register">회원가입</a>
                    <% } else { %>
                    <a><strong><%= userVo.getNickName() %></strong> 님 환영합니다</a>
                    <a href="/logout">로그아웃</a>
                    <% } %>
                </div>
            </div>
            <!--// customer -->
        </div>
    </div>
    <!--// gnb -->
</div>