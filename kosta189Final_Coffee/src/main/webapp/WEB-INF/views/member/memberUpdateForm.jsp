<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../common/header.jsp" %>
<form action="memberUpdate" method="post" enctype="multipart/form-data">
<div class="mypage-wrap" data-aos="fade-in">
   <div class="mypage-container">
        <div class="mypage-sidebar">
                <div class="mypage-sidebar-title">
                    <span><b>마이페이지</b></span>
                    <span style="font-size:18px;font-weight: 600;">mypage</span>
                </div>
                <ul>
                     <li class="select sidebar-1"><a href="${pageContext.request.contextPath}/member/memberMypage">회원정보수정</a></li>
                    <li class="sidebar-2"><a href="${pageContext.request.contextPath}/member/memberGive">내 후원</a></li>
                    <li class="sidebar-3"><a href="${pageContext.request.contextPath}/member/memberReceipt">영수증관리</a></li>
                    <li class="sidebar-4"><a href="${pageContext.request.contextPath}/member/memberQnA">Q&A</a>
                    <c:choose>
	                              <c:when test="${qnaNewAlarm==1}">
	                                	<i class="fa fa-bell faa-tada animated" id="alarm" style="color:#FF607F"></i>
	                              </c:when>
                              </c:choose></li>
                    <li class="sidebar-5"><a href="${pageContext.request.contextPath}/member/memberCheer">내 응원</a>
                    <c:choose>
	                              <c:when test="${newAlarm==1}">
	                             	   	<i class="fa fa-bell faa-tada animated" id="alarm" style="color:#FF607F"></i>
	                              </c:when>
                              </c:choose> 
                              </li>
                    <li class="sidebar-6"><a href="${pageContext.request.contextPath}/member/memberFavorite">즐겨찾기</a></li>
                </ul>
        </div>
        <div class="mypage-contents">
           <p align="center" class="mypage-title">
               <span style="font-size:30px;color:black;">회원정보수정</span>
           </p>
            <div class="mypage-1-content">
                <div class="inform-container">
                    <div class="inform-items">
                        <div class="inform-label"><span>아이디</span></div>
                        <div class="inform-input"><input type="text" name="id" value="${member.id}" readonly="readonly"></div>
                    </div>
                    <div class="inform-items">
                        <div class="inform-label"><span>비밀번호 확인</span></div>
                        <div class="inform-input">
                            <input type="password" name="pwd" placeholder="현재 비밀번호">
                        </div>
                    </div>
                    <div class="inform-items">
                        <div class="inform-label"><span>새 비밀번호</span></div>
                        <div class="inform-input">
                            <input type="password" name="pwdNew" placeholder="비밀번호를 변경할 시에만 작성" style="width: 200px">
                        </div>
                    </div>
                    <div class="inform-items">
                        <div class="inform-label"><span>이름</span></div>
                        <div class="inform-input"><input type="text" name="name" value="${member.name}"></div>
                    </div>
                    <div class="inform-items">
                        <div class="inform-label"><span>휴대폰</span></div>
                        <div class="inform-input"><input type="text" name="phone" value="${member.phone}"></div>
                    </div>
                    <div class="inform-items">
                        <div class="inform-label"><span>이메일</span></div>
                        <div class="inform-input"><input type="text" name="email" value="${member.email}" style="width: 200px">
                        </div>
                    </div>
                   <div class="inform-items" style="height:130px;">
							<div class="inform-label">
								<span>프로필 사진</span>
							</div>
						   <div class="inform-input">
                     				<a id="download" download="thumbnail.jpg" target="_blank">
                       			  		<img id="thumbnail" src="${pageContext.request.contextPath}/resources/finalPhoto/member/${member.picture}" onerror="this.src='${pageContext.request.contextPath}/resources/images/thumbs/test2.jpg'" width="100" alt="썸네일영역" style="border-radius: 100%;">
                     				</a>
                     				<input type="file" id="photo" name="file" maxlength="60" size="40" accept="image/*">
                			</div>
               			</div>
                    
                    <!-- 저장 버튼 -->
                    <div class="inform-save" style="margin-top:20px;display:flex;justify-content: center;">
                        <input type="submit" id="updateBtn" class="btn_2" value="저장" style="width:100px;">
                        <input type="submit" id="deleteBtn" class="btn_2" value="탈퇴" style="width:100px;">
                    </div>
                    <!-------------->
                </div>
                
            </div>
        </div>
   </div>
</div>
</form>
<script>
	$(function(){
		if(${updated == 'false'})
			alert("비밀번호 오류입니다.");
	});
	$("#updateBtn").on("click",function(){
		$("form").attr("action","memberUpdate");
		$("form").submit
	});

	$("#deleteBtn").on("click",function(){
		$("form").attr("action","memberDelete");
		$("form").submit
	});

	$(function(){
	
		$("#pwdBtn").click(function(){
			  var windowStyleVar = "top=10, left=10, width=400, height=200, status=no, menubar=no, toolbar=no scrollbars=no";
			  window.open("${pageContext.request.contextPath}/member/password","passwordRequest", "width=600,height=200");
		}); // 비번변경 버튼
		
		
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
	})
	
 function processRequest(){
	$("form").attr("action","${pageContext.request.contextPath}/member/memberUpdate");
	$("form").submit();
}
	
</script>
<%@ include file="../common/footer.jsp" %>