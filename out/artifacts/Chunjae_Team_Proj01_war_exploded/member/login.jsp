<%@ page import="javax.xml.xpath.XPathEvaluationResult" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path3 = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <%@ include file="/setting/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path3%>/css/google.css">
    <link rel="stylesheet" href="<%=path3%>/css/fonts.css">
    <link rel="stylesheet" href="<%=path3%>/css/login.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path3%>/css/common.css">
    <link rel="stylesheet" href="<%=path3%>/css/header.css">
    <link rel="stylesheet" href="<%=path3%>/css/footer.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="/layout/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="/">HOME</a> &gt; <span>로그인</span></p>
        </div>
        <section class="page" id="page1">
            <div class="login-wrapper">
                <h2>Login</h2>
                <form method="post" action="<%=path3%>/member/loginpro.jsp" id="login-form">
                    <input type="text" name="id" placeholder="아이디" autofocus required>
                    <input type="password" name="pw" placeholder="비밀번호" required>
                    <label for="remember-check">
                        <input type="checkbox" id="remember-check">아이디 저장하기
                    </label>
                    <input type="submit" value="Login">
                </form>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="/layout/footer.jsp" %>
    </footer>
</div>
</body>
</html>