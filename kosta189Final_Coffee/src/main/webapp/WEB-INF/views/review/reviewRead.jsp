<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../common/header.jsp" %>
<script src="${pageContext.request.contextPath}/resources/bower_components/tui-editor/dist/tui-editor-Viewer.js"></script>
<SCRIPT language=javascript>
   $(function(){
	   $("input[value=수정하기]").click(function(){
		  
		   
		   $("#requestForm").attr("action", "${pageContext.request.contextPath}/review/reviewUpdateForm/${requestScope.review.projectNo}");
		   $("#requestForm").submit();
	   })
	   
	   
	   
		   $("input[value=삭제하기]").click(function(){
			   if(confirm("정말 삭제하시겠습니까?")==true){
				   $("#requestForm").attr("action", "${pageContext.request.contextPath}/review/reviewDelete");
				   $("#requestForm").submit();
			   }
			   else{
				   return;
				   
			   }
			   
	   })
	   
	
	})
	</script>
<style>
 a{
	 text-decoration:underline;
	 
 }
</style>
</head>
<body>



	<div class="project-review-wrap" data-aos="fade-in">
		<div class="project-review-container">
			<div class="review-title">
			${review.id}
				<span>최종 모금 후기</span>
			</div>
			<div class="review-regdate">
				<span>등록일 : ${requestScope.review.reviewRegdate}</span>
			</div>
			<!-- <div class="code-html w-100">
				<div id="review-content"></div>
					<script class="code-js">
                        var content = '';
                        var editor = new tui.Editor({
                            el : document.querySelector('#review-content'),
                            previewStyle : 'vertical',
                            height : '550px',
                            initialEditType : 'wysiwyg',
                            initialValue : content,
                            language : 'ko',
                            viewOnly : true,
                            toolbarItems : [ ],
                            /*toolbarItems : [' '] */  
                      });
                        editor.setValue('${requestScope.review.reviewContent}');
            		</script>
            	
            </div> -->
            <div class="code-html">

    			<div id="review-content"></div>
    			<textarea id="hide-content" style="display:none;">${review.reviewContent}</textarea>
    		</div>
    		<script class="code-js">
    		var editor = new tui.Editor({
				el: document.querySelector('#review-content'),
				height: '300px',
				viewer : true
				/* initialValue: content  */
				});
				 editor.setValue( $("#hide-content").val()); 
    		
    		</script>
			<div class="review-receipt-title">
				<span>영수증</span>
			</div>
			<div class="review-receipt-contents">
				<img
					src="${pageContext.request.contextPath}/resources/finalPhoto/review/${requestScope.review.reviewImg}" onerror='this.src="${pageContext.request.contextPath}/resources/images/thumbs/test4.jpg"'> 
			</div>
			
			  <c:if test="${review.id==sessionScope.userDTO.id}">
				<form name="requestForm" method="post" id="requestForm">
		     <input type=hidden name="projectNo" value="${requestScope.review.projectNo}"> 
		     <input type=hidden name="id" value="${requestScope.review.id}"> 
		     		<div class="modify_delete_btn">
            			<input type=button value="수정하기"><input type=button value="삭제하기">
        			</div>
				</form>
				</c:if>
		<div style="text-align:right"><a href="${pageContext.request.contextPath}/project/projectRead?projectNo=${requestScope.projectDTO.projectNo}" >프로젝트로 돌아가기</a></div>
		</div>
		</div>
	
		<%@ include file="../common/footer.jsp" %>