<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path4 = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입</title>
    <%@ include file="/setting/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path4%>/css/google.css">
    <link rel="stylesheet" href="<%=path4%>/css/fonts.css">


    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path4%>/css/common.css">
    <link rel="stylesheet" href="<%=path4%>/css/header.css">
    <link rel="stylesheet" href="<%=path4%>/css/content_header.css">
    <link rel="stylesheet" href="<%=path4%>/css/footer.css">
    <link rel="stylesheet" href="<%=path4%>/css/join.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="/layout/header.jsp" %>
    </header>
        <div class="contents" id="contents">
            <div class="content_header">
                <div class="breadcrumb">
                    <p><a href="/">Home</a> &gt; <span> 회원 가입 </span> </p>
                    <h2 class="page_tit"> 회원 가입 </h2>
                </div>
            </div>
            <section class="page" id="page1">
                <div class="join-wrapper">
                    <form name="frm1" action="joinpro.jsp" method="post" onsubmit="return inform(this)">
                        <table class="tb1">
                            <tbody>
                            <tr>
                                <div class="person">
                                    <label><input type="radio" name="per" id="student" value="1" checked>학생</label> &nbsp;&nbsp;
                                    <label><input type="radio" name="per" id="mother" value="2">학부모</label>
                                </div>
                            </tr>
                            <tr>
                                <th><label for="id">아이디</label></th>
                                <td>
                                    <input type="text" name="id" id="id" class="indata" required>
                                    <button type="button" id="ck_btn" class="inbtn" onclick="idcheck()">아이디 중복 체크</button>
                                    <input type="hidden" name="ck_item" id="ck_item" value="no">
                                </td>
                            </tr>
                            <tr>
                                <th><label for="pw">비밀번호</label></th>
                                <td>
                                    <input type="password" name="pw" id="pw" class="indata" required>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="pw2">비밀번호 확인</label></th>
                                <td>
                                    <input type="password" name="pw2" id="pw2" class="indata" required>
                                </td>
                            </tr>
                            <tr>
                                <th><label for="name">이름</label></th>
                                <td><input type="text" name="name" id="name" class="indata" required></td>
                            </tr>
                            <tr>
                                <th><label for="tel">전화번호</label></th>
                                <td><input type="tel" name="tel" id="tel" class="indata" required></td>
                            </tr>
                            <tr>
                                <th><label for="email">이메일</label></th>
                                <td><input type="email" name="email" id="email" class="indata" required></td>
                            </tr>
                            <tr>
                                <td colspan="2" class="colspan">
                                    <input type="submit" value="회원 가입" class="inbtn">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </form>
                    <script>
                        function inform(frm){
                            var ck_item = frm.ck_item;
                            //var ck_item = document.getElementById("ck_item");
                            if(ck_item.value!="yes"){
                                alert("아이디 중복 검사를 진행하시기 바랍니다.");
                                frm.id.focus();
                                return false;
                            }
                            var pw = frm.pw.value;
                            var pw2 = frm.pw2.value;
                            if(pw!=pw2){
                                alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
                                pw.focus();
                                alert(pw + " " +pw2);
                                return false;
                            }
                        }
                        function idcheck(){
                            var child;
                            var id = document.getElementById("id");
                            if(id.value!="") {
                                child = window.open("idcheck.jsp?id="+id.value, "child", "width=250, height=100");
                                return;
                            } else {
                                alert("아이디 입력란에 아이디를 입력하고, 진행하시기 바랍니다.");
                                id.focus();
                                return;
                            }
                        }
                    </script>
                </div>
            </section>
        </div>
    <footer class="ft" id="ft">
        <%@ include file="/layout/footer.jsp" %>
    </footer>
</div>
</body>
</html>