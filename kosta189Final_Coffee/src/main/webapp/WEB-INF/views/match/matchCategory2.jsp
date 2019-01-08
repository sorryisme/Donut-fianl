<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ include file="../common/header.jsp" %>
<input type="hidden" id="step01" name="step01" value="${param.step01}"/>
<div class="match-step02-wrap" data-aos="fade-in">
    <div class="match-step02-container">
        <div class="steps">
            <ul class="step02" style="background:url(${pageContext.request.contextPath}/resources/images/matchIMG/step_bg.png) center -46px no-repeat;">
                <li>
                    <p>2단계</p>
                    <p>대상</p>
                </li>
            </ul>
        </div>
        <div class="match-step02-list">
            <div class="match-step02-item" data-item="0">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/children.JPG">
                </div>
                <div class="item-description">
                    <p>아동</p>
                    <p>사랑하는 우리 아이들,<br>아동에게 도움을 주고 싶다.</p>
                </div>
            </div>
            <div class="match-step02-item" data-item="1">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/adult.JPG">
                </div>
                <div class="item-description">
                    <p>성인</p>
                    <p>사회에 진출하여 밝은 미래를 꿈꾸는<br>성인에게 도움을 주고 싶다.</p>
                </div>
            </div>
            <div class="match-step02-item" data-item="2">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/senior.JPG">
                </div>
                <div class="item-description">
                    <p>노인</p>
                    <p>복지사각지대에 있는 취약계층인<br>노인분들께 도움을 주고 싶다.</p>
                </div>
            </div>
            <div class="match-step02-item" data-item="3">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/animal.JPG">
                </div>
                <div class="item-description">
                    <p>동물</p>
                    <p>생존 보장 및 위험에 처해있는<br>동물들에게 도움을 주고 싶다.</p>
                </div>
            </div>
            <div class="match-step02-item" data-item="4">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/society.JPG">
                </div>
                <div class="item-description">
                    <p>지역사회</p>
                    <p>우리 사회의 발전을 위해<br>지역사회분야에 도움을 주고 싶다.</p>
                </div>
            </div>
        </div>
        <div class="prev_btn" >
            <input type="button" value="이전">
        </div>
    </div>
</div>
<script>
    $(".match-step02-item").click(function(){
    	var dataItem = $(this).attr('data-item');
        $(location).attr('href','${pageContext.request.contextPath}/match/matchCategory3?step01=' + $("#step01").val() 
        		+ "&step02=" + dataItem);
    });
    $(".prev_btn").click(function(){
    	history.back(1);
    })
</script>

<%@ include file="../common/footer.jsp" %>