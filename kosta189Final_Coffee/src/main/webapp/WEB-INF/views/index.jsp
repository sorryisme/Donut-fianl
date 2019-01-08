<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<%@ include file="common/header.jsp" %>

        <div class="page-move">
        <!-- 컨텐츠 -->
        <div class="index-wrap clearfix"> 
            <div class="main">
                <form name="search" id="search">
                    <div class="search-container">
                        <i class="fas fa-search" style="padding-right:10px"></i>
                        <input type="text" class="search" name="keyWord" id="keyWord" size="50" placeholder=" 검색" autocomplete="off">
                        <div id="autoComplete" style="display:none">
                        
                        </div>
                    </div>
                </form>

	            <!-- 카운트 -->
	            <div class="count clearfix">현재 
	            	<input type="hidden" id="odoA" value="${countProject }">
	            	<input type="hidden" id="odoB" value="${countMemberOne }">
	            	<input type="hidden" id="odoC" value="${countMemberTwo }">
	                <span class="odometer a"></span>건의 프로젝트를 
	                <span class="odometer b"></span>명의 개인, 
	                <span class="odometer c"></span>개의 단체와 함께 하고 있습니다.
	            </div>
	                                                
	            <div class="title-wrap">
	               <div class="index-project-title">
	                <h3>   100% 목표 달성이 얼마 남지 않은 프로젝트</h3>
	                </div>
	            </div>
	            <div class="index-project-wrap">
	                <div class="index-project">
	                	<c:forEach var="project" items="${percentList}">
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
	            
	            
	            <div class="title-wrap">
	               <div class="index-project-title">
	                <h3>새로운 프로젝트</h3>
	                </div>
	            </div>
	            <div class="index-project-wrap">
	                <div class="index-project">
	                	<c:forEach var="project" items="${recentList}">
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
	            
	            
	            <div class="title-wrap">
	               <div class="index-project-title">
	                <h3>마감 날짜를 앞둔 프로젝트</h3>
	                </div>
	            </div>
	            <div class="index-project-wrap">
	                <div class="index-project">
	                	<c:forEach var="project" items="${deadlineList}">
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
	            
	            <div class="title-wrap">
	               <div class="index-project-title">
	                <h3>추천 프로젝트</h3>
	                </div>
	            </div>
	            <div class="index-project-wrap">
	                <div class="index-project">
	                	<c:forEach var="project" items="${recommendList}">
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
            
        	</div> <!-- main 끝 -->
        </div>
        </div>
        
<script type="text/javascript">
	/* 프로젝트 클릭시 페이지 이동 */
	$(".project-list-items").click(function(){
		var projectNo = $(this).children().html();
		$(location).attr('href', '${pageContext.request.contextPath}/project/projectRead?projectNo='+projectNo);
	});
	
	/* 프로젝트 검색 */
	$(function(){
		$("#keyWord").keyup(function(){
			
			if($(this).val()==""){
 				$("#autoComplete").hide();
 				return;
 			}
			
			$.ajax({
 				url : "autoComplete",
 				type : "post",
 				dataType : "json",
 				data : "keyWord="+$(this).val(),
 				success : function(result){
 					var str="";
 					
 					$.each(result, function(index, item){
 						str+="<a href='#' class = 'searchDirect'>"+item.projectSubject+"</a><div hidden='hidden'>"+item.projectNo+"</div><br>";
 					})
 					
 					$("#autoComplete").html(str);
 					$("#autoComplete").show();	
 				},	
 				error:function(err){
 					console.log(err+" --> 발생함 ");
 				}
 			});
			
			/* if($(this).val()==""){
 				$("#autoComplete").hide();
 				return;
 			} */
		});
		
		$(document).on("click", ".searchDirect", function(){
 			$("#keyWord").val($(this).text());
 			$("#autoComplete").hide();
 			
 			var projectNo = $(this).next().html();
			$(location).attr('href', '${pageContext.request.contextPath}/project/projectRead?projectNo='+projectNo);
 		});
		
		//odometer

		setTimeout(function(){
			   var odoA = document.querySelector('#odoA').value;
			   var odoB = document.querySelector('#odoB').value;
			   var odoC = document.querySelector('#odoC').value;
			    $(".odometer.a").html(odoA);
			   $(".odometer.b").html(odoB);
			    $(".odometer.c").html(odoC);
		}, 0);
		
		
	});
	

</script>


<%@ include file="common/footer.jsp" %>