<%--
  Created by IntelliJ IDEA.
  User: hayoung
  Date: 2024/04/16
  Time: 8:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<c:url value="/css/admin/admin.css"/>">

<!DOCTYPE html>
<html lang="en">
<head>
    <title>회사홈페이지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/common.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <!-- Bootstarp JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <script>
        function searchby() {
            let op = $('#search_box option:selected').val();
            let txt = $('#search_txt').val();
            $('#sort_box').val("none");
            $('#listup_box').val("0");

            $.ajax({
                url:'<c:url value="/admin/member/searchby"/>',
                method:'post',
                data:{'op':op, 'txt':txt},
                success: res => success(res)
            });
        }
        function sortby() {
            let op = $('#sort_box option:selected').val();
            $('#search_txt').val("");
            $('#listup_box').val("0");

            $.ajax({
                url:'<c:url value="/admin/member/sortby"/>',
                method:'post',
                data:{'op':op},
                success: res => success(res)
            });
        }
        function listup() {
            let op = $('#listup_box option:selected').val();
            $('#search_txt').val("");
            $('#sort_box').val("none");

            $.ajax({
                url:'<c:url value="/admin/member/listup"/>',
                method:'post',
                data:{'op':op},
                success: res => success(res)
            });
        }
        function success(res) {
            let html = '';
            html += `<tr> <th>아이디</th> <th>성명</th> <th>이메일</th> <th>생일</th> <th>가입일</th> <th>임시비밀번호</th> </tr>`
            res.forEach(function(m) {
                html += '<tr>' +
                    '<td>' + m.memberId + '</td>' +
                    '<td>' + m.memberName + '</td>' +
                    '<td>' + m.memberEmail + '</td>' +
                    '<td>' + formatDate(m.memberBirthDate) + '</td>' +
                    '<td>' + formatDate(m.memberJoinDate) + '</td>' +
                    '<td>-</td>' +
                    '</tr>';
            });
            $('#results').html(html);

        }
        function formatDate(date) {
            var d = new Date(date),
                month = '' + (d.getMonth() + 1),
                day = '' + d.getDate(),
                year = d.getFullYear();

            if (month.length < 2) month = '0' + month;
            if (day.length < 2) day = '0' + day;

            return [year, month, day].join('-');
        }
    </script>

</head>

<body>

<!-- 탑메뉴 -->
<div class="toTopScroll">
    <img src="/img/icon-top.png" onClick="javascript:window.scrollTo(0,0)">
</div>
<div class="top d-none d-md-block">
    <div class="topMenu d-none d-md-block container">
        <span class="home"><a href="/">HOME</a></span>

        <span><a href="/member/logoutAction">LOGOUT</a></span>


        <span><a href="/member/join">JOIN</a></span>
        <span><a href="/company/company03">CONTACT US</a></span>
    </div>
</div>

<!-- 메인 -->
<!-- COMMON -->

<div class="commonSection1">
    <div class="commonContent1">
        <img src="<c:url value="/img/member/sub-visual01.jpg"/>"
             style="width: 100%; height: 100%;">
        <div class="commonContent2 text-center">
            <div>
                <h3>관리자페이지</h3>
            </div>
            <div>
                <p><img src="<c:url value="/img/icon-home.png"/>"> > 관리자페이지</p>
            </div>
        </div>
    </div>
</div>

<div id="adminMain">
    <!-- 사이드메뉴 -->
    <div id="adminSide">
        <ul>
            <li><a href="<c:url value="/admin/member"/>" class="adminSideActive">회원 관리</a></li>
            <li><a href="<c:url value="/admin/notice"/>">공지사항 관리</a></li>
            <li><a href="<c:url value="#"/>">1:1문의 관리</a></li>
            <li><a href="<c:url value="#"/>">묻고답하기 관리</a></li>
            <li><a href="<c:url value="#"/>">FAQ 관리</a></li>
            <li><a href="<c:url value="#"/>">제품 관리</a></li>
        </ul>
    </div>
    <!-- 메인 -->
    <div id="adminSection">
        <div class="adminDiv">
            <h3>회원관리</h3>
        </div>
        <div class="adminDiv">
            검색 옵션
            <select id="search_box" onselect="searchby()">
                <option value="0">전체</option>
                <option value="1">아이디</option>
                <option value="2">성명</option>
                <option value="3">이메일</option>
            </select>
            <input type="text" name="search_keyword" id="search_txt">
            <input type="image" src="<c:url value="/img/community/search.gif"/>" onclick="searchby()">
        </div>
        <div class="adminDiv">
            정렬
            <select class="size" id="sort_box" onchange="sortby()">
                <option value="none" selected>=== 선택 ===</option>
                <option value="0">아이디 오름차순</option>
                <option value="1">아이디 내림차순</option>
                <option value="2">가입일 오름차순</option>
                <option value="3">가입일 내림차순</option>
            </select>
        </div>
        <div class="adminDiv2" id="tableTitle">
            <div>회원목록 ${n}건</div>
            <div>한페이지 행수
                <select class="size" id="listup_box" onchange="listup()">
                    <option value="0" selected>전체 보기</option>
                    <option value="1">5개만 보기</option>
                    <option value="2">10개만 보기</option>
                </select>
            </div>
        </div>
        <div class="">
            <table id="results" class="adminTable">
                <thead>
                <tr>
                    <th>아이디</th>
                    <th>성명</th>
                    <th>이메일</th>
                    <th>생일</th>
                    <th>가입일</th>
                    <th>임시비밀번호</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="m" items="${members}">
                    <tr>
                        <td>${m.memberId}</td>
                        <td>${m.memberName}</td>
                        <td>${m.memberEmail}</td>
                        <td>
                            <fmt:formatDate value="${m.memberBirthDate}" pattern="yyyy-MM-dd" var="formattedDate"/>
                                ${formattedDate}
                        </td>
                        <td>
                            <fmt:formatDate value="${m.memberJoinDate}" pattern="yyyy-MM-dd" var="formattedDate"/>
                                ${formattedDate}
                        </td>
                        <td>-</td>
                    </tr>
                </c:forEach>


                </tbody>
            </table>
        </div>

<%--        <div class="pageNav adminDiv2">--%>
<%--            <div> </div>--%>
<%--            <div>--%>
<%--                <a href="/admin_member?page=1">처음</a>--%>
<%--                <a href="/admin_member?page=1">이전</a>--%>
<%--                <a href="/admin_member?page=1">1</a>--%>
<%--                <a href="/admin_member?page=2">2</a>--%>
<%--                <a href="/admin_member?page=3">3</a>--%>
<%--                <a href="/admin_member?page=2">다음</a>--%>
<%--                <a href="/admin_member?page=3">마지막</a>--%>
<%--            </div>--%>
<%--            <div> </div>--%>
<%--        </div>--%>

    </div>
</div>




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


</body>
</html>