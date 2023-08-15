<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae_pro01.util.*" %>
<%@ page import="com.chunjae_pro01.dto.*" %>
<%@ include file="/setting/encoding.jsp" %>
<%
    String path6 = request.getContextPath();
%>
<%
    String id = (String) session.getAttribute("id");

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC conn = new MariaDBCon();
    con = conn.connect();
    if(con != null){
        System.out.println("DB 연결 성공");
    }

    Member m = new Member();
    String pw="";
    try{
        String sql = "select * from member where id=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, id);
        rs = pstmt.executeQuery();
        if(rs.next()){
            m.setId(rs.getString("id"));
            m.setPw(rs.getString("pw"));
            m.setName(rs.getString("name"));
            m.setEmail(rs.getString("email"));
            m.setTel(rs.getString("tel"));
            m.setResdate(rs.getString("resdate"));
            m.setPoint(rs.getInt("point"));
            pw=m.getPw();
        }else{
            response.sendRedirect("/member/login.jsp");
        }
    } catch (SQLException e) {
        System.out.println("SQL 구문이 처리되지 못했습니다.");
    } finally{
        conn.close(rs, pstmt, con);
    }

    String pw2 = pw.substring(0,2);
    for(int i=0; i<pw.length()-2;i++){
        pw2 += "*";
    }

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개인정보 수정</title>
    <%@ include file="/setting/encoding.jsp" %>
    <%@ include file="/setting/head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="<%=path6 %>/css/google.css">
    <link rel="stylesheet" href="<%=path6 %>/css/fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="<%=path6 %>/css/common.css">
    <link rel="stylesheet" href="<%=path6 %>/css/header.css">
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
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }
    </style>

    <link rel="stylesheet" href="<%=path6 %>/css/footer.css">
</head>
<body>
<div class="wrap">
    <header class="hd" id="hd">
        <%@ include file="/layout/header.jsp" %>
    </header>
    <div class="contents" id="contents">
        <div class="content_header">
            <div class="breadcrumb">
                <p><a href="/">Home</a> &gt; <span> 마이페이지 </span> &gt; <span> 개인정보 변경 </span> </p>
                <h2 class="page_tit"> 개인정보 변경 </h2>
            </div>
        </div>
        <section class="page" id="page1">
            <div class="page_wrap">
                <form action="modifypro.jsp" method="post">
                    <table class="tb1">
                        <tbody>
                        <tr>
                            <th>아이디</th>
                            <td><input type="text" name="id" id="id" class="indata" value="<%=m.getId() %>" readonly required/></td>
                        </tr>
                        <tr>
                            <th>비밀번호</th>
                            <td>
                                <input type="text" value="<%=pw2 %>" name="re_pw" id="re_pw" class="indata" required>
                                <input type="hidden" value="<%=pw2 %>" name="pw2" id="pw2" />
                                <input type="hidden" value="<%=pw %>" name="pw" id="pw" />
                            </td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td><input type="text" value="<%=m.getName() %>" name="name" id="name" class="indata" disabled></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><input type="tel" value="<%=m.getTel() %>" name="tel" id="tel" class="indata" required></td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td><input type="email" value="<%=m.getEmail() %>" name="email" id="email" class="indata" required></td>
                        </tr>
                        <tr>
                            <td colspan="2" class="colspan">
                                <input type="submit" value="회원정보수정" class="inbtn">
                                <a href="/mypage/mypage.jsp" class="inbtn">마이페이지로</a>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="/layout/footer.jsp" %>
    </footer>
</div>
</body>
</html>