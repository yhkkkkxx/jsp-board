<%--
  Created by IntelliJ IDEA.
  User: hayoung
  Date: 2024/04/16
  Time: 8:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value="/css/admin/admin.css"/>">
<link rel="stylesheet" href="<c:url value="/css/member/login.css"/>">

<!DOCTYPE html>
<html lang="en">
<head>
    <title>회사홈페이지</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="stylesheet" href="/css/main.css" />
    <link rel="stylesheet" href="/css/common.css" />

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

    <script>
        let login = {
            init: function () {
                $('#btn_login').click(() => {
                    let login_id = $('#login_id').val();
                    let login_pw = $('#login_pw').val();
                    $.ajax({
                        url:'/admin/loginimpl',
                        method:'post',
                        data:{'login_id':login_id,'login_pw':login_pw},
                        success: (res) =>{
                            if(res == "1") {
                                alert("로그인 되었습니다.");
                                location.href="<c:url value="/admin/member"/>";
                                return;
                            }
                            else if(res == "0") {
                                alert("아이디가 존재하지 않습니다.");
                                $('#login_id').val("");
                                $('#login_id').focus();
                                $('#login_pw').val("");
                                return;
                            }
                            else if(res == "-1") {
                                alert("비밀번호가 틀렸습니다.");
                                $('#login_pw').val("");
                                $('#login_pw').focus();
                                return;
                            }
                        }
                    });
                });


            }
        };
        $(function () {
            login.init();
        });
    </script>
</head>

<body>
<!-- 탑메뉴 -->
<div class="toTopScroll">
    <img src="/img/icon-top.png" onClick="javascript:window.scrollTo(0,0)" />
</div>
<div class="top d-none d-md-block">
    <div class="topMenu d-none d-md-block container">
        <span class="home"><a href="/">HOME</a></span>

        <span><a href="/member/login">LOGIN</a></span>

        <span><a href="/member/join">JOIN</a></span>
        <span><a href="/company/company03">CONTACT US</a></span>
    </div>
</div>

<!-- 메인 -->
<!-- COMMON -->
<div class="commonSection1">
    <div class="commonContent1">
        <img
                src="<c:url value="/img/member/sub-visual01.jpg"/>"
                style="width: 100%; height: 100%"
        />
        <div class="commonContent2 text-center">
            <div>
                <h3>ADMIN</h3>
            </div>
            <div>
                <p><img src="<c:url value="/img/icon-home.png"/>" /> > 관리자 로그인</p>
            </div>
        </div>
    </div>
</div>

<!-- 로그인 -->
<div class="loginForm container text-center">
    <div class="loginSection1">
        <div><h3>관리자 로그인</h3></div>
        <div><p>The design and maintenance are excellent.</p></div>
    </div>
    <div class="loginMain">
        <form action="adminLoginAction" method="post">
            <table class="main1">
                <tr>
                    <td>
                        아이디 <br/>
                        비밀번호
                    </td>
                    <td>
                        <input id="login_id" type="text" name="member_id"/> <br/>
                        <input id="login_pw" type="text" name="member_pw"/>
                    </td>
                    <td>
                        <button id="btn_login" type="button">
<%--                            <input id="btn_login"--%>
<%--                                   type="image"--%>
<%--                                   class="loginImg"--%>
<%--                                   name="submit"--%>
<%--                                   value="submit"--%>
<%--                                   src="<c:url value="/img/member/btn_login.gif"/>"/>--%>
                            <img src="<c:url value="/img/member/btn_login.gif"/>"/>
                        </button>
                    </td>
                </tr>
            </table>
        </form>
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
          <span
          >회사 : 코딩강사 &nbsp; 주소 : 서울특별시 중구 명동 세종대로 110
            &nbsp; 대표 : 홍길동 <br />
            고객지원 : 010-2222-3333, FAX : 070-888-5555, EMAIL :
            support@gmail.com, 사업자등록번호 : 100-02-00033, 통신판매업 :
            제1111-경기-00000호<br />COPYRIGHT(C) 2021 CODINGGANSA. ALL RIGHT
            RESERVED.</span
          >
        </div>
        <div>
            <img src="<c:url value="/img/mf-icon01.png"/>" alt=""/>
            <img src="<c:url value="/img/mf-icon02.png"/>" alt="" />
            <img src="<c:url value="/img/mf-icon03.png"/>" alt="" />
            <img src="<c:url value="/img/mf-icon04.png"/>" alt="" />
        </div>
    </div>
</div>

<%--<script>--%>

<%--    $(function() {--%>
<%--        login.init();--%>
<%--        // back to top 기능--%>
<%--        $(document).ready(function () {--%>
<%--            $(window).scroll(function () {--%>
<%--                if ($(this).scrollTop() > 50) {--%>
<%--                    console.log("fadeIn");--%>
<%--                    $("#back-to-top").fadeIn();--%>
<%--                } else {--%>
<%--                    console.log("fadeOut");--%>
<%--                    $("#back-to-top").fadeOut();--%>
<%--                }--%>
<%--            });--%>
<%--            // scroll body to 0px on click--%>
<%--            $("#back-to-top").click(function () {--%>
<%--                console.log("click");--%>
<%--                $("#back-to-top").tooltip("hide");--%>
<%--                $("body,html").animate(--%>
<%--                    {--%>
<%--                        scrollTop: 0,--%>
<%--                    },--%>
<%--                    500--%>
<%--                );--%>
<%--                return false;--%>
<%--            });--%>
<%--            $("#back-to-top").tooltip("show");--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
</body>
</html>

