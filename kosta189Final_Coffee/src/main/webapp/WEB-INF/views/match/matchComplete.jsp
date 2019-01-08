<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ include file="../common/header.jsp" %>

<div class="match-complete-wrap" data-aos="fade-in">
    <div class="match-complete-container">
        <div class="match-complete-result">맞춤기부 검색 결과</div>
        
	<c:choose>
        <c:when test="${!empty matchList}">
        <p style="text-align: center;margin-bottom:30px;">${fn:length(matchList)}건이 검색되었습니다. 끌리는 프로젝트를 선택하여 기부를 해보세요!</p>
        <div class="match-list-wrap">
            <div class="project-list">
                <!-- 리스트 출력 반복문 -->
				<c:forEach var="project" items="${matchList}">
				 	<div class="project-list-items">
	                	<div hidden="hidden">${project.projectNo}</div>
	                    <div class="project-img"><img src="${pageContext.request.contextPath}/resources/finalPhoto/project/${project.projectImg}" onerror='this.src="${pageContext.request.contextPath}/resources/images/thumbs/test2.jpg"'></div>
	                    <div class="project-name"><span>${project.projectSubject}</span></div>
	                    <div class="progress-wrap"><progress id="progressbar" value="${project.percent}" max="100"></progress></div>
	                    <div class="progress-value-wrap"><span class="progress-value">${project.percent}%</span></div>
	                    <div class="project-collection"><span><fmt:formatNumber value="${project.totalMoney}" type="number"/>/<fmt:formatNumber value="${project.goal}" type="number"/></span></div>
	               	 </div>
				</c:forEach>
            </div>       
        </div> 
        </c:when>
        
        <c:otherwise>
        	<p style="text-align: center;margin-bottom:30px;">알맞은 기부프로젝트가 아직 등록되지 않았습니다.</p>
        </c:otherwise>
	</c:choose>
		<div class="prev_btn">
            <input type="button" value="다시하기">
        </div>
    </div>
</div>

<script>
$(".prev_btn").click(function(){
	$(location).attr('href','${pageContext.request.contextPath}/match/matchStart');
})

$(".project-list-items").click(function(){
	var projectNo = $(this).children().html();
	$(location).attr('href', '${pageContext.request.contextPath}/project/projectRead?projectNo='+projectNo);
});

</script>


<%@ include file="../common/footer.jsp" %>