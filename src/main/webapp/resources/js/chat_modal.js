
var myUid;
var userName;




//로그인 감지
firebase.auth().onAuthStateChanged((user) => {
	if (user) {
	  // User is signed in, see docs for a list of available properties
	  myUid = user.uid;
	  userName = user.displayName;
	}
});
//로그인 감지

//--------------------채팅방이 없는 경우 채팅방 생성하기 -----------------------------------------------------------------------------------//
function chatRoom(mem_uid){
	console.log(mem_uid);
	
	firebase.database().ref('chatrooms').orderByChild("users/"+myUid).equalTo(true).once('value').then(function(snapshot){

		//내가있는 채팅방이 존재할때
		if(snapshot.exists()){
			snapshot.forEach(function(childSnapshot){
				var chatUserObject = childSnapshot.child("users").val();
				Object.getOwnPropertyNames(chatUserObject).forEach(function(key) {
					//채팅방이 이미 있으면
					if(key==mem_uid){
						chatRoomId = childSnapshot.key;
						console.log(chatRoomId);
						getMessage(chatRoomId);
						$("#chatModal").modal('hide');
						$("#chatRoom").modal('show');
						
					}
					//채팅방이 없을떄
					if(key!=myUid & key!=mem_uid){
						console.log("채팅방없음");
						var users = new Map();
						users[myUid] = true;
						users[mem_uid] = true;
						var user = new Object();
						user.users=users;

						firebase.database().ref('chatrooms').push().set(user);
						chatRoomId = getChatroomId(mem_uid);
						getMessage(chatRoomId);
						$("#chatModal").modal('hide');
						$("#chatRoom").modal('show');
						
					}

				});
		});//forEach

		}//내가있는 채팅방이 존재할떄

		//내가 속한 채팅방이 존재하지 않을때
		else{
			var users = new Map();
			users[myUid] = true;
			users[mem_uid] = true;
			var user = new Object();
			user.users=users;

			firebase.database().ref('chatrooms').push().set(user);
			chatRoomId = getChatroomId(mem_uid);
			console.log(chatRoomId);
			getMessage(chatRoomId);
			$("#chatModal").modal('hide');
			$("#chatRoom").modal('show');
		}
		

	});
}

//--------------------채팅방이 없는 경우 채팅방 생성하기 -----------------------------------------------------------------------------------//



//-----------------------채팅방ID불러오기-----------------------------------------------------------------------------------------------------//

function getChatroomId(mem_uid){
	console.log(mem_uid);
	console.log(myUid);
	firebase.database().ref('chatrooms').orderByChild("users/"+myUid).equalTo(true).once('value').then(function(snapshot){

		//내가있는 채팅방이 존재
			snapshot.forEach(function(childSnapshot){
				var chatUserObject = childSnapshot.child("users").val();
				Object.getOwnPropertyNames(chatUserObject).forEach(function(key) {
					//채팅방이 이미 있으면
					if(key==mem_uid){
								
					 var chatRoomId = childSnapshot.key;
						console.log(chatRoomId);
					//getMessage(chatRoomName);
						
					}


				});
		});//forEach

});

return chatRoomId;
}

//-----------------------채팅방ID불러오기-----------------------------------------------------------------------------------------------------//


//-----------------------메세지 불러오기-----------------------------------------------------------------------//
function getMessage(chatRoomId){
	console.log(chatRoomId);
	document.getElementById('chatRoomId').value =chatRoomId;
	console.log(document.getElementById('chatRoomId').value);
	firebase.database().ref('chatrooms/'+chatRoomId+'/comments').on('value',function(snapshot){
		var message='';
	//$(".chat-body").empty();
		if(snapshot.exists()){
			console.log('a');
			snapshot.forEach(function(childSnapshot){
				var comment = new Map();
				comment['uid'] = childSnapshot.child('uid').val();
				comment['message'] = childSnapshot.child('message').val();
				var time = childSnapshot.child('timestamp').val();									
				var timeStamp = new Date(time);
				comment['timestamp'] = timeStamp; 
					comment['profileImage'] = childSnapshot.child('profileImage').val();
					comment['name'] = childSnapshot.child('name').val();	
							
					
				
					if(comment['uid']==myUid){
						message+="<div class='answer right'><div class='avatar'><img src="+comment['profileImage']+"></div><div class='text'>"
						+comment['message']+
						"</div><div class='time'>"
						+comment['timestamp']+"</div></div>"

		
					}
					else{
						message+="<div class='answer left'><div class='avatar'><img src="
						+comment['profileImage']+
						"></div><div class='name'>"
						+comment['name']+
						"</div><div class='text'>"
						+comment['message']+
						"</div><div class='time'>"
						+comment['timestamp']+"</div></div>"

					}
				
				
					
				});
				$(".chat-body").html(message);
				$(".chat-body").scrollTop($(".chat-body").prop("scrollHeight"));
		}				
						
						
			
	});
}
//----------------------------------메세지 불러오기------------------------------------------------------------//



//--------------------------------------메세지 보내기-------------------------------------------------//

function sendMessage(chatRoomId){
		var comment = new Map();
		 
	
		var friendUid;
			comment['uid'] = myUid;
			console.log(userName);
			comment['name'] = userName;
			comment['message'] =$("#textInput").val();
			comment['timestamp'] = new Date().getTime();
	firebase.database().ref('chatrooms/'+chatRoomId+'/comments').push().set(comment);

	//상대방에게 Firebase Cloud Message 보내기
	firebase.database().ref('chatrooms/'+chatRoomId).once('value').then(function(snapshot){
			var chatUserObject = snapshot.child("users").val();
			Object.getOwnPropertyNames(chatUserObject).forEach(function(key) {
				if(key!=myUid){
					friendUid=key;
					console.log(friendUid);
					firebase.database().ref('users/'+friendUid).once('value').then(function(snapshot){
							console.log(snapshot.child("pushToken").val());
							$.ajax({
								url: 'https://fcm.googleapis.com/fcm/send',
								method :'POST',
								headers: {
											'Content-Type' : 'application/json',
											'Authorization' : 'key=AAAAR-jvvt0:APA91bH0LOf1QqiIqhc6vJ7PYhx5ry5FLbXpHhg68FGgCHN6TSdDKe6CRf9byBJGJvajrIHSOW_75lj4_NkyUwug0e_jOKIS94yGYW9jLwACt5R-hR4It4Yei3wVuIXrK-ciEX4MHqnv'
											
											
								},
								data:JSON.stringify({
									'to' : snapshot.child("pushToken").val() , 'data' : { title :userName , text:$("#textInput").val()  }

								}),
								success: function (response) {
									console.log(response)
								},
								error: function (xhr,status,error){
									console.log(xhr.error)
								}
								
							})
					});
				}	
			});	
	});
	//상대방에게 Firebase Cloud Message 보내기 
	
	document.getElementById("textInput").value='';
	document.getElementById("textInput").focus();
}
	


function add_frd(mem_no,mem_uid,del_ins){// del_ins = 1이면 삭제 아니면 추가
	$.ajax({
		url:'../member/friend_member_add_del.foc'
		,data : {mem_no : mem_no, del_ins : del_ins}
		,method : "post"
		,dataType : 'json'
		,success :function(data){
			if(del_ins==1){
				$("#friendBtn").attr("onclick","javascript:add_frd('"+data[0].MEM_NO+"','"+data[0].MEM_UID+"','2')");
				$("#friendBtn").text("친구추가");
			}else{
				$("#friendBtn").attr("onclick","javascript:add_frd('"+data[0].MEM_NO+"','"+data[0].MEM_UID+"','"+data[0].FRD_CNT+"')");
				$("#friendBtn").text("친구삭제");
			}
		}
		});
		firebase.database().ref('friends/'+myUid+'/'+mem_uid).once('value').then(function(snapshot){
			if(snapshot.exists()){
				
			}
			else{
				var friend = new Object();
				friend.friendUid = mem_uid;
				firebase.database().ref('friends/'+myUid+'/'+mem_uid).set(friend);
				location.reload();
			}
	
		});
		
	
}




$(function(){
    $(".chat").niceScroll();
}) 
/*


var text = "<%=text%>";
var time = "<%=time%>";
function formatAMPM(date) {
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? '오후' : '오전';
    hours = hours % 12;
    hours = hours ? hours : 12; // the hour '0' should be '12'
    minutes = minutes < 10 ? '0'+minutes : minutes;
    var strTime = hours + ':' + minutes + ' ' + ampm;
    return strTime;
}
function insertChat(who, text, time){   
    if (time === undefined){
        time = 0;
    }
    var control = "";
    var date = formatAMPM(new Date());
}
*/





/*
	getMessageText = function () {
	    var $message_input;
	    $message_input = $('.message_input');
	    return $message_input.val();
	};
	sendMessage = function (text) {
	    var $messages, message;
	    if (text.trim() === '') {
	        return;
	    }
	    $('.message_input').val('');
	    $messages = $('.messages');
	    message_side = message_side === 'left' ? 'right' : 'left';
	    message = new Message({
	        text: text,
	        message_side: message_side
	    });
	};
	*/
