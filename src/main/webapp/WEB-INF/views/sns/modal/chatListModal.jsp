<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map,java.util.HashMap,java.util.List" %>
<!DOCTYPE html>
<html>
<head>
 <!-- <script type="text/javascript" src="<%=path.toString() %>resources/js/chat_modal.js"></script> -->
  <script type="text/javascript">
function startChat(friendUid){
  console.log(friendUid);
  chatRoom(friendUid);

}
</script>
</head>
<body>
  <script type ="text/javascript">
  $(document).ready(function()
  {
    var chatList;
    firebase.auth().onAuthStateChanged(function(user) {
      if (user) {
        var myUid = user.uid;
        console.log(myUid);

    var destinationUserList = new Array();
    firebase.database().ref("chatrooms").orderByChild("users/"+myUid).equalTo(true).once('value').then(function(snapshot){
      if(snapshot.exists()){
          snapshot.forEach(function(childSnapshot){
            var chatUserObject = childSnapshot.child("users").val();
				  Object.getOwnPropertyNames(chatUserObject).forEach(function(key) {
            if(myUid!=key){
                var destinationUid = new Object();
                destinationUid.uid = key;
                destinationUserList.push(destinationUid);
                console.log(destinationUserList);
            }

          });
      });
      
    

    for(var i=0;i<destinationUserList.length;i++){
		firebase.database().ref('users/'+destinationUserList[i].uid).once('value').then(function(snapshot){
      $("#chatRoomList2").append('<a href ="javascript:startChat(\''+snapshot.val().uid+'\')"><div class="thumb_user"><div class="profile_thumb"><img src='
        +snapshot.val().profileImageUrl+
        ' style="width: 100%;"></div><div class="detail"><div class="id">'
          +snapshot.val().userName+'</div></div></div></a>');
    });
  }
  

  }
  });

  } 
});
    
    
});

  </script>

<div class="modal fade" id="chatListModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div id="myChatListModal" class="modal-dialog" role="document">
    <div class="modal-content">
    <div class="modal-header">
       메세지목록  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
     
      </div>
      <div class="modal-body">
        <div class="chatList">
    		<article class="story">
                    <div class="scroll_inner" id="chatRoomList2">
                      
                       
                      
                    </div>
                </article>
            </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>