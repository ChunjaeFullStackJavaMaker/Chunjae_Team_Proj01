<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.chunjae_pro01.util.*" %>
<%@ page import="com.chunjae_pro01.vo.*" %>
<%@ include file="/setting/encoding.jsp" %>
<%
    String path20 = request.getContextPath();
%>
<%
    String id = (String) session.getAttribute("id");
    int per =(Integer) session.getAttribute("per");

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC conn = new MariaDBCon();
    con = conn.connect();


    String sql = "select * from motherboardlist where id=? ";
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1,id);
    rs = pstmt.executeQuery();

    List<MotherBoardList> boardList = new ArrayList();
    while(rs.next()){
        MotherBoardList b = new MotherBoardList();
        b.setBno(rs.getInt("bno"));
        b.setTitle(rs.getString("title"));
        b.setContent(rs.getString("content"));
        b.setAuthor(rs.getString("author"));
        b.setId(rs.getString("id"));
        b.setResdate(rs.getString("resdate"));
        b.setCnt(rs.getInt("cnt"));
        boardList.add(b);
    }
    conn.close(rs, pstmt, con);

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내가쓴글-comunity</title>

    <%@ include file="/setting/encoding.jsp" %>
    <%@ include file="/setting/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path20 %>/css/google.css">
    <link rel="stylesheet" href="<%=path20 %>/css/fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path20 %>/css/common.css">
    <link rel="stylesheet" href="<%=path20 %>/css/header.css">
    <style>
        .contents { clear:both; min-height:100vh; }
        .contents::after { content:""; clear:both; display:block; width:100%; }
        .page { clear:both; width: 100%; min-height: 90vh; position:relative; top: 50px; }
        .page::after { content:""; display:block; width: 100%; clear:both; }
        .page_wrap { clear:both; width: 1000px; height: auto; margin:0 auto; }

        .content_header { clear: both; height: 250px; background-image: url("/images/mypage_cover.jpg");
            background-repeat: no-repeat; background-position:center -300px;
            background-size: cover; }

        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }

        .box_myboard { display : block; margin-bottom: 20px; text-align :center;}
        .btn_myboard {padding-right : 20px; padding-left :20px;  background-color: gray; color:#fff;
            border-radius:100px; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            line-height:50px; font-size:15px; }
        #btn_mb1 {background-color: yellowgreen;}

        .tb1 { width:500px; margin:50px auto; }
        .tb1 th { width:180px; line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid #333; border-bottom:1px solid #333;
            background-color:yellowgreen; color:#fff; }
        .tb1 td { width:310px; line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #333;
            padding-left: 14px; border-top:1px solid #333; }
        .item1 {white-space: nowrap; overflow: hidden; text-overflow: ellipsis;}
    </style>

    <link rel="stylesheet" href="<%=path20 %>/css/footer.css">
    <link rel="stylesheet" href="<%=path20 %>/jquery.dataTables.css">
    <script src="<%=path20 %>/jquery.dataTables.js"></script>
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
                <p class="box_myboard">
                    <a href="/mypage/myBoardListQna.jsp" class="btn_myboard">QnA </a> &nbsp&nbsp | &nbsp&nbsp
                    <% if(per == 1){%>
                    <a href="/mypage/myStudentBoardListComu.jsp" class="btn_myboard" id="btn_mb1">커뮤니티</a>
                    <%}else if(per ==2){ %>
                    <a href="/mypage/myMotherBoardListComu.jsp" class="btn_myboard" id="btn_mb1">커뮤니티</a>
                    <%} %>
                </p>
                <hr>
                <br><br>
                <table class="tb1" id="myTable">
                    <thead>
                    <th class="item1">번호</th>
                    <th class="item2">제목</th>
                    <th class="item3">글쓴이</th>
                    <th class="item4">작성일</th>
                    <th class="item5">조회</th>
                    </thead>
                    <tbody>
                    <%
                        SimpleDateFormat ymd = new SimpleDateFormat("yyyy-MM-dd");
                        for(MotherBoardList b: boardList){
                            Date d= ymd.parse(b.getResdate());
                            String date = ymd.format(d);
                    %>
                    <tr>
                        <td class="item1"><%=b.getBno() %></td>
                        <td class="item1">
                            <a href="/board/motherboard/getMotherBoard.jsp?bno=<%=b.getBno()%>"><%=b.getTitle() %></a>
                        </td>
                        <td class="item1"><%=b.getAuthor() %></td>
                        <td class="item1"><%=date %></td>
                        <td class="item1"><%=b.getCnt() %></td>
                    </tr>
                    <%} %>
                    </tbody>
                </table>
                <script>
                    $(document).ready( function () {
                        $('#myTable').DataTable({
                            order:[[0, "desc"]]
                        });
                    });
                </script>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="/layout/footer.jsp" %>
    </footer>
</div>
</body>
</html>