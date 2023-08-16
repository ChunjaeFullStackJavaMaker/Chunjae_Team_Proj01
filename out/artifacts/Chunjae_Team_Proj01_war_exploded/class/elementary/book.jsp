<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<%
    String path2 = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>초등 강의 소개</title>
    <%@ include file="/setting/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path2%>/css/google.css">
    <link rel="stylesheet" href="<%=path2%>/css/fonts.css">
    <link rel="stylesheet" href="<%=path2%>/css/login.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path2%>/css/common.css">
    <link rel="stylesheet" href="<%=path2%>/css/header.css">
    <link rel="stylesheet" href="<%=path2%>/css/content_header.css">
    <link rel="stylesheet" href="<%=path2%>/css/footer.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="/layout/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="/">Home</a> &gt; <span> 초등 강의 소개 </span> </p>
                <h2 class="page_tit"> 초등 강의 소개 </h2>
            </div>
        </div>
        <div class="container">
            <div class="card" style="width: 18rem;">
                <img src="..." class="card-img-top" alt="강의소개">
                <div class="card-body">
                    <h5 class="card-title">초등 국어</h5>
                    <p class="card-text">도전! AI 받아쓰기</p>
                    <a href="#" class="btn btn-primary">1, 2학년 제공</a>
                </div>
            </div>
            <div class="card" style="width: 18rem;">
                <img src="..." class="card-img-top" alt="강의소개">
                <div class="card-body">
                    <h5 class="card-title">초등 국어</h5>
                    <p class="card-text">보고 따라 쓰기</p>
                    <a href="#" class="btn btn-primary">문제 음성을 듣고 받아쓰기</a>
                </div>
            </div>
            <div class="card" style="width: 18rem;">
                <img src="..." class="card-img-top" alt="강의소개">
                <div class="card-body">
                    <h5 class="card-title">초등 국어</h5>
                    <p class="card-text">어휘력 짱짱</p>
                    <a href="#" class="btn btn-primary">어휘력을 향상시킬 수 있는 낱말 게임</a>
                </div>
            </div>
            <div class="card" style="width: 18rem;">
                <img src="..." class="card-img-top" alt="강의소개">
                <div class="card-body">
                    <h5 class="card-title">초등 영어</h5>
                    <p class="card-text">팡팡 Phonics</p>
                    <a href="#" class="btn btn-primary">소리와 글자의 연관관계를 학습하며 읽기 실력의 기초를 마련</a>
                </div>
            </div>
            <div class="card" style="width: 18rem;">
                <img src="..." class="card-img-top" alt="강의소개">
                <div class="card-body">
                    <h5 class="card-title">초등 영어</h5>
                    <p class="card-text">술술 Speaking</p>
                    <a href="#" class="btn btn-primary">하나의 주제로 영어의 듣기, 말하기, 읽기, 쓰기를 학습할 수 있는 회화 중심 통합학습</a>
                </div>
            </div>
            <div class="card" style="width: 18rem;">
                <img src="..." class="card-img-top" alt="강의소개">
                <div class="card-body">
                    <h5 class="card-title">초등 영어</h5>
                    <p class="card-text">콕콕 Listening</p>
                    <a href="#" class="btn btn-primary">AI 음성인식 기술을 통해 말하기 연습 병행</a>
                </div>
            </div>
            <div class="card" style="width: 18rem;">
                <img src="..." class="card-img-top" alt="강의소개">
                <div class="card-body">
                    <h5 class="card-title">초등 수학</h5>
                    <p class="card-text">기본</p>
                    <a href="#" class="btn btn-primary">기초부터 차근차근 공부하고 싶을 때</a>
                </div>
            </div>
            <div class="card" style="width: 18rem;">
                <img src="..." class="card-img-top" alt="강의소개">
                <div class="card-body">
                    <h5 class="card-title">초등 수학</h5>
                    <p class="card-text">실력</p>
                    <a href="#" class="btn btn-primary">다양한 문제로 실력을 키우고 싶을 때</a>
                </div>
            </div>
            <div class="card" style="width: 18rem;">
                <img src="..." class="card-img-top" alt="강의소개">
                <div class="card-body">
                    <h5 class="card-title">초등 영어</h5>
                    <p class="card-text">심화</p>
                    <a href="#" class="btn btn-primary">고난도 문제를 풀고 싶을 때</a>
                </div>
            </div>
        </div>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="/layout/footer.jsp" %>
    </footer>
</div>
</body>
</html>