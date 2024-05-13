<%--
  Created by IntelliJ IDEA.
  User: hayoung
  Date: 2024/04/16
  Time: 8:20 PM
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
    <title>회원가입2</title>

    <!-- Main CSS : Header, Main, Footer -->
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/member/join.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

    <!-- Bootstarp JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
    <script>
        let join = {

            id_chk: false,
            pw_chk: false,
            init: function() {
                this.date();

                $('#join_id').keyup(function() {
                    let id = $('#join_id').val();
                    join.id_chk = false;
                    if(id == "") $('#id_chk').text("");
                    else $('#id_chk').text("아이디 중복확인을 해주세요.");
                });

                $('#btn_id_chk').click(() => {
                    let id = $('#join_id').val();
                    if(id == '' || id == null) {
                        alert('ID가 입력되지 않았습니다.');
                        $('#join_id').focus();
                        return;
                    }
                    $.ajax({
                        url:'<c:url value="/member/join/idchk"/>',
                        data: {'id':id},
                        success: (res) => {
                            if(res == "1") {
                                $('#id_chk').text("사용 가능한 아이디입니다.");
                                this.id_chk = true;
                            }
                            else if(res == "0") {
                                $('#id_chk').text("사용 중인 아이디입니다.");
                                this.id_chk = false;
                                $('#join_id').val("");
                                $('#join_id').focus();
                            }
                        }
                    });
                });


                $('#join_pw').keyup(function() {
                    pw = $('#join_pw').val();
                    pw2 = $('#join_pw_chk').val();
                    join.pw_chk = false;
                    if(pw.length == 0) {
                        $('#pw_l_chk').text("");
                    }
                    else if(pw.length < 4) {
                        $('#pw_l_chk').text("비밀번호는 4자리 이상이어야 합니다.");
                    }
                    else if(pw.length >= 4) {
                        $('#pw_l_chk').text("사용 가능한 비밀번호입니다.");
                        join.pw_chk = true;
                    }

                    $('#join_pw_chk').val("");
                    $('#pw_chk').text("");
                });

                $('#join_pw_chk').keyup(function() {
                    pw = $('#join_pw').val();
                    pw2 = $('#join_pw_chk').val();
                    join.pw_chk = false;

                    if(pw2 == '' || pw2 == null) {
                        $('#pw_chk').text("");
                    }
                    else if(pw != pw2) {
                        $('#pw_chk').text("비밀번호가 일치하지 않습니다.");
                    }
                    else if(pw == pw2) {
                        $('#pw_chk').text("비밀번호가 일치합니다.");
                        join.pw_chk = true;
                    }

                });


                $('#btn_confirm').click(() => {
                    if(this.valid_chk()) {
                        birthDate = this.parse_date();
                        $.ajax({
                            url:'<c:url value="/member/join/joinimpl"/>',
                            type:'post',
                            contentType:'application/json',
                            data:JSON.stringify({
                                memberId: $('#join_id').val().toString(),
                                memberPw: $('#join_pw').val().toString(),
                                memberName: $('#join_name').val().toString(),
                                memberEmail: $('#join_email').val().toString()+"@"+$('#join_email_addr').val().toString(),
                                memberEmailReceive: $("input[name='sms']:checked").val(),
                                memberPwQuestion: $('#join_pw_q').val(),
                                memberPwAnswer: $('#join_pw_a').val().toString(),
                                memberGender: $("input[name='gender']:checked").val().toString(),
                                memberBirthDate: birthDate
                            }),
                            success: (res) => {
                                if(res == "1") {
                                    alert("회원가입이 완료되었습니다.\n환영합니다!");
                                    location.href="<c:url value="/member/login"/>";
                                }
                                else {
                                    alert("오류 발생!\n다시 시도해주세요.");
                                    location.href="<c:url value="/member/join/beforejoin"/>";
                                }
                            }
                        });
                    }
                });

                $('#btn_cancel').click(() => {
                    if (confirm("정말 나가시겠습니까?\n작성하신 정보는 저장되지 않습니다.") == true){
                        location.href = "<c:url value="/"/>";
                    } else return;
                });

            },
            date: function() {
                let today = new Date();
                let year = today.getFullYear();

                for (i = 1970; i <= year; i++) {
                    $('#year').append('<option value="'+ i + '">' + i + '</option>');
                }
                for (i = 1; i <= 12; i++) {
                    $('#month').append('<option value="' + i + '">' + i + '</option>');
                }
                for (i = 1; i <= 31; i++) {
                    $('#day').append('<option value="' + i + '">' + i + '</option>');
                }
                $("#year").val("").prop("selected",false);
                $("#month").val("").prop("selected",false);
                $("#day").val("").prop("selected",false);
            },
            parse_date: function() {
                let birthy = $('#year option:selected').val();
                let birthm = $('#month option:selected').val();
                let birthd = $('#day option:selected').val();

                birthm = birthm.padStart(2, '0');
                birthd = birthd.padStart(2, '0');

                let birthDate = birthy+'-'+birthm+'-'+birthd;
                return birthDate;
            },
            valid_chk: function() {
                let sms = $("input[name='sms']:checked");
                let pwq = $('#join_pw_q');
                let gender = $("input[name='gender']:checked");
                let birthy = $('#year option:selected');
                let birthm = $('#month option:selected');
                let birthd = $('#day option:selected');

                let input_txt = $('.input_txt').map(function() {
                    return $(this);
                }).get();
                let txt = ["아이디", "비밀번호", "비밀번호 확인", "이름", "이메일", "이메일", "비밀번호 확인시 답변"]
                for(i=0; i<input_txt.length; i++) {
                    if(input_txt[i].val() == null || input_txt[i].val() == "") {
                        alert(txt[i]+" 값을 입력하세요.");
                        input_txt[i].focus();
                        return false;
                    }
                    if(i == 0 && !this.id_chk) {
                        alert("아이디 중복확인을 해주세요.");
                        return false;
                    }
                    if(i == 1 && input_txt[i].val().length < 4) {
                        alert("비밀번호는 4자리 이상이어야 합니다.");
                        return false;
                    }
                    if(i == 1 && (this.pw_chk.length < 4 || !this.pw_chk)) {
                        alert("비밀번호가 일치하지 않습니다.");
                        return false;
                    }
                }
                if(!this.chkother(sms, sms.val(), "이메일 수신여부") || !this.chkother(pwq, pwq.val(), "비밀번호 확인시 질문")
                    || !this.chkother(gender, gender.val(), "성별") || !this.chkother(birthy, birthy.val(), "생년월일")
                    || !this.chkother(birthm, birthm.val(), "생년월일") || !this.chkother(birthd, birthd.val(), "생년월일")) {
                    return false;
                }
                return true;
            },
            chkother: function(obj, val, str) {
                if(str == "비밀번호 확인시 질문" && val == "0") {
                    alert(str+" 값을 선택하세요.");
                    obj.focus();
                    return false;
                }
                if(val == undefined) {
                    alert(str+" 값을 선택하세요.");
                    obj.focus();
                    return false;
                }
                return true;
            }
        };
        $(function () {
            join.init();
        });
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
    <br><br>
    <div class="contents">
        <h3>회원가입을 위해서 아래의 양식에 있는 내용을 입력해 주셔야 합니다.</h3>
        <h5>-회원님의 개인정보를 신중하게 보호하고 있으며 회원님의 동의 없이는 기재하신 회원정보가 누출되지 않습니다.
            자세한 내용은 개인정보보호정책에서 확인하세요.</h5>
    </div>
    <!-- 입력폼 -->
    <div class="information1">
        <div>기본정보</div>
        <table id="join_table">
            <tr>
                <td>아이디</td>
                <td>
                    <input class="input_txt" id="join_id" type="text" name="join_id" value="">
                    <button id="btn_id_chk" type="button" >
                        아이디중복확인▶
                    </button>
                    (영문 소문자, 숫자로 4~16자)
                    <div id="id_chk"></div>
                </td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td>
                    <input class="input_txt" id="join_pw" type="password" name="join_pw" value="">
                    영문/숫자/특수문자조합으로 8~16자리. 첫글자는 영문자로 사용
                    <div id="pw_l_chk"></div>
                </td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td>
                    <input class="input_txt" id="join_pw_chk" type="password" name="userPWCheck" value="">
                    <div id="pw_chk"></div>
                </td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input class="input_txt" id="join_name" type="text" value=""></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input class="input_txt" id="join_email" type="text" value="">@<input class="input_txt" id="join_email_addr" type="text" value=""></td>
            </tr>
            <tr>
                <td>이메일 수신여부</td>
                <td><input type="radio" name="sms" value="1">수신
                    <input type="radio" name="sms" value="0">수신안함</td>
            </tr>
            <tr>
                <td>비밀번호 확인시 질문</td>
                <td>
                    <select id="join_pw_q" class="size" name="passwordCheckQuestion">
                        <option value="0">========선택========</option>
                        <option value="1">기억에 남는 추억의 장소는?</option>
                        <option value="2">자신의 인생 좌우명은?</option>
                        <option value="3">자신의 보물 제1호는?</option>
                        <option value="4">가장 기억에 남는 선생님 성함은?</option>
                        <option value="5">내가 좋아하는 캐릭터는?</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>비밀번호 확인시 답변</td>
                <td><input class="input_txt" id="join_pw_a" type="text" name="passwordCheckAnswer" value=""></td>
            </tr>
            <tr>
                <td>성별</td>
                <td><input name="gender" type="radio" value="0">남자<input name="gender" type="radio" value="1">여자</td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td>
                    <select name="year" id="year" title="년도" class="birthdaySelect"></select>
                    <select name="month" id="month" title="월" class="birthdaySelect"></select>
                    <select name="day" id="day" title="일" class="birthdaySelect"></select>
                </td>
            </tr>
        </table>
    </div>
    <div class="Information2">부가정보</div>
    <div class="imageBtn2">
        <button id="btn_confirm" type="button" >회원가입</button>
        <button id="btn_cancel" type="button">취소</button>
    </div>

</div>



<!-- 푸터 -->
<div id="footer"></div>

</body>
</html>