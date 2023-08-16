<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

<%
    String path32 = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>고등 강의 소개</title>
    <%@ include file="/setting/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path32%>/css/google.css">
    <link rel="stylesheet" href="<%=path32%>/css/fonts.css">
    <link rel="stylesheet" href="<%=path32%>/css/login.css">


    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path32%>/css/common.css">
    <link rel="stylesheet" href="<%=path32%>/css/header.css">
    <link rel="stylesheet" href="<%=path32%>/css/footer.css">

    <style>
        /*breadcrumb*/
        .content_header {
            clear: both;
            height: 250px;
            margin-top: 40px;
            background-image: url("/images/mypage_cover.jpg");
            background-repeat: no-repeat;
            background-position:center -300px;
            background-size: cover;
        }

        .page_tit {
            font-size:48px;
            text-align: center;
            padding-top:1em;
            color:#fff;
            padding-bottom: 2.4rem;
            margin-left: 450px;
        }

        .breadcrumb {
            clear:both;
            width:1200px;
            margin: 0 auto;
            text-align: right;
            color:#fff;
            padding-top: 28px;
            padding-bottom: 28px;
        }

        .breadcrumb a {
            color:#fff;
        }

        /*contents*/
        .container{
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .contents{
            margin-top: 20px;
            height: 1400px;
        }
        .row{
            display: flex;
            flex-wrap: wrap;
            margin-left: 150px;
        }
        div .card {
            margin: 25px auto;
        }

        .col-3 {
            width: 330px;
            height: 300px;
        }

        .card-text{
            height: 50px;
        }
        .card-body {
            height: 150px;
        }
        .btn {
            margin-top: 10px;
            background-color: #8CB964;
            border-color: #8CB964;

        }
        .card-img-top {
            height: 130px;
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
                <h2 class="page_tit"> 고등 강의 소개 </h2>
            </div>
        </div>
            <div class="container">
                <div class="box_wrap">
                    <ul class="list row">
                        <li class="col-3">
                            <div class="card">
                                <img src="..." class="card-img-top" alt="강의소개">
                                <div class="card-body">
                                    <h5 class="card-title">고등 국어</h5>
                                    <p class="card-text">국어 영역 최선의 선택!</p>
                                    <a href="#" class="btn btn-primary">김이름 선생님</a>
                                </div>
                            </div>
                        </li>
                        <li class="col-3">
                            <div class="card">
                                <img src="..." class="card-img-top" alt="강의소개">
                                <div class="card-body">
                                    <h5 class="card-title">고등 국어</h5>
                                    <p class="card-text">문학의 핵심을 잡는 베테랑의 여유</p>
                                    <a href="#" class="btn btn-primary">박문학 선생님</a>
                                </div>
                            </div>
                        </li>
                        <li class="col-3">
                            <div class="card">
                                <img src="..." class="card-img-top" alt="강의소개">
                                <div class="card-body">
                                    <h5 class="card-title">고등 국어</h5>
                                    <p class="card-text">한글만 알고오면 너도 되는 국어</p>
                                    <a href="#" class="btn btn-primary">김국어 선생님</a>
                                </div>
                            </div>
                        </li>
                        <li class="col-3">
                            <div class="card">
                                <img src="..." class="card-img-top" alt="강의소개">
                                <div class="card-body">
                                    <h5 class="card-title">고등 영어</h5>
                                    <p class="card-text">영포자 탈출하는 쉬운 영어</p>
                                    <a href="#" class="btn btn-primary">박이름 선생님</a>
                                </div>
                            </div>
                        </li>
                        <li class="col-3">
                            <div class="card">
                                <img src="..." class="card-img-top" alt="강의소개">
                                <div class="card-body">
                                    <h5 class="card-title">고등 영어</h5>
                                    <p class="card-text">영어듣기 만점을 목표로~!</p>
                                    <a href="#" class="btn btn-primary">김영어 선생님</a>
                                </div>
                            </div>
                        </li>
                        <li class="col-3">
                            <div class="card">
                                <img src="..." class="card-img-top" alt="강의소개">
                                <div class="card-body">
                                    <h5 class="card-title">초등 영어</h5>
                                    <p class="card-text">최고의 영어강의를 보라</p>
                                    <a href="#" class="btn btn-primary">이듣기 선생님</a>
                                </div>
                            </div>
                        </li>
                        <li class="col-3">
                            <div class="card">
                                <img src="..." class="card-img-top" alt="강의소개">
                                <div class="card-body">
                                    <h5 class="card-title">고등 수학</h5>
                                    <p class="card-text">수포자를 탈출하는 가장 쉬운 방법</p>
                                    <a href="#" class="btn btn-primary">정수학 선생님</a>
                                </div>
                            </div>
                        </li>
                        <li class="col-3">
                            <div class="card">
                                <img src="..." class="card-img-top" alt="강의소개">
                                <div class="card-body">
                                    <h5 class="card-title">고등 수학</h5>
                                    <p class="card-text">완벽한 교육과 지독한 노력만이 만점을 만듭니다</p>
                                    <a href="#" class="btn btn-primary">김벡터 선생님</a>
                                </div>
                            </div>
                        </li>
                        <li class="col-3">
                            <div class="card">
                                <img src="..." class="card-img-top" alt="강의소개">
                                <div class="card-body">
                                    <h5 class="card-title">고등 영어</h5>
                                    <p class="card-text">지나간 것도 다시 보는 수학</p>
                                    <a href="#" class="btn btn-primary">박수열 선생님</a>
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