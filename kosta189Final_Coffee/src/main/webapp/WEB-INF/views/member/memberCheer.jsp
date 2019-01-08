<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../common/header.jsp" %>

<div class="mypage-wrap">
   <div class="mypage-container">
        <div class="mypage-sidebar">
                <div class="mypage-sidebar-title">
                    <span><b>마이페이지</b></span>
                    <span style="font-size:18px;font-weight: 600;">mypage</span>
                </div>
                <ul>
                    <li class="sidebar-1"><a href="${pageContext.request.contextPath}/member/memberMypage">회원정보수정</a></li>
                    <li class="sidebar-2"><a href="${pageContext.request.contextPath}/member/memberGive">내 후원</a></li>
                    <li class="sidebar-3"><a href="${pageContext.request.contextPath}/member/memberReceipt">영수증관리</a></li>
                    <li class="sidebar-4"><a href="${pageContext.request.contextPath}/member/memberQnA">Q&A</a>
                     <c:choose>
	                              <c:when test="${qnaNewAlarm==1}">
	                                	<i class="fa fa-bell faa-tada animated" id="alarm" style="color:#FF607F"></i>
	                              </c:when>
                              </c:choose></li>
                    <li class="select sidebar-5"><a href="${pageContext.request.contextPath}/member/memberCheer">내 응원</a>
                                        <c:choose>
	                              <c:when test="${newAlarm==1}">
	                             	   	<i class="fa fa-bell faa-tada animated" id="alarm" style="color:#FF607F"></i>
	                              </c:when>
                              </c:choose> </li>
                    <li class="sidebar-6"><a href="${pageContext.request.contextPath}/member/memberFavorite">즐겨찾기</a></li>
                </ul>
        </div>
        <div class="mypage-contents">
           <p align="center" class="mypage-title">
               <span style="font-size:30px;color:black;">내 응원</span>
           </p>
           
            <div class="cheer">
                    <table class="cheer-table" style=" width: 1000px">
                    <tr>
                       	<td>프로젝트명</td>
                       	<td>응원</td>
                       	<td>등록일</td>
                   	</tr>
                     <c:choose>
                    	<c:when test="${fn:length(cheerList) == 0}">
                            <tr>
                                <td colspan="3" align="center">
                                   <p align="center"><b><span style="font-size:9pt;">조회 결과가 없습니다.</span></b></p>
                                </td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                        
                          <c:forEach var="boardList" items="${cheerList}" varStatus="status">
                        	<c:choose>
                             	<c:when test="${boardList.cheerParentNo==0}"><!-- 부모글 -->
                        <tr>
                        
                           <td><div class="cheer-projectSubject">${boardList.projectDTO.projectSubject}</div></td>
                            <td>
                            	<div class="cheer-cheerContent">${boardList.cheerContent}</div>
                            	<div class="replyRead">댓글<i class="fas fa-angle-down"></i>
                                	<input type=hidden name="cheerNo" class="cheerNo" value="${boardList.cheerNo}">
                          
                                   	<c:choose>
                                   		<c:when test="${boardList.cheerNotify==1}">
                                　          					<strong>new</strong> <i class="far fa-comment faa-flash animated"></i>
                                      	</c:when>
                                   	</c:choose>
                                
                                </div>
                                <div class="replyContent"></div>
                            </td>
                            <td>${boardList.cheerRegdate}</td>
                        </tr>
                        
                       <c:choose>
                        <c:when test="${boardList.cheerNotify==0}"><!-- ★대댓글이 없습니다. -->
                         <tr class="cheerTr" id="a">
                            <td colspan="4">
                                <div class="cheerReply"> 등록된 답변이 없습니다. </div>
                            </td>
                        </tr>
                        </c:when>
                        </c:choose>
                        </c:when>
                        <c:when test="${boardList.cheerParentNo!=0}"><!-- 자식글 -->
                        <tr class="cheerTr" id="a">
                            <td colspan="4">
                                <div class="cheerReply"> ${boardList.cheerContent}</div>
                            </td>
                        </tr>
                        </c:when>
                        </c:choose>
                        </c:forEach>
                       </c:otherwise>
                      </c:choose>
                        
                        
                        
                    </table>
                </div>
        </div>
   </div>
</div>

<script>

$(".replyRead").on('click', function(){
    var cheerNo = $(this).children().next().val();
    if($(this).parent().parent().next().css('display') == 'none'){
        $(this).html('닫기<i class="fas fa-angle-up">');
        $(this).parent().parent().next().css('display', 'table-row');
    }else if($(this).parent().parent().next().css('display') == 'table-row'){
        $(this).html('열기<i class="fas fa-angle-down">');
        $(this).parent().parent().next().css('display', 'none');
    }

     $.ajax({
		   url:"${pageContext.request.contextPath}/member/memberCheerNotify" , //서버요청주소 현재링크기준으로
		   type:"post" , //전송방식(get or post)
		   dataType:"json", //서버가 보내주는 데이터타입(text,html,xml,json)
		   data:{
			   "cheerNo": cheerNo,
			   }
	   })//ajax끝   
})

$(".replyRead").on('click', function(){
	
	  $.ajax({
		   url:"${pageContext.request.contextPath}/member/alarmCheck" , //서버요청주소 현재링크기준으로
		   type:"post" , //전송방식(get or post)
		   dataType:"json", //서버가 보내주는 데이터타입(text,html,xml,json)
		   success:function(alarmExist){
			   if(alarmExist==0){
				   setTimeout("history.go(0);", 3500);
			   	}
			   } ,
			   error:function(err){
				   alert("에러발생");
			   } 
	   })//ajax2끝   
	   
})


$(window).on('beforeunload', function(){
	  $.ajax({
		   url:"${pageContext.request.contextPath}/member/alarmCheck" , //서버요청주소 현재링크기준으로
		   type:"post" , //전송방식(get or post)
		   dataType:"json" //서버가 보내주는 데이터타입(text,html,xml,json)
	   })//ajax2끝   
})



</script>
<%@ include file="../common/footer.jsp" %>