<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path8 = request.getContextPath();
    String sid = (String) session.getAttribute("id");
%>
<div class="tnb_wrap">
    <nav class="tnb">
        <ul class="menu">
            <li><a href="<%=path8 %>/member/login.jsp"> 로그인 </a></li>
            <li><a href="<%=path8 %>/member/term.jsp"> 회원가입 </a></li>
        </ul>
    </nav>
</div>
<div class="hd_wrap">
    <a href="/" class="logo">
        <img src="<%=path8%>/images/corn_edu_400-256.png" alt="CORN EDU 로고 타입">
    </a>
    <nav class="gnb">
        <ul class="menu">
            <li class="item1">
                <a href="" class="dp1"> 소 개 </a>
                <ul class="sub">
                    <li><a href=""> 회사 소개 </a></li>
                    <li><a href=""> 서비스 소개 </a></li>
                    <li><a href=""> 오시는 길 </a></li>
                </ul>
            </li>
            <li class="item2">
                <a href="" class="dp1"> 초 등 </a>
                <ul class="sub">
                    <li><a href=""> 강의 소개 </a></li>
                    <li><a href=""> 교재 소개 </a></li>
                </ul>
            </li>
            <li class="item3">
                <a href="" class="dp1"> 중 등 </a>
                <ul class="sub">
                    <li><a href=""> 강의 소개 </a></li>
                    <li><a href=""> 교재 소개 </a></li>
                </ul>
            </li>
            <li class="item4">
                <a href="" class="dp1"> 고 등 </a>
                <ul class="sub">
                    <li><a href=""> 강의 소개 </a></li>
                    <li><a href=""> 교재 소개 </a></li>
                </ul>
            </li>
            <li class="item5">
                <a href="" class="dp1"> 커뮤니티 </a>
                <ul class="sub">
                    <li><a href=""> 학생 커뮤니티 </a></li>
                    <li><a href="<%=path8 %>/board/motherboard/MotherBoardList.jsp"> 학부모 커뮤니티 </a></li>
                </ul>
            </li>
            <li class="item6">
                <a href="" class="dp1"> 고객지원 </a>
                <ul class="sub">
                    <li><a href=""> 공지사항 </a></li>
                    <li><a href=""> QnA </a></li>
                    <li><a href=""> FAQ </a></li>
                </ul>
            </li>
        </ul>
    </nav>
</div>