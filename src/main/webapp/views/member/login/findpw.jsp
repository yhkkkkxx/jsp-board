<%--
  Created by IntelliJ IDEA.
  User: hayoung
  Date: 2024/04/16
  Time: 8:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    let findpw = {
        init: function () {
        }
    };
    $(function () {
        findpw.init();
    });
</script>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>회원비밀번호 찾기</title>

  <link rel="stylesheet" href="<c:url value="/css/member/passwordFind.css"/>">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
  <!-- Bootstarp JS -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</head>
<body>
<div class="main">
  <c:choose>
    <c:when test="${not empty findPw}">
      <table>
        <tr><td colspan="2">비밀번호 찾기 결과</td></tr>
        <tr></tr>
        <tr><td colspan="2">회원님의 비밀번호는 ${findPw} 입니다.</td></tr>
        <tr></tr>
        <tr></tr>
      </table>
    </c:when>
    <c:otherwise>
      <form action="/member/login/findpwimpl" name="pwFindForm">
        <table>
          <tr>
            <td colspan="2">비밀번호 찾기</td>
          </tr>
          <tr>
            <td colspan="2">비밀번호를 잊어버리셨나요?
              <br>회원님의 성명과 아이디,이메일을 입력하여 주세요.</td>
          </tr>
          <tr>
            <td id="input_name" style="width: 20%;">
              &nbsp;· 이름<br/>&nbsp;· 아이디<br/>&nbsp;· 이메일
<%--              <img src="<c:url value="/img/member/txt_join1.gif"/>">--%>
<%--              <img src="<c:url value="/img/member/txt_login_01.gif"/>">--%>
<%--              <img src="<c:url value="/img/member/txt_email.gif"/>">--%>
            </td>
            <td style="width: 80%;">
              <input type="text" name="userName"><br/>
              <input type="text" class="idText" name="userID"><br/>
              <input type="text" class="emailText" name="userEmail">
            </td>
          </tr>
<%--          <tr>--%>
<%--            <td></td>--%>
<%--            <td>${notFound}</td>--%>
<%--          </tr>--%>
        </table>
        <div>${notFound}</div>
        <div>
          <button id="btn_confirm" type="button" onclick="document.pwFindForm.submit()">확인</button>
<%--          <input type="image" src="<c:url value="/img/member/btn_confirm.gif"/>" onclick="document.pwFindForm.submit()">--%>
        </div>
      </form>
    </c:otherwise>
  </c:choose>
  <div>
    <button id="btn_cancel" type="button" onclick="window.close()"><span id="x">x</span> 닫기</button>
  </div>
<%--    <input type="image" src="<c:url value="/img/member/btn_close.gif"/>" onclick="window.close()"></div>--%>
</div>
<script>
  function submit() {
    var form = document.passwordFindForm;

    form.submit();
  }
</script>
</body>
</html>