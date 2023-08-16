<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<style>
    .page_content { text-align: center; margin: 20px 0px; }
    .pic_lst { clear:both; width: 1200px; margin: 0px auto; }
    .pic_lst li { width: 340px; height: 242px; padding :40px; margin-right:10px; float:left;
        margin-top:30px; transition:0.4s; box-shadow:12px 12px 12px #999; overflow:hidden; box-sizing: border-box; }
    .pic_lst li:hover { margin-top: -5px; }
    .pic_lst li a { display:block; width: 256px; height: 376px; margin: 11px;
        color:#fff; text-align: left; }
    .pic_lst li:first-child { margin-left: 20px; background-color: #FFC700; border-radius: 50px; }
    .pic_lst li:nth-child(2) { margin-left:20px;background-color: green; border-radius: 50px;}
    .pic_lst li:last-child {margin-left:20px; background-color:darkorange; border-radius: 50px;}
    .pic_tit { font-size : 26px; text-shadow:0px 2px 7px rgba(0,0,0,0.12); font-weight:bold;}
    .pic_com {display: block; line-height: 1.2; position: relative; margin-top:10px; margin-bottom: 50px;}
    .pic_arrow { border : 2px solid #fff; border-radius: 50px; padding:10px; float: right; }
    #pic_a1:hover { background-color:#ffffff; color:#FFC700; transition: 0.7s; }
    #pic_a2:hover { background-color:#ffffff; color:green; transition: 0.7s; }
    #pic_a3:hover { background-color:#ffffff; color:darkorange; transition: 0.7s; }
</style>

<section class="page" id="page1">
    <div class="page_wrap">
        <h2 class="page_tit"> 메뉴 </h2>
        <p class="page_content"> 학년에 맞는 학습의 즐거움을 느껴보세요! </p>
        <ul class="pic_lst">
            <li class="item1">
                <a href="">
                    <strong class="pic_tit">초등</strong>
                    <em class="pic_com">초등학생 메뉴로 이동합니다.</em>
                    <span class="pic_arrow" id="pic_a1">이동하기 →</span>
                </a>
            </li>
            <li class="item2">
                <a href="">
                    <strong class="pic_tit">중등</strong>
                    <em class="pic_com">중학생 메뉴로 이동합니다.</em>
                    <span class="pic_arrow" id="pic_a2">이동하기 →</span>
                </a>
            </li>
            <li class="item3">
                <a href="">
                    <strong class="pic_tit">고등</strong>
                    <em class="pic_com">고등학생 메뉴로 이동합니다.</em>
                    <span class="pic_arrow" id="pic_a3">이동하기 →</span>
                </a>
            </li>
        </ul>
    </div>
</section>