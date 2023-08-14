<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.chunjae_pro01.util.*" %>
<%@ page import="com.chunjae_pro01.vo.*" %>
<%@ include file="/setting/encoding.jsp" %>
<%
    String path7 = request.getContextPath();
%>
<%
    String id = (String) session.getAttribute("id");
    String per =(String) session.getAttribute("per");

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC conn = new MariaDBCon();
    con = conn.connect();

    String sql = "select * from qnalist where id=? ";
    pstmt = con.prepareStatement(sql);
    rs = pstmt.executeQuery();

    List<Qna> qnaList = new ArrayList();
    while(rs.next()){
        Qna q = new Qna();
        q.setQno(rs.getInt("qno"));
        q.setTitle(rs.getString("title"));
        q.setContent(rs.getString("content"));
        q.setAuthor(rs.getString("author"));
        q.setName(rs.getString("name"));
        q.setResdate(rs.getString("resdate"));
        q.setCnt(rs.getInt("cnt"));
        q.setLev(rs.getInt("lev"));
        q.setPar(rs.getInt("par"));
        qnaList.add(q);
    }
    conn.close(rs, pstmt, con);

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내가 쓴 글-qna</title>
    <%@ include file="/setting/encoding.jsp" %>
    <%@ include file="/setting/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path7 %>/css/google.css">
    <link rel="stylesheet" href="<%=path7 %>/css/fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path7 %>/css/common.css">
    <link rel="stylesheet" href="<%=path7 %>/css/hd.css">
    <style>
        .contents { clear:both; height:100vh;}
        .contents::after { content:""; clear:both; display:block; width:100%; }
        .content_tit {text-align: center;}

        .content_header { clear: both; height: 250px; background-image: url("/images/mypage_cover.jpg");
            background-repeat: no-repeat; background-position:center -300px;
            background-size: cover; }
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

        .box_myboard {display: block;  width:1000px; height: 80px; margin-left: 350px; margin-top: 50px;
            margin-bottom: 25px;}
        .btn_myboard { display: block; float: left; border-radius:100px; min-width: 200px;
            padding-left: 24px; padding-right: 24px; margin-right: 50px; text-align: center;
            line-height: 50px; background-color: deepskyblue;color: #fff;font-size: 25px; text-decoration: none;}

        .tb1 { width:500px; margin:50px auto; }
        .tb1 th { width:180px; line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid #333; border-bottom:1px solid #333;
            background-color:yellowgreen; color:#fff; }
        .tb1 td { width:310px; line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #333;
            padding-left: 14px; border-top:1px solid #333; }

        .indata { display:inline-block; width:300px; height: 48px; line-height: 48px;
            text-indent:14px; font-size:18px; }
        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px; text-decoration: none;}
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }
    </style>

    <link rel="stylesheet" href="<%=path7 %>/css/footer.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="/layout/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="/">Home</a> &gt; <span> 마이페이지 </span> &gt; <span> 내가 쓴 글 </span> </p>
                <h2 class="page_tit"> 내가 쓴 글 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <div class="box_myboard">
                    <a href="/mypage/myBoardListQna.jsp" class="btn_myboard">QnA</a>
                    <%if(per.equals("학생")){%>
                    <a href=/mypage/myStudentBoardListComu.jsp" class="btn_myboard">커뮤니티</a>
                    <%}else if(per.equals("학부모")){ %>
                    <a href=/mypage/myMotherBoardListComu.jsp" class="btn_myboard">커뮤니티</a>
                    <%} %>
                </div>
                <hr>
                <br><br><p class="content_tit"> QnA </p>
                <table class="tb1" id="myTable">
                    <thead>
                    <th class="item1">번호</th>
                    <th class="item2">제목</th>
                    <th class="item3">글쓴이</th>
                    <th class="item4">작성일</th>
                    <th class="item5">조회</th>
                    </thead>
                    <tbody>
                    <%if(qnaList != null){%>
                    <div style="font-size: 17px; font-weight: bold;">작성글이 없습니다.</div>
                    <% }else{
                        SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
                        for(Qna q: qnaList){
                            Date d= ymd.parse(q.getResdate());
                            String date = ymd.format(d);
                    %>
                    <tr>
                        <td class="item1"><%=q.getQno() %></td>
                        <td class="item1">
                            <a href="/qna/getQna.jsp?qno=<%=q.getQno()%>"><%=q.getTitle() %></a>
                        </td>
                        <td class="item1"><%=q.getName() %></td>
                        <td class="item1"><%=date %></td>
                        <td class="item1"><%=q.getCnt() %></td>
                    </tr>
                    <%}} %>
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