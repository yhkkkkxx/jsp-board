<%--
  Created by IntelliJ IDEA.
  User: hayoung
  Date: 2024/04/16
  Time: 5:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!-- Main CSS : Header, Main, Footer -->
<link rel="stylesheet" href="<c:url value="/css/main.css"/>">
<link rel="stylesheet" href="<c:url value="/css/common.css"/>">
<link rel="stylesheet" href="<c:url value="/css/community.css"/>">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
      integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
      crossorigin="anonymous"/>
<!-- Bootstarp JS -->
<script
        src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"
></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
        crossorigin="anonymous"
></script>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Hahmlet:wght@100..900&display=swap');
    @import url('https://fonts.googleapis.com/css2?family=Gowun+Dodum&family=Hahmlet:wght@100..900&display=swap');
    * {
        /*font-family: "Hahmlet", serif;*/
        /*font-optical-sizing: auto;*/
        /*font-weight: <weight>;*/
        /*font-style: normal;*/

        font-family: "Gowun Dodum", sans-serif;
        font-weight: 400;
        font-style: normal;
    }
</style>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>rlagkdud 사무소</title>


    <!-- Bootstrap CSS -->
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
            integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
            crossorigin="anonymous"
    />
    <!-- Bootstarp JS -->
    <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
            crossorigin="anonymous"
    ></script>
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
            crossorigin="anonymous"
    ></script>

</head>
<body>
<!-- header -->
<div class="toTopScroll">
    <img src="<c:url value="/img/icon-top.png"/>./img/icon-top.png" onClick="javascript:window.scrollTo(0,0)">
</div>
<div class="top d-none d-md-block">
    <div class="topMenu d-none d-md-block container">
        <span class="home"><a href="<c:url value="/"/>">HOME</a></span>
        <c:choose>
            <c:when test="${empty sessionScope.member_id}">
                <span><a href="<c:url value="/member/login"/>">LOGIN</a></span>
                <span><a href="<c:url value="/member/join/beforejoin"/>">JOIN</a></span>
            </c:when>
            <c:otherwise>
                <span><a href="<c:url value="/member/logoutimpl"/>" onclick="return confirm('로그아웃 하시겠습니까?');">LOGOUT</a></span>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<!-- navbar -->
<nav class="navbar navbar-expand-md navbar-light bg-white sticky-top">
    <div class="container">
        <a class="navbar-brand" href="<c:url value="/"/>"><img src="<c:url value="/img/logo.png"/>" alt="로고"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse"
                data-target="#collapsibleNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="collapsibleNavbar">
            <!-- ml-auto : margin-left  -->
            <ul class="navbar-nav ml-auto">
                <!-- d-block : display: block  display: none -->
                <li class="nav-item d-sm-block d-md-none ljoin">
                    <a href="./member/login.html"> <img src="./img/icon-member.png">&nbsp;&nbsp;Login</a>&nbsp;
                    <a href="./member/join.html"> <img src="./img/icon-join.png">&nbsp;&nbsp;Join</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link" href="#">회사소개</a>
                    <div class="dropdown-content">
                        <a href="./company/company01.html">회사개요</a>
                        <a href="#">CEO인사말</a>
                        <a href="./company/company03.html">오시는길</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link" href="#">사업분야</a>
                    <div class="dropdown-content">
                        <a href="./business/business01.html">사업분야01</a>
                        <a href="#">사업분야02</a>
                        <a href="#">사업분야03</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link" href="#">제품안내</a>
                    <div class="dropdown-content">
                        <a href="./product/product01.html">제품안내01</a>
                        <a href="#">제품안내02</a>
                        <a href="#">제품안내03</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link" href="#">커뮤니티</a>
                    <div class="dropdown-content">
                        <a href="<c:url value="/community/notice"/>">공지사항</a>
                        <a href="#">홍보자료</a>
                        <a href="#">채용안내</a>
                    </div>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link" href="#">고객지원</a>

                    <c:choose>
                        <c:when test="${not empty sessionScope.member_id}">
                            <div class="dropdown-content">
                                <a href="<c:url value='/customer/one2one/write'/>">1:1문의</a>
                                <a href="<c:url value='/customer/qna'/>">묻고답하기</a>
                                <a href="#">FAQ</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <!-- 세션에 member_id가 없을 때 다른 동작 -->
                            <div class="dropdown-content">
                                <a href="#" onclick="alert('로그인이 필요합니다.');">1:1문의</a>
                                <a href="#" onclick="alert('로그인이 필요합니다.');">묻고답하기</a>
                                <a href="#" onclick="alert('로그인이 필요합니다.');">FAQ</a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- center -->
<c:choose>
    <c:when test="${center == null}">
        <jsp:include page="main.jsp"/>
    </c:when>
    <c:otherwise>
        <jsp:include page="${center}.jsp"/>
    </c:otherwise>
</c:choose>



<!-- footer -->
<div class="footer">
    <div class="container text-center">
        <div>
            <a href="#">회사소개&nbsp;&nbsp;<span>|</span></a>
            <a href="#">개인정보보호정책&nbsp;&nbsp;<span>|</span></a>
            <a href="#">이메일무단수집거부&nbsp;&nbsp;<span>|</span></a>
            <a href="#">묻고답하기&nbsp;&nbsp;<span>|</span></a>
            <a href="#">오시는길&nbsp;&nbsp;<span>|</span></a>
        </div>
        <div>
      <span>회사 : 코딩강사 &nbsp; 주소 : 서울특별시 중구 명동 세종대로 110  &nbsp; 대표 : 홍길동 <br>
        고객지원 : 010-2222-3333, FAX : 070-888-5555, EMAIL : support@gmail.com, 사업자등록번호 : 100-02-00033, 통신판매업 : 제1111-경기-00000호<br>COPYRIGHT(C) 2021 CODINGGANSA. ALL RIGHT RESERVED.</span>
        </div>
        <div>
            <img src="<c:url value="/img/mf-icon01.png"/>" alt=""/>
            <img src="<c:url value="/img/mf-icon02.png"/>" alt="" />
            <img src="<c:url value="/img/mf-icon03.png"/>" alt="" />
            <img src="<c:url value="/img/mf-icon04.png"/>" alt="" />
        </div>
    </div>
</div>


<script>
    $(document).ready(function () {
        setTimeout(function () {
            $(".carousel").carousel({
                interval: 2000, //기본 5초
                keyboard: true, //키보드이벤트 설정
                pause: "hover", //마우스를 가져대면 자동 순환이 멈춘다.
                wrap: true, //순환설정
                touch: true, //왼쪽 오른쪽 드래그 설정
            });
        }, 1000);
    });
</script>
</body>
</html>
