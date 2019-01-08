<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../../common/header.jsp"%>

<div class="signup-wrap">
	<div class="signup-container">
		<div class="signup-title">

			<ul>
				<li><a id="signup_person" href="${pageContext.request.contextPath}/member/signUp">개인회원가입</a></li>
				<li><a id="signup_company" href="${pageContext.request.contextPath}/company/companyInsertForm">단체회원가입</a></li>
			</ul>

		</div>
		
	  <form name="insertCInfo" method="post" action="${pageContext.request.contextPath}/company/companyInsert" enctype="multipart/form-data">	
		<div class="signup-contents">
			<div class="signup-company">
				<div class="signup-items">
					<div class="signup-label">
						<span style="color: red;">*</span><span>아이디</span>
					</div>
					<div class="signup-input">
						<input type="text" id="companyid" name="id" placeholder="아이디"> 
						<input type="button" class="btn_2" id="btn_idCheckC" value="중복확인" style="width: 70px;">
						<span id="idResultC" name="idResultC" style="display: block; color: red"></span>
					</div>
				</div>
				<div class="signup-items">
					<div class="signup-label">
						<span style="color: red;">*</span><span>비밀번호</span>
					</div>
					<div class="signup-input">
						<input type="password" id="pwd" name="pwd" placeholder="비밀번호">
					</div>
				</div>
				<div class="signup-items">
					<div class="signup-label">
						<span style="color: red;">*</span><span>단체명</span>
					</div>
					<div class="signup-input">
						<input type="text" id="companycompanyName" name="companyName" readonly="readonly" placeholder="단체명">
						<input type="button" class="btn_2" id="btn_companyNameCheck" value="검색" style="width: 70px;">
					</div>
				</div>
				<div class="signup-items">
					<div class="signup-label">
						<span style="color: red;">*</span><span>주소</span>
					</div>
					<div class="signup-input">
						<input type="text" id="companycompanyAddr" name="companyAddr" readonly="readonly" placeholder="주소">
					</div>
				</div>
				<div class="signup-items" style="height:130px;">
						<div class="signup-label" >
							<span>사진</span>
						</div>
						<div class="signup-input" style="height:130px;">
							<a id="download" download="thumbnail.jpg" target="_blank"> 
							<img
								id="thumbnail"
								src="${pageContext.request.contextPath}/resources/images/thumbs/testImg.jpg"
								width="100" alt="썸네일영역" style="border-radius: 100%;">
							</a>
							<input type="file" id="photo" name="file" maxlength="60" size="40" accept="image/*">
						</div>
				</div>
				<div class="signup-items">
					<div class="signup-label">
						<span style="color: red;">*</span><span>담당자</span>
					</div>
					<div class="signup-input">
						<input type="text" id="name" name="name" readonly="readonly" placeholder="담당자">
					</div>
				</div>
				<div class="signup-items">
						<div class="signup-label">
							<span style="color: red;">*</span><span>이메일</span>
						</div>
						<div class="signup-input">
							<input type="text" id="email" name="email" placeholder="이메일">
						</div>
					</div>
				<div class="signup-items">
					<div class="signup-label">
						<span style="color: red;"></span><span>전화번호</span>
					</div>
					<div class="signup-input">
					<input type="text" id="companycompanyCall" name="companyCall" size="20" readonly="readonly" placeholder="전화번호">
					</div>
				</div>

				<div class="signup-items">
					<div class="signup-label">
						<span style="color: red;">*</span><span>계좌번호</span>
					</div>
					<div class="signup-input">
						<input type="text" id="companyaccount" name="account" placeholder="계좌번호">
						<select id="companybank" name="bank">
							<option value="신한은행">신한</option>
							<option value="국민은행">국민</option>
							<option value="우리은행">우리</option>
							<option value="하나은행">하나</option>
							<option value="농협은행">농협</option>
							<option value="기업은행">기업</option>
							<option value="대구은행">대구</option>
						</select>
					</div>
				</div>
				<div class="signup-items">
					<div class="signup-label">
						<span>소개</span>
					</div>
					<div class="signup-input">
						<textarea
							style="width: 70%; height: 45px; resize: none; padding: 10px; overflow: hidden; position: relative;"
							maxlength="50" placeholder="50자 이내로 단체를 소개해주세요."></textarea>
					</div>
				</div>

				<!-- 가입 버튼 -->
				<div class="signup-save"
					style="margin-top: 20px; display: flex; justify-content: center;">
					<input type="submit" class="btn_2" id="btn_submitC" value="가입" style="width: 100px;">
				</div>
			</div>
		</div>
	  </form>	
	</div>
</div>
<script>
	$(function() {
		//단체명 검색버튼 클릭시 팝업창생성
		$("#btn_companyNameCheck")
				.on(
						"click",
						function() {
							window
									.open(
											"${pageContext.request.contextPath}/company/companyAPIForm",
											"MsgWindow",
											"width=1000,height=500");
						});

		$('#btn_submitC').attr('hidden', true);

		$('#btn_idCheckC').click(function() {
			if ($('#companyid').val() == '') {
				$('#idResultC').text('id를 입력하세요');
			} else {
				$.ajax({
					url : "../member/idCheck",
					type : "post",
					data : "id=" + $('#companyid').val(),
					dataType : "text",
					success : function(result) {
						console.log(result)
						if (result == "success") {
							result = "사용가능한 아이디입니다.";
							$('#btn_submitC').attr("hidden", false);
						} else {
							result = "사용중인 아이디입니다.";
							$('#btn_submitC').attr("hidden", true);
						}

						$('#idResultC').text(result);
					},
					error : function(err) {
						alert("err : " + err);
					}
				})
			}
		});

		var file = document.querySelector('#photo');

		file.onchange = function() {
			var fileList = file.files;

			// 읽기
			var reader = new FileReader();
			reader.readAsDataURL(fileList[0]);

			//로드 한 후
			reader.onload = function() {

				//썸네일 이미지 생성
				var tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
				tempImage.src = reader.result; //data-uri를 이미지 객체에 주입
				tempImage.onload = function() {
					//리사이즈를 위해 캔버스 객체 생성
					var canvas = document.createElement('canvas');
					var canvasContext = canvas.getContext("2d");

					//캔버스 크기 설정
					canvas.width = 100; //가로 100px
					canvas.height = 100; //세로 100px

					//이미지를 캔버스에 그리기
					canvasContext.drawImage(this, 0, 0, 100, 100);
					//캔버스에 그린 이미지를 다시 data-uri 형태로 변환
					var dataURI = canvas.toDataURL("image/jpeg");

					//썸네일 이미지 보여주기
					document.querySelector('#thumbnail').src = dataURI;

				};
			};
		};

		$('#btn_submitC').click(function() {
			if ($('#pwd').val() == '') {
				alert("비밀번호를 입력해주세요");
				$('#pwd').focus();
				return false;
			}

			if ($('#companycompanyName').val() == '') {
				alert("단체명의 검색버튼을 눌러주세요");
				$('#companycompanyName').focus();
				return false;
			}

			if ($('#companycompanyAddr').val() == '') {
				alert("단체명의 검색버튼을 눌러주세요");
				$('#companycompanyAddr').focus();
				return false;
			}

			if ($('#name').val() == '') {
				alert("단체명의 검색버튼을 눌러주세요");
				$('#name').focus();
				return false;
			}

			if ($('#email').val() == '') {
				alert("이메일을 입력해주세요");
				$('#email').focus();
				return false;
			}

			if ($('#companyaccount').val() == '') {
				alert("계좌번호를 입력해주세요");
				$('#companyaccount').focus();
				return false;
			}

			else {
				alert($('#companyid').val() + "님 가입을 축하드립니다!");
			}
		});
	})

	$(function() {
		$("#signup_company").parent().css("background-color", "#CE5970");
		$("#signup_company").parent().parent().find("li:first-child a").css(
				"color", "black");
		$("#signup_company").parent().parent().find("li:first-child").css(
				"background-color", "white");
		$("#signup_company").css("color", "white");
	});
</script>

<%@ include file="../../common/footer.jsp"%>