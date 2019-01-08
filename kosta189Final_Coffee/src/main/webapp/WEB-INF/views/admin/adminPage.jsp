<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<style type="text/css">
	#piechart {width: 100%; height: 400px;}
	#curvechart {width: 80%; height: 400px}
</style>

<script type="text/javascript">
    $(function() {
    	$("#chartBtn").click(function() {
			$.ajax({
		        url: "chart",
		        type: "post",
		        dataType :"json",
		        data : "date=" + $("#date").val(),
		        async : false,
		        success: function(list) {
		            google.charts.load('current', {'packages':['corechart']});
		            google.charts.setOnLoadCallback(drawChart);
		            
		            function drawChart() {
		                var dataChart = [['category','total']];
		                if(list.length != 0) {
		                    $.each(list, function(i, item){
		                        dataChart.push([item.CATEGORY, item.TOTAL]);
		                    });
		                }else {
		                    //dataChart.push(['입력해주세요', 0]);
		                }
		                
		                var data = google.visualization.arrayToDataTable(dataChart);
		                var view = new google.visualization.DataView(data);
		                var options = {
		                	title: '<' + $("#date").val() + '의 카테고리별 기부 금액>', 
		                	chartArea:{left:250,top:50,width:"100%",height:"100%"},
	                        is3D: true,
	                        colors: ['#FF607F','#46291D','#F3B461','#ff7f50', '#996699'],
	                        titleTextStyle: {
	                      	    color: 'black',
	                      	    fontSize: 20,
	                      	    bold: true
	                    	},
		                	pieSliceText: 'value-and-percentage'
		                };
		                
		                var formatter = new google.visualization.NumberFormat({
		                	suffix: '원', fractionDigits : 0
		                	});
		                formatter.format(data, 1);
		                var chart = new google.visualization.PieChart(document.getElementById('piechart'));
		                chart.draw(view, options);
		        	}
		        }
			});
		});
    	
    	
		$("#date").datepicker();
        
        $.datepicker.setDefaults({
            dateFormat: 'yy-mm-dd',
            prevText: '이전',
            nextText: '다음',
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dayNames: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            showMonthAfterYear: true,
            yearSuffix: '년'
        });
        
        $(".leaveBtn").click(function() {
        	var id = $(this).parent().parent().find(".id").text().trim();
        	if(confirm(id+"님을 정말 탈퇴시키겠습니까?"))
		    {
		     	location.href="${pageContext.request.contextPath}/admin/delete?id="+id;
		     	alert("강제 탈퇴 완료");
		    }
        });
        
        
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
        	
        	var dataChart = [['날짜', '기부단체의 프로젝트 등록 건수', '기부자의 기부 횟수']]
	        
	        var list = '${curveList}';
	        var jsonList = JSON.parse(list);
	        console.log(jsonList);
	        
	        if(jsonList.length != 0) {
	            $.each(jsonList, function(i, item){
	                dataChart.push([item.today, item.newProject, item.newGive]);
	            });
	        }else {
	            //data.push(['입력해주세요', 0]);
	        }

	        var data = google.visualization.arrayToDataTable(dataChart);
	        
	        var options = {
	          	title: '<날짜별 프로젝트 등록 건수와 기부 횟수 비교>',
	          	chartArea:{left:200,top:50,bottom:50,width:"100%",height:"100%"},
                titleTextStyle: {
              	    color: 'black',
              	    fontSize: 20,
              	    bold: true
            	},
	          	colors:['#FF607F', '#F3B461'],
	          	legend: { position: 'bottom' }
	        };
	
         	var chart = new google.visualization.LineChart(document.getElementById('curvechart'));

	        chart.draw(data, options);
         
        }
        
        
	});
    
    
    
    
</script>
</head>
<body>
	<div class="admin-wrap">
    	<div class="admin-container">
        	<div class="admin-title">관리자페이지</div>
        	<div class="admin-sum">
            	<table>
                	<tr>
                    	<td>오늘의 기부 현황</td>
                    	<td style="color:#CE5970">
                    	<c:choose>
       						<c:when test="${today eq null}">
       						0원	
       						</c:when>
       						<c:otherwise>
       						<fmt:formatNumber type="number" value="${today}"/>원
       						</c:otherwise>
       					</c:choose>
                    	</td>
                    	<td>최근 일주일<br>기부 현황</td>
                    	<td style="color:#CE5970">
                    	<c:choose>
       						<c:when test="${week eq null}">
       						0원	
       						</c:when>
       						<c:otherwise>
       						<fmt:formatNumber type="number" value="${week}"/>원
       						</c:otherwise>
       					</c:choose>
                    	</td>
                	</tr>
            	</table>
        	</div>
        	<div class="admin-list">
            	<ul>
                	<li class="category">분석1</li>
                	<li class="date">분석2</li>
                	<li class="company">단체</li>
                	<li class="member">회원</li>
            	</ul>
        	</div>
        	<div class="admin-contents-0">
            	<div class="title"><span>분류를 선택하세요.</span></div>
        	</div>
        	<div class="admin-contents-1">
            	<div class="title"><p>카테고리별 기부 금액</p></div>
            	<div class="input">
    				<input type="text" name="date" placeholder="날짜 선택" id="date" readonly="readonly">
    				<input type="button" value="검색" id="chartBtn"/>
    			</div>
    			<div id="piechart"></div>
        	</div>
        	<div class="admin-contents-2">
            	<div id="curvechart"></div>
 			</div>
        	<div class="admin-contents-3">
            	<div class="title"><p>기부 단체별 프로젝트 리스트</p></div>
    <div id="companyTable">
    	
    	<table class="company-table" cellspacing="0" width="800">
            <tr>
                <td>ID</td>
                <td>단체명</td>
                <td>프로젝트 제목</td>
                <td>기부 누적액</td>
                <td>목표 달성여부</td>
                <td>탈퇴</td>
            </tr>
            
            <c:choose>
			    <c:when test="${empty companyList}">
				<tr>
			        <td colspan="5">
			            <p align="center"><b><span style="font-size:9pt;">등록된 기부단체가 없습니다.</span></b></p>
			        </td>
			    </tr>
    			</c:when>
	    		<c:otherwise>
					<c:forEach items="${companyList}" var="company" varStatus="status">
		            <tr>
			            <td class="id">
			                <c:if test="${companyList[status.index-1].companyId != company.companyId}">
			                	${company.companyId}
			                </c:if>
		                </td>
		                <td>
		                	<c:if test="${companyList[status.index-1].companyId != company.companyId}">
			                	${company.companyName}
			                </c:if>
		                </td>
		                <td>
		                	${company.projectSubject}
		                	<c:if test="${company.projectSubject eq null}">
		                		<span style="color:#CE5970">등록한 프로젝트가 없습니다.</span>
		                	</c:if>
		                </td>
		                <td>
		                	<fmt:formatNumber type="number" value="${company.totalMoney}"/>
		                </td>
		                <td>
		                	<c:choose>
			                	<c:when test="${company.percent eq 100}">
			                		달성
			                	</c:when>
			                	<c:when test="${company.projectSubject eq null}">
			                	</c:when>
			                	<c:otherwise>
			                		미달성
			                	</c:otherwise>
			                </c:choose>
		                </td>
		                <td>
		                	<c:choose>
		                		<c:when test="${company.dropFlag eq 1}">
		                			<c:if test="${companyList[status.index-1].companyId != company.companyId}">
		                				<input type="button" value="탈퇴" class="leaveBtn">
	                				</c:if>
		                		</c:when>
		                		<c:otherwise>
		                			이미 탈퇴한 기부단체 입니다.
		                		</c:otherwise>
		                	</c:choose>
		                </td>
		            </tr>
	              	</c:forEach>
				</c:otherwise>
		    </c:choose>
		    
        </table>
    </div>
        	</div>
        	<div class="admin-contents-4">
            	<div class="title"><p>회원별 기부 현황 리스트</p></div>
    <div id="memberTable">
        	
    	<table class="member-table" cellspacing="0" width="800">
            <tr>
                <td style="text-align: center">ID</td>
                <td style="text-align: center">이름</td>
                <td style="text-align: center">프로젝트 제목</td>
                <td style="text-align: center">기부 금액</td>
                <td style="text-align: center">탈퇴</td>
            </tr>
            
            <c:choose>
			    <c:when test="${empty memberList}">
				<tr>
			        <td colspan="5">
			            <p align="center"><b><span style="font-size:9pt;">등록된 개인회원이 없습니다.</span></b></p>
			        </td>
			    </tr>
    			</c:when>
	    		<c:otherwise>
					<c:forEach items="${memberList}" var="member" varStatus="status">
		            <tr>
			            <td class="id">
			                <c:if test="${memberList[status.index-1].memberId != member.memberId}">
			                	${member.memberId}
			                </c:if>
		                </td>
		                <td>
		                	<c:if test="${memberList[status.index-1].memberId != member.memberId}">
			                	${member.memberName}
			                </c:if>
		                </td>
		                <td>
		                	${member.projectSubject}
		                	<c:if test="${member.projectSubject eq null}">
		                		<span style="color:#CE5970">기부한 프로젝트가 없습니다.</span>
		                	</c:if>
		                </td>
		                <td>
		                	<fmt:formatNumber type="number" value="${member.giveMoney}"/>
		                </td>
		                <td>
		                	<c:choose>
		                		<c:when test="${member.dropFlag eq 1}">
		                			<c:if test="${memberList[status.index-1].memberId != member.memberId}">
			                			<input type="button" value="탈퇴" class="leaveBtn">
			                		</c:if>
		                		</c:when>
		                		<c:otherwise>
		                			이미 탈퇴한 개인회원 입니다.
		                		</c:otherwise>
		                	</c:choose>
		                </td>
		            </tr>
	              	</c:forEach>
				</c:otherwise>
		    </c:choose>
		    
        </table>
    </div>
        	</div>
    	</div>
	</div>
</body>

<script>
$(".admin-list ul li:first-child").on('click',function(){
    $(this).addClass('select');
    $(".admin-contents-1").fadeIn();
    $(".admin-contents-0").css('display', 'none');$("#curvechart>div").css('display', 'none');
    $(".admin-contents-2").css('display', 'none');$(".admin-contents-3").css('display', 'none');$(".admin-contents-4").css('display', 'none');
    $(".admin-contents-1").css('display','block');
    $(".admin-list ul li").not('.category').removeClass('select');
})
$(".admin-list ul li:nth-child(2)").on('click',function(){
    $(this).addClass('select');
    $(".admin-contents-2").fadeIn();
    $(".admin-contents-0").css('display', 'none');
    $(".admin-contents-1").css('display', 'none');$(".admin-contents-3").css('display', 'none');$(".admin-contents-4").css('display', 'none');
    $(".admin-contents-2 *").css('display','block');/* $("#curvechart>div").css('display','block');$("#curvechart>div").css('height','100%'); */
    /* $("#curvechart *").css('width','100%'); */
    $(".admin-list ul li").not('.date').removeClass('select');
})
    $(".admin-list ul li:nth-child(3)").on('click',function(){
    $(this).addClass('select');
    $(".admin-contents-3").fadeIn();
    $(".admin-contents-0").css('display', 'none');$("#curvechart>div").css('display', 'none');
    $(".admin-contents-1").css('display', 'none');$(".admin-contents-2").css('display', 'none');$(".admin-contents-4").css('display', 'none');
    $(".admin-contents-3").css('display','block');
    $(".admin-list ul li").not('.company').removeClass('select');
})
    $(".admin-list ul li:last-child").on('click',function(){
    $(this).addClass('select');
    $(".admin-contents-4").fadeIn();
    $(".admin-contents-0").css('display', 'none');$("#curvechart>div").css('display', 'none');
    $(".admin-contents-1").css('display', 'none');$(".admin-contents-2").css('display', 'none');$(".admin-contents-3").css('display', 'none');
    $(".admin-contents-4").css('display','block');
    $(".admin-list ul li").not('.member').removeClass('select');
})

</script>

<%@ include file="../common/footer.jsp" %>
