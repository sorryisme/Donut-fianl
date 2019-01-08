<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../common/header.jsp" %>

<div class="project-wrap" data-aos="fade-in">
    <div class="project-container">
       <p class="project-title"><span style="font-size:30px;">프로젝트</span></p>
        <div class="project-divider" id="project-divider">
            <ul>
                <li class="select" id="money-raising">모금중</li>
                <li id="money-raising-end">모금종료</li>
            </ul>
        </div>
            
        <div class="project-category" style="top:11%;">
        	<form id="categoryForm" action="${pageContext.request.contextPath}/project/categoryList">
            <div class="category-title"><span>항목</span></div>
            <div class="category-contents">
                <input type="radio" name="category1" value="전체" checked="checked">전체
                <input type="radio" name="category1" value="금액">금액
                <input type="radio" name="category1" value="물품">물품
            </div>
            <div class="category-title"><span>중분류</span></div>
            <div class="category-contents">
                <input type="radio" name="category2" value="전체" checked="checked">전체
                <input type="radio" name="category2" value="아동">아동
                <input type="radio" name="category2" value="성인">성인
                <input type="radio" name="category2" value="노인">노인                 
                <input type="radio" name="category2" value="동물">동물
                <input type="radio" name="category2" value="지역사회">지역사회
            </div>
            <div class="category-title" id="category3-title"><span>소분류</span></div>
            <div class="category-contents">
                <input type="radio" name="category3" value="전체" checked="checked">전체
                <input type="radio" name="category3" value="교육">교육
                <input type="radio" name="category3" value="소녀/소년가장">소녀/소년가장
                <input type="radio" name="category3" value="장애인">장애인                 
                <input type="radio" name="category3" value="질병/희귀">질병/희귀
            </div>
            <div>
                <input type="button" value="검색" id="searchBtn">
                <input type="button" value="닫기" onclick="hide()">
            </div>
            </form>
        </div>
        <div class="project-sort">
            <button>상세검색<i class="fas fa-angle-down"></i></button>
        </div>
        <div class="project-list-wrap">
            <div class="project-list">
                <!-- 리스트 출력 반복문 -->
				<c:forEach var="project" items="${list}">
				 	<div class="project-list-items">
	                	<div hidden="hidden">${project.projectNo}</div>
	                    <div class="project-img">
	                    
	                    <img src="${pageContext.request.contextPath}/resources/finalPhoto/project/${project.projectImg}"  onerror="this.src='${pageContext.request.contextPath}/resources/images/thumbs/test2.jpg'">
	                    </div>
	                    <div class="project-name"><span>${project.projectSubject}</span></div>
	                    <div class="progress-wrap"><progress id="progressbar" value="${project.percent}" max="100"></progress></div>
	                    <div class="progress-value-wrap"><span class="progress-value">${project.percent}%</span></div>
	                    <div class="project-collection"><span><fmt:formatNumber value="${project.totalMoney}" type="number"/>/<fmt:formatNumber value="${project.goal}" type="number"/></span></div>
	               	 </div>
				</c:forEach>
            </div>       
        </div>
        <div class="btn-more-div">
            <input align="center" class="btn-more" type="button" value="더보기">
        </div>
    </div>
</div>


<script>  
    /* 상세검색 버튼 토글 */
    function hide(){
        $(".project-category").fadeOut();
        
    }
    
  	/* 상세검색 버튼 클릭*/
    $("#searchBtn").on("click",function(){
    	$("#categoryForm").submit();
    });
    
  	$("input[name=category2]").on("click", function(){
  		var category3 = $("#category3-title").next();
  		var str ='';
		if($("input[name=category2]:checked").val() =='아동'){
			str += '<input type="radio" name="category3" value="전체" checked="checked">전체';
			str += '<input type="radio" name="category3" value="교육">교육';
			str += '<input type="radio" name="category3" value="소녀/소년가장">소녀/소년가장';
			str += '<input type="radio" name="category3" value="장애인">장애인';
			str += '<input type="radio" name="category3" value="질병/희귀">질병/희귀';
			category3.html(str);
		} else if($("input[name=category2]:checked").val() == '성인'){
			str += '<input type="radio" name="category3" value="전체" checked="checked">전체';
			str += '<input type="radio" name="category3" value="미혼모">미혼모';
			str += '<input type="radio" name="category3" value="저소득층">저소득층';
			str += '<input type="radio" name="category3" value="장애인">장애인';
			str += '<input type="radio" name="category3" value="질병/희귀">질병/희귀';
			category3.html(str);
		} else if($("input[name=category2]:checked").val() == '노인'){
			str += '<input type="radio" name="category3" value="전체" checked="checked">전체';
			str += '<input type="radio" name="category3" value="독거노인">독거노인';
			str += '<input type="radio" name="category3" value="기초생활수급자">기초생활수급자';
			str += '<input type="radio" name="category3" value="장애인">장애인';
			category3.html(str);
		} else if($("input[name=category2]:checked").val() == '동물'){
			str += '<input type="radio" name="category3" value="전체" checked="checked">전체';
			str += '<input type="radio" name="category3" value="생계 및 기초생활 지원">생계 및 기초생활 지원';
			str += '<input type="radio" name="category3" value="의료">의료';
			str += '<input type="radio" name="category3" value="인식/정책 개선">인식/정책 개선';
			category3.html(str);
		} else if($("input[name=category2]:checked").val() == '지역사회'){
			str += '<input type="radio" name="category3" value="전체" checked="checked">전체';
			str += '<input type="radio" name="category3" value="환경">환경';
			str += '<input type="radio" name="category3" value="보훈 대상자">보훈 대상자';
			str += '<input type="radio" name="category3" value="재해민">재해민';
			str += '<input type="radio" name="category3" value="다문화">다문화';
			category3.html(str);
		}
		
  	});
		
  	
  	
    $(".project-category").hide();
    $(".project-sort>button").click(function(){
        $(".project-category").fadeToggle(300);
    })
    
    
    /* 프로젝트 모금중 , 모금종료 선택시 */
    $("#money-raising").on("click", function(){
    	$(location).attr('href',"${pageContext.request.contextPath}/project/projectList?flag=ing")
    });
    
    $("#money-raising-end").on("click", function(){
    	$(location).attr('href',"${pageContext.request.contextPath}/project/projectList?flag=end")
   });
    
    $(function(){
    	if(${param.flag == 'ing'}){
    		$("#money-raising-end").removeClass("select");
       		 $("#money-raising").addClass("select");
    	} else if (${param.flag == 'end'}){
    		$("#money-raising").removeClass("select");
        	$("#money-raising-end").addClass("select");
    	}    	
    });   
    
    
    /* 프로젝트 클릭시 페이지 이동 */
    $(".project-list-items").click(function(){
    	var projectNo = $(this).children().html();
    	$(location).attr('href', '${pageContext.request.contextPath}/project/projectRead?projectNo='+projectNo);
    }); 
    
    
    
    
</script>

<%@ include file="../common/footer.jsp" %>