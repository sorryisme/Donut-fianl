<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ include file="../common/header.jsp" %>

<div class="match-step01-wrap" data-aos="fade-in">
    <div class="match-step01-container">
        <div class="steps">
            <ul class="step01" style="background:url(${pageContext.request.contextPath}/resources/images/matchIMG/step_bg.png) center 28px no-repeat;">
                <li>
                    <p>1단계</p>
                    <p>기부형태</p>
                </li>
            </ul>
        </div>
        <div class="match-step01-list">
            <div class="match-step01-item" data-item="0">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/money.PNG" alt="맞춤후원 리스트 사진 01">
                </div>
                <div class="item-description">
                    <p>금액</p>
                    <p>금액 기부의 형태로<br>도움을 주고 싶다.</p>
                </div>
            </div>
            <div class="match-step01-item" data-item="1">
                <div class="item-img">
                    <img src="${pageContext.request.contextPath}/resources/images/matchIMG/item.PNG" alt="맞춤후원 리스트 사진 01">
                </div>
                <div class="item-description">
                    <p>물품</p>
                    <p>물품 기부의 형태로<br>도움을 주고 싶다.</p>
                </div>
            </div>
        </div>
        <div class="prev_btn" >
            <input type="button" value="이전">
        </div>
    </div>
</div>


<script>
    $(".match-step01-item").click(function(){
    	var dataItem = $(this).attr("data-item");
    	$(location).attr('href','${pageContext.request.contextPath}/match/matchCategory2?step01=' + dataItem);
    });
    $(".prev_btn").click(function(){
    	history.back(1);
    })
</script>


<%@ include file="../common/footer.jsp" %>