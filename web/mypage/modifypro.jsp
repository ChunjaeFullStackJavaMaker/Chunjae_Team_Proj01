<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae_pro01.util.*" %>
<%@ include file="/setting/encoding.jsp" %>

<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String pw2 = request.getParameter("pw2");
    String re_pw = request.getParameter("re_pw");
    String apw ="";
    if(pw2.equals(re_pw)){
        apw = pw;
    }else{
        apw = re_pw;
    }
    String tel = request.getParameter("tel");
    String email = request.getParameter("email");

    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DBC conn = new MariaDBCon();
    con = conn.connect();
    if(con != null){
        System.out.println("DB 연결 성공");
    }

    int cnt =0;
    try{
        String sql = "update member set pw =?, email=?, tel=? where id=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, apw);
        pstmt.setString(2, email);
        pstmt.setString(3, tel);
        pstmt.setString(4, id);
        cnt = pstmt.executeUpdate();
        if(cnt >0){
            response.sendRedirect("/");
        }else{
            response.sendRedirect("/mypage/modify.jsp");
        }
    } catch (SQLException e) {
        System.out.println("SQL 구문이 처리되지 못했습니다.");
    } finally {
      conn.close(rs, pstmt, con);
    }

%>