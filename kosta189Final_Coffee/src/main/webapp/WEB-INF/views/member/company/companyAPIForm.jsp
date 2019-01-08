<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css"/>
    <style>
        .item-search-wrap{
            width:1000px;
            height:100%;
            margin: auto;
        }
        .item-search-wrap hr{
			background-color:#DC287C;
        }
        
        .item-search-text{
        	text-align:center;margin:20px auto;
        }
        
        .item-search-subject {
            margin-top:30px; 
            height:50px;
            width:100%;
        }
        
        .item-search-list{
            margin-top:30px; 
            height: 100%;
        }
        
        .item-search-searchBox{
        	text-align:center;
            padding-top:20px;
            width:400px;
            height: 100px;
            background-color : #CE5970;
            margin:0 auto;
        }
        .item-search-searchBox input[type=text]{
        	width:200px;height:30px;border-radius:5px;outline-width:0;
        }
        
        .item-search-searchBox span{
        	color:white;
        }
        
        .btn-box{
        	text-align:center;margin-bottom:20px;
        }
        
        
        .item-List-ConfirmDiv {
        	width: 300px;
        	margin:auto;
        }
        .item-List-ConfirmDiv input{
        	margin-left:20px;
        	margin-bottom: 5px;
        }
        
    </style>
    <!-- script -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
    
</head>
<body>
   
<div class="item-search-wrap">
    <div class="item-search-subject">
         <p class="notice-title"><span style="font-size:30px;">단체명 검색</span></p>
    </div>
    <div class="item-search-main">
        <div class="item-search-text">
            <span>기부단체의 이름을 입력해주세요</span>    
        </div>
        <div class="item-search-searchBox">
	        <input type="text" id="keyword" placeholder="단체명을 검색해주세요">
            <input type="button" value="검색">
        </div>
        <div class="item-search-list">
				<table class="notice-table" id="notice-table">
				</table>            
        </div>
        <div class="item-List-Cofirm" id="itemListCofirm">
        </div>
        <div class="btn-box">
        <input type="button" class="btn_2" id="itemConfirm" value="확인" style="width:50px;">
        <input type="button" class="btn_2" id="itemCancel" value="취소" style="width:50px;">
        </div>
    </div>
</div>

<script>

$(function(){
	//단체api
	$("input[value=검색]").on("click",function(){
		//alert($("#keyword").val());
		 $.ajax({
	            url : "${pageContext.request.contextPath}/companyAPI", 
	            type : "post",
	            dataType: "JSON",
	            data : {
					keyword :$("#keyword").val()           	
	            },
	            success : function(result){
	            	console.log(result.response.body.items.item);
	            	var	str = '<tr><td style="width:450px;">단체명</td><td style="text-align:center;">주소</td><td>전화번호</td><td style="width:70px">담당자명</td><td>선택여부</td></tr>';
	            		if(result.response.body.totalCount == 1){
	            		str += '<tr><td>'+result.response.body.items.item.nanmmbyNm+'</td><td style="width:200px;">'+result.response.body.items.item.adres+'</td><td style="width:150px;">'+result.response.body.items.item.dmstcTelno+'</td><td style="width:50px;">'+result.response.body.items.item.rprsntvNm+'</td><td><input type="button" value="선택"></td></tr>'
            		} else {
		            	$.each(result.response.body.items.item, function(index,data){
	            			str += '<tr><td>'+data.nanmmbyNm+'</td><td style="width:200px;">'+data.adres+'</td><td style="width:150px;">'+data.dmstcTelno+'</td><td style="width:50px;">'+data.rprsntvNm+'</td><td><input type="button" value="선택"></td></tr>' 
	            		});//for문
            		}
	            		$("#notice-table").html(str);
	            },
	            error : function(error){//실패했을 때
	               alert(error +"에러발생");               
	            }
	         });
	});

	//취소버튼누를시 창 없애기
	$("#itemCancel").on("click",function(){
		window.close();
	});
	
	//확인버튼누를시 본인 단체를 선택하라고함
	$("#itemConfirm").on("click",function(){
		alert("검색창에 단체를 검색해주세요");
		$('#keyword').focus();
	});

	
	$(document).on("click","input[value=선택]",function(){
		$(opener.document).find("#companycompanyName").val($(this).parent().parent().find("td").eq(0).html());
		$(opener.document).find("#companycompanyAddr").val($(this).parent().parent().find("td").eq(1).html());
		$(opener.document).find("#companycompanyCall").val($(this).parent().parent().find("td").eq(2).html());
		$(opener.document).find("#name").val($(this).parent().parent().find("td").eq(3).html());
		self.close();
		
	})

	
});

</script>
    
</body>
</html>
