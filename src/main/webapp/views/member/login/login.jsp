<%--
  Created by IntelliJ IDEA.
  User: hayoung
  Date: 2024/04/16
  Time: 5:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>


    let login = {
        init: function () {
            $('#btn_login').click(() => {
                let id = $('#login_id').val();
                let pw = $('#login_pw').val();
                console.log(id," ",pw);
                if(id == '' || id == null) {
                    alert('ID를 입력하세요.');
                    $('#login_id').focus();
                    return;
                }
                if(pw == '' || pw == null) {
                    alert('비밀번호를 입력하세요.');
                    $('#login_pw').focus();
                    return;
                }
                login.send();
            });
        },

        send: function() {
            $('#login_form').attr({
                'method':'post',
                'action': '<c:url value="/member/login/loginimpl"/>'
            });
            $('#login_form').submit();
        }
    }

    $(function() {
        login.init();
    });
</script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>

    <!-- Main CSS : Header, Main, Footer -->
    <link rel="stylesheet" href="<c:url value="/css/member/login.css"/>">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

    <!-- Bootstarp JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

    </script>

</head>

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
<body>
<!-- 헤더 -->
<div id="headerTop"></div>
<div id="header" class="sticky-top"></div>

<!-- 메인 -->
<!-- COMMON -->
<div class="commonSection1">
    <div class="commonContent1">
        <img src="<c:url value="/img/member/sub-visual01.jpg"/>"
             style="width: 100%; height: 100%;">
        <div class="commonContent2 text-center">
            <div>
                <h3>MEMBER</h3>
            </div>
            <div>
                <p><img src="<c:url value="/img/icon-home.png"/>"> > 로그인</p>
            </div>
        </div>
    </div>
</div>

<!-- 로그인 -->
<div class="loginForm container text-center">
    <div class="loginSection1">
        <div><h3>로그인</h3></div>
        <div><p>The design and maintenance are excellent.</p></div>
    </div>
    <div class="loginMain">
        <table class="main1">
            <label id="login_msg">${msg}</label>
            <tr>
                <td>
                    아이디 <br/><br/>
                    비밀번호
                </td>
                <form id="login_form">
                    <td>
                        <input type="text" id="login_id" name="login_id"/> <br/><br/>
                        <input type="password" id="login_pw" name="login_pw"/>
                    </td>
                    <td>
                        &nbsp; <button id="btn_login" type="button">
                                로그인
<%--                            <img src="<c:url value="/img/member/btn_login.gif"/>"/>--%>
                        </button>
                    </td>
                </form>
            </tr>
        </table>
        <div class="loginSection2">
            <table class="main2">
                <tr>
                    <td>-아이디를 잊으셨나요?</td>
                    <td>
<%--                        <input type="image"--%>
<%--                               onclick="window.open('<c:url value="/member/login/findid"/>', 'newWindow', 'width=460,height=300')",--%>
<%--                               src="<c:url value="/img/member/btn_id_find.gif"/>" >--%>
                        <button id="btn_findid" type="button"
                               onclick="window.open('<c:url value="/member/login/findid"/>', 'newWindow', 'width=460,height=320')",
                               src="<c:url value="/img/member/btn_id_find.gif"/>" >아이디찾기</button>
                    </td>
                </tr>
                <tr>
                    <td>-비밀번호를 잊으셨나요?</td>
                    <td>
                        <button id="btn_findpw" type="button"
                               onclick="window.open('<c:url value="/member/login/findpw"/>', 'newWindow', 'width=460,height=355')",
                               src="<c:url value="/img/member/btn_pw_find.gif"/>"
                               value="${findId}">비밀번호찾기</button>
<%--                        <input type="image"--%>
<%--                               onclick="window.open('<c:url value="/member/login/findpw"/>', 'newWindow', 'width=460,height=325')",--%>
<%--                               src="<c:url value="/img/member/btn_pw_find.gif"/>"--%>
<%--                               value="${findId}">--%>
                    </td>
                </tr>
            </table>
        </div>

    </div>
</div>


<!-- 푸터 -->
<div id="footer"></div>
</body>
</html>