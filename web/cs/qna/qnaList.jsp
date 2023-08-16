<%--
  Created by IntelliJ IDEA.
  User: jk347
  Date: 2023-08-15
  Time: 오전 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 라이브러리 임포트 --%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.*" %>
<%@ page import="com.chunjae_pro01.util.*" %>
<%@ page import="com.chunjae_pro01.vo.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<%
    String path5 = request.getContextPath();
%>

<%
    //2. DB 연결
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    //3. SQL을 실행하여 결과셋(ResultSet) 받아오기
    String sql = "SELECT a.qno AS qno, a.title AS title, a.content AS content, a.author AS author, a.resdate AS resdate, a.cnt as cnt, a.lev AS lev, a.par AS par, b.name AS name FROM qna a, member b WHERE a.author=b.id order BY a.par DESC, a.lev ASC, a.qno ASC";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();

    //4. 받아온 결과셋(ResultSet) 을 질문및답변 목록(qnaList)에 불러와 하나의 레코드씩 담기
    List<Qna> qnaList = new ArrayList<>();
    while(rs.next()){
        Qna qna = new Qna();
        qna.setQno(rs.getInt("qno"));
        qna.setTitle(rs.getString("title"));
        qna.setContent(rs.getString("content"));
        qna.setAuthor(rs.getString("author"));
        qna.setResdate(rs.getString("resdate"));
        qna.setCnt(rs.getInt("cnt"));
        qna.setLev(rs.getInt("lev"));
        qna.setPar(rs.getInt("par"));
        qna.setName(rs.getString("name"));
        qnaList.add(qna);
    }
    con.close(rs, pstmt, conn);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>묻고 답하기 목록</title>
    <%@ include file="/setting/head.jsp" %>
    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path5%>/css/google.css">
    <link rel="stylesheet" href="<%=path5%>/css/fonts.css">
    <link rel="stylesheet" href="<%=path5%>/css/login.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path5%>/css/common.css">
    <link rel="stylesheet" href="<%=path5%>/css/header.css">
    <link rel="stylesheet" href="<%=path5%>/css/board.css">
    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height:100vh;
            background-image: url("<%=path5%>/images/bg_visual_overview.jpg");
            background-repeat: no-repeat; background-position:center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 400px; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }
        .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px; }

        .tb1 { width:500px; margin:0 auto; }
        .tb1 td { width:500px; line-height: 48px; padding-top:24px; padding-bottom:24px; }

        .indata { display:inline-block; width: 500px; height: 48px; line-height: 48px;
            text-indent:14px; font-size:18px; }
        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }
    </style>

    <link rel="stylesheet" href="<%=path5%>/css/footer.css">
    <style>
        .btn_group { clear:both; width:800px; margin:20px auto; }
        .btn_group:after { content:""; display:block; width:100%; clear: both; }
        .btn_group p {text-align: center;   line-height:3.6; }
    </style>

    <link rel="stylesheet" href="../jquery.dataTables.css">
    <script src="../jquery.dataTables.js"></script>
    <style>
        #myTable_length, #dataTables_filter { margin-top:20px; margin-bottom:20px; }
    </style>
</head>
<body>
<div class="container">
    <header class="hd" id="hd">
        <%@ include file="/layout/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="breadcrumb">
            <p><a href="/">HOME</a> &gt; <a href="/cs/qna/qnaList.jsp">질문 및 답변</a> &gt; <span>질문 및 답변 목록</span></p>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">질문 및 답변 목록</h2>
                <br><br><hr><br><br>
                <table class="tb1" id="myTable">
                    <thead>
                    <tr>
                        <th class="item1">글번호</th><th class="item2">제목</th>
                        <th class="item3">작성자</th><th class="item4">작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        SimpleDateFormat ymd = new SimpleDateFormat("yy-MM-dd");
                        int tot = qnaList.size();
                        for(Qna q:qnaList) {
                            Date d = ymd.parse(q.getResdate());
                            String date = ymd.format(d);
                    %>
                    <tr>
                        <td class="item1"><%=tot %></td>
                        <td class="item2">
                            <% if(q.getLev()==0) { %>
                            <a href="/cs/qna/getQna.jsp?qno=<%=q.getQno()%>"><%=q.getTitle() %></a>
                            <% } else { %>
                            <a style="padding-left:28px;" href="/cs/qna/getQna.jsp?qno=<%=q.getQno()%>">[답변] <%=q.getTitle() %></a>
                            <% } %>
                        </td>
                        <td class="item3"><%=q.getName()%></td>
                        <td class="item4"><%=date %></td>
                    </tr>
                    <%
                            tot--;
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="/layout/footer.jsp" %>
    </footer>
</div>
</body>
</html>
