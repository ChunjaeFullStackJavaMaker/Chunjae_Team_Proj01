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
        <section class="page" id="map">
            <div class="page_wrap">
                <h2 class="page_tit">오시는길</h2>
                <div class="maparea">
                    <div id="map" style="margin-left:120px;	margin-top:50px; width:800px;height:600px; background:white; ">                        </div>
                    <script>
                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                            mapOption = {
                                center: new daum.maps.LatLng(37.4676446,126.8876698), // 지도의 중심좌표
                                level: 2 // 지도의 확대 레벨
                            };
                        var map = new daum.maps.Map(mapContainer, mapOption);
                        // 마커가 표시될 위치입니다
                        var markerPosition  = new daum.maps.LatLng(37.4676446,126.8876698);
                        // 마커를 생성합니다
                        var marker = new daum.maps.Marker({
                            position: markerPosition
                        });
                        // 마커가 지도 위에 표시되도록 설정합니다
                        marker.setMap(map);
                        var iwContent = '<div style="padding:5px;">천재 IT교육센터 본원<br><a href="" style="color:blue" target="_blank"></a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                            iwPosition = new daum.maps.LatLng(37.4676446,126.8876698); //인포윈도우 표시 위치입니다
                        // 인포윈도우를 생성합니다
                        var infowindow = new daum.maps.InfoWindow({
                            position : iwPosition,
                            content : iwContent
                        });
                        // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
                        infowindow.open(map, marker);
                    </script>
                    <script type="text/javascript" src="http://m1.daumcdn.net/tiara/js/td.min.js"></script>
                    <script type="text/javascript">
                        var _tiq = 'undefined' !== typeof _tiq ? _tiq : [];
                        window._tiq = _tiq;
                        _tiq.push(['__trackPageview']);
                    </script>
                    <script type="text/javascript" src="http://s1.daumcdn.net/svc/attach/U03/cssjs/mapapidoc/1421136453605/service.min.js">
                    </script>
                </div>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="/layout/footer.jsp" %>
    </footer>
</div>
</body>
</html>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Author" content="천재교육 콘텐츠 제작팀">
    <meta http-equiv="Publisher" content="천재교육 김기태">
    <meta http-equiv="Copyright" content="copyright@chunjae.co.kr">
    <title>천재교육 - 회사소개</title>

    <!-- 검색엔진 최적화(SEO) -->
    <meta name="Subject" content="천재교육, 천재IT교육센터">
    <meta name="Keywords" content="천재교육, 천재 IT, 교육 교재, 교과서, 스마트 교육">
    <meta name="Description" content="천재교육은 교과서 제작, 교육 교재 제작, 초등, 중등, 고등 교육에 대한 교재와 교육을 실시하는 기관입니다.">
    <!-- <meta name="Robots" content="noindex, nofllow"> -->
    <meta name="robots" content="index,follow">

    <!-- 오픈 그래프(Open graph)-->
    <meta property="og:type" content="website">
    <meta property="og:title" content="천재교육">
    <meta property="og:description" content="앞선 생각으로 더 큰 미래의 교육을 준비하는 기업">
    <meta property="og:image" content="https://kktlove.github.io/web01/images/chunjae_logo.png">
    <meta property="og:url" content="https://kktlove.github.io/web01">

    <!-- 트위터 -->
    <meta name="twitter:card" content="picture">
    <meta name="twitter:title" content="천재교육">
    <meta name="twitter:description" content="앞선 생각으로 더 큰 미래의 교육을 준비하는 기업">
    <meta name="twitter:image" content="https://kktlove.github.io/web01/images/chunjae_logo.png">

    <!-- 모바일 앱의 iOS 인 경우
    <meta property="al:ios:url" content="ios 앱 url">
    <meta property="al:ios:app_store_id" content="ios 앱스토어 ID" />
    <meta property="al:ios:app_name" content="ios 앱 이름" />
    -->

    <!-- 모바일 앱의 Android 인 경우
    <meta property="al:android:url" content="안드로이드 앱 URL" />
    <meta property="al:android:app_name" content="안드로이드 앱 이름" />
    <meta property="al:android:package" content="안드로이드 패키지 이름" />
    <meta property="al:web:url" content="안드로이드 앱 URL" />
    -->

    <!-- 파비콘 설정 -->
    <!-- 16x16, 24x24, 32x32, 48x48, 64x64, 96x96, 114x114, 128x128, 256x256 등을 활용-->
    <!-- 표준 파비콘 -->
    <link rel="shortcut icon" href="./images/logo.ico">
    <!-- 애플 계열 모바일 -->
    <link rel="apple-touch-icon-precomposed" href="./images/logo_64.png">
    <!-- IE 계열 브라우저 -->
    <meta name="msapplication-TileColor" content="#FFFFFF">
    <meta name="msapplication-TileImage" content="./images/logo_48.png">
    <!-- 파이어폭스, 오페라, 또는 구형 크롬/사파리 -->
    <link rel="icon" href="./images/logo_16.png" sizes="16x16">
    <link rel="icon" href="./images/logo_32.png" sizes="32x32">
    <link rel="icon" href="./images/logo_48.png" sizes="48x48">
    <link rel="icon" href="./images/logo_64.png" sizes="64x64">

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="google.css">
    <link rel="stylesheet" href="fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="common.css">
    <link rel="stylesheet" href="hd.css">
    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height:100vh;
            background-repeat: no-repeat; background-position:center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; min-height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        #com { margin-top: 90px; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#333;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }

        .tab_box { clear:both; width: 1200px; height: 42px;
            margin-top: 120px; position:fixed; top:100px; left: 50%;
            margin-left: -600px; z-index:99; }
        .tab_box li { width: 25%; height: 42px; line-height: 42px; float:left; }
        .tab_box li a { display:block; width: 100%; text-align: center;
            background-color:rgba(255,215,0,0.7); }

    </style>

    <link rel="stylesheet" href="ft.css">

    <link rel="stylesheet" type="text/css" href="http://s1.daumcdn.net/svc/attach/U03/cssjs/mapapidoc/1421136453605/service.min.css">
    <style>
        body { background:white; }
    </style>
    <script type="text/javascript" src="http://dmaps.daum.net/map_js_init/v3.js"></script>
    <script type="text/javascript" src="http://s1.daumcdn.net/svc/original/U03/cssjs/jquery/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="http://s1.daumcdn.net/svc/original/U0301/cssjs/JSON-js/fc535e9cc8/json2.min.js"></script>
</head>
<body class="web guide" data-page_section="web" data-page_type="guide" data-title="Daum 지도 Web API 가이드">
<div class="wrap">
    <header class="hd">
        <div class="hd_wrap">
            <nav class="tnb">
                <ul class="menu">
                    <li><a href="login.html">로그인</a></li>
                    <li><a href="join.html">회원가입</a></li>
                    <li><a href="map.html">오시는길</a></li>
                </ul>
            </nav>
        </div>
        <div class="hd_wrap">
            <a href="index.html" class="logo">
                <img src="./images/chunjae1.png" alt="천재IT교육센터 로고타입">
            </a>
            <!-- nav.gnb>ul.menu>li.item$*5>a.dp1{메인$}+(ul.sub>li*4>a{서브$$}) -->
            <nav class="gnb">
                <ul class="menu">
                    <li class="item1">
                        <a href="company.html" class="dp1">회사소개</a>
                        <ul class="sub">
                            <li><a href="company.html#com">회사개요</a></li>
                            <li><a href="company.html#greet">인사말</a></li>
                            <li><a href="company.html#history">연혁</a></li>
                            <li><a href="company.html#map">오시는길</a></li>
                        </ul>
                    </li>
                    <li class="item2">
                        <a href="biz.html" class="dp1">사업영역</a>
                        <ul class="sub">
                            <li><a href="biz.html#text">교과서</a></li>
                            <li><a href="biz.html#ref">참고서</a></li>
                            <li><a href="biz.html#smart">스마트교육</a></li>
                            <li><a href="biz.html#edu">에듀테크</a></li>
                        </ul>
                    </li>
                    <li class="item3">
                        <a href="social.html" class="dp1">사회공헌</a>
                        <ul class="sub">
                            <li><a href="social.html#serve">학습봉사</a></li>
                            <li><a href="social.html#support">지역사회후원</a></li>
                            <li><a href="social.html#academy">학회지원</a></li>
                            <li><a href="social.html#school">공교육지원</a></li>
                        </ul>
                    </li>
                    <li class="item4">
                        <a href="promotion.html" class="dp1">홍보</a>
                        <ul class="sub">
                            <li><a href="promotion.html#news">언론보도</a></li>
                            <li><a href="promotion.html#pr">광고</a></li>
                            <li><a href="promotion.html#sns">SNS</a></li>
                            <li><a href="promotion.html#story">천재이야기</a></li>
                        </ul>
                    </li>
                    <li class="item5">
                        <a href="brand.html" class="dp1">브랜드</a>
                        <ul class="sub">
                            <li><a href="brand.html#intro">브랜드 소개</a></li>
                            <li><a href="brand.html#organizion">유관 기관</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </header>
    <div class="contents">
        <div class="breadcrumb">
            <p><a href="">HOME</a> &gt; <a href="">회사소개</a> &gt; <span id="cur">회사개요</span></p>
        </div>
        <div class="tab_box">
            <ul>
                <li><a href="#com">회사개요</a></li>
                <li><a href="#greet">인사말</a></li>
                <li><a href="#history">회사연혁</a></li>
                <li><a href="#map">오시는길</a></li>
            </ul>
        </div>
        <section class="page" id="com">
            <div class="page_wrap">
                <h2 class="page_tit">회사개요</h2>
            </div>
        </section>
        <section class="page" id="greet">
            <div class="page_wrap">
                <h2 class="page_tit">인사말</h2>
            </div>
        </section>
        <section class="page" id="history">
            <div class="page_wrap">
                <h2 class="page_tit">회사연혁</h2>
            </div>
        </section>
        <section class="page" id="map">
            <div class="page_wrap">
                <h2 class="page_tit">오시는길</h2>
                <div class="maparea">
                    <div id="map" style="margin-left:120px;	margin-top:50px; width:800px;height:600px; background:white; ">                        </div>
                    <script>
                        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                            mapOption = {
                                center: new daum.maps.LatLng(37.4676446,126.8876698), // 지도의 중심좌표
                                level: 2 // 지도의 확대 레벨
                            };
                        var map = new daum.maps.Map(mapContainer, mapOption);
                        // 마커가 표시될 위치입니다
                        var markerPosition  = new daum.maps.LatLng(37.4676446,126.8876698);
                        // 마커를 생성합니다
                        var marker = new daum.maps.Marker({
                            position: markerPosition
                        });
                        // 마커가 지도 위에 표시되도록 설정합니다
                        marker.setMap(map);
                        var iwContent = '<div style="padding:5px;">천재 IT교육센터 본원<br><a href="" style="color:blue" target="_blank"></a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
                            iwPosition = new daum.maps.LatLng(37.4676446,126.8876698); //인포윈도우 표시 위치입니다
                        // 인포윈도우를 생성합니다
                        var infowindow = new daum.maps.InfoWindow({
                            position : iwPosition,
                            content : iwContent
                        });
                        // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
                        infowindow.open(map, marker);
                    </script>
                    <script type="text/javascript" src="http://m1.daumcdn.net/tiara/js/td.min.js"></script>
                    <script type="text/javascript">
                        var _tiq = 'undefined' !== typeof _tiq ? _tiq : [];
                        window._tiq = _tiq;
                        _tiq.push(['__trackPageview']);
                    </script>
                    <script type="text/javascript" src="http://s1.daumcdn.net/svc/attach/U03/cssjs/mapapidoc/1421136453605/service.min.js">
                    </script>
                </div>
            </div>
        </section>
    </div>
    <footer class="ft">
        <div class="ft_wrap">
            <nav class="ft_link">
                <ul class="fnb">
                    <li class="ft_logo"></li>
                    <li><a href="">제휴 문의</a></li>
                    <li><a href="">이메일 무단 수집 거부</a></li>
                </ul>
                <ul class="snb">
                    <li class="item1"><a href="">소셜1</a></li>
                    <li class="item2"><a href="">소셜2</a></li>
                    <li class="item3"><a href="">소셜3</a></li>
                    <li class="item4"><a href="">소셜4</a></li>
                    <li class="item5"><a href="">소셜5</a></li>
                    <li class="locate">
                        <select name="sel" id="sel" onchange="loc()">
                            <option value="">FAMILY LINK</option>
                            <option value="https://chunjaetext.co.kr/">천재교과서</option>
                            <option value="http://www.milkt.co.kr/Main/Main_new">밀크T</option>
                            <option value="http://www.prinpia.co.kr/">프린피아</option>
                            <option value="http://www.edumon.co.kr/intro/index.asp">에듀몬</option>
                        </select>
                    </li>
                </ul>
            </nav>
            <script>
                function loc(){
                    var url = document.getElementById("sel").value;
                    //location.href = url;  //현재 창에
                    if(url!="") {
                        var win = window.open(url); //새창에
                    }
                }
            </script>
        </div>
        <div class="ft_wrap2">
            <p class="copyright">
                <span>(주)천재교육</span>
                <span>서울시 금천구 가산로9길 54</span>
                <span>대표자 강희철</span>
                <span>사업자등록번호 119-81-19350</span>
                <span>통신판매신고번호 제18-439호</span>
                <span class="end">부가통신사업신고 016712</span>
            </p>
            <p class="copyright">
                <span>천재교육 1577-0902</span>
                <span>리틀천재 1577-0218</span>
                <span>월간우등생학습 1577-6226</span>
                <span>밀크T초등 1577-1533</span>
                <span>밀크T중학 1522-5533</span>
                <span class="end">밀크T고등 1522-5533</span>
            </p>
            <p class="cp">COPYRIGHT 1981-2023 CHUNJAE EDUCATION INC. ALL RIGHTS RESERVED.</p>
        </div>
    </footer>
</div>
<!-- 문서 위로 이동 -->
<a href="#" class="totop">↑</a>
</body>
</html>