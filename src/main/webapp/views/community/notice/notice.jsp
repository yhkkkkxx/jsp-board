<%--
  Created by IntelliJ IDEA.
  User: hayoung
  Date: 2024/04/16
  Time: 5:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>

    <!-- Main CSS : Header, Main, Footer -->
    <link rel="stylesheet" href="<c:url value="/css/community/community.css"/>">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <!-- Bootstarp JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

    <script>
        function searchby() {
            let op = $('#search_box option:selected').val();
            let txt = $('#search_txt').val();

            $.ajax({
               url:'<c:url value="/community/notice/searchby"/>',
               method:'post',
               data:{'op':op, 'txt':txt},
                success: function(response) {
                    let html = '';
                    html += `<tr> <th>번호</th> <th>제목</th> <th>작성일</th> </tr>`
                    response.forEach(function(n) {
                        html += '<tr>' +
                            '<td width="20%">' + n.noticeIdx + '</td>' +
                            '<td width="50%"><a href="/community/notice/detail?noticeidx=' + n.noticeIdx + '">' + n.noticeTitle + '</a></td>' +
                            '<td width="30%">' + formatDate(n.noticeDate) + '</td>' +
                            '</tr>';
                    });

                    $('#results').html(html);

                }

            });
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
<!-- 헤더 -->
<div id="headerTop"></div>
<div id="header" class="sticky-top"></div>

<!-- 메인 -->
<!-- 공지사항 -->
<!-- COMMON -->
<div class="commonSection1">
    <div class="commonContent1">
        <img src="<c:url value="/img/member/sub-visual02.jpg"/>"
             style="width: 100%; height: 100%;">
        <div class="commonContent2 text-center">
            <div>
                <h3>COMMUNITY</h3>
            </div>
            <div>
                <p><img src="<c:url value="/img/icon-home.png"/>"> > 커뮤니티 > 공지사항</p>
            </div>
        </div>
    </div>
</div>
<!-- COMMON - 드랍다운 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="../index.html"><button class="homeBtn">H</button></a>
    <ul class="navbar-nav mr-auto navbar-nav-scroll"
        style="max-height: 100px;">

        <li class="nav-item dropdown dropdownHide">
            <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button"
               data-toggle="dropdown" aria-expanded="false">
                커뮤니티
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                <li><a class="dropdown-item" href="#">회사소개</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">사업분야</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">제품안내</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">커뮤니티</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">고객지원</a></li>
            </ul>
        </li>

        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown"
               role="button" data-toggle="dropdown" aria-expanded="false">
                공지사항
            </a>
            <ul class="dropdown-menu asd">
                <li><a class="dropdown-item" href="../community/community01.html">공지사항</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">홍보자료</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="#">채용안내</a></li>
            </ul>
        </li>
    </ul>
    </div>
</nav>

<!-- 공지사항 -->
<div class="communitySection2 container text-center">
    <div>
        <div>공지사항</div>
        <div>The design and maintenance are excellent.</div>
    </div>
    <div class="Notice">
        <table id="results">
            <tr>
                <th width="20%">번호</th>
                <th width="50%">제목</th>
                <th width="30%">작성일</th>
            </tr>
            <c:forEach var="n" items="${notices}">
                <tr>
                    <td>${n.noticeIdx}</td>
                    <td><a href="<c:url value="/community/notice/detail"/>?noticeidx=${n.noticeIdx}">${n.noticeTitle}</a></td>
                    <td>
                        <fmt:formatDate value="${n.noticeDate}" pattern="yyyy-MM-dd" var="formattedDate"/>
                            ${formattedDate}
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>


<!-- search bar -->
<div class="search container">
    <table id="table_search">
        <tr>
            <td>
                <select id="search_box">
                    <option value="0" name="notice_title">제목</option>
                    <option value="1" name="notice_content">내용</option>
                </select>
            </td>
            <td>
                <input id="search_txt" type="text">
            </td>
            <td>
                <button id="btn_search" onclick="searchby()">🔍</button>
<%--                <input type="image" src="<c:url value="/img/community/search.gif"/>" onclick="searchby()"/>--%>
            </td>
        </tr>
    </table>
</div>

<!-- 푸터 -->
<div id="footer"></div>
</body>
</html>