<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/postingModal.css">
<title>Insert title here</title>
</head>
<body>
<%@ include file="./header.jsp" %>
	<div id="main_container">

        <section class="b_inner">

            <div class="contents_box">

                <article class="contents cont01">

                    <div class="img_section">
                        <div class="trans_inner">
                            <div><img src="../img/1.jpg" alt=""></div>
                        </div>
                    </div>


                    <div class="detail--right_box">

                        <header class="top">
                            <div class="user_container">
                                <div class="profile_img">
                                    <img src="../img/1.jpg" alt="">
                                </div>
                                <div class="user_name">
                                    <div class="nick_name"><a href="profile.jsp">고양이</a></div>
                                    <div class="country">Seoul, South Korea</div>
                                </div>
                            </div>
                            <div class="sprite_more_icon" data-name="more">
                                <ul class="more_detail">
                                    <li>팔로우</li>
                                    <li>수정</li>
                                    <li>삭제</li>
                                </ul>
                            </div>

                        </header>

                        <section class="scroll_section">
                            <div class="admin_container">
                                <div class="admin"><img src="../img/1.jpg" alt="user"></div>
                                <div class="comment">
                                    <span class="user_id">회원id</span>댓글
                                    <div class="time">2시간</div>
                                </div>
                            </div>

                            <div class="user_container-detail">
                                <div class="user"><img src="../img/1.jpg" alt="user"></div>
                                <div class="comment">
                                    <span class="user_id">회원id</span>댓글
                                    <div class="time">2시간 <span class="try_comment">답글 달기</span></div>
                                    <div class="icon_wrap">
                                        <div class="more_trigger">
                                            <div class="sprite_more_icon"></div>
                                        </div>
                                        <div>
                                            <div class="sprite_small_heart_icon_outline"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="user_container-detail">
                                <div class="user"><img src="../img/1.jpg" alt="user"></div>
                                <div class="comment">
                                    <span class="user_id">회원id</span>댓글
                                    <div class="time">2시간 <span class="try_comment">답글 달기</span></div>
                                    <div class="icon_wrap">
                                        <div class="more_trigger">
                                            <div class="sprite_more_icon"></div>
                                        </div>
                                        <div>
                                            <div class="sprite_small_heart_icon_outline"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="user_container-detail">
                                <div class="user"><img src="../img/1.jpg" alt="user"></div>
                                <div class="comment">
                                    <span class="user_id">회원id</span>댓글내용
                                    <div class="time">2시간 <span class="try_comment">답글 달기</span></div>
                                    <div class="icon_wrap">
                                        <div class="more_trigger">
                                            <div class="sprite_more_icon"></div>
                                        </div>
                                        <div>
                                            <div class="sprite_small_heart_icon_outline"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="user_container-detail">
                                <div class="user"><img src="../img/1.jpg" alt="user"></div>
                                <div class="comment">
                                    <span class="user_id">회원id</span>너무귀엽네요
                                    <div class="time">2시간 <span class="try_comment">답글 달기</span></div>
                                    <div class="icon_wrap">
                                        <div class="more_trigger">
                                            <div class="sprite_more_icon"></div>
                                        </div>
                                        <div>
                                            <div class="sprite_small_heart_icon_outline"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="user_container-detail">
                                <div class="user"><img src="../img/1.jpg" alt="user"></div>
                                <div class="comment">
                                    <span class="user_id">회원id</span>너무귀엽네요 ㅎㅎㅎ맞팔해요~!
                                    <div class="time">2시간 <span class="try_comment">답글 달기</span></div>
                                    <div class="icon_wrap">
                                        <div class="more_trigger">
                                            <div class="sprite_more_icon"></div>
                                        </div>
                                        <div>
                                            <div class="sprite_small_heart_icon_outline"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </section>


                        <div class="bottom_icons">
                            <div class="left_icons">
                                <div class="heart_btn">
                                    <div class="sprite_heart_icon_outline" data-name="heartbeat"></div>
                                </div>
                                <div>
                                    <div class="sprite_bubble_icon"></div>
                                </div>
                                <div>
                                    <div class="sprite_share_icon" data-name="share"></div>
                                </div>
                            </div>

                            <div class="right_icon">
                                <div class="sprite_bookmark_outline" data-name="book-mark"></div>
                            </div>
                        </div>

                        <div class="count_likes">
                            좋아요
                            <span class="count">2,351</span>
                            개
                        </div>
                        <div class="timer">2시간</div>

                        <div class="commit_field">
                            <input type="text" placeholder="댓글달기..">

                            <div class="upload_btn">게시</div>
                        </div>



                    </div>


                </article>


            </div>


        </section>

    </div>
</body>
</html>