<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>천재교육 팀플 1차</title>
  <%@ include file="/setting/head.jsp"%>
  <style>
    .contents { clear: both;}
    .contents::after { content:""; clear:both; display:block; width:100%; }
    .vs { clear:both; width:100%; min-height:600px; background-color: rgb(255, 255, 255); position:relative; overflow:hidden; }
    .img_box { position:relative; width: 100%; height:600px; overflow:hidden; }
    .img_box li { visibility:hidden; opacity:0;  transition-duration:0.7s; transition-delay:0.1s;    width:100%; height:600px;  }
    .img_box li .bg_box { width:100%; height:600px; background-repeat: no-repeat; background-position:center center; background-size:cover; position:absolute;left: 0; top: 0; z-index:5; }
    .img_box li.active .bg_box { z-index:6; }
    .img_box li.item1 .bg_box { background-image: url("./images/education01.jpg"); border-radius: 150px; }
    .img_box li.item2 .bg_box { background-image: url("./images/education02.jpg"); border-radius: 150px;}
    .img_box li .vs_tit { position:absolute; top:150px; left:100px; z-index:10; font-weight: 100; font-size: 50px; line-height: 1.3; color:#fff; }
    .img_box li.active { visibility: visible; opacity: 1; }
    .btn_box li .vs_btn { display:block; width: 15px; height: 15px; background-color:rgba(255,255,255,0.8); border:2px solid #fff; position:absolute; top:100px; left: 100px; z-index:14; cursor:pointer; border-radius:50%; }
    .btn_box li.item2 .vs_btn { left: 132px; }
    .btn_box li.active .vs_btn { background-color: #fff; border:2px solid #333; }
    .vs_ra { display:none; }

    .play_btn { display:block; width: 12px; height: 12px; position:absolute; top:98px; left: 164px; z-index:14; cursor:pointer; color: #fff; border:0;  background-color: transparent; font-weight: 900; }

    <!-- link 이동 목록 -->
    .page { clear:both; width: 100vw; height: 100vh; position:relative; }
    .page::after { content:""; display:block; width: 100%; clear:both; }

    .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
    .page_tit { font-size:48px; text-align: center; padding-top:1.75em; }

    .pic_lst { clear:both; width: 1200px; margin: 60px auto; }
    .pic_lst li { width: 280px; margin-right:26px; height: 400px; float:left;
      background-repeat: no-repeat; background-position:center center;
      filter:brightness(90%); margin-top:30px; transition:0.4s;
      box-shadow:12px 12px 12px #999; overflow:hidden;  }
    .pic_lst li:hover { filter:brightness(140%); margin-top: -10px; }
    .pic_lst li a { display:block; width: 256px; height: 376px; margin: 11px;
      border:1px solid #fff; color:#fff; }
    .pic_lst li:last-child { margin-right: 0; }
    .pic_lst li.item1 { background-image: url("./images/img_social_main01.jpg"); }
    .pic_lst li.item2 { background-image: url("./images/img_social_main02.jpg"); }
    .pic_lst li.item3 { background-image: url("./images/img_social_main03.jpg"); }
    .pic_lst li.item4 { background-image: url("./images/img_social_main04.jpg"); }
    .pic_com { padding-left: 20px; padding-top: 20px; font-size:14px; }
    .pic_tit { padding-left: 20px; padding-top: 20px; font-size:18px; }
    .pic_arrow { display:block; width:110px; height:10px; border-bottom:1px solid #fff;
      margin-top: 20px; margin-left: -12px; transition:0.4s; position:relative; }
    .pic_lst li:hover a .pic_arrow { margin-left:20px; }
    .pic_arrow::after { content:""; display:block; width: 10px; height: 10px;
      position:absolute; right:0; top: 0; border-bottom:1px solid #fff; transform-origin:100% 100%;
      transform:rotate(45deg); display:none; }
    .pic_lst li:hover a .pic_arrow::after { display:block; }

    <!--추천 강의 목록 스타일-->
    .box_tit { text-align: center; padding : 10px; margin-top:20px; margin-bottom : 20px;}
    .box_group { height : 250px; margin: 80px auto; }
    .box {float:left; display : block; width : 180px; height : 220px; padding : 15px; border : 1px solid #333;  margin : 10px;}
    a { text-decoration: none; display : flex; color : #333; text-align: center;}

    <!--공지사항과 이벤트 게시판 스타일-->
    #page3 {clear : both; background-color: gray;}
    .board_lst { background-color: lightgray; margin-top : 30px;}
    .board { display : inline-block; margin: 60px;}
    .board_title { display : inline-block;}
    .notice_title {margin : 5px;}
    .notice_more { position : absolute; top: 1970px; left : 500px;}
    .events_title {margin : 5px;}
    .events_more { position : absolute; top : 1980px; left : 1120px;}
    .lst_group { display: flex; justify-content : space-between; margin-top : 10px; }
    .board_subject1::before { content:"공지"; padding-right: 5px; border-radius: 50px; background-color: #333;
      color:#fff; font-size: 10px; text-align: center; line-height: 20px; padding-left: 5px; padding-right: 5px;}
    .board_subject2::before { content:"공지"; padding-right: 5px; border-radius: 50px; background-color: #333;
      color:#fff; font-size: 10px; text-align: center; line-height: 20px; padding-left: 5px; padding-right: 5px;}
    a { text-decoration: none; display : flex; color : #333; text-align: center;}
    .lst { border-top:2px solid #333; margin:0; width : 500px; padding: 0; }
  </style>
</head>

<body>
  <div class="wrap">
    <div class="hd" id="hd">
      <%@ include file="/layout/header.jsp" %>
    </div>
    <!-- 컨텐츠 상단 부분 content.jsp-->
    <%@ include file="/content/content.jsp"%>

    <!-- 메뉴 링크 부분 link.jsp -->
    <%@ include file="/content/link.jsp"%>

    <!--추천 강의 목록 lecture.jsp -->
    <%@include file="/content/lecture.jsp" %>

    <!--공지사항, 이벤트 게시판 board.jsp-->
    <%@ include file="/content/board.jsp" %>

    <div class="ft" id="ft">
      <%@ include file="/layout/footer.jsp"%>
    </div>
</body>
</html>
