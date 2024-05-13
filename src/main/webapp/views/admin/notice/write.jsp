<%--
  Created by IntelliJ IDEA.
  User: hayoung
  Date: 2024/04/16
  Time: 8:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value="/css/admin/admin.css"/>">
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
    function submit() {
      if (confirm("공지사항을 등록하시겠습니까?") == true) {
        let form = document.noticeForm;
        form.submit();
        alert('등록되었습니다.');
      } else return;
    }

    function cancel() {
      if (confirm("작성하신 내용은 저장되지 않습니다.\n취소하시겠습니까?") == true) {
        location.href = "<c:url value="/admin/notice"/>";
      } else return;
    }
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

    <span><a href="/member/logoutAction">LOGOUT</a></span>

    <span><a href="/member/join">JOIN</a></span>
    <span><a href="/company/company03">CONTACT US</a></span>
  </div>
</div>

<!-- main.jsp, login.jsp, ... -->
<link rel="stylesheet" href="<c:url value="/css/admin/admin.css"/>" />

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
        <h3>관리자페이지</h3>
      </div>
      <div>
        <p><img src="<c:url value="/img/icon-home.png"/>" /> > 관리자페이지</p>
      </div>
    </div>
  </div>
</div>

<div id="adminMain">
  <!-- 사이드메뉴 -->
  <div id="adminSide">
    <ul>
      <li><a href="<c:url value="/admin/member"/>">회원 관리</a></li>
      <li><a href="<c:url value="/admin/notice"/>" class="adminSideActive">공지사항 관리</a></li>
      <li><a href="<c:url value="#"/>">1:1문의 관리</a></li>
      <li><a href="<c:url value="#"/>">묻고답하기 관리</a></li>
      <li><a href="<c:url value="#"/>">FAQ 관리</a></li>
      <li><a href="<c:url value="#"/>">제품 관리</a></li>
    </ul>
  </div>
  <!-- 메인 -->
  <div id="adminSection">

    <div class="adminDiv">
      <h3>공지사항 관리</h3>
    </div>
    <form action="/admin/notice/writeimpl" name="noticeForm">
      <div class="communitySection2 container text-center">
        <div>
          <div>공지사항</div>
          <div>The design and maintenance are excellent.</div>
        </div>
        <div class="main">
          <table>
            <tr>
              <td>제목</td>
              <td><input type="text" name="noticeTitle" value="${notice.noticeTitle}"></td>
            </tr>
          </table>

        </div>
      </div>
      <div class="container content_textarea">
        <div>
        <textarea name="noticeContent" id="editor4">
          ${notice.noticeContent}
        </textarea>
        </div>
      </div>
    </form>
    <div class="container btnImg text-center">
      <table>
        <tr>
          <td></td>
          <td>
            <input type="image" src="<c:url value="/img/customer/btn_confirm.gif"/>" onclick="submit()">
            <input type="image" src="<c:url value="/img/customer/btn_cancel.gif"/>" onclick="cancel()"></td>
          <td></td>
        </tr>
      </table>
    </div>


<%--  </div>--%>
<%--    <div class="noticeViewTitle adminDiv2">--%>
<%--      <span>[일반]타이틀1</span>--%>
<%--      <span>--%>
<%--            <span>글쓴이:admin</span>--%>
<%--            <span>글번호:5</span>--%>
<%--          </span>--%>
<%--    </div>--%>
<%--    <div class="adminDiv2">--%>
<%--      <div class="noticeViewContent">--%>
<%--            <textarea rows="5" cols="50" id="editor4" name="editor4">--%>
<%--						내용입니다.1</textarea--%>
<%--            >--%>
<%--      </div>--%>
<%--    </div>--%>
<%--    <div class="noticeViewBtns adminDiv2">--%>
<%--      <div>--%>
<%--        <a href="/admin_notice_modify?notice_idx=1">수정</a>--%>
<%--        <a href="/admin_notice_delete?notice_idx=1">삭제</a>--%>
<%--      </div>--%>
<%--      <div>--%>
<%--        <a href="/admin/notice">목록</a>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>

<script src="https://cdn.ckeditor.com/4.15.1/standard/ckeditor.js"></script>
<!-- <script>CKEDITOR.replace('editor4');</script> -->
<script>
  var ckeditor_config = {
    resize_enaleb: false,
    enterMode: CKEDITOR.ENTER_BR,
    shiftEnterMode: CKEDITOR.ENTER_P,
    filebrowserUploadUrl: "/ckUpload",
  };
  CKEDITOR.replace("editor4", ckeditor_config);
</script>

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

<script>
  // back to top 기능
  $(document).ready(function () {
    $(window).scroll(function () {
      if ($(this).scrollTop() > 50) {
        console.log("fadeIn");
        $("#back-to-top").fadeIn();
      } else {
        console.log("fadeOut");
        $("#back-to-top").fadeOut();
      }
    });
    // scroll body to 0px on click
    $("#back-to-top").click(function () {
      console.log("click");
      $("#back-to-top").tooltip("hide");
      $("body,html").animate(
              {
                scrollTop: 0,
              },
              500
      );
      return false;
    });
    $("#back-to-top").tooltip("show");
  });
</script>
</body>
</html>
