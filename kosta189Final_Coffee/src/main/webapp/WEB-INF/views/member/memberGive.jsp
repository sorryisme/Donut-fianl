<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
                    <li class="select sidebar-2"><a href="${pageContext.request.contextPath}/member/memberGive">내 후원</a></li>
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
                    <li class="sidebar-6"><a href="${pageContext.request.contextPath}/member/memberFavorite">즐겨찾기</a></li>
                    
                </ul>
        </div>
        <div class="mypage-contents">
           <p align="center" class="mypage-title">
               <span style="font-size:30px;color:black;">내 후원</span>
           </p>
            <div class="project-list-wrap">
            <div class="project-list">
            	<c:forEach var="project" items="${projectList}">
                <div class="project-list-items">
                	<div hidden="hidden">${project.projectNo}</div>
                    <div class="project-img"><img src="${pageContext.request.contextPath}/resources/finalPhoto/project/${project.projectImg}"  onerror="this.src='${pageContext.request.contextPath}/resources/images/thumbs/test2.jpg'"></div>
                    <div class="project-name"><span>${project.projectSubject}</span></div>
                    <div class="progress-wrap"><progress id="progressbar" value="${project.percent}" max="100"></progress></div>
                    <div class="progress-value-wrap"><span class="progress-value">${project.percent}%</span></div>
                    <div class="project-collection"><span>${project.totalMoney}/${project.goal}</span></div>
                </div>
                </c:forEach>
            </div>       
        </div>
        </div>
   </div>
</div>

<script>
	$(".project-list-items").click(function(){
		var projectNo = $(this).children().html();
		$(location).attr('href', '${pageContext.request.contextPath}/project/projectRead?projectNo='+projectNo);
	}); 
</script>

<%@ include file="../common/footer.jsp" %>