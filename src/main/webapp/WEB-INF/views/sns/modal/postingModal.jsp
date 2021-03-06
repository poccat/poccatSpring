<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 
</style>
<script type="text/javascript">


</script>
<meta name="viewport" content="width=device-width,initial-scale=1">
</head>
<body>
<div class="modal fade" id="postingModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
    <div class="modal-header">
       <button type="button" class="close" id="btnModalClose" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
     
      </div>
      <div class="modal-body">
      <div id="main_container">

        <section class="b_inner">

            <div class="contents_box">


                    <div class="img_section">
                			<div class="thumbnail"> 
                            <div><img id="post_main" src="../resources/common/pds/cat_01.jpg" alt=""></div>
                            <input type="hidden" id="modal_post_no" value=""/>
                            <input type="hidden" id="modal_cat_no" value=""/>
                        </div>
                    </div>

                    <div class="detail--right_box">
 <!-- =========================== 후원 알림 ========================== -->
 					<div id = "donationAlert" class="alert alert-danger alert-dismissible" style="display:none;">
					</div>
 <!-- =========================== 후원 알림 ========================== -->
                        <header class="top">
                            <div class="user_container">
                                <div class="profile_img">
                                    <img id="post_profile" src="<%=path %>resources/common/pds/cat_01.jpg" alt="">
                                </div>
                                <div class="user_name">
                                    <div class="nick_name"><a id="nick_name" href="">고양이</a></div>
                                    <div class="country">Seoul, South Korea</div>
                                </div>
                            </div>
                            <div class="user_container" style="float:right;">
                                <div class="profile_img">
                                    <img id="post_profile_user" src="<%=path %>resources/common/pds/cat_01.jpg" alt="">
                                </div>
                                <div class="user_name">
                                    <span>작성자</span><div class="nick_name"><a id="post_mem_id" >유저1</a></div>
                                    <!--유저id눌렀을때 세션에서 mem_no가져와서 친구목록 호출 클릭하면 채팅혹은 친구추가 가능하게  -->
                                </div>
                            </div>

                        </header>

                        <section id="cmt_area" class="scroll_section">
                        <!--아작스로 채워짐 -->
                        </section>


                        <div class="bottom_icons">
                            <div class="left_icons">
                                <div class="heart_btn">
                                    <div class="sprite_heart_icon_outline" data-name="heartbeat" onclick="javascript:insert_or_del_like(0)"></div>
                                    <div class="sprite_heart_icon_red" style="display:none;" data-name="heartbeat" onclick="javascript:insert_or_del_like(1)"></div>
                                </div>
                                <div>
                                    <div class="sprite_share_icon" data-name="share"></div>
                                </div>
                            </div>
                        </div>

                        <div class="count_likes">
                              	좋아요<span id="like_count" class="count">1</span>개
                        </div>
                        <div class="timer">2시간</div>
                        <div class="commit_field">
                            <input type="text" id="cmt_insert" placeholder="댓글달기.." onKeypress="javascript:if(event.keyCode==13) {cmt_insert()}"/>
								<!--아작스 인서트로 댓글 넣고 댓글 불러오는걸로 다시 불러오기? -->
                            <div style="display:inline-block; width:30px; float:right;"><a href="javascript:cmt_insert()">게시</a></div>
                        </div>



                    </div>

            </div>


        </section>

    </div>
       
      </div>
    </div>
  </div>
</div>
	              

</body>
</html>