<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ include file="../common/header.jsp" %>

<div class="match-start-wrap" data-aos="fade-in">
    <div class="match-start-container">
        <p class="match-start-title">맞춤기부</p>
            <div class="match-start-card">
                <div class="match-start-card-title"><p>나에게 딱 맞는 기부를 찾아보세요!</p></div>
                <div class="start_btn">
                    <p class="matchStart">시작하기</p>
                </div>
            </div>
    </div>
</div>


<script>
    $(".start_btn").click(function(){
        $(location).attr('href','${pageContext.request.contextPath}/match/matchCategory1');
    });
</script>

<%@ include file="../common/footer.jsp" %>