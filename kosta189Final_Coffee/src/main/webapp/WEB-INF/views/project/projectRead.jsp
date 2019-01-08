<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../common/header.jsp" %>
<script src="${pageContext.request.contextPath}/resources/bower_components/tui-editor/dist/tui-editor-Viewer.js"></script>

<div class="project-detail-wrap" data-aos="fade-in">
    <div class="cover" style='background-image: url("${pageContext.request.contextPath}/resources/finalPhoto/project/${projectDTO.projectImg}"),url("${pageContext.request.contextPath}/resources/images/thumbs/test1.jpg");'>
        <div class="cover-title">
        	<c:set var="now" value="<%=new java.util.Date()%>" />
           	<c:set var="sysDay"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
           	<fmt:parseDate value="${projectDTO.projectEnd}" var="ParseDate" pattern="yyyy-MM-dd"/> 
           	<c:set var="projectDate"><fmt:formatDate value="${ParseDate}" pattern="yyyy-MM-dd" /></c:set> 
             
           	<c:choose>
          		<c:when test="${projectDTO.percent == 100 ||  projectDate le sysDay}">
          			<div class="cover-status" style="width:80px;">모금종료</div>		
          		</c:when>
       		
       			<c:otherwise>
       				<div class="cover-status">모금중</div>
       			</c:otherwise>
       		</c:choose>	
            
            <span><b>${projectDTO.projectSubject}</b></span>
            <div class="cover-subtitle">
                <span>${companyDTO.companyName}</span>
            </div>
             <div class="update_btn" id="update_btn">
            </div>
            
        <div class="add-favorite" id="bookmark" style="display:inline-block;cursor: pointer">
            
            <span style="color:white;background-color: black;border-radius: 5px;padding: 5px;opacity:0.6;font-size:16px;">
		       <c:choose>
			       	<c:when test="${requestScope.flag==false}">
			            <i class="far fa-star" id="fa-star" style="color:#F9FC0B;font-size:14px;"></i>
			    	</c:when>
			    	<c:when test="${requestScope.flag==null}">
			            <i class="far fa-star" id="fa-star" style="color:#F9FC0B;font-size:14px;"></i>
			    	</c:when>  
			    	<c:otherwise> 
			            <i class="fas fa-star" id="fa-star" style="color:#F9FC0B;font-size:14px;"></i>
			        </c:otherwise> 
		      </c:choose>     
		          <span>즐겨찾기</span>
            </div>
            
        </div>  
        
    </div>
    <div class="project-detail-container">
            <div class="header">
                
                <div class="header-donation" style="display: inline-block">
                    <table class="project-detail-table">
                       <tr>
                           <td><b>목표금액</b></td>
                           <td><fmt:formatNumber type="number" value="${projectDTO.goal}"/>원</td>
                       </tr>
                       <tr>
                           <td><b>모인금액</b></td>
                           <td style="color:#DC287C"><fmt:formatNumber type="number" value="${projectDTO.totalMoney}"/>원</td>
                       </tr>
                        <tr>
                           <td><b>프로젝트 등록일</b></td>
                           <td>${projectDTO.projectRegdate}</td>
                       </tr>
                        <tr>
                           <td><b>프로젝트 마감일</b></td>
                           <td style="color:#DC287C">${projectDTO.projectEnd}</td>
                        </tr>
                       <tr>
                           <td><b>참여 인원</b></td>
                           <td>${projectDTO.givePerson}</td>
                       </tr>  
                       <tr>
                           <td><b>카테고리</b></td>
                           <td>${projectDTO.category2}</td>
                       </tr>
                   </table> 
                    <div class="progress-wrap">
                        <progress class="progressbar" value="${projectDTO.percent}" max="100"></progress>
                        <div class="progress-value-wrap">
                            <span class="progress-value">${projectDTO.percent}%</span>
                        </div>
                    </div>
                    
                </div>    
         </div>
        
        <div class="project-detail-main">
            
                <div class="project-detail-tabs">   
                    <ul>
                        <li class="select" id="story"><a href="#story">스토리</a></li>
                        <li><a href="#cheer">응원</a></li>
                        <li><a href="#qna">Q&A</a></li>
                        <li><a href="#review">후기</a></li>
                        <li><a href="#donate">기부하기</a></li>
                    </ul>
                </div>
                <div class="story">
                	<div class="code-html">
    					<div id="story-content"></div>
						<textarea id="hide-content" style="display:none;">${projectDTO.story}</textarea>
    				</div>
			    		<script class="code-js">
			      			var editor = new tui.Editor({
			      					el: document.querySelector('#story-content'),
			        				height: '300px',
			        				viewer : true
			        				/* initialValue: content  */
			      				});
			      				 editor.setValue( $("#hide-content").val()); 
			    		</script>
                </div>
                
                
                <div class="project-detail-tabs">   
                    <ul>
                        <li><a href="#story">스토리</a></li>
                        <li class="select" id="cheer"><a href="#cheer">응원</a></li>
                        <li><a href="#qna">Q&A</a></li>
                        <li><a href="#review">후기</a></li>
                        <li><a href="#donate">기부하기</a></li>
                    </ul>
                </div>
                <div class="cheer">
                
                    <table>
                     <c:choose>
                    <c:when test="${fn:length(list) == 0}">
                            <tr>
                                <td colspan="3" align="center">
                                    조회결과가 없습니다.
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                           <c:forEach var="boardList" items="${list}" varStatus="status">
                            <c:choose><c:when test="${boardList.cheerParentNo==0}">
                        <tr>
                           <td><div class="thumb"><img src="${pageContext.request.contextPath}/resources/finalPhoto/member/${boardList.memberDTO.picture}" onerror ="this.src='${pageContext.request.contextPath}/resources/images/thumbs/testImg.jpg'"></div></td>
                            <td>${boardList.id}
                            <input type=hidden name="cheerNo" class="cheerNo" value="${boardList.cheerNo}">
                            <input type=hidden name="cheerParentNo" class="cheerParentNo" value="${boardList.cheerParentNo}">
                            </td>
                            <td><span>${boardList.cheerContent}</span> 
                                
                                <c:choose>
	                                <c:when test="${boardList.cheerNotify!=0||sessionScope.userDTO.id==projectDTO.id}">
	                                <div class="replyRead">열기<i class="fas fa-angle-down"></i></div>
	                                </c:when>
                                </c:choose>
                                
                                <c:choose>
	                                <c:when test="${boardList.id==sessionScope.userDTO.id}">
                                    <i class="fas fa-pencil-alt user_modify"></i>
                                    <i class="fas fa-times user_delete" class=""></i>
                                    </c:when>
                                </c:choose>
                                <div class="replyContent"></div>
                            </td>
                            <td>${boardList.cheerRegdate}</td>
                        </tr>
                         <c:choose><c:when test="${boardList.cheerNotify==0}">
                        <tr class="cheerTr">
                            <td colspan="4">
                             	<form name="writeForm" method="post" action="${pageContext.request.contextPath}/cheer/cheerReplyInsert"> 
          						    <input type=hidden name="id" value="${sessionScope.userDTO.id}">
          						    <input type=hidden name="cheerNo" value="${boardList.cheerNo}">
          						    <input type=hidden name="projectNo" value="${projectDTO.projectNo}">
	                             
	                                
	                                <c:choose>
		                                  <c:when test="${sessionScope.userDTO.id==projectDTO.id}">
		                                
		                                   <div class="reply-submit" align="center">
		                                    <input type="text"  name="cheerContent" placeholder="답변을 등록해주세요.">
		                                    <input type="submit" value="전송">
		                                     </div>
		                                    
		                                 </c:when>
		                                 <c:otherwise>
		                                   <div class="cheerReply"> 등록된 답변이 없습니다. </div>
		                                 </c:otherwise>
	                                 </c:choose>   
	                                    
	                               
                               </form> 
                                
                            </td>
                        </tr>
                        </c:when>
                        </c:choose>
                            </c:when>
                         <c:when test="${boardList.cheerParentNo!=0}">
                        <tr class="cheerTr" id="a">
                            <td colspan="4">
                                <div class="cheerReply"> ${boardList.cheerContent}</div>
                                
                                <c:choose>
	                                <c:when test="${boardList.id==sessionScope.userDTO.id}">
		                                <div class="reply-modify-delete">
		                                	<input type=hidden name="cheerNo" value="${boardList.cheerNo}">
		                                    <i class="fas fa-pencil-alt writer_modify"></i>
		                                	<input type=hidden name="cheerParentNo" value="${boardList.cheerParentNo}">
		                                    <i class="fas fa-times writer_delete"></i>
		                                </div>
	                                </c:when>
                                </c:choose>
                                
                            </td>
                        </tr>
                        </c:when>
                        </c:choose> 
                      </c:forEach>
                    </c:otherwise>
                </c:choose>
                    </table>
                   
                   
                 <!-- 댓글 다는 곳 -->
				<form name="writeForm" method="post" action="${pageContext.request.contextPath}/cheer/cheerInsert"> 
                    <div class="cheerupReply">
                    	 <input type=hidden name="id" value="${sessionScope.userDTO.id}">
                    <input type=hidden name="projectNo" value="${projectDTO.projectNo}">
                        <input type="text" name="cheerContent" placeholder="50자 이내로 응원을 남겨주세요.">
                        <input type="submit" value="응원하기">
                    </div>
                  </form>
                    
                    
                </div>
                
              <div class="project-detail-tabs">   
                    <ul>
                        <li><a href="#story">스토리</a></li>
                        <li><a href="#cheer">응원</a></li>
                        <li class="select" id="qna"><a href="#qna">Q&A</a></li>
                        <li><a href="#review">후기</a></li>
                        <li><a href="#donate">기부하기</a></li>
                    </ul>
                </div>
                
          <div class="qna">
                    <table id="questionTable">
                        <tr>
                            <th>상태</th>
                            <th>문의/답변</th>
                            <th>작성자</th>
                            <th>작성일</th>
                        </tr>
                        

              <c:choose>
                    <c:when test="${fn:length(qnaList) == 0}">
                            <tr>
                                <td colspan="3" align="center">
                                    조회결과가 없습니다.
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                           <c:forEach var="qnaList" items="${qnaList}" varStatus="status">
                           
                         <c:choose>
                         <c:when test="${qnaList.qnaParentNo==0}"><!-- 부모 글이면 -->
                        <tr>
                            <th>
                                  	<c:choose>
                         			<c:when test="${qnaList.qnaNotify==0}">미답변</c:when>
                         			<c:when test="${qnaList.qnaNotify!=0}">답변</c:when>
                         			</c:choose>
                            <input type="hidden" id="qnaNo" value="${qnaList.qnaNo}">
                            </th>
                            <td>
                                <div class="questionContent" >
                                <span>${qnaList.qnaContent}</span>
                                </div> 
                                <div class="user_qna">
                                <c:choose>
	                                <c:when test="${qnaList.id==sessionScope.userDTO.id}">
                                       <i class="fas fa-pencil-alt user_qna_modify"></i>
                                       <input type="hidden" id="qnaNo" value="${qnaList.qnaNo}">
                                       <i class="fas fa-times user_qna_delete"></i>
                                       </c:when>
                                       </c:choose>
                                </div> 
                            </td>
                            <td> ${qnaList.id} </td>
                            <td> ${qnaList.qnaRegdate} </td>
                        </tr>
                    
                        <c:choose>
                         <c:when test="${qnaList.qnaNotify==0}"><!-- 부모글인데 대댓글이 없으면 -->
                        <tr class="questionTr">
                           <td colspan="4">
                           
                           <form name="qnaReplyForm" method="post" action="${pageContext.request.contextPath}/qna/qnaReplyInsert"> 
          						
                                <div class="questionReply">
                                    <div class="questionContentDetail">
                                    <span class="question"><i class="far fa-question-circle"></i></span>
                                          <span>${qnaList.qnaContent}</span>
                                    </div>
                                     <div class="questionContentReply" >
		                                
		                                <input type=hidden name="id" value="${sessionScope.userDTO.id}">
          						   		 <input type=hidden name="qnaNo" value="${qnaList.qnaNo}">
          						    	<input type=hidden name="projectNo" value="${projectDTO.projectNo}">
	                              <c:choose>
		                                  <c:when test="${sessionScope.userDTO.id==projectDTO.id}">
		                                 <div class="questionContentReply_input">
		                                 				<span style="color:red">답변을 등록해주세요.</span><br>
		                                                <input type="text"  name="qnaContent" placeholder="답변을 등록해주세요.">
		                                                <input type="submit" value="등록">
		                                            </div>
		                                            <div class="writer_qna_reply">
		                                            </div>
		                                    </c:when>
		                                         <c:otherwise>
					                                   <div class="qnaReply"> 등록된 답변이 없습니다. </div>
					                             </c:otherwise>
		                             </c:choose>
		                        	   </div>
		                        	   
                                </div>
                                
                           </form>
                                
                            </td>
                        </tr>
                        </c:when>
                        </c:choose>
                        </c:when>
                       </c:choose>
                                       <c:choose>
                                     <c:when test="${qnaList.qnaParentNo!=0}"> <!-- 대댓글이면 -->
                                    <tr class="questionTr">
                                       <td colspan="4">
                                            <div class="questionReply">
                                                <div class="questionContentDetail">
                                                <span class="question"><i class="far fa-question-circle"></i></span>
                                                       <span class="myquestion">${qnaList.qnaContent} </span>
                                                </div>
                                    <div class="questionContentReply" id="${qnaList.qnaParentNo}">
                                    <span>${qnaList.qnaContent}</span>
                                       <div class="writer_qna_reply">
                                       <input type=hidden name="qnaParentNo" value="${qnaList.qnaParentNo}">
                                        <input type=hidden name="qnaNo" value="${qnaList.qnaNo}">
                                        <c:choose>
	                              		  <c:when test="${qnaList.id==sessionScope.userDTO.id}">
                                            <i class="fas fa-pencil-alt writer_qna_modify"></i>
                                            <i class="fas fa-times writer_qna_delete"></i>
                                            </c:when>
                                            </c:choose>
                                       </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </c:when>
                        </c:choose>
                     
                             </c:forEach>
                          </c:otherwise>
                       </c:choose>
                    </table>
                    

                  	<form name="writeForm" method="post" action="${pageContext.request.contextPath}/qna/qnaInsert"> 
                    <div class="qna_input_form">
                    <!-- 여기에 projectNo랑 id다시받아야함 -->
                    	 <input type=hidden name="id" value="${sessionScope.userDTO.id}">
                    <input type=hidden name="projectNo" value="${projectDTO.projectNo}">
                    <textarea name="qnaContent" placeholder="50자 이내로 질문 남겨주세요."></textarea>
                        <!-- <input type="text" name="qnaContent" placeholder="50자 이내로 질문 남겨주세요."> -->
                        <input type="submit" value="질문하기">
                    </div>
                  </form>
                    
                    
                </div>
                
                
               <div class="project-detail-tabs">   
                    <ul>
                        <li><a href="#story">스토리</a></li>
                        <li><a href="#cheer">응원</a></li>
                        <li><a href="#qna">Q&A</a></li>
                        <li class="select" id="review"><a href="#review">후기</a></li>
                        <li><a href="#donate">기부하기</a></li>
                    </ul>
                </div>
                
                <!-- 리뷰 -->
                 <div class="project-review">
					<div class="review-add">
					<c:choose>
					<c:when test="${empty review}">
                       <tr>
                        <td><span>작성된 리뷰가 없습니다.</span></td>
                        </tr>
                        <tr>
                     <c:if test="${projectDTO.percent == 100 ||  projectDate le sysDay}">
	                     <c:if test="${projectDTO.id==userDTO.id}">
							 <form name="requestForm" method="post" action="${pageContext.request.contextPath}/review/reviewInsertForm">
								<input type=hidden name="projectNo" value="${requestScope.projectDTO.projectNo}"> 
								<input type=hidden name="id" value="${requestScope.projectDTO.id}">
								<input type=submit value="등록하기" >
							</form>
						</c:if>
					</c:if>
					 </tr>
					 </c:when> 
                       <c:otherwise>
                      	<form name="reviewForm" method="post" action="${pageContext.request.contextPath}/review/reviewRead/${requestScope.projectDTO.projectNo}">
                    	<input type=hidden name="projectNo" value="${requestScope.projectDTO.projectNo}">
                    	<td><input type="submit" value="후기보기" id="review_popup"></td>
                   		</form>
                       </c:otherwise> 
                        </c:choose>
                    </div>
                </div>
                
                
                <div class="project-detail-tabs">   
                    <ul>
                        <li><a href="#story">스토리</a></li>
                        <li><a href="#cheer">응원</a></li>
                        <li><a href="#qna">Q&A</a></li>
                        <li><a href="#review">후기</a></li>
                        <li class="select" id="donate"><a href="#donate">기부하기</a></li>
                    
                    </ul>
                </div>
                <!-- 기부페이지 -->
                
                <!-- 기부페이지(금액) -->

               <c:choose>
				<c:when test='${projectDTO.moneyOrItem==1}'>
			       		<div class="donate">
                    <table style="width:90%;height:90%;">
                        <tr>
                            <td colspan="2" >
                                <p style="font-weight: bold; color:#666666;">결제수수료 없이 100% 기부</p>
                                <br>결제하신 금액은 기부시 별도 수수료 없이<br>
                                	단체로 <span style="color:#DC287C">100% 기부</span>됩니다.
                            </td>
                        </tr>
                        <tr><!-- 리워드 -->
                            <td colspan="2">
                                <div class="reward-title">리워드 <i id="whatIsReward" class="fas fa-question-circle"></i>
                                    <div class="reward-description">
                                        <span>모금이 100%가 되었을때 기부자에게 주어지는 일종의 보상입니다.</span>
                                    </div>
                                </div>
                                <br>
                                <c:forEach var="rewardList" items="${projectDTO.reward}">
                                <div class="reward-detail">
                                    <p>품목<span>${rewardList.rewardItem}</span></p>
                                    <br>
                                    <p>조건<span>${rewardList.condition}원</span></p>
                                </div>
                                </c:forEach>
                            </td>
                        </tr>
                        <tr>
                            <th>금액</th>
                            <td>
                                <div style="margin-bottom:5px;">
                                    <input type="button" value="+1,000원" class="money_increase_1">
                                    <input type="button" value="+10,000원" class="money_increase_2">
                                    <input type="button" value="+100,000원" class="money_increase_3">
                                    <input type="button" value="초기화" class="money_init">
                                </div>
                                <input type="text" value="1000" readonly size="10" class="payment_money">원
                            </td>
                        </tr>
                        <tr class="money_total">
                            <td colspan="2" style="text-align: right;padding:20px 20px 0 20px;">
                                <div>총 기부금액</div>
                                <div style="font-size:30px;color:#DC287C"><span class="payment_money_total">1,000</span>원</div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align:center;">
                                <input type="button" value="기부하기" id="payment_money_btn">
                            </td>
                        </tr>
                    </table>
                </div>
			    	</c:when>
			       	<c:when test='${projectDTO.moneyOrItem==2}'>
                <div class="donate">
                	<table>
                		<tr><!-- 리워드 -->
                            <td colspan="2">
                                <div class="reward-title">리워드 <i id="whatIsReward" class="fas fa-question-circle"></i>
                                    <div class="reward-description">
                                        <span>모금이 100%가 되었을때 기부자에게 주어지는 일종의 보상입니다.</span>
                                    </div>
                                </div>
                                <br>
                                <c:forEach var="rewardList" items="${projectDTO.reward}">
                                <div class="reward-detail">
                                    <p>품목<span>${rewardList.rewardItem}</span></p>
                                    <br>
                                    <p>조건<span>${rewardList.condition}원</span></p>
                                </div>
                                </c:forEach>
                            </td>
                        </tr>
                        <tr>
                            <th>항목 </th>
                            <td>
                                <select style="width:50%;" id="item_select">
                                    <option>선택</option>
                                    <c:forEach var="projectItem" items="${projectDTO.item}">
                                    <option>${projectItem.itemName} - ${projectItem.itemPrice}원</option>
                                    </c:forEach>
                                </select>
                                <input type="button" value="추가" class="item_add">
                            </td>
                        </tr>
                        <tr class="money_total">
                            <td colspan="2" style="text-align: right;padding:20px 20px 0 20px;">
                                <div>총 기부금액</div>
                               <div style="font-size:30px;color:#DC287C"><span class="payment_money_total">0</span>원</div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align:center;">
                                <input type="button" value="기부하기" id="payment_item_btn">
                            </td>
                        </tr>
                    </table>
                </div>                
			    	</c:when>
			    
			    	
		      </c:choose>   
                
                



        </div>
     </div>  
</div>

<!-- 기부하기 정보 전달을 위한 form -->
<form id="giveForSetting" action="", method="POST">
	<input type="hidden" value="${fn:length(projectDTO.item)}"/>
	<input type="hidden" name="id" value="${sessionScope.userDTO.id}">

	<input type="hidden" name="projectNo" value="${requestScope.projectDTO.projectNo}">
	<input type="hidden" name="projectSubject" value="${requestScope.projectDTO.projectSubject}">
	<input type="hidden" name="moneyOrItem" value="${requestScope.projectDTO.moneyOrItem}">

	<input type="hidden" name="projectImg" value="${projectDTO.projectImg}">
	<input type="hidden" name="companyName" value="${companyDTO.companyName}">
	
</form>


<script>
$(".user_modify").on('click', function(){
    var user_reply = $(this).parent().find('span').text();
    var cheerNo = $(this).parent().parent().find('input.cheerNo').val();
    var cheerParentNo = $(this).parent().parent().find('input.cheerParentNo').val();
    /* var projectNo = ${projectDTO.projectNo}; */
    $(this).parent().find('span').html('<input class="user_modify_value" size="50" type="text"><input type="button" class="update_cheer" value="수정"><input type="button" value="취소">');
    $(this).parent().parent().find('span>input[type=text]').val(user_reply);
    
    $.ajax({
		   url:"${pageContext.request.contextPath}/cheer/cheerUpdateForm" , //서버요청주소 현재링크기준으로
		   type:"post" , //전송방식(get or post)
		   dataType:"json", //서버가 보내주는 데이터타입(text,html,xml,json)
		   data:{
			   "cheerNo":cheerNo,
			   "cheerParentNo":cheerParentNo
			   }, //서버에게 보낼 parameter정보
		   //cheerNo=${boardList.cheerNo} 
		   success:function(result){
		
		   } , //성공했을때
		   error:function(err){
			   alert(err+" => 오류 발생")
		   }  //실패했을때
	   })//ajax끝  
});
// 연필 누르는 곳 - qna 수정
$(".writer_qna_modify").on('click', function(){
	 var writer_qna_value = $(this).parent().parent().find('span').text();
	    
    var qnaNo = $(this).prev().val();
    var cheerParentNo = $(this).prev().prev().val();
    /* var projectNo = ${projectDTO.projectNo}; */
    $(this).parent().parent().find('span').html('<input type="text" size="50"> <input type="button" class="update_reply_qna" value="수정"><input type="button" value="취소">');
    $(this).parent().parent().find('input[type=text]').val(writer_qna_value);
    
    $.ajax({
		   url:"${pageContext.request.contextPath}/qna/qnaUpdateForm" , //서버요청주소 현재링크기준으로
		   type:"post" , //전송방식(get or post)
		   dataType:"json", //서버가 보내주는 데이터타입(text,html,xml,json)
		   data:{
			   "qnaNo":qnaNo,
			   "cheerParentNo":cheerParentNo
			   }, //서버에게 보낼 parameter정보
		   //cheerNo=${boardList.cheerNo} 
		   success:function(result){
		
		   } , //성공했을때
		   error:function(err){
			   alert(err+" => 오류 발생")
		   }  //실패했을때
	   })//ajax끝   
});

   //cheer 삭제
$(".user_delete").on('click', function(){
	    var cheerNo = $(this).parent().parent().find('input.cheerNo').val();
		var projectNo=1; //이거 반장님꺼 받아와야함
		var cheerParentNo = 3; // 아무 숫자나 넣어도 됨. 0만 아니면 되니까. 어차피 값 안써요 
	    $.ajax({
			   url:"${pageContext.request.contextPath}/cheer/cheerDelete" , //서버요청주소 현재링크기준으로
			   type:"post" , //전송방식(get or post)
			   dataType:"json", //서버가 보내주는 데이터타입(text,html,xml,json)
			   data:{
				   "cheerNo":cheerNo,
				   "projectNo":projectNo,
				   "cheerParentNo":cheerParentNo
				   },
			   success:function(deleteResult){
					alert(deleteResult.message);
					history.go(0);
			   } , //성공했을때
			   error:function(err){
				   alert(err+" => 오류 발생")
			   }  //실패했을때 */
			   
		   })//ajax끝  
});

   
   
//cheer 대댓글 수정
$(".writer_modify").on('click', function(){
    var writer_reply = $(this).parent().prev().text();
    var cheerNo = $(this).prev().val();
    
    
    $(this).parent().prev().html('<input class="writer_modify_value" size="50" type="text"><input type="button" class="update_reply_cheer" value="수정"><input type="button" value="취소">');
    $(this).parent().prev().find('input[type=text]').val(writer_reply);
    
   $.ajax({
		   url:"${pageContext.request.contextPath}/cheer/cheerUpdateForm" , //서버요청주소 현재링크기준으로
		   type:"post" , //전송방식(get or post)
		   dataType:"json", //서버가 보내주는 데이터타입(text,html,xml,json)
		   data:{
			   "cheerNo":cheerNo
			   }, //서버에게 보낼 parameter정보
		   //cheerNo=${boardList.cheerNo} 
		   success:function(result){
		   } , //성공했을때
		   error:function(err){
			   alert(err+" => 오류 발생")
		   }  //실패했을때
	   })//ajax끝 
    
})

// cheer 대댓글 삭제
$(".writer_delete").on('click', function(){
	    var cheerNo = $(this).prev().prev().prev().val();
	    var cheerParentNo = $(this).prev().val();
		var projectNo=1; //이거 반장님꺼 받아와야함
	    $.ajax({
			   url:"${pageContext.request.contextPath}/cheer/cheerDelete" , //서버요청주소 현재링크기준으로
			   type:"post" , //전송방식(get or post)
			   dataType:"json", //서버가 보내주는 데이터타입(text,html,xml,json)
			   data:{
				   "cheerNo":cheerNo,
				   "projectNo":projectNo,
				   "cheerParentNo":cheerParentNo
				   },
				   success:function(deleteResult){
						alert(deleteResult.message);
						history.go(0);
				} , //성공했을때
					   error:function(err){
						   alert(err+" => 오류 발생")
					   }  //실패했을때 */
			   
		   })//ajax끝  
});


//qna 열닫
$(".questionContent").on('click',function(){
    if($(this).parent().parent().next().css('display') == 'none'){
        $(this).parent().parent().next().css('display', 'table-row');
        var myquestion = $(this).children().text();
    	$(this).parent().parent().next().find('span.myquestion').text(myquestion);
   
    }else if($(this).parent().parent().next().css('display') == 'table-row'){
        $(this).parent().parent().next().css('display', 'none');
    }
})

$(".replyRead").on('click', function(){
    if($(this).parent().parent().next().css('display') == 'none'){
        $(this).html('닫기<i class="fas fa-angle-up">');
        $(this).parent().parent().next().css('display', 'table-row');
    }else if($(this).parent().parent().next().css('display') == 'table-row'){
        $(this).html('열기<i class="fas fa-angle-down">');
        $(this).parent().parent().next().css('display', 'none');
    }
})

//  qna 수정
    $(".user_qna_modify").on('click',function(){
        var user_qna_value = $(this).parent().prev().find('span').text();
        
        $(this).parent().prev().find('span').html('<input type="text" size="50"> <input type="button" class="update_qna" value="수정"><input type="button" value="취소">');
        $(this).parent().prev().find('input[type=text]').val(user_qna_value);
        
        $($(this).parent().prev().find('input[value=취소]')).on('click',function(){
            $(this).empty();
            $(this).text(user_qna_value);  
        })
        var qnaNo = $(this).next().val();
           $.ajax({
		   url:"${pageContext.request.contextPath}/qna/qnaUpdateForm" , //서버요청주소 현재링크기준으로
		   type:"post" , //전송방식(get or post)
		   dataType:"json", //서버가 보내주는 데이터타입(text,html,xml,json)
		   data:{
			   "qnaNo":qnaNo
			   }, //서버에게 보낼 parameter정보
		   //cheerNo=${boardList.cheerNo} 
		   success:function(result){
		
		   } , //성공했을때
		   error:function(err){
			   alert(err+" => 오류 발생")
		   }  //실패했을때
	   })//ajax끝   
    })
    
    //qna 삭제
    $(".user_qna_delete").on('click',function(){
    	    var qnaNo = $(this).prev().val();
    		var projectNo=1; //이거 반장님꺼 받아와야함
    		var qnaParentNo = 3; // 아무 숫자나 넣어도 됨. 0만 아니면 되니까. 어차피 값 안써요 
    	     $.ajax({
    			   url:"${pageContext.request.contextPath}/qna/qnaDelete" , //서버요청주소 현재링크기준으로
    			   type:"post" , //전송방식(get or post)
    			   dataType:"json", //서버가 보내주는 데이터타입(text,html,xml,json)
    			   data:{
    				   "qnaNo":qnaNo,
    				   "projectNo":projectNo,
    				   "qnaParentNo":qnaParentNo
    				   },
    				   success:function(deleteResult){
    						alert(deleteResult.message);
    						history.go(0);
    				} , //성공했을때
    					   error:function(err){
    						   alert(err+" => 오류 발생")
    					   }  //실패했을때 
    			   
    		   })//ajax끝   
    });


    $(".writer_qna_delete").on('click',function(){
    	 var qnaNo = $(this).prev().prev().val();
 	    var qnaParentNo = $(this).prev().prev().prev().val();
 		var projectNo=1; //이거 반장님꺼 받아와야함
 	    $.ajax({
 			   url:"${pageContext.request.contextPath}/qna/qnaDelete" , //서버요청주소 현재링크기준으로
 			   type:"post" , //전송방식(get or post)
 			   dataType:"json", //서버가 보내주는 데이터타입(text,html,xml,json)
 			   data:{
 				   "qnaNo":qnaNo,
 				   "projectNo":projectNo,
 				   "qnaParentNo":qnaParentNo
 				   },
 				   success:function(deleteResult){
 						alert(deleteResult.message);
 						history.go(0);
 				} , //성공했을때
 					   error:function(err){
 						   alert(err+" => 오류 발생")
 					   }  //실패했을때
 			   
 		   })//ajax끝  
    });


$(document).on("click","input[value=응원하기]",function(){
	if(${alreadyPaid=='false'}){
		alert("응원댓글은 기부한 후에 작성 가능합니다.");
		
		return false;
	}
	
	$.ajax({
			   url:"${pageContext.request.contextPath}/cheer/cheerInsertAjax" , //서버요청주소 현재링크기준으로
			   type:"post" , //전송방식(get or post)
			   dataType:"json", //서버가 보내주는 데이터타입(text,html,xml,json)
			   data: {
					projectNo:${projectDTO.projectNo}			
				},
			   success:function(duplicatedResult){
					   alert(duplicatedResult.message);
				} , //성공했을때
					   error:function(err){
						   alert(err+" => 오류 발생")
					   }  //실패했을때
			   
		   })//ajax끝   
});





    //cheer 대댓글 수정1
$(document).on("click","input[value=수정]",function(){
	
	if($(this).attr("class") == 'update_reply_cheer'){ 
		/* alert("대댓글 수정"); */
		var projectNo = 1;
		var user_reply_point = $(this).parent().parent().find('input[type=text]');
		var user_reply = user_reply_point.val();
		 if(user_reply == ""){
             alert("수정할 내용을 입력하세요.");
             user_reply_point.focus();
             return false;
         }
		 $.ajax({
			  url:"${pageContext.request.contextPath}/cheer/cheerUpdate" , //서버요청주소 현재링크기준으로
			   type:"post" , //전송방식(get or post)
			   dataType:"json", //서버가 보내주는 데이터타입(text,html,xml,json)
			   data:{
				   "cheerContent":user_reply,
				   "projectNo":projectNo
				   },
				   success:function(updateResult){
					   alert("수정에 성공했습니다.");
						history.go(0);
					   } ,
					   error:function(err){
						   alert("에러발생");
					   } 
				   })//ajax끝   
  
	} else if($(this).attr("class") == 'update_reply_qna'){ 
		/* alert("대댓글 수정"); */
		var projectNo = 1;
		var qna_reply_point = $(this).parent().parent().find('input[type=text]');
		var qna_reply = qna_reply_point.val();
		
	    alert(qna_reply);
		 if(qna_reply == ""){
             alert("수정할 내용을 입력하세요.");
             qna_reply_point.focus();
             return false;
         }
		  $.ajax({
			  url:"${pageContext.request.contextPath}/qna/qnaUpdate" , //서버요청주소 현재링크기준으로
			   type:"post" , //전송방식(get or post)
			   dataType:"json", //서버가 보내주는 데이터타입(text,html,xml,json)
			   data:{
				   "qnaContent":qna_reply,
				   "projectNo":projectNo
				   },
				   success:function(updateResult){
					   alert("수정에 성공했습니다.");
						history.go(0);
					   } ,
					   error:function(err){
						   alert("에러발생");
					   } 
				   })//ajax끝   
   
	} else if($(this).attr("class") == 'update_cheer'){ // 그냥 댓글 수정
		/* alert($(this).parent().parent().find('input[type=text]').val()); */
		var projectNo = 1; //수정해라
		var user_reply_point = $(this).parent().parent().find('input[type=text]');
		var user_reply = user_reply_point.val();
		 if(user_reply == ""){
             alert("수정할 내용을 입력하세요.");
             user_reply_point.focus();
             return false;
         }
		console.log(user_reply);
	 	$.ajax({
			  url:"${pageContext.request.contextPath}/cheer/cheerUpdate" , //서버요청주소 현재링크기준으로
			   type:"post" , //전송방식(get or post)
			   dataType:"json", //서버가 보내주는 데이터타입(text,html,xml,json)
			   data:{
				   "cheerContent":user_reply,
				   "projectNo":projectNo
				   },
				   success:function(updateResult){
					   alert("수정에 성공했습니다.");
						history.go(0);
					   } ,
					   error:function(err){
						   alert("에러발생");
					   } 
				   })//ajax끝   
   
	} else if($(this).attr("class") == 'update_qna'){ // QnA 수정
		/* alert("대댓글 수정"); */
		var projectNo = 1;
		var user_qna_value = $(this).prev().val();
		   $.ajax({
			  url:"${pageContext.request.contextPath}/qna/qnaUpdate" , //서버요청주소 현재링크기준으로
			   type:"post" , //전송방식(get or post)
			   dataType:"json", //서버가 보내주는 데이터타입(text,html,xml,json)
			   data:{
				   "qnaContent":user_qna_value
				   },
				   success:function(updateResult){
					   alert("수정에 성공했습니다.");
						history.go(0);
					   } ,
					   error:function(err){
						   alert("에러발생");
					   } 
				   })//ajax끝   
    
	}
});
//지성, 병현 기능 추가
       
//% 처리        
        if($(".progressbar").val() != 0){
            var progressbar = $(".progressbar"),
            max = progressbar.attr('max'),
                initValue = 0,
              value = progressbar.val();

          var loading = function() {
              initValue += 1;
              addValue = progressbar.val(initValue);
                progressbar.next().children().html(initValue + '%');

              if (initValue == value) {
                  clearInterval(animate);
              }
          };

          var animate = setInterval(function() {
              loading();
          }, 10);
       }
        
    $(function(){
         var progressbar = $(".goods-progressbar"),
				max = progressbar.attr('max'),
//				time = (10/max)*5,
                initValue = 0,
		        value = progressbar.val();

		    var loading = function() {
		        initValue += 1;
		        addValue = progressbar.val(initValue);

		        progressbar.next().children().html(initValue + '%');
//                $(".progress-value").html(initValue + '%');

		        if (initValue == value) {
		            clearInterval(animate);
		        }
		    };

		    var animate = setInterval(function() {
		        loading();
		    }, 10);
    })
      
    
   
$(function(){
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
  
	//병현 즐겨찾기 추가 및 삭제
  $("#bookmark").on("click" , function(){       
	  var starImg =$("#fa-star").attr("class");
	  var id = "${sessionScope.userDTO.id}";
	  console.log(id);
	  
	  if(id == ''){
		  return;
		  
	  }
	  
	  var projectNo = ${favoriteDTO.projectNo};
	  if( starImg == 'far fa-star'){
		    $.ajax({
	               url :"${pageContext.request.contextPath}/project/insertFavorite", 
	               type :"post", 
	               dataType :"json", 
	               data : {"id" : id, "projectNo" : projectNo},
	               success : function(result){
	                  if(result==1){
	                	  $("#fa-star").attr("class","fas fa-star");
	                  }
	               },
	               error : function(err){
	                  alert(err + "=> 예외발생!!");
	               }       
	          });
	  } else if( starImg == 'fas fa-star'){
		  $.ajax({
             url :"${pageContext.request.contextPath}/project/deleteFavorite",
             type :"post",
             dataType :"json", 
             data : {"id" : id, "projectNo" : projectNo},
             success : function(result){
                if(result==1){
               	 $("#fa-star").attr("class","far fa-star");
                }
             },
             error : function(err){
                alert(err + "=> 예외발생!!");
             }       
        }); 
	  }
  });// 즐겨찾기 클릭시
  //글쓴이 확인이 되면 삭제버튼과 수정버튼을 추가한다.
  if("${updateFlag}" == "true"){
	  str="";
	  str +="<input type='button' class='btn_2' value='수정' style='width:100px;'>"
	  $("#update_btn").html(str);
  }

  $("input[value=수정]").on("click",function(){
	  location.href="projectUpdateForm"
  });
  
});
    
    
/* 결제 */
function numberWithCommas(money){
    return money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
$(".item_add").on('click',function(){
    var selectValue = $("#item_select option:selected").val();
    
    if(selectValue == '선택'){
        alert('항목을 선택해주세요.');
        return ;
    }
    
    var splitValue = selectValue.split(' - ');
    var deleteUnit = splitValue[1].split('원');
    
    var length = $(".eachName").length;
    var alreadyExist = 0;
    
    for(i=0;i<length;i++){
    	var paymentName = $('.paymentNumber').eq(i).children().find('span').html().trim();
    	console.log(paymentName);
    	
    	if(paymentName == splitValue[0]){
    		alreadyExist += 1;
    	}
    }
    
    if(alreadyExist>0){
    	alert("이미 추가된 항목입니다.");
    }
    else{
        $(this).parent().parent().after('<tr class="paymentNumber"><th><span style="color:#DC287C" class="eachName">'+splitValue[0]+'</span></th><td><div style="margin-bottom:5px;"><input type="button" value="+1개" class="item_increase_1"><input type="button" value="+10개" class="item_increase_2"><input type="button" value="+100개" class="item_increase_3"><input type="button" value="초기화" class="item_init"><input type="button" value="삭제" class="item_delete"></div><input type="text" value="1" readonly size="5" class="payment_item">개 * <span style="color:#DC287C;font-size:13px;" class="eachPrice">'+splitValue[1]+'</span></td></tr>');
        
        var money = parseInt(deleteUnit[0]);
        var totalMoney = parseInt(removeComma($(".payment_money_total").text()));
        totalMoney += money;
        $(".payment_money_total").text(numberWithCommas(totalMoney));
    }
});

$(document).on('click',".item_delete",function(){
	$(this).parent().parent().parent().remove();

    var totalMoney = parseInt(removeComma($(".payment_money_total").text()));
    var money = parseInt($(this).parent().parent().find(".eachPrice").text())*parseInt($(this).parent().parent().find(".payment_item").val());
    totalMoney -= money;
    $(".payment_money_total").text(numberWithCommas(totalMoney));
});


$(function(){

	$(".money_increase_1").on('click',function(){
        var sum = parseInt($(".payment_money").val());
        sum+=1000;
        $(".payment_money").val(sum);$(".payment_money_total").text(numberWithCommas(sum));
    });
    $(".money_increase_2").on('click',function(){
        var sum = parseInt($(".payment_money").val());
        sum+=10000;
        $(".payment_money").val(sum);$(".payment_money_total").text(numberWithCommas(sum));
    });
    $(".money_increase_3").on('click',function(){
        var sum = parseInt($(".payment_money").val());
        sum+=100000;
        $(".payment_money").val(sum);$(".payment_money_total").text(numberWithCommas(sum));
    });
    $(".money_init").on('click',function(){
        $(".payment_money").val('1000');$(".payment_money_total").text('1,000');
    });
});

function removeComma(str){
	n = parseInt(str.replace(/,/g,""));
	return n;
}

$(document).on('click',".item_increase_1",function(){
    var sum = parseInt($(this).parent().parent().find(".payment_item").val());
    sum+=1;
    $(this).parent().parent().find(".payment_item").val(sum);
    
    var money = parseInt($(this).parent().parent().find(".eachPrice").text());
    var totalMoney = parseInt(removeComma($(".payment_money_total").text()));
    totalMoney += money;
    $(".payment_money_total").text(numberWithCommas(totalMoney));
    
});
$(document).on('click',".item_increase_2",function(){
    var sum = parseInt($(this).parent().parent().find(".payment_item").val());
    sum+=10;
    $(this).parent().parent().find(".payment_item").val(sum);
    
    var money = parseInt($(this).parent().parent().find(".eachPrice").text())*10;
    var totalMoney = parseInt(removeComma($(".payment_money_total").text()));
    totalMoney += money;
    $(".payment_money_total").text(numberWithCommas(totalMoney));
});
$(document).on('click',".item_increase_3",function(){
    var sum = parseInt($(this).parent().parent().find(".payment_item").val());
    sum+=100;
    $(this).parent().parent().find(".payment_item").val(sum);
    
    var money = parseInt($(this).parent().parent().find(".eachPrice").text())*100;
    var totalMoney = parseInt(removeComma($(".payment_money_total").text()));
    totalMoney += money;
    $(".payment_money_total").text(numberWithCommas(totalMoney));
});
$(document).on('click',".item_init",function(){
	$(this).parent().parent().find(".payment_item").val('1');
	
	var money = parseInt($(this).parent().parent().find(".eachPrice").text());
    $(".payment_money_total").text(numberWithCommas(money));
});


$(document).on('click',"#payment_money_btn",function(){

	if('${sessionScope.userDTO.id}' == ''){
		if(confirm("로그인 후에 이용 가능합니다. 로그인 하시겠습니까?")){
	     	location.href="${pageContext.request.contextPath}/member/login";
	    }	
	} else {
		
		if(${alreadyPaid} == 'true'){
			alert("기부는 한 번만 가능합니다.");
			return false;
		}
		
		var giveMoney = $('input.payment_money').val();
		$("#giveForSetting").attr("action","${pageContext.request.contextPath}/payment/paymentGiveSetting?giveMoney=" + giveMoney);
		$("#giveForSetting").submit();
	}
	
});

$(document).on('click',"#payment_item_btn",function(){
	
	if('${sessionScope.userDTO.id}' == ''){
		if(confirm("로그인 후에 이용 가능합니다. 로그인 하시겠습니까?")){
	     	location.href="${pageContext.request.contextPath}/member/login";
	    }	
	} else {
		if(${alreadyPaid=='true'}){
			alert("기부는 한 번만 가능합니다.");
			return false;
		}
		var giveMoney = removeComma($(".payment_money_total").text());
		$("#giveForSetting").attr("action","${pageContext.request.contextPath}/payment/paymentGiveSetting?giveMoney" + giveMoney);
		
		var length = $(".paymentNumber").length;
	 		for(i=0;i<length;i++){
	 			
	 			var giveItemAmount = $('.paymentNumber').eq(i).find('.payment_item').val();
	 			var paymentNumber = $('.paymentNumber').eq(i).find('.payment_item').next().html().split('원')[0].trim(); 
	 			var paymentName = $('.paymentNumber').eq(i).children().find('span').html().trim();
	 			
				$("#giveForSetting").append("<input type='hidden' name='giveItem["+i+"].giveItemName' value ="+paymentName+">");
				$("#giveForSetting").append("<input type='hidden' name='giveItem["+i+"].giveItemPrice' value ="+paymentNumber+"> ");
				$("#giveForSetting").append("<input type='hidden' name='giveItem["+i+"].giveItemAmount' value="+giveItemAmount+">");
	 		}
		 
		  $("#giveForSetting").submit();  
	}
	  
})


</script>

<%@ include file="../common/footer.jsp" %>