<%--
  Created by IntelliJ IDEA.
  User: hayoung
  Date: 2024/04/16
  Time: 5:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
    function submit() {
        let form = document.idFindForm;
        form.submit();
    }
</script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원아이디 찾기</title>

    <link rel="stylesheet" href="<c:url value="/css/member/idFind.css"/>">


    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <!-- Bootstarp JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</head>
<body>
<div class="main">
    <c:choose>
        <c:when test="${not empty findId}">
            <table>
                <tr><td colspan="2">아이디 찾기 결과</td></tr>
                <tr></tr>
                <tr><td colspan="2">회원님의 아이디는 ${findId} 입니다.</td></tr>
                <tr></tr>
                <tr></tr>
            </table>
        </c:when>
        <c:otherwise>
            <form action="/member/login/findidimpl" name="idFindForm">
                <table>
                    <tr>
                        <td colspan="2">아이디 찾기</td>
                    </tr>
                    <tr>
                        <td colspan="2">아이디를 잊어버리셨나요?<br>회원님의 성명과 이메일을 입력하여 주세요.</td>
                    </tr>
                    <tr>
                        <td id="input_name" style="width: 20%;">
                            · 이름<br/>· 이메일
                        </td>
                        <td style="width: 80%;">
                            <input id="find_id_name" type="text" name="userName"><br/>
                            <input id="find_id_email" type="text" class="emailText" name="userEmail">
                        </td>
                    </tr>
                </table>
                <div>${notFound}</div>
                <div>
                    <button id="btn_confirm" type="button" onclick="document.idFindForm.submit()">확인</button>
                </div>
            </form>
        </c:otherwise>
    </c:choose>

    <div>
        <button id="btn_cancel" type="button" onclick="window.close()"><span id="x">x</span> 닫기</button>
</div>
</body>
</html>