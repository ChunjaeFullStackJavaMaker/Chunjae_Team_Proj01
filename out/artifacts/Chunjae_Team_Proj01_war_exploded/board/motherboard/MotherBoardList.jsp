<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 로딩 --%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.chunjae_pro01.dto.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.chunjae_pro01.util.DBC" %>
<%@ page import="com.chunjae_pro01.util.MariaDBCon" %>
<%
    String path5 = request.getContextPath();
%>
<%
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    //2. DB 연결하기
    DBC conn = new MariaDBCon();
    con = conn.connect();

    //3. SQL을 실행하여 Result(공지사항목록)을 가져오기
    String sql = "select * from motherboard order by bno desc";
    pstmt = con.prepareStatement(sql);
    rs = pstmt.executeQuery();

    //4.가져온 목록을 boardList(공지사항목록)에 하나 씩 담기
    List<MotherBoard> motherBoardList = new ArrayList<>();
    while(rs.next()){
        MotherBoard motherBoard = new MotherBoard();
        motherBoard.setBno(rs.getInt("bno"));
        motherBoard.setTitle(rs.getString("title"));
        motherBoard.setContent(rs.getString("content"));
        motherBoard.setAuthor(rs.getString("author"));
        motherBoard.setResdate(rs.getString("resdate"));
        motherBoard.setCnt(rs.getInt("cnt"));
        motherBoardList.add(motherBoard);
    }
    conn.close(rs, pstmt, con);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 목록</title>
    <%@ include file="/setting/head.jsp" %>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path5%>/css/google.css">
    <link rel="stylesheet" href="<%=path5%>/css/fonts.css">
    <link rel="stylesheet" href="<%=path5%>/css/content_header.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path5%>/css/common.css">
    <link rel="stylesheet" href="<%=path5%>/css/header.css">
    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height:100vh;
            /*background-image: url("../images/bg_visual_overview.jpg");*/
            background-repeat: no-repeat; background-position:center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }
        .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px; }

        .tb1 { width:800px; margin:50px auto; }
        .tb1 th { line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid #8CB964; border-bottom:1px solid #8CB964;
            background-color:#8CB964; color:#fff; }
        .tb1 td {line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #8CB964;
            padding-left: 14px; border-top:1px solid #333; }

        .tb1 .item1 { width:10%; text-align: center; }
        .tb1 .item2 { width:65%; }
        .tb1 .item3 { width:10%; text-align: center; }
        .tb1 .item4 { width:15%; text-align: center; }

        .indata { display:inline-block; width:300px; height: 48px; line-height: 48px;
            text-indent:14px; font-size:18px; }
        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #8CB964; color:#fff; font-size: 18px; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }
    </style>

    <link rel="stylesheet" href="<%=path5%>/css/footer.css">
    <style>
        .btn_group { clear:both; width:800px; margin:20px auto; }
        .btn_group:after { content:""; display:block; width:100%; clear: both; }
        .btn_group p {text-align: center;   line-height:3.6; }
    </style>

    <link rel="stylesheet" href="<%=path5%>/jquery.dataTables.css">
    <script src="<%=path5%>/jquery.dataTables.js"></script>
</head>
<body>
<div class="container">
    <header class="hd" id="hd">
        <%@ include file="/layout/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="<%=path5 %>">Home</a> &gt; <span> 관리자 페이지 </span> </p>
                <h2 class="page_tit"> 학부모커뮤니티 상세보기 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">학부모커뮤니티 목록</h2>
                <br><br><hr><br><br>
                <table class="tb1" id="myTable">
                    <thead>
                    <th class="item1">글번호</th>
                    <th class="item2">글제목</th>
                    <th class="item3">작성자</th>
                    <th class="item4">작성일</th>
                    </thead>
                    <tbody>
                    <%-- 5. boardList(공지사항목록)을 테이블 태그의 tr 요소를 반복하여 출력 --%>
                    <%
                        SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
                        for(MotherBoard motherBoard:motherBoardList) {
                            Date d = ymd.parse(motherBoard.getResdate());  //날짜데이터로 변경
                            String date = ymd.format(d);    //형식을 포함한 문자열로 변경
                    %>
                    <tr>
                        <td class="item1"><%=motherBoard.getBno() %></td>
                        <td class="item2">
                            <%-- 6. 로그인한 사용자만 제목 부분의 a요소에 링크 중 bno 파라미터(쿼리스트링)으로 상세보기를 요청 가능--%>
                            <% if(sid!=null) { %>
                            <a href="/board/motherboard/getMotherBoard.jsp?bno=<%=motherBoard.getBno() %>"><%=motherBoard.getTitle() %></a>
                            <% } else { %>
                            <span><%=motherBoard.getTitle() %></span>
                            <% } %>
                        </td>
                        <td class="item3"><%=motherBoard.getAuthor() %></td>
                        <td class="item4"><%=date %></td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
                <script>
                    $(document).ready( function () {
                        $('#myTable').DataTable({
                            order:[[0, "desc"]]
                        }); // 테이블 태그의 id태그가 되어야함
                    });
                </script>
                <br><hr>
                <div class="btn_group">
                    <%-- 공지사항이므로 관리자만 글 추가 기능(링크)이 적용되도록 설정 --%>
                    <% if(sid!=null && sid.equals("admin")) { %>
                    <a href="/board/motherboard/addMotherBoard.jsp" class="inbtn">글쓰기</a>
                    <% } else { %>
                    <p>관리자만 공지사항의 글을 쓸 수 있습니다.<br>
                        로그인한 사용자만 글의 상세내용을 볼 수 있습니다.</p>
                    <% } %>
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