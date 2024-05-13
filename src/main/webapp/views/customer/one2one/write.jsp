<%--
  Created by IntelliJ IDEA.
  User: hayoung
  Date: 2024/04/16
  Time: 8:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>1:1문의</title>

  <!-- Main CSS : Header, Main, Footer -->
  <link rel="stylesheet" href="<c:url value="/css/customer/customer01.css"/>">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
  <!-- Bootstarp JS -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>


  <script>
    function submit() {
      if (confirm("1:1 문의를 등록하시겠습니까?") == true){
        let form = document.questionForm;
        form.submit();
        alert('등록되었습니다.');
      } else return;
    }

    function cancel() {
      if (confirm("작성하신 내용은 저장되지 않습니다.\n취소하시겠습니까?") == true){
        location.href="<c:url value="/"/>";
      } else return;
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
        <p><img src="<c:url value="/img/icon-home.png"/>"> > 고객지원 > 1:1문의</p>
      </div>
    </div>
  </div>
</div>
<!-- COMMON - 드랍다운 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="<c:url value="/"/>"><button class="homeBtn">H</button></a>
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
        1:1문의
      </a>
      <ul class="dropdown-menu asd">
        <li><a class="dropdown-item" href="<c:url value="/customer/one2one/write"/>">1:1문의</a></li>
        <li><hr class="dropdown-divider"></li>
        <li><a class="dropdown-item" href="<c:url value="/customer/qna"/>">묻고답하기</a></li>
        <li><hr class="dropdown-divider"></li>
        <li><a class="dropdown-item" href="#">FAQ</a></li>
      </ul>
    </li>
  </ul>
  </div>
</nav>

<!-- 1:1문의 -->
<div class="communitySection2 container text-center">
  <div>
    <div>1:1문의</div>
    <div>The design and maintenance are excellent.</div>
  </div>
  <div class="question">
    <form action="/customer/one2one/writeimpl" name="questionForm">
      <table>
        <tr>
          <td>구분</td>
          <td><select name="cate">
            <option value="1">로그인</option>
            <option value="2">회원가입</option>
            <option value="3">이용안내</option>
          </select>
          </td>
        </tr>
        <tr>
          <td>성명</td>
          <td><input type="text" class="inputStyle1" name="one2oneName"></td>
        </tr>
        <tr>
          <td>전화번호</td>
          <td><input type="text" class="inputStyle1" name="one2onePhone"></td>
        </tr>
        <tr>
          <td>이메일</td>
          <td><input type="text" class="inputStyle2" name="one2oneEmail"></td>
        </tr>
        <tr>
          <td>주소</td>
          <td><input type="text" class="inputStyle2" name="one2oneAddress"></td>
        </tr>
        <tr>
          <td>제목</td>
          <td><input type="text" class="inputStyle2" name="one2oneTitle"></td>
        </tr>
        <tr>
          <td>설명</td>
          <td><textarea name="one2oneContent" rows="10" style="width: 90%;"></textarea></td>
        </tr>
      </table>
    </form>
  </div>
  <div class="btn">
    <button id="btn_confirm" type="button" onclick="submit()">등록</button>
    <button id="btn_cancel" type="button" onclick="cancel()">취소</button>
  </div>
</div>

<!-- 푸터 -->
<div id="footer"></div>
</body>
</html>