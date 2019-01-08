<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../common/header.jsp" %>
   

   <div class="project-review-wrap" data-aos="fade-in">
        <div class="project-review-container">
            <div class="review-title"><span>모금 후기 작성</span></div>
            <div class="review-content">
                <div class="code-html w-100">
                   <div id="review_insertSection"></div>
                   <script class="code-js">
                        var content = '';
                        var editor = new tui.Editor({
                            el : document.querySelector('#review_insertSection'),
                            previewStyle : 'vertical',
                            height : '550px',
                            initialEditType : 'wysiwyg',
                            initialValue : content,
                            language : 'ko',
                            viewOnly : false,
                            toolbarItems : [ 'bold', 'image' ],
                            /*toolbarItems : [' '] */  
                      });
                        $(function(){
	                        $("#save").click(function() {
	                            var formData = new FormData();
	                            var content = editor.getValue(); 
	                            var projectNo = ${requestScope.review.projectNo};
	                            formData.append("reviewContent",content);
	                            formData.append("projectNo",projectNo);
	                            formData.append("file",$("#file")[0].files[0]);
	                            
	                       		$.ajax({
	                               url:"${pageContext.request.contextPath}/review/reviewInsert",
	                               type:"post",
	                               data:formData, 
	                               dataType:"JSON",
	                               contentType: false,
	                               processData: false,
	                               success:function(result){
	                                  if(result==1){
	                                	  alert('후기가 작성되었습니다.');
	                                	  $(location).attr("href", "${pageContext.request.contextPath}/review/reviewRead/${review.projectNo}");
	                                  }
	                                  
	                               },error:function(err){
	                                  alert("err : "+err);
	                               }
	                            })
	                         })
                        });
                        
                     
                  
                       
                    </script>
                </div>
            </div>
            <div class="review-receipt-title">
               <span>영수증</span>
            </div>  
            <div class="review-receipt-contents">
                <input type="file" id="file">
            </div>
            <div class="review-submit" style="">
            <input type="button" value="저장" id="save" >
          <%--   
              <form id="reviewForm" action="${pageContext.request.contextPath}/review/reviewInsert">
				<input type ="hidden" name="projectNo" value="${requestScope.review.projectNo}" > 
               
               </form> 
   
               --%>
                
            </div>
        </div>
    </div>
   
	  <%@ include file="../common/footer.jsp" %>