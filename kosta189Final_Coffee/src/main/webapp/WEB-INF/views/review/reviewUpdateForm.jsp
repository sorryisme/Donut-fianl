<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../common/header.jsp" %>
   

   
   <div class="project-review-wrap" data-aos="fade-in"> 
        <div class="project-review-container">
            <div class="review-title"><span>모금 후기 수정</span></div>
            <div class="review-content">
     
                <div class="code-html w-100">
                   <div id="review_updateSection"></div>
                   <script class="code-js">
                        var content = '${requestScope.review.reviewContent}';
                        var editor = new tui.Editor({
                            el : document.querySelector('#review_updateSection'),
                            previewStyle : 'vertical',
                            height : '550px',
                            initialEditType : 'wysiwyg',
                            initialValue : content,
                            language : 'ko',
                            viewOnly : false,
                            toolbarItems : [ 'bold', 'image' ]
                        });
                       
                        $(function(){
	                        $("#change").click(function() {
	                          
	                        	var formData = new FormData();
	                            var content = editor.getValue(); 
	                            var projectNo = ${requestScope.review.projectNo};
	                            formData.append("reviewContent",content);
	                            formData.append("projectNo",projectNo);
	                            formData.append("file",$("#file")[0].files[0]);
	                            
	                             $.ajax({
	                               url:"${pageContext.request.contextPath}/review/reviewUpdate",
	                               type:"post",
	                               data:formData, 
	                               dataType:"JSON",
	                               contentType: false,
	                               processData: false,
	                               success:function(result){
	                                  if(result==1){
	                                	  alert('수정하였습니다.');
	                                	  
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
                <input type="button" value="수정" id="change">
            </div>
        </div>
    </div>

        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-ui.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/index.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/odometer.min.js"></script>
        <script>
        </script>
<%@ include file="../common/footer.jsp" %>