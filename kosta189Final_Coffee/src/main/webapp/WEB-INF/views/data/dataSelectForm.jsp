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
            width:400px;
            height:100%;
            margin: auto;
        }
        .item-search-wrap hr{
            border: 1px solid #DC287C;
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
            width:100%;
            height: 100px;
            background-color : #CE5970;
        }
        
        .item-search-searchBox span{
        	color:white;
        }
        
        .btn-box{
        	text-align:center;
        }
        
	/* 	.item-List-Confirm {
			width:300px;
        	margin:auto;
        }
        .item-List-Confirm input{
        	margin-left:20px;
        	margin-bottom: 5px;
        } */
        
        .item-List-Wrap {
			width: 300px;
        	margin:auto;
        }
        
        .item-List-Wrap input{
        	margin-left:20px;
        	margin-bottom: 5px;
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
         <p class="notice-title"><span style="font-size:30px;">물품검색</span></p>
    </div>
    <div class="item-search-main">
        <div class="item-search-text">
            <span>프로젝트에 등록할 물품들을 선택한 후,</span><br>    
            <span>각각 기부받을 수량을 입력해주세요.</span>    
        </div>
        <div class="item-search-searchBox">
            <span>카테고리</span>
	            <select name="dataCategory">
	            	<option value="0">카테고리를 선택해주세요</option>
		            <c:forEach var="data" items="${list}">
		            	<option value="${data}">${data}</option>
		            </c:forEach>
	            </select>
            <input type="button" value="검색">
        </div>
        <div class="item-search-list">
				<table class="notice-table">
				</table>            
        </div>
        <div class="item-List-Confirm" id="itemListCofirm">
        </div>
        <div class="btn-box">
        <input type="button" class="btn_2" id="itemConfirm" value="확정" style="width:50px;">
        <input type="button" class="btn_2" id="itemCancel" value="취소" style="width:50px;">
        </div>
    </div>
</div>

<script>
$(function(){
	
	// 물품데이터 카테고리 검색
	$("input[value=검색]").on("click",function(){
		var dataCategory = $("select[name=dataCategory]").val();
		
		if(dataCategory == "0") {
			alert("카테고리를 선택 후 검색해주세요");
			return;
		}

	    $.ajax({
            url : "dataSelectAll?dataCategory="+dataCategory, 
            type : "get", 
            success : function(result){
            	var str = "";
            	str += '<tr style="background-color: #DC287C"><td>물품번호</td><td style="text-align: center">풀뭄명</td><td>카테고리</td><td>가격</td><td>선택</td></tr>'
            	$.each(result, function(index,data){
            		str += "<tr>";
            		str += "<td class='dataItemNo'>"+data.dataItemNo+"</td><td class='dataItemName'>"+data.dataItemName+"</td><td class='dataItemCategory'>"+data.dataItemCategory+"</td><td class='dataItemPrice'>"+data.dataItemPrice+"</td><td><input type='button' value='선택'/></td>";
            		str += "</tr>"
            	});//for문
        		$("table").html(str);	
            	
            },
            error : function(error){//실패했을 때
               alert(error +"에러발생");               
            }
         });
	}); //검색버튼
	

	
}) //document.ready

//list에 넣기 위한 인덱스
	var indexNo = 0;
	
	$(document).on("click","input[value=선택]",function(){
		if($("#itemListCofirm > div").length == 0){
			 var str='';
			str += "<div class='item-List-Wrap'><input type='text'  size='10' value='물품명' readonly='readonly'>";
			str += "<input type='text'  size='10' value='수량' readonly='readonly'>";
			str += "<input type='text'  size='10' value='개당가격' readonly='readonly'></div>";
			$("#itemListCofirm").append(str);
		}

		var str = "";
		str += "<div class='item-List-ConfirmDiv'><input type='text' size='10' id='itemName"+indexNo+"' value='"+$(this).parent().parent().children(".dataItemName").html()+"' readonly='readonly'>";
		str += "<input type='text' size='10' name='goalAmount' id='goalAmount"+indexNo+"' value='1'>";
		str += "<input type='text' size='10' id='itemPrice"+indexNo+"' value='"+$(this).parent().parent().children(".dataItemPrice").html()+"' readonly='readonly'></div>";
	//	$(opener.document).find("#itemList").append(str);
		$("#itemListCofirm").append(str);
		indexNo++;
	});
	
	$(document).on("keyup","input[name=goalAmount]",function(){
        $(this).attr('value',$(this).val());
    });
	
	//물품 수량 입력 후 목표금액 설정
	$(document).on("click","#itemConfirm", function(){
		var length = $("#itemListCofirm > div").length-1;
		var price = 0;
		for(var i =0; i<length; i++){
			if($("#goalAmount"+i+"").val()==0){
				alert("수량은 0개 이상이어야 합니다.")
				return false;
			}
			price += $("#itemPrice"+i+"").val() * $("#goalAmount"+i+"").val()
		}
		
		if(price == 0)
			return false;
		
		var list= $("#itemListCofirm").html();
		
		$(opener.document).find("#goods_goal_input>input").val(price);
		$(opener.document).find("#itemList").html(list);
		self.close();
	});    
	
	$(document).on("click", "#itemCancel", function(){
		$("#itemListCofirm").html('');
	});

</script>
    
</body>
</html>
