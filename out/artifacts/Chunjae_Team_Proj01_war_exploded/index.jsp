<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>천재교육 팀플 1차</title>
  <%@ include file="/setting/head.jsp"%>
  <style>

    <!-- link 이동 목록 -->
    .page { clear:both; width: 100vw; height: 100vh; position:relative; }
    .page::after { content:""; display:block; width: 100%; clear:both; }

    .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
    .page_tit { font-size:48px; text-align: center; padding-top:1.75em; }

    <!--추천 강의 목록 스타일 -->
    .page_tit {margin-top : 100px;}
    .box_tit { text-align: center; padding : 10px; margin-top:20px; margin-bottom : 20px;}
    .box_group { height : 250px;  margin: 80px auto; }
    .box {float:left; display : block; width : 200px; height : 220px; border : 1px solid #333;  margin : 15px;}
    a { display: flex; flex-direction: column; text-decoration: none; color : #333; text-align: center;}
    .image { padding-bottom:20px;}


    <!--공지사항과 이벤트 게시판 스타일-->
    #page3 {clear : both; background-color: gray;}
    .board_lst { background-color: lightgray; margin-top : 30px;}
    .board { display : inline-block; margin: 60px;}
    .board_title { display : inline-block;}
    .notice_title {margin : 5px;}
    .notice_more { position : absolute; top: 1810px; left : 500px;}
    .events_title {margin : 5px;}
    .events_more { position : absolute; top : 1850px; left : 1120px;}
    .lst_group { display: flex; justify-content : space-between; margin-top : 10px; }
    .board_subject1::before { content:"공지"; padding-right: 5px; border-radius: 50px; background-color: #333;
      color:#fff; font-size: 10px; text-align: center; line-height: 20px; padding-left: 5px; }
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
