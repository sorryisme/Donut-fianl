$(function(){
	/*
    $(".chat-close").click(function(){
        var chatToggleBtn = $(this).find('button').text();
        if(chatToggleBtn == '닫기'){
            $(".chat-area").fadeOut();
            $(".input-area").fadeOut();
            $(this).html('<button>열기<i class="fas fa-angle-down"></i></button>');
        }
        else if(chatToggleBtn =='열기')
        {
            $(".chat-area").fadeIn();
            $(".input-area").fadeIn();
            $(this).html('<button>닫기<i class="fas fa-angle-up"></i></button>');
        }
        
    })*/
    
	$.datepicker.setDefaults({
        dateFormat: 'yy-mm-dd',
        prevText: '이전',
        nextText: '다음',
        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        dayNames: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
        showMonthAfterYear: true,
        yearSuffix: '년'
    });
    
    //플로팅 메뉴
    var floatPosition = parseInt($("#floatMenu").css('top'));
	$(window).scroll(function() {
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

        $("#floatMenu").stop().animate({
			"top" : newPosition
		}, 1000);
        
        
	}).scroll();
    
    //채팅플로팅 메뉴
    var chatfloatPosition = parseInt($("#chat").css('top'));
	$(window).scroll(function() {
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + chatfloatPosition + "px";

        $("#chat").css('top', newPosition);
	}).scroll();
    
    
    //스크롤 내릴때 메뉴 숨기기/ 올릴때 보이기
    var lastScroll = 0;
     $(window).scroll(function(event){
         
         var st = $(this).scrollTop();
         
         if(st<lastScroll && $(window).scrollTop()>145){
             $(".menu-wrap.none").css("display","flex");
             $(".menu-wrap.none").css("opacity",0.8);
         }else if(st>lastScroll && $(window).scrollTop()>145){
             $(".menu-wrap.none").css("display","none");
         }else if($(window).scrollTop()<145){
             $(".menu-wrap.none").css("display","none");
         }
         lastScroll=st;
     });
    
     
     
     $("a").on('click', function(event) {

    	    // Make sure this.hash has a value before overriding default behavior
    	    if (this.hash !== "") {
    	      // Prevent default anchor click behavior
    	      event.preventDefault();

    	      // Store hash
    	      var hash = this.hash;

    	      // Using jQuery's animate() method to add smooth page scroll
    	      // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
    	      $('html, body').animate({
    	        scrollTop: $(hash).offset().top
    	      }, 800, function(){
    	   
    	        // Add hash (#) to URL when done scrolling (default click behavior)
    	        window.location.hash = hash;
    	      });
    	  } // End if
     });
     
     
     
     
//     	var progressbar = $(".progressbar"),
//		max = progressbar.attr('max'),
////		time = (10/max)*5,
//		initValue = 0,
//     	value = progressbar.val();
//
//     	var loading = function() {
//    	 initValue += 1;
//     	addValue = progressbar.val(initValue);
//
//     	progressbar.next().children().html(initValue + '%');
////     $(".progress-value").html(initValue + '%');
//
//     	if (initValue == value) {
//     		clearInterval(animate);
//     	}
//        };
//
//     var animate = setInterval(function() {
//     loading();
//     }, 10);
//    
    
    
    
    $(".login_nav").click(function(){
        $(".page-move").load('login.html');
    });
    
    $(".notice_menu").click(function(){
        $(".page-move").load('notice.html');
        
    });
    
    $(".project_menu").click(function(){
        $(".page-move").load('project.html');
        
    });
    
    $(".mypage_nav").click(function(){
        $(".page-move").load('mypage.html');
    });
    
    $(".signup_nav").click(function(){
        $(".page-move").load('signup_person.html');
    });

    $(".project_register_menu").click(function(){
        $(".page-move").load('project-register.html');
    });
    
    $(".honor_menu").click(function(){
        $(".page-move").load('honorList.html');
    });
    
    $(".match_menu").click(function(){
        $(".page-move").load('matchStart.html');
    })
    
});

AOS.init();






/*
var g_webSocket = null;
window.onload = function() {
    g_webSocket = new WebSocket("ws://localhost:8080/web/websocket");
    
    
    *//**
     * 웹소켓 사용자 연결 성립하는 경우 호출
     *//*
    g_webSocket.onopen = function(message) {
        addLineToChatBox("Server is connected.");
    };
    
    
    *//**
     * 웹소켓 메시지(From Server) 수신하는 경우 호출
     *//*
    g_webSocket.onmessage = function(message) {
        addLineToChatBox(message.data);
    };


    *//**
     * 웹소켓 사용자 연결 해제하는 경우 호출
     *//*
    g_webSocket.onclose = function(message) {
        addLineToChatBox("Server is disconnected.");
    };


    *//**
     * 웹소켓 에러 발생하는 경우 호출
     *//*
    g_webSocket.onerror = function(message) {
        addLineToChatBox("Error!");
    };
}

*/
/**
* 채팅 박스영역에 내용 한 줄 추가
*/
function addLineToChatBox(_line) {
    if (_line == null) {
        _line = "";
    }
    
    var chatBoxArea = document.getElementById("chatBoxArea");
    chatBoxArea.value += _line + "\n";
    chatBoxArea.scrollTop = chatBoxArea.scrollHeight;    
}


/**
* Send 버튼 클릭하는 경우 호출 (서버로 메시지 전송)
*/
function sendButton_onclick() {
    var inputMsgBox = document.getElementById("inputMsgBox");
    if (inputMsgBox == null || inputMsgBox.value == null || inputMsgBox.value.length == 0) {
        return false;
    }
    
    var chatBoxArea = document.getElementById("chatBoxArea");
    
    if (g_webSocket == null || g_webSocket.readyState == 3) {
        chatBoxArea.value += "Server is disconnected.\n";
        return false;
    }
    
    // 서버로 메시지 전송
    g_webSocket.send(inputMsgBox.value);
    inputMsgBox.value = "";
    inputMsgBox.focus();
    
    return true;
}


/**
* Disconnect 버튼 클릭하는 경우 호출
*/
function disconnectButton_onclick() {
    if (g_webSocket != null) {
        g_webSocket.close();    
    }
}


/**
* inputMsgBox 키입력하는 경우 호출
*/
function inputMsgBox_onkeypress() {
    if (event == null) {
        return false;
    }
    
    // 엔터키 누를 경우 서버로 메시지 전송
    var keyCode = event.keyCode || event.which;
    if (keyCode == 13) {
        sendButton_onclick();
    }
}