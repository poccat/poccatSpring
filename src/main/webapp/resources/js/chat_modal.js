
function chatRoom(mem_uid){
	alert(mem_uid+"멤버uid");
	$("#chatRoom").modal('show');
	$("#chatModal").modal('hide');
}
function add_frd(mem_no){
	alert("친구추가 함수작동"+mem_no);
}
$(function(){
    $(".chat").niceScroll();
}) 
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
function onKeyDown(){
     if(event.keyCode == 13){
		return sendMessage(getMessageText());
	}
}
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
