<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script
   src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../../common/header.jsp"%>
<form method="post" enctype="multipart/form-data">
   <div class="mypage-wrap">
      <div class="mypage-container">
         <div class="mypage-sidebar">
            <div class="mypage-sidebar-title">
               <span><b>마이페이지</b></span> <span
                  style="font-size: 18px; font-weight: 600;">mypage</span>
            </div>
            <ul>
               <li class="select sidebar-1"><a
                  href="${pageContext.request.contextPath}/company/companyMypage">회원정보수정</a></li>
               <li class="sidebar-2"><a
                  href="${pageContext.request.contextPath}/company/companyProject">내 프로젝트</a></li>
            </ul>
         </div>
         <div class="mypage-contents">
            <p align="center" class="mypage-title">
               <span style="font-size: 30px; color: black;">회원정보수정</span>
            </p>
            <div class="mypage-1-content">
               <div class="inform-container">
                  <div class="inform-items">
                     <div class="inform-label">
                        <span>아이디</span>
                     </div>
                     <div class="inform-input">${member.id}<input type="hidden" name="id" value="${member.id}">
                     </div>
                  </div>
                  <div class="inform-items">
                     <div class="inform-label">
                        <span>비밀번호</span>
                     </div>
                     <div class="inform-input">
                        <input type="password" name="pwd" id="pwd" value="">
                        <input type="submit" id="pwdBtn" class="btn_2" value="비밀번호 변경" style="width: 100px;">
                        </div>
                  </div>
                  <div class="inform-items">
                     <div class="inform-label">
                        <span>단체명</span>
                     </div>
                     <div class="inform-input">${member.company.companyName}<input
                           type="hidden" name="companyName"
                           value="${member.company.companyName}">
                     </div>
                  </div>
                  <div class="inform-items">
                     <div class="inform-label">
                        <span>주소</span>
                     </div>
                     <div class="inform-input">${member.company.companyAddr}<input type="hidden" name="companyAddr" value="${member.company.companyAddr}">
                     </div>
                  </div>



                  <div class="inform-items">
                     <div class="inform-label">
                        <span>담당자</span>
                     </div>
                     <div class="inform-input">${member.name}<input type="hidden" name="name" value="${member.name}">
                     </div>
                  </div>
                  <div class="inform-items">
                     <div class="inform-label">
                        <span>이메일</span>
                     </div>
                     <div class="inform-input">
                        <input type="text" id="email" name="email"
                           value="${member.email}" size="30">
                     </div>
                  </div>

                  <div class="inform-items">
                     <div class="inform-label">
                        <span>전화번호</span>
                     </div>
                     <div class="inform-input">${member.company.companyCall}
                        <input type="hidden" id="phone" name="companyCall"
                           value="${member.company.companyCall}" size="30">
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
                        
                  <div class="inform-items">
                     <div class="inform-label">
                        <span>계좌번호</span>
                     </div>
                     <div class="inform-input">
                        <input type="text" id="account" name="account"
                           value="${member.company.account}">
                        <!-- <input type="hidden" id="bank" name="company.bank" value="{member.company.bank}"> -->
                        
                        <select id="bank" name="bank">
                           <option value="신한">신한</option>
                           <option value="국민">국민</option>
                           <option value="우리">우리</option>
                           <option value="하나">하나</option>
                           <option value="농협">농협</option>
                           <option value="기업">기업</option>
                           <option value="대구">대구</option>
                        </select>
                     </div>
                  </div>
                  <div class="inform-save" style="margin-top: 20px; display: flex; justify-content: center;">
                     <span><input type="submit" id="updateBtnCompany"
                        class="btn_2" value="수정하기" style="width: 100px;"></span> <span><input
                        type="submit" id="deleteBtnCompany" class="btn_2" value="탈퇴"
                        style="width: 100px;"></span>

                  </div>

               </div>

            </div>
         </div>
      </div>
   </div>
</form>
<script>

$(function(){
var member=${requestScope.member.pwd};
$("input[value=수정하기]").click(function(){
   
   prompt("hihi");
   
   if($("#pwd").val() == ''){
      alert("비밀번호를 입력해주세요");
      return;
   }
   $("form").attr("action","${pageContext.request.contextPath}/company/companyUpdate");
   $("form").submit();
}); // 수정하기 버튼 


$("#pwdBtn").click(function(){
     var windowStyleVar = "top=10, left=10, width=400, height=200, status=no, menubar=no, toolbar=no scrollbars=no";
     window.open("${pageContext.request.contextPath}/member/password","passwordRequest",windowStyleVar);
}); // 비번변경 버튼

$("input[value=탈퇴]").click(function(){
     if(confirm("정말 탈퇴하시겠습니까?")==true){
         
        if($("#pwd").val()==${member.pwd}){
         $("form").attr("action", "${pageContext.request.contextPath}/company/companyDelete");
         $("form").submit();
        }  else {
         return;
      }
   }
}); // 탈퇴버튼


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

var opt = document.querySelectorAll("#bank option");
   for (var i = 0; i < opt.length; i++) {
      if (opt[i].value == '${member.company.bank}') {
         $("#bank option:eq("+i+")").attr("selected","selected");   
      break;
   }
}
   
});// document.ready



function processRequest(){
   $("form").attr("action","${pageContext.request.contextPath}/company/companyUpdate");
   $("form").submit();
}


</script>

<%@ include file="../../common/footer.jsp"%>