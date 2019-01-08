<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ include file="../common/header.jsp" %>



<div class="honor-wrap">
    <div class="honor-container">
        <div class="honor-title"><p>명예의전당</p></div>
        <div class="honor-thumb">
            <div class="honor-thumb-item">
                <div><img src="${pageContext.request.contextPath}/resources/images/honor/thumb1.png"></div>
                <div><p>총 기부금</p></div>
                <div><p><fmt:formatNumber value="${totalGiveMoney}" type="number"/>원</div>
            </div>
            <div class="honor-thumb-item">
                <div><img src="${pageContext.request.contextPath}/resources/images/honor/thumb2.png"></div>
                <div><p>프로젝트</p></div>
                <div><p>${countProject}건</p></div>
            </div>
        </div>
        
        
        <div class="honor-list-container">
            <div class="honor-list">
                <div class="honor-large-amount"><p><i style="color:#CE5970" class="fas fa-star-of-david"></i> 고액후원자</p></div>
                <ul>
                <c:forEach items="${requestScope.list}" var="memberDTO" >
                    <li>
                       
                        <div class="list-user-thumb">
                           <img src="${pageContext.request.contextPath}/resources/finalPhoto/member/${memberDTO.picture}" onerror ="this.src='${pageContext.request.contextPath}/resources/images/thumbs/testImg.jpg'">
                        </div>
                        
                        <div class="list-user-description">
                            <div class="list-user-id">${memberDTO.name}</div>
                            <div class="list-user-donation"><fmt:formatNumber value="${memberDTO.accMoney}" type="number"/>원</div>
                        </div>
                    </li>
                    
                    </c:forEach>
                </ul>
            </div>
            
            
            
            <div class="honor-list">
                <div class="honor-special-donor"><p><i style="color:#CE5970" class="fas fa-sun"></i> 특별후원자</p></div>
                <ul>
                    <li>
                        <div class="list-user-thumb">
                            <img src="${pageContext.request.contextPath}/resources/images/thumbs/test4.jpg">
                        </div>
                        <div class="list-user-description">
                            <div class="list-user-id">kdh8909</div>
                            <div class="list-user-donation">32,000,000원</div>
                        </div>
                    </li>
                    <li>
                        <div class="list-user-thumb">
                            <img src="${pageContext.request.contextPath}/resources/images/thumbs/test2.jpg">
                        </div>
                        <div class="list-user-description">
                            <div class="list-user-id">abcd1234</div>
                            <div class="list-user-donation">21,000,000원</div>
                        </div>
                    </li>
                    <li>
                        <div class="list-user-thumb">
                            <img src="${pageContext.request.contextPath}/resources/images/thumbs/test3.jpg">
                        </div>
                        <div class="list-user-description">
                            <div class="list-user-id">qwer1234</div>
                            <div class="list-user-donation">15,000,000원</div>
                        </div>
                    </li>
                </ul>  
            </div>
        </div>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>