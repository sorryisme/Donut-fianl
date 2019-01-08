<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../common/header.jsp" %>

<div class="mypage-wrap">
   <div class="mypage-container">
        <div class="mypage-sidebar">
                <div class="mypage-sidebar-title">
                    <span><b>마이페이지</b></span>
                    <span style="font-size:18px;font-weight: 600;">mypage</span>
                </div>
                <ul>
                    <li class="sidebar-1"><a href="${pageContext.request.contextPath}/company/companyMypage">회원정보수정</a></li>
                    <li class="select sidebar-2"><a href="${pageContext.request.contextPath}/company/companyProject">내 프로젝트</a></li>
                </ul>
        </div>
        <div class="mypage-contents">
           <p align="center" class="mypage-title">
               <span style="font-size:30px;color:black;">내 프로젝트</span>
           </p>
             <table id="listTable"   align="center" border="0" cellpadding="5" cellspacing="2" width="100%">

	<tr>
	<td bgcolor="pink">
            <p align="center">
            <font color="white"><b><span style="font-size:9pt;">번호</span></b></font></p>
        </td>
        <td bgcolor="pink">
            <p align="center">
            <font color="white"><b><span style="font-size:9pt;">주제</span></b></font></p>
        </td>
        <td bgcolor="pink">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">목표</span></b></font></p>
        </td>
        <td bgcolor="pink">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">달성률</span></b></font></p>
        </td>
        <td bgcolor="pink">
            <p align="center"><font color="white"><b><span style="font-size:9pt;">프로젝트 만료일</span></b></font></p>
        </td>
         <td bgcolor="pink">
            <p align="center"><font color="white"><b><span style="font-size:9pt;"> 진행사항</span></b></font></p>
        </td>
    </tr>
    <c:choose>
    <c:when test="${empty requestScope.myProject}">
	<tr>
        <td colspan="5">
            <p align="center"><b><span style="font-size:9pt;">아직 등록한 프로젝트가 없습니다.</span></b></p>
        </td>
    </tr>
    </c:when>
    <c:otherwise>
	<c:forEach items="${requestScope.myProject}" var="myProject" varStatus="status">
		    <tr style="background:white;" onmouseover="this.style.background='#eaeaea'" onmouseout="this.style.background='white'">
		         <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		             ${status.count}
		            </span></p>
		        </td>
		         
		       
		      
		        
		        <td bgcolor="">
					<p align="center"><span style="font-size:9pt;">
					<a href="${pageContext.request.contextPath}/project/projectRead?projectNo=${myProject.projectNo}">
					 ${myProject.projectSubject}
					</a>
					</span></p>
		        </td>
		      
				<td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		              ${myProject.goal}
		              </span></p>
		        </td>
		        		       
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		             ${myProject.percent}%
		            </span></p>
		        </td>
		         
		        <td bgcolor="">
		        	 <c:set var="projectEnd" value="${myProject.projectEnd}"/>
		            <p align="center"><span style="font-size:9pt;">
		        			${fn:substring(projectEnd,0,10)}
		            
		              </span></p>
		        </td>
		        
		         
		        <c:set var="now" value="<%=new java.util.Date()%>" />
            	<c:set var="sysDay"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></c:set>
            	<fmt:parseDate value="${myProject.projectEnd}" var="ParseDate" pattern="yyyy-MM-dd"/> 
            	<c:set var="projectDate"><fmt:formatDate value="${ParseDate}" pattern="yyyy-MM-dd" /></c:set> 
              
              	<c:choose>
              		<c:when test="${myProject.percent == 100 ||  projectDate le sysDay}">
            			<td bgcolor=""> 
                  			<p align="center"><span style="font-size:9pt;">
								<a href="${pageContext.request.contextPath}/project/projectRead?projectNo=${myProject.projectNo}">
                     			모금 완료</a>
                    		</span></p>
              			</td>
		            </c:when>
              		<c:otherwise>
               			<td bgcolor=""> 
                  			<p align="center"><span style="font-size:9pt;">
                  			<a href="${pageContext.request.contextPath}/project/projectRead?projectNo=${myProject.projectNo}">
                     			모금 진행중</a>
                  			</span></p>
                		</td>
              		</c:otherwise>
               	</c:choose>
		         
		        
		    </tr>
    </c:forEach>
	</c:otherwise>
    </c:choose>
</table>
                

</div>
</div>
</div>

<script>


</script>

<%@ include file="../../common/footer.jsp" %>