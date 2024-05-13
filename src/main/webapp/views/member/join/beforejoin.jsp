<%--
  Created by IntelliJ IDEA.
  User: hayoung
  Date: 2024/04/16
  Time: 5:20 PM
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
    <title>회원가입</title>

    <!-- Main CSS : Header, Main, Footer -->
    <link rel="stylesheet" href="<c:url value="/css/member/join.css"/>">


    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

    <!-- Bootstarp JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

    <script>
        function checkall(check) {
            const checkboxes = document.getElementsByName('agree');

            checkboxes.forEach((checkbox) => {
                checkbox.checked = check.checked;
            })
        }
        function agree() {
            var isAllCheck = true;
            var checkboxArray = document.getElementsByClassName('check');
            for(var cbx of checkboxArray) {
                if(cbx.checked == false){
                    isAllCheck = false;
                    break;
                }
            }
            if(isAllCheck == true){
                window.location.href = '<c:url value="/member/join"/>'
            }else{
                alert('이용약관에 모두 동의해주세요.');
            }
        }
    </script>

</head>
<body>
<!-- 헤더 -->
<div id="headerTop"></div>
<div id="header" class="sticky-top"></div>

<!-- 메인 -->
<!-- COMMON -->
<div class="commonSection1">
    <div class="commonContent1">
        <img src="<c:url value="/img/member/sub-visual02.jpg"/>"
             style="width: 100%; height: 100%;">
        <div class="commonContent2 text-center">
            <div>
                <h3>MEMBER</h3>
            </div>
            <div>
                <p><img src="<c:url value="/img/icon-home.png"/>"> > 회원가입</p>
            </div>
        </div>
    </div>
</div>

<!-- 메인 -->
<!-- 회원가입 -->
<div class="joinForm container">
    <div class="joinSection1">
        <div><h3>회원가입</h3></div>
        <div><p>The design and maintenance are excellent.</p></div>
    </div>
    <div class="wellcome">
        <h3>OOO사이트에 오신 것을 환영합니다.</h3>
        <h5>-이름과 이메일을 입력해 주시면 가입여부를 확인 후 회원가입 절차가 이루어집니다.</h5>
    </div>

    <!-- 이용약관 -->
    <div class="term1">
        <div>이용약관</div>
        <div>
        <textarea name="" id="" cols="30" rows="10">
          이용약관
        </textarea>
            <div><input name="agree" class="check" type="checkbox">위 약관에 동의합니다.</div>
        </div>
    </div>
    <!-- 개인정보보호정책 -->
    <div class="term2">
        <div>개인정보보호정책</div>
        <div>
        <textarea name="" id="" cols="30" rows="10">
          개인정보보호정책
        </textarea>
            <div><input name="agree" class="check" type="checkbox">위 개인정보취급방침에 동의합니다.</div>
        </div>
    </div>
    <!-- 개인정보의 수집 및 이용목적 -->
    <div class="term3">
        <div>개인정보의 수집 및 이용목적</div>
        <div>
        <textarea name="" id="" cols="30" rows="10">
          개인정보의 수집 및 이용목적
        </textarea>
            <div><input name="agree" class="check" type="checkbox">위 개인정보의 수집 및 이용목적에 동의합니다.</div>
        </div>
    </div>
    <br/><br/>
    <div><input class="checkall" type="checkbox" onclick="checkall(this)">모두 동의합니다.</div>
    <br/><br/>
</div>
<%--    <div class="imageBtn">--%>
<%--        <input type="image" onclick="agree();" src="<c:url value="/img/member/btn_join.gif"/>">--%>
<%--    </div>--%>
</div>
<div id="btn_div">
    <button id="btn_join" type="button" onclick="agree();" src="<c:url value="/img/member/btn_join.gif"/>">회원가입
        <%--        <img src="<c:url value="/img/member/btn_cancel.gif"/>">--%>
    </button>
</div>

<!-- 푸터 -->
<div id="footer"></div>

</body>
</html>