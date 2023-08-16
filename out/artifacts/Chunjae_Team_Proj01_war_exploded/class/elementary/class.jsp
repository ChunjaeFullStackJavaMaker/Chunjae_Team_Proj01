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
    <link rel="stylesheet" href="<%=path2%>/css/footer.css">

    <style>
        /*breadcrumb*/

        /*contents*/
        .container{
            margin-top: 20px;
        }

        .contents{
            margin-top: 20px;
        }
        .list row {
            display: flex;
            width: 1000px;
        }

        .col-3 {
            width: 330px;
            height: 300px;
        }

        .card-body {
            height: 150px;
        }
        .btn {
            margin-top: 10px;
            background-color: #8CB964;
            border-color: #8CB964;
        }

    </style>
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
                <div class="box_wrap">
                    <ul class="list row">
                        <li class="col-3">
                            <div class="card">
                                <img src="..." class="card-img-top" alt="강의소개">
                                <div class="card-body">
                                    <h5 class="card-title">초등 국어</h5>
                                    <p class="card-text">1, 2학년 제공</p>
                                    <a href="#" class="btn btn-primary">도전! AI 받아쓰기</a>
                                </div>
                            </div>
                        </li>
                        <li class="col-3">
                            <div class="card">
                                <img src="..." class="card-img-top" alt="강의소개">
                                <div class="card-body">
                                    <h5 class="card-title">초등 국어</h5>
                                    <p class="card-text">문제 음성을 듣고 받아쓰기</p>
                                    <a href="#" class="btn btn-primary">보고 따라 쓰기</a>
                                </div>
                            </div>
                        </li>
                        <li class="col-3">
                            <div class="card">
                                <img src="..." class="card-img-top" alt="강의소개">
                                <div class="card-body">
                                    <h5 class="card-title">초등 국어</h5>
                                    <p class="card-text">어휘력을 향상시킬 수 있는 낱말 게임</p>
                                    <a href="#" class="btn btn-primary">어휘력 짱짱</a>
                                </div>
                            </div>
                        </li>
                        <li class="col-3">
                            <div class="card">
                                <img src="..." class="card-img-top" alt="강의소개">
                                <div class="card-body">
                                    <h5 class="card-title">초등 영어</h5>
                                    <p class="card-text">소리와 글자의 연관관계를 학습하며 읽기 실력의 기초를 마련</p>
                                    <a href="#" class="btn btn-primary">팡팡 Phonics</a>
                                </div>
                            </div>
                        </li>
                        <li class="col-3">
                            <div class="card">
                                <img src="..." class="card-img-top" alt="강의소개">
                                <div class="card-body">
                                    <h5 class="card-title">초등 영어</h5>
                                    <p class="card-text">하나의 주제로 영어의 듣기, 말하기, 읽기, 쓰기를 학습할 수 있는 회화 중심 통합학습</p>
                                    <a href="#" class="btn btn-primary">술술 Speaking</a>
                                </div>
                            </div>
                        </li>
                        <li class="col-3">
                            <div class="card">
                                <img src="..." class="card-img-top" alt="강의소개">
                                <div class="card-body">
                                    <h5 class="card-title">초등 영어</h5>
                                    <p class="card-text">AI 음성인식 기술을 통해 말하기 연습 병행</p>
                                    <a href="#" class="btn btn-primary">콕콕 Listening</a>
                                </div>
                            </div>
                        </li>
                        <li class="col-3">
                            <div class="card">
                                <img src="..." class="card-img-top" alt="강의소개">
                                <div class="card-body">
                                    <h5 class="card-title">초등 수학</h5>
                                    <p class="card-text">기초부터 차근차근 공부하고 싶을 때</p>
                                    <a href="#" class="btn btn-primary">기본</a>
                                </div>
                            </div>
                        </li>
                        <li class="col-3">
                            <div class="card">
                                <img src="..." class="card-img-top" alt="강의소개">
                                <div class="card-body">
                                    <h5 class="card-title">초등 수학</h5>
                                    <p class="card-text">다양한 문제로 실력을 키우고 싶을 때</p>
                                    <a href="#" class="btn btn-primary">실력</a>
                                </div>
                            </div>
                        </li>
                        <li class="col-3">
                            <div class="card">
                                <img src="..." class="card-img-top" alt="강의소개">
                                <div class="card-body">
                                    <h5 class="card-title">초등 영어</h5>
                                    <p class="card-text">고난도 문제를 풀고 싶을 때</p>
                                    <a href="#" class="btn btn-primary">심화</a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="/layout/footer.jsp" %>
    </footer>
</div>
</body>
</html>