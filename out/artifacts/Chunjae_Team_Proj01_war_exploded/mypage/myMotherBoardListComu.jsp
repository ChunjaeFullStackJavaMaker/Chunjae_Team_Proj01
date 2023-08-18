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

    int pageNo = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 0;
    // 총 페이지 수
    int totalPage = 0;
    // 마지막 페이지
    int endPage = pageNo+2 < 5 ? 5 : pageNo+2;
    // 학부모 게시글 총 개수
    int count = 0;

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    DBC con = new MariaDBCon();
    conn = con.connect();

    // 페이징 처리 - 전체 페이지 수 구하기
    String sql = "SELECT COUNT(*) as 'count' FROM MotherBoardList";
    pstmt = conn.prepareStatement(sql);
    rs = pstmt.executeQuery();
    if(rs.next()) {
        count = rs.getInt("count");
        totalPage = count % 10 == 0 ? count / 10 : (count / 10) + 1;
        // 전체 페이지가 0일 경우 (=게시글이 없는 경우)
        totalPage = (totalPage == 0) ? 1 : totalPage;
    }
    rs.close();
    pstmt.close();

    // 페이징 처리 - 현재 페이지에 출력될 페이지 리스트 구하기
    if(endPage > totalPage) {
        endPage = totalPage;
    }
    List<Integer> pageList = new ArrayList<>();
    for(int p=(endPage-4 > 0 ? endPage-4 : 1); p<=endPage; p++) {
        pageList.add(p);
    }

    sql = "select * from motherboardlist where id=? ORDER BY bno DESC ";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,id);
    pstmt.setInt(1, 10*(pageNo-1));
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

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date d = sdf.parse(rs.getString("resdate"));
        b.setResdate(sdf.format(d));

        boardList.add(b);
    }
    con.close(rs, pstmt, conn);

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
    <link rel="stylesheet" href="<%=path20 %>/css/content_header.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path20 %>/css/common.css">
    <link rel="stylesheet" href="<%=path20 %>/css/header.css">
    <link rel="stylesheet" href="<%=path20  %>/css/msboard.css">
    <link rel="stylesheet" href="<%=path20 %>/css/mgmt.css">

    <style>
        .contents { clear:both; min-height:100vh; }
        .contents::after { content:""; clear:both; display:block; width:100%; }
        .page { clear:both; width: 100%; min-height: 90vh; position:relative; top: 50px; margin:0px auto;}
        .page::after { content:""; display:block; width: 100%; clear:both; }
        .page_wrap { clear:both; width: 1000px; height: auto; margin:0 auto; }

        .content_tit { font-weight: bold; font-size: 25px; margin: 80px 30px 30px 10px; }

        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }

        .box_myboard { display : block; margin-bottom: 20px; text-align :center;}
        .btn_myboard {padding-right : 20px; padding-left :20px;  background-color: gray; color:#fff;
            border-radius:100px; box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            line-height:50px; font-size:15px; text-align: center;}
        #btn_mb1 {background-color: yellowgreen;}
    </style>

    <link rel="stylesheet" href="<%=path20 %>/css/footer.css">
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
                <p class="content_tit">
                    <a href="/mypage/myBoardListQna.jsp" class="btn_myboard">QnA </a> &nbsp&nbsp | &nbsp&nbsp
                    <% if(per == 1){%>
                    <a href="/mypage/myStudentBoardListComu.jsp" class="btn_myboard" id="btn_mb1">커뮤니티</a>
                    <%}else if(per ==2){ %>
                    <a href="/mypage/myMotherBoardListComu.jsp" class="btn_myboard" id="btn_mb1">커뮤니티</a>
                    <%} %>
                </p>
                <hr>
                <div class="board_list_wrap">
                    <div class="board_list">
                        <div class="top" >
                            <div class="bno" >글번호</div>
                            <div class="qTitle" >제목</div>
                            <div style="width:25% ">작성자</div>
                            <div class="resdate">작성일</div>
                        </div>
                    <% for(MotherBoardList b: boardList){ %>
                    <div>
                        <div class="bno"><%=b.getBno() %></div>
                        <div class="qTitle">
                            <a href="<%=path20 %>/board/motherboard/getMotherBoard.jsp?bno=<%=b.getBno()%>"><%=b.getTitle() %></a>
                        </div>
                        <div style="width:25%"><%=b.getAuthor() %></div>
                        <div class="resdate"><%=b.getResdate() %></div>
                    </div>
                    <%}%>
                    <% if(count==0){ %>
                    <div>
                        <p class="result">작성한 글이 없습니다.</p>
                    </div>
                    <%} %>
                    </div>
                    <div class="board_page">
                        <a href="<%=path20 %>/mypage/myMotherBoardListComu.jsp?page=1" class="bt first"> &lt;&lt; </a>
                        <a href="<%=path20 %>/mypage/myMotherBoardListComu.jsp?page=<%=pageNo-1 < 1 ? 1 : pageNo-1%>" class="bt prev"> &lt; </a>
                        <%  for(int p : pageList) {  %>
                        <a href="<%=path20 %>/mypage/myMotherBoardListComu.jsp?page=<%=p%>" class="num <%=(p==pageNo) ? "on" : ""%>"> <%=p%> </a>
                        <%  } %>
                        <a href="<%=path20 %>/mypage/myMotherBoardListComu.jsp?page=<%=pageNo+1 > totalPage ? totalPage : pageNo+1%>" class="bt next"> &gt; </a>
                        <a href="<%=path20 %>/mypage/myMotherBoardListComu.jsp?page=<%=totalPage%>" class="bt last"> &gt;&gt; </a>
                    </div>
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