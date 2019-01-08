<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ include file="../common/header.jsp" %>

<input type="hidden" id="step01" name="step01" value="${param.step01}" />
<input type="hidden" id="step02" name="step02" value="${param.step02}" />
<div class="match-step03-wrap" data-aos="fade-in">
    <div class="match-step03-container">
        <div class="steps">
            <ul class="step03" style="background:url(${pageContext.request.contextPath}/resources/images/matchIMG/step_bg.png) center -120px no-repeat;">
                <li>
                    <p>3단계</p>
                    <p>분야</p>
                </li>
            </ul>
        </div>
        
	<c:choose>
        <c:when test="${param.step02 == '0'}">
        <div class="match-step03-list">
            <div class="match-step03-item" data-item="0">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/children_education.PNG">
                </div>
                <div class="item-description">
                    <p>교육</p>
                    <p>미래의 빛이 되어줄 아이들의<br>교육 분야에 도움을 주고 싶다.</p>
                </div>
            </div>
            <div class="match-step03-item" data-item="1">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/children_headedhousehold.PNG">
                </div>
                <div class="item-description">
                    <p>소녀/소년 가장</p>
                    <p>어린 나이에 가장이 된<br>소녀/소년에게 도움을 주고 싶다.</p>
                </div>
            </div>
            <div class="match-step03-item" data-item="2">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/children_disabledperson.PNG">
                </div>
                <div class="item-description">
                    <p>장애인</p>
                    <p>따뜻한 손길이 필요한<br>장애아동에게 도움을 주고 싶다.</p>
                </div>
            </div>
            <div class="match-step03-item" data-item="3">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/children_disease.PNG">
                </div>
                <div class="item-description">
                    <p>질병/희귀 질환</p>
                    <p>열심히 질병과 싸우는<br>아이들에게 도움을 주고 싶다.</p>
                </div>
            </div>
        </div>
        </c:when>
        	
        	
        	
        <c:when test="${param.step02 == '1'}">
        <div class="match-step03-list">
            <div class="match-step03-item" data-item="0">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/adult_singlemother.PNG">
                </div>
                <div class="item-description">
                    <p>미혼모</p>
                    <p>혼자가 아니라고 말해주고 싶은<br>미혼모에게 도움을 주고 싶다.</p>
                </div>
            </div>
            <div class="match-step03-item" data-item="1">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/adult_lowincomepeople.PNG">
                </div>
                <div class="item-description">
                    <p>저소득층</p>
                    <p>소득이 적은<br>저소득층 성인에게 도움을 주고 싶다.</p>
                </div>
            </div>
            <div class="match-step03-item" data-item="2">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/adult_disabledperson.PNG">
                </div>
                <div class="item-description">
                    <p>장애인</p>
                    <p>따뜻한 손길이 필요한<br>성인 장애인들에게 도움을 주고 싶다.</p>
                </div>
            </div>
            <div class="match-step03-item" data-item="3">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/adult_disease.PNG">
                </div>
                <div class="item-description">
                    <p>질병/희귀 질환</p>
                    <p>열심히 질병과 싸우는<br>성인에게 도움을 주고 싶다.</p>
                </div>
            </div>
        </div>
        </c:when>
        <c:when test="${param.step02 == '2'}">
        <div class="match-step03-list">
            <div class="match-step03-item" data-item="0">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/senior_livesalone.PNG">
                </div>
                <div class="item-description">
                    <p>독거 노인</p>
                    <p>돌봄이 필요한<br>독거 노인에게 도움을 주고 싶다.</p>
                </div>
            </div>
            <div class="match-step03-item" data-item="1">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/senior_basicwageearner.PNG">
                </div>
                <div class="item-description">
                    <p>기초생활수급자</p>
                    <p>기본적인 생활 환경이 필요한<br>기초생활수급자 노인에게 도움을 주고 싶다</p>
                </div>
            </div>
            <div class="match-step03-item" data-item="2">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/senior_disabledperson.PNG">
                </div>
                <div class="item-description">
                    <p>장애인</p>
                    <p>거동이 힘든<br>장애인 노인에게 도움을 주고 싶다.</p>
                </div>
            </div>
        </div>
        </c:when>
        
        <c:when test="${param.step02 == '3'}">
        <div class="match-step03-list">
            <div class="match-step03-item" data-item="0">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/animal_livelihood.PNG">
                </div>
                <div class="item-description">
                    <p>생계 및 기초생활 지원</p>
                    <p>생명에 위협을 받는<br>동물들에게 도움을 주고 싶다.</p>
                </div>
            </div>
            <div class="match-step03-item" data-item="1">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/animal_medicaltreatment.PNG">
                </div>
                <div class="item-description">
                    <p>의료</p>
                    <p>치료를 기다리고 있는<br>동물들에게 도움을 주고 싶다.</p>
                </div>
            </div>
            <div class="match-step03-item" data-item="2">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/animal_housing.PNG">
                </div>
                <div class="item-description">
                    <p>주거,환경개선</p>
                    <p>제대로 된 보금자리를 찾는<br>동물들에게 도움을 주고 싶다.</p>
                </div>
            </div>
            <div class="match-step03-item" data-item="3">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/animal_policy.PNG">
                </div>
                <div class="item-description">
                    <p>인식 및 정책 개선</p>
                    <p>함께 더불어 살아가고 있는 생명체로서<br>동물들에게 도움을 주고 싶다.</p>
                </div>
            </div>
        </div>
        </c:when>
        
        <c:when test="${param.step02 == '4'}">
        <div class="match-step03-list">
            <div class="match-step03-item" data-item="0">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/society_environment.PNG">
                </div>
                <div class="item-description">
                    <p>환경</p>
                    <p>우리 아이들에게 물려줄<br>환경 분야에 도움을 주고 싶다.</p>
                </div>
            </div>
            <div class="match-step03-item" data-item="1">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/society_statesponsor.PNG">
                </div>
                <div class="item-description">
                    <p>보훈 대상자</p>
                    <p>빛나는 공헌에 대한 보답을 해드릴<br>보훈 대상자에게 도움을 주고 싶다.</p>
                </div>
            </div>
            <div class="match-step03-item" data-item="2">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/society_disaster.PNG">
                </div>
                <div class="item-description">
                    <p>재해민</p>
                    <p>하루아침에 큰 변화를 맞은<br>재해민에게 도움을 주고 싶다.</p>
                </div>
            </div>
            <div class="match-step03-item" data-item="3">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/society_multiplecultures.PNG">
                </div>
                <div class="item-description">
                    <p>다문화</p>
                    <p>차별을 없애기 위해<br>다문화가정에 도움을 주고 싶다.</p>
                </div>
            </div>
        </div>
        </c:when>
        
	</c:choose>  
        <div class="prev_btn">
            <input type="button" value="이전">
        </div>
    </div>
</div>
<script>
    $(".match-step03-item").click(function(){
    	var dataItem = $(this).attr('data-item');
        $(location).attr('href','${pageContext.request.contextPath}/match/matchComplete?step01=' + $("#step01").val() 
        		+ '&step02=' + $("#step02").val() + '&step03='  + dataItem);
    });
    $(".prev_btn").click(function(){
    	history.back(1);
    })
</script>

<%@ include file="../common/footer.jsp" %>