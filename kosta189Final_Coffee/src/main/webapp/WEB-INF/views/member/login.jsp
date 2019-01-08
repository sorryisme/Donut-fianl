<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../common/header.jsp" %>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script><!--kakao login API -->

<div class="login-wrap clearfix" data-aos="fade-in">
	<div class="login-container">
        		<div class="person-login" id="person-login">
	                <form method="post" action="loginCheck">
	                
			         <p>로그인</p>
			         <input type="text" id="id" name="id" placeholder="아이디"> 
			         <input type="password" id="pwd" name="pwd" placeholder="비밀번호">
			         
			         <table>
			             <tr>
			                 <td>
			                     <input type="submit" class="login-btn" id="btn_login" value="로그인">
			                 </td>
			                 <td>
			                     <input type="button" class="sign-btn" id="btn_signUpM" value="회원가입">
			                 </td>
			             </tr>
			             <tr>
			                 <td>
			                     <img id="kakao-login-btn" src="${pageContext.request.contextPath}/resources/images/kakao_login.png">
                             </td>
                             <td>
                                 <div class="fb-login-button" data-max-rows="1" data-size="medium" data-button-type="continue_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false" scope="public_profile,email" onlogin="checkLoginState();">
				                 </div>	
                             </td>
			             </tr>
			         </table>
			         </form>
		        </div>
           </div>
</div>
<script>
$(function(){
	if(${loginError != null})
		alert("${loginError}");
});

Kakao.init('be41100ffa5ef4d98b212542f79877aa');
$(document).on('click', "#kakao-login-btn", function(){
	Kakao.Auth.login({
		  success: function(authObj) {
		    Kakao.API.request({
		      url: '/v2/user/me',
		      success: function(res) {
		    	console.log(res);
		        var id = res.id;
		        var name = res.properties.nickname;
				var email = res.kakao_account.email;
				
		         $.ajax({
					url : "loginAPI",
					type : "post",
					data :{
						id : id,
						name :name,
						email : email
					},
					dataType : "json",
					success : function(result) {
						if (result.status == 'login') {
				              alert('로그인 성공완료');
				              $(location).attr("href","${pageContext.request.contextPath}/" )
				          } else {
				              alert('로그인 실패입니다!');
				          }
					},
					error : function(err) {
						alert("실패  : " + err);
					} 
				})
		      },
		      fail: function(error) {
		        alert(JSON.stringify(error));
		      }
		    });
		  },
		  fail: function(err) {
		    alert(JSON.stringify(err));
		  }
		});
});


	
	$(function() {
		$('#btn_login').click(function(){
			if($('#id').val()==''){
				alert("id를 입력하세요");
				$('#id').focus();
				return false;
			}
			
			if($('#pwd').val()==''){
				alert("비밀번호를 입력하세요");
				$('#pwd').focus();
				return false;
			}
		});
		


		$('#btn_signUpM').click(function(){			
			location.href="/web/member/signUp";
		});
	})


	
window.fbAsyncInit = function() {
    FB.init({
      appId            : '1261648697309902',
      autoLogAppEvents : true,
      xfbml            : true,
      version          : 'v3.2'
    });
  };


 function statusChangeCallback(response) {
    console.log(response);
    if (response.status === 'connected') { 
        console.log(response.authResponse);
        autoServerLogin(response.authResponse.accessToken);
    } else {
        console.log("로그인 되지 않았음");
    }
  }
    
  function checkLoginState() {
      FB.getLoginStatus(function(response) { 
        statusChangeCallback(response);
      });
  }
  
 function autoServerLogin(accessToken) {
	    $.getJSON(
	        '${pageContext.request.contextPath}/member/facebookLogin', 
	        {'accessToken': accessToken}, 
	        function(result) {
	          if (result.status == 'login') {
	              alert('로그인 성공');
	              $(location).attr("href","${pageContext.request.contextPath}/" )
	          } else {
	              alert('로그인 실패');
	          }
	    });
	}

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "https://connect.facebook.net/ko_KR/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));

</script>

<%@ include file="../common/footer.jsp" %>