<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
</head>
<body>
	<!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
	<script type="text/javascript">
		/*결제를 위해 필요한 data*/
		var giveMoney = ${giveDTO.giveMoney};
		var name = "${sessionScope.userDTO.name}";
		var projectSubject = "${param.projectSubject}";
		var email = "${sessionScope.userDTO.email}";
		var tel = "${sessionScope.userDTO.phone}";
		var postcode = "${param.postcode}";
		var IMP = window.IMP; // 생략해도 괜찮습니다.
		IMP.init('imp15231326'); //"가맹점 식별코드"를 사용합니다.
		
		/*access_token을 받기 위한 data*/
		var apiKey = '8001201219160277';
		var apiSecret = 'vPfS0qHRvL2KNdZWb7zfniXvNcPVA4B5TRXThFKNqNxe0wacDJr02pwPClKcpmhjefdwUXjkLQzMmJZZ';
		var form = new FormData();
		form.append("imp_key", apiKey);
		form.append("imp_secret", apiSecret);
		
		/*DB에 넣기 위한 data*/
		var memo = "${giveDTO.payment.memo}";
		var receiver = "${giveDTO.payment.receiver}";
		var projectNo = ${giveDTO.projectNo};
		var id = "${giveDTO.id}";
		var addr = "${param.roadAddress} " + "${param.detailAddress}" + "${param.extraAddress}";
		var call = "${giveDTO.payment.call}";
		
		/*금액 or 물품*/
		var moneyOrItem = ${param.moneyOrItem};
		
		/*Unix 시간을 Date로 보내주는 함수*/
		function timeConverter(UNIX_timestamp){
           var a = new Date(UNIX_timestamp * 1000);
           var months = ['01','02','03','04','05','06','07','08','09','10','11','12'];
           var year = a.getFullYear();
           var month = months[a.getMonth()];
           var date = (a.getDate()<10?'0':'') + a.getDate();
           //console.log("date" + date);
           var hour = (a.getHours()<10?'0':'') + a.getHours();
           //console.log("hour" + hour);
           var min = (a.getMinutes()<10?'0':'') + a.getMinutes();
           //console.log("min" + min);
           var sec = (a.getSeconds()<10?'0':'') + a.getSeconds();
           //console.log("sec" + sec);
           var time = year +month + date + hour + min + sec;
           return time;
         }
		

		/* IMP.request_pay(param, callback) 호출 PC 환경에서는 지정한 pg사의 결제모듈 창이 나타남 */			
		IMP.request_pay({ // param
		    pg: "html5_inicis", //결제방식
		    pay_method: "card", //결제수단
		    merchant_uid: 'merchant_' + new Date().getTime(), //주문번호
		    name: projectSubject, //주문 상품
		    amount: giveMoney, //결제 금액
		    buyer_email: email, //구매자 이메일
		    buyer_name: name, //구매자 이름
		    buyer_tel: tel, //구매자 전화번호
		    buyer_addr: addr, //받는사람 우편주소
		    buyer_postcode: postcode //받는사람 우편번호
		}, function (rsp) { // callbackF
		    if (rsp.success) //결제 성공했을 때 
		    {
		    	var imp_uid = rsp.imp_uid;
		        $.ajax({ //ajax 전체
					//async : true,  //요청이 비동기식으로 처리되는지 여부
					//crossDomain : true,
					url : "https://api.iamport.kr/users/getToken?=,", //서버 요청 주소
					method : "post", //전송 방식(get or post)
					dataType : "json", //서버가 보내주는 데이터타입(text,html,xml,json)
					mimeType : "multipart/form-data",
					data : form, //서버에게 보낼 parameter 정보
					processData: false,    // 반드시 작성 - 요청으로 보낸 데이터를 query string 형태로 변환할지 여부를 나타냄 기본값은 true
												//파일 전송의 경우 이를 하지 않아야 하고 이를 설정하는 것이 processData : false 이다.
					contentType: false,    // 반드시 작성 - 서버로 보내지는 데이터의 content-type
												//default 값이 "application/x-www-form-urlencoded; charset=UTF-8" 인데, "multipart/form-data" 로 전송이 되게 false 로 넣어준다.
					success : function(result){ //토큰 받아오는 것을 성공했을 때
						
						var access_token = result.response.access_token;
						var form = new FormData();
						form.append("", "");
						
						/////////////////////////////////////
						/* 토큰으로 결제 승인 값 가져오기 */
						
						$.ajax({ 
							url : "https://api.iamport.kr/payments/" + imp_uid + "?_token=" + access_token, //서버 요청 주소
							method : "get", //전송 방식(get or post)
							dataType : "json", //서버가 보내주는 데이터타입(text,html,xml,json)
							mimeType : "multipart/form-data",
							data : form, //서버에게 보낼 parameter 정보
							processData: false,    // 반드시 작성 - 요청으로 보낸 데이터를 query string 형태로 변환할지 여부를 나타냄 기본값은 true
														//파일 전송의 경우 이를 하지 않아야 하고 이를 설정하는 것이 processData : false 이다.
							contentType: false,    // 반드시 작성 - 서버로 보내지는 데이터의 content-type
														//default 값이 "application/x-www-form-urlencoded; charset=UTF-8" 인데, "multipart/form-data" 로 전송이 되게 false 로 넣어준다.
							success : function(result){ //결제 승인 값 가져오기 성공했을 때
								console.log("====" + result.response);
								var payMethod = result.response.card_name // "BC카드"
								var receiptURL = result.response.receipt_url //영수증 주소
								
								console.log(receiptURL+"+++++");
								
								//시간 변환
								var permissionDate = timeConverter(result.response.paid_at);
								console.log(permissionDate);
								console.log(result.response.paid_at+"이거이거");
								console.log(result.response.card_name+"이것도");
								
								//--------------------------------------------------------------------------//
								/* DB에 저장하기 */;
								
								 if(moneyOrItem == 1) //금액일 경우
								{
									var data = {
										projectNo:projectNo,
										id:id,
										giveMoney:giveMoney,
										payment:{
											payMethod:payMethod,
											payMoney:giveMoney,
											receiver:receiver,
											addr:addr,
											permissionDate:permissionDate,
											call:call,
											memo:memo,
											receiptURL:receiptURL
										}
									}
								} else
								{
									var giveItem1 = '${giveDTO.giveItem}';
	    							var giveItem = JSON.parse(giveItem1);
									console.log(giveItem);
									
									var data = {
										projectNo:projectNo,
										id:id,
										giveMoney:giveMoney,
										payment:{
											payMethod:payMethod,
											payMoney:giveMoney,
											receiver:receiver,
											addr:addr,
											permissionDate:permissionDate,
											call:call,
											memo:memo,
											receiptURL:receiptURL
										},
										giveItem:giveItem
									}
								}
								
								$.ajax({ 
									url : "paymentComplete", //서버 요청 주소
									contentType: 'application/json',
									type : "post", //전송 방식(get or post)
									dataType : "text", //서버가 보내주는 데이터타입(text,html,xml,json)
									data : JSON.stringify(data), //서버에게 보낼 parameter 정보들
									success : function(result){ //DB에 저장 성공했을 때
										if(confirm("결제가 완료되었습니다. 기부하신 프로젝트에 응원댓글을 작성하시겠습니까?"))
									    {
									     	location.href="${pageContext.request.contextPath}/project/projectRead?projectNo="+projectNo;
									    }
									    else
									    {
									    	alert("응원댓글은 추후에 직접 프로젝트 상세페이지의 응원 댓글 탭에서도 작성하실 수 있습니다. 메인 페이지로 이동합니다. 감사합니다.");
									    	location.href="${pageContext.request.contextPath}";
									    }
									},
									error : function(err){//DB에 넣는 것을 실패했을 때
										 var msg = '결제에 실패하였습니다.';
								         msg += '에러내용 : ' + err.error_msg;
								         if(confirm("결제에 실패하였습니다. 프로젝트로 다시 돌아가시겠습니까?"))
									     {
									      	 location.href="${pageContext.request.contextPath}/project/projectRead?projectNo="+projectNo;
									     }
									     else
									     {
									    	 alert("메인 페이지로 이동합니다. 이용에 불편을 드려 죄송합니다.");
									    	 location.href="${pageContext.request.contextPath}";
									     }
									}
								}); //DB에 저장 끝 
								//--------------------------------------------------------------------------//
							},//결제 승인 값 가져오기 성공했을 때 끝
							error : function(err){//결제 승인 값 받아오는 것을 실패했을 때
								 var msg = '결제에 실패하였습니다.';
						         msg += '에러내용 : ' + rsp.error_msg;
						         if(confirm("결제에 실패하였습니다. 프로젝트로 다시 돌아가시겠습니까?"))
							     {
							      	 location.href="${pageContext.request.contextPath}/project/projectRead?projectNo="+projectNo;
							     }
							     else
							     {
							    	 alert("메인 페이지로 이동합니다. 이용에 불편을 드려 죄송합니다.");
							    	 location.href="${pageContext.request.contextPath}";
							     }
							}
						});//토큰으로 결제 승인 값 가져오기 끝
					},//토큰으로 결제 승인 성공했을 때 끝
					error : function(err){//토큰 받아오는 것을 실패했을 때
					     var msg = '결제에 실패하였습니다.';
				         msg += '에러내용 : ' + err.error_msg;
				         if(confirm("결제에 실패하였습니다. 프로젝트로 다시 돌아가시겠습니까?"))
					     {
					      	 location.href="${pageContext.request.contextPath}/project/projectRead?projectNo="+projectNo;
					     }
					     else
					     {
					    	 alert("메인 페이지로 이동합니다. 이용에 불편을 드려 죄송합니다.");
					    	 location.href="${pageContext.request.contextPath}";
					     }					
					}
				});//ajax 전체 끝
		    }//결제 성공 끝 
		    else 
		    {
		    	 var msg = '결제에 실패하였습니다.';
		         msg += '에러내용 : ' + rsp.error_msg;
		         if(confirm("결제에 실패하였습니다. 프로젝트로 다시 돌아가시겠습니까?"))
			     {
			      	 location.href="${pageContext.request.contextPath}/project/projectRead?projectNo="+projectNo;
			     }
			     else
			     {
			    	 alert("메인 페이지로 이동합니다. 이용에 불편을 드려 죄송합니다.");
			    	 location.href="${pageContext.request.contextPath}";
			     }
		    }//결제 실패 끝
		
		   if(msg != null)
		    	alert(msg);//결제 실패 메세지 출력
		});
		
	</script>
	
</body>
</html>