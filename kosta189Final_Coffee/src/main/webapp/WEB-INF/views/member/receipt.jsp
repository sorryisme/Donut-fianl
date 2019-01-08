<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<style>
    #Layout {
        width:800px; 
        border:0.5px solid black;
    }
        
    table {
        border:0.5px solid black;
    }
        
    .tblTop {
        border-collapse:collapse; border:1px solid black; border-bottom:0px;
    }
    
    .tblTop td {
        padding:5px 0 10px 30px; font:bold 24px gulim; color:black;
        text-align:center;
    }
    
    .tblTop2 td{
        text-align : center;
        border-right: 0.5px solid black;
    }
    
    .tblTop3 td{
        text-align: center;
        border-right: 0.5px solid black;
    }
    .tbl3-tr td{
        border-bottom: 0.5px solid black;
    }
    
    .tbl4-tr td{
        text-align: center;
        border-right: 0.5px solid black;
    }
    
    .tbl5-tr td{
        text-align: right;
        padding-right: 10px;
    }
    .stamp img{
        width:100px;
        height:100px;
        margin-top: 5px;
    }
    .tdText{
        text-align: center;
    }
    
    .date{
        text-align: right;
        margin-right: 7px;
    }
    </style>
</head>
<body>
    <div id="Layout">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblTop">
            <tr>
              <td>기부내용</td>
            </tr>
        </table>
        
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblTop2">
            <tr>
                <td width="20%" class="noTd">유형</td>
                <td width="30%" class="name">금액</td>
                <td width="20%">유형</td>
                <td width="30%">물품</td>
            </tr>
        </table>
        
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblTop3">
            <tr class="tbl3-tr">
                <td width="10%">년</td>
                <td width="10%">월</td>
                <td width="15%">기부단체</td>
                <td width="15%">금액</td>
                <td width="10%">년</td>
                <td width="10%">월</td>
                <td width="15%">기부단체</td>
                <td width="15%">금액</td>
            </tr>
            <!-- 반복문 영역-->
            <c:forEach items="${receiptList}" var="item">
	            <tr>
	            	<c:set var="giveDate" value="${item.giveRegdate}"/>
	            	<c:choose>
	            		<c:when test="${item.project.moneyOrItem == '1'}">
	            		   <c:set var="sumMoney" value="${sumMoney+item.giveMoney}"/>
	            		
	            		  <td width="10%">${fn:substring(giveDate,2,4)}년</td>
	                		<td width="10%">${fn:substring(giveDate,5,7)}월</td>
	                		<td width="15%">${item.project.id}</td>
	                		<td width="15%">${item.giveMoney}</td>
	                		<td width="10%"></td>
	                		<td width="10%"></td>
	                		<td width="15%"></td>
	                		<td width="15%"></td>
	            		</c:when>
	            		<c:otherwise>
	            		<c:set var="sumItem" value="${sumItem+item.giveMoney}"/>
	            			<td width="10%"></td>
			                <td width="10%"></td>
			                <td width="15%"></td>
			                <td width="15%"></td>
			                <td width="10%">${fn:substring(giveDate,2,4)}년</td>
			                <td width="10%">${fn:substring(giveDate,5,7)}월</td>
			                <td width="15%">${item.project.id}</td>
			                <td width="15%">${item.giveMoney}</td>
	            		</c:otherwise>
	            	</c:choose>
	            </tr>
            </c:forEach>
        </table>
        
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblTop4">
            <tr class="tbl4-tr">
                <td width="20%" class="noTd">합계</td>
                <td width="30%" class="name">${sumMoney}</td>
                <td width="20%">합계</td>
                <td width="30%">${sumItem}</td>
            </tr>
        </table>
        
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblTop5">
            <tr class="tbl5-tr">
                <td width="50%" class="noTd"></td>
                <td width="15%">신청일자</td>
                <td width="35%">2017년 12월 31일</td>
            </tr>
            <tr class="tbl5-tr">
                <td width="50%" class="noTd"></td>
                <td width="10%">신청인</td>
                <td width="40%">김 지 성 (인)</td>
            </tr>       
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="tblTop5">
            <tr>
                <td width="50%" rowspan="2" class="tdText">위와 같이 기부금을 받았음을 증명합니다</td>
                <td width="5%"></td>
                <td width="20%" class="date">
                    2017년 12월 31일
                </td>
                <td class="stamp" width="25%" rowspan="2">
                    <img src="${pageContext.request.contextPath}/resources/images/stamp.jpg" style="width:100px;height:100px;">
                </td>
            </tr>

            <tr>   
                <td width="5%"></td>
                <td width="45%" class="date">
                    영수증 대리발급 DONUT(인)
                </td>
            </tr>
        </table>
   
    </div>

</body>
</html>
