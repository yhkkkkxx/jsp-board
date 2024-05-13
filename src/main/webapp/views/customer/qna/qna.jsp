<%--
  Created by IntelliJ IDEA.
  User: hayoung
  Date: 2024/04/16
  Time: 8:31 PM
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
  <title>묻고답하기</title>

  <!-- Main CSS : Header, Main, Footer -->
  <link rel="stylesheet" href="<c:url value="/css/customer/customer02.css"/>">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
  <!-- Bootstarp JS -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>


  <script>
    function openWindow(no){
      window.open('<c:url value="/customer/qna/checkpw"/>?no='+no, '비밀번호확인', 'width=430,height=300')
    }

    function searchby() {
      let op = $('#search_box option:selected').val();
      let txt = $('#search_txt').val();

      $.ajax({
        url:'<c:url value="/customer/qna/searchby"/>',
        method:'post',
        data:{'op':op, 'txt':txt},
        success: function(response) {
          console.log("hhh");
          let html = '';
          html += `<tr> <th>번호</th> <th>제목</th> <th>작성자</th> <th>작성일</th> </tr>`
          response.forEach(function(q) {
            html += '<tr>' +
                    '<td width="15%">' + q.qnaIdx + '</td>' +
                    '<td width="50%"><a href="#" onclick="window.open(\'/customer/qna/checkpw?qnaidx=' + q.qnaIdx + '\', \'비밀번호확인\', \'width=430,height=330,location=no,status=no,scrollbars=no\'); return false;"><img src="/img/customer/icon_sct.gif" alt="Icon">' + q.qnaTitle + '</a></td>' +
                    '<td width="15%">' + q.qnaName + '</td>' +
                    '<td width="20%">' + formatDate(q.qnaDate) + '</td>';
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
<!-- 1:1문의 -->
<!-- COMMON -->
<div class="commonSection1">
  <div class="commonContent1">
    <img src="<c:url value="/img/member/sub-visual02.jpg"/>"
         style="width: 100%; height: 100%;">
    <div class="commonContent2 text-center">
      <div>
        <h3>COSTOMER</h3>
      </div>
      <div>
        <p><img src="<c:url value="/img/icon-home.png"/>"> > 고객지원 > 묻고답하기</p>
      </div>
    </div>
  </div>
</div>
<!-- COMMON - 드랍다운 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href=".<c:url value="/"/>"><button class="homeBtn">H</button></a>
  <ul class="navbar-nav mr-auto navbar-nav-scroll"
      style="max-height: 100px;">

    <li class="nav-item dropdown dropdownHide">
      <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button"
         data-toggle="dropdown" aria-expanded="false">
        고객지원
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
        묻고답하기
      </a>
      <ul class="dropdown-menu asd">
        <li><a class="dropdown-item" href="<c:url value="/customer/inquiry/write"/>">1:1문의</a></li>
        <li><hr class="dropdown-divider"></li>
        <li><a class="dropdown-item" href="<c:url value="customer/qna"/>">묻고답하기</a></li>
        <li><hr class="dropdown-divider"></li>
        <li><a class="dropdown-item" href="#">FAQ</a></li>
      </ul>
    </li>
  </ul>
  </div>
</nav>

<!-- 묻고답하기 -->
<div class="communitySection2 container text-center">
  <div>
    <div>묻고답하기</div>
    <div>The design and maintenance are excellent.</div>
  </div>
  <div class="qna">
    <table id="results">
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
      </tr>
      <c:forEach var="q" items="${qnas}">
        <tr width="15%">
          <td>${q.qnaIdx}</td>
          <td width="50%">
            <a href="#" onclick="window.open('<c:url value='/customer/qna/checkpw'/>?qnaidx=${q.qnaIdx}', '비밀번호확인', 'width=430,height=330,location=no,status=no,scrollbars=no'); return false;">
              <img src="<c:url value="/img/customer/icon_sct.gif"/>">
                ${q.qnaTitle}
            </a>
          </td>
          <td width="15%">${q.qnaName}</td>
          <td width="20%">
            <fmt:formatDate value="${q.qnaDate}" pattern="yyyy-MM-dd" var="formattedDate"/>
              ${formattedDate}
          </td>
        </tr>
      </c:forEach>
    </table>
  </div>
</div>

<!-- search bar -->
<%--<div class="search container">--%>
<%--  <div class="search container">--%>
<%--    <div>--%>
<%--      <img onclick="window.location.href='<c:url value="/customer/qna/write"/>'"--%>
<%--           src="<c:url value="/img/customer/write.gif"/>">--%>
<%--    </div>--%>
<%--  <table id="table_search">--%>
<%--    <tr>--%>
<%--      <td>--%>
<%--        <select id="search_box">--%>
<%--          <option value="0" name="notice_title">제목</option>--%>
<%--          <option value="1" name="notice_content">내용</option>--%>
<%--          <option value="2" name="notice_content">작성자</option>--%>
<%--        </select>--%>
<%--      </td>--%>
<%--      <td>--%>
<%--        <input id="search_txt" type="text">--%>
<%--      </td>--%>
<%--      <td>--%>
<%--        <button id="btn_search" onclick="searchby()">🔍</button>--%>
<%--        &lt;%&ndash;                <input type="image" src="<c:url value="/img/community/search.gif"/>" onclick="searchby()"/>&ndash;%&gt;--%>
<%--      </td>--%>
<%--    </tr>--%>
<%--  </table>--%>
<%--</div>--%>

<!-- search bar -->
<div class="search container">
  <table id="table_search">
    <tr>
      <td>
        <select name="내용" id="search_box">
          <option value="0" name="notice_title">제목</option>
          <option value="1" name="notice_content">내용</option>
          <option value="2" name="notice_content">작성자</option>
        </select>
      </td>
      <td>
        <input id="search_txt" type="text">
      </td>
      <td id="search">
<%--        <input type="image" src="<c:url value="/img/customer/search.gif"/>" onclick="searchby()">--%>
        <button id="btn_search" onclick="searchby()">🔍</button>
      </td>
      <td>
        <div id="btn">
          <button id="btn_write" type="button" onclick="window.location.href='<c:url value="/customer/qna/write"/>'">글쓰기</button>
        </div></td>
    </tr>
  </table>
</div>

<!-- 푸터 -->
<div id="footer"></div>

</body>
</html>