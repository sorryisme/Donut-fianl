<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
$('input[value=삭제]').on('click',function(){
	var favoriteNo=$(this).attr("id");	
	var deleteTr = $(this).parent().parent().parent().parent();
	
    $.ajax({
       url:"${pageContext.request.contextPath}/member/memberFavoriteDelete",
       type:"post",
       data:{"favoriteNo":favoriteNo},
       dataType:"json",
       success:function(result){
    	   if(result>0){
    		
    		   deleteTr.remove();
    		   alert("삭제가 완료되었습니다.");
    		  /*  $(this).parent().parent().parent().parent().parent().after('<tr><td colspan="6">test1</tr>') */;
    	   }else{
    		   alert('삭제 오류');
    	   }
         
       },error:function(err){
          alert("err : "+err);
       }
    })
 });
})
</script>

<%@ include file="../common/header.jsp" %>

<div class="mypage-wrap" data-aos="fade-in">
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
                    <li class="sidebar-5"><a href="${pageContext.request.contextPath}/member/memberCheer">내 응원</a>
                                        <c:choose>
	                              <c:when test="${newAlarm==1}">
	                             	    	<i class="fa fa-bell faa-tada animated" id="alarm" style="color:#FF607F"></i>
	                              </c:when>
                              </c:choose> </li>
                    <li class="select sidebar-6"><a href="${pageContext.request.contextPath}/member/memberFavorite">즐겨찾기</a></li>
                </ul>
        </div>
        <div class="mypage-contents">
           <p align="center" class="mypage-title">
               <span style="font-size:30px;color:black;">즐겨찾기</span>
           </p>
           <div class="mypage-wrap" data-aos="fade-in">
       		<div class="favorite-container">
            	<table id="listTable" class="favorite-table">
					<tr style="background-color: #DC287C">
                    	<td>주제</td>
                    	<td style="text-align: center">기부단체</td>
                    	<td>달성률</td>
                    	<td>즐겨찾기</td>
               		</tr>
    <c:choose>
    <c:when test="${empty requestScope.memberfavorite}">
	<tr>
        <td colspan="4">
            <p align="center"><b><span style="font-size:9pt;">조회 결과가 없습니다.</span></b></p>
        </td>
    </tr>
    </c:when>
    <c:otherwise>
	<c:forEach items="${requestScope.memberfavorite}" var="memberfavorite">
		    <tr>
<%-- 		         <td>
		            <p align="center"><span style="font-size:9pt;">
		             ${memberfavorite.favoriteNo}
		            </span></p>
		        </td>
		         
		       
		        <td>
		            <p align="center"><span style="font-size:9pt;">
		            ${memberfavorite.projectNo}</span></p>
		        </td> --%>
		        
		        <td>
					<p><span style="font-size:9pt;">
					<a href="${pageContext.request.contextPath}/project/projectRead?projectNo=${memberfavorite.projectNo}">
					 ${memberfavorite.projectDTO.projectSubject}
					</a>
					</span></p>
		        </td>
		      
		       
		        <td>
		            <p align="center"><span style="font-size:9pt;">
		             ${memberfavorite.projectDTO.id}
		            </span></p>
		        </td>
		         
		         <td>
		            <p align="center"><span style="font-size:9pt;">
		              ${memberfavorite.projectDTO.percent}%</span></p>
		        </td>
		        <td>
		            <p align="center">
		            	<span style="font-size:9pt;">
		            		<input type="button" id=${memberfavorite.favoriteNo} value="삭제" >
		          		</span>
		          	</p>
		        </td>
		    
		    </tr>
    </c:forEach>
    	</c:otherwise>
    </c:choose>
</table>
         
</div>
</div>
</div>
</div>
</div>
<%@ include file="../common/footer.jsp" %>