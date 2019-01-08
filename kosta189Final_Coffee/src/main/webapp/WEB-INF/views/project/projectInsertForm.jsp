<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../common/header.jsp" %>

	<div class="project-register-wrap" data-aos="fade-in">
    	<div class="project-register-container">
        <p>프로젝트 등록</p>
        <div class="register-items">
                    <div class="register-title">
                        <div class="field"><span>프로젝트 제목</span><span style="color:red;">*</span></div>
                        <div class="input"><input type="text" name="projectSubject" id="projectSubject" placeholder="제목"></div>
                    </div>
                    <div class="register-category-kind">
                        <div class="field"><span>항목</span><span style="color:red;">*</span></div>
                        <div>
                            <input id="cash_picker" type="radio" value="cash" name="kind" checked>금액
                            <input id="goods_picker" type="radio" value="goods" name="kind">물품
                        </div>
                    </div>
                    
                     <div class="register-category-item" id="categoryItem" style="display:none;">
                        <div class="field"><span>물품검색</span><span style="color:red;">*</span></div>
                        <div><input type="button" class="btn_2" id="itemSearch"value="검색" style="width:80px;"></div>
                        <div class="field"><span>물품목록</span><span style="color:red;">*</span></div>
                        <div id="itemList"></div>
                        
                    </div>
                    
                    <div class="register-goal">
                        <div class="field"><span>목표금액</span><span style="color:red;">*</span></div>
                        <div id="cash_goal_input" class="input">
                            <input type="text" name="goal" id="goal" placeholder="목표금액을 , 없이 숫자만 입력해주세요."></span>
                        </div>
                        <div id="goods_goal_input" class="input hidden">
                            <input type="text" id="itemGoal" name="itemGoal" placeholder="목록에서 수량 입력 후 확정 버튼을 눌러주세요" readonly="readonly"></span>
						</div> 
                    </div>
                    <div class="register-category-detail">
                        <div class="field"><span>상세카테고리</span><span style="color:red;">*</span></div>
                        <div style="width:100%;height:170px;">
                            <ol>
                                <li><p>아동</p>
                                    <ul>
                                        <li>교육</li><li>소녀/소년가장</li><li>장애인</li><li>질병/희귀</li>
                                   </ul>
                                </li>
                                <li><p>성인</p>
                                    <ul>
                                        <li>미혼모</li><li>저소득층</li><li>장애인</li><li>질병/희귀</li>
                                    </ul>
                                </li>
                                <li><p>노인</p>
                                    <ul>
                                        <li>독거노인</li><li>기초생활수급자</li><li>장애인</li>
                                    </ul>
                                </li>
                                <li><p>동물</p>
                                    <ul>
                                        <li>생계 및 기초생활 지원</li><li>의료</li><li>주거/환경 개선</li><li>인식/정책 개선</li>
                                    </ul>
                                </li>
                                <li><p>지역사회</p>
                                    <ul>
                                        <li>환경</li><li>보훈 대상자</li><li>재해민</li><li>다문화</li>
                                    </ul>
                                </li>
                            </ol>
                        </div>
                        <div class="input">
                            	카테고리<input type="text" placeholder="카테고리를 선택하세요." name="category" id="category" readonly>
                        </div>
                    </div>
                    <div class="register-story">
                    	<div class="field"><span>스토리</span><span style="color:red;">*</span></div>
                    	<div class="code-html w-100">
                	   <div id="story_insertSection"></div>
 					<script class="code-js">
                    
                        $(function(){
                        	
                            var content = '';
                            var editor = new tui.Editor({
                                el : document.querySelector('#story_insertSection'),
                                previewStyle : 'vertical',
                                height : '550px',
                                initialEditType : 'wysiwyg',
                                initialValue : content,
                                language : 'ko',
                                viewOnly : false,
                                toolbarItems : [ 'bold', 'image' ]
                          });
                        	
			                    $("#save").on("click",function() {
		                        	if($("#cash_picker").is(":checked")){
		                        		if(moneyValidation()){
		                        			
		                        			if($('#goal').val()==''){
		                        				alert("'목표금액'을 입력해주세요");
		                        				$('#goal').focus();
		                        				return false;
		                        			}
		                        			
				                       		var id = "${sessionScope.userDTO.id}";
				                            var formData = new FormData();
				                            formData.append("id",id);
				                            formData.append("projectSubject",$("#projectSubject").val());
				                            formData.append("category",$("#category").val());
				                            formData.append("story",editor.getValue());
				                            formData.append("projectEnd",$("#projectend_date").val());
				                            formData.append("goal",$("#goal").val());
				                            formData.append("file",$("#file")[0].files[0]);
				                            
				                            var rewardLength = $("#rewardInput input").length/2;
				                            for(var i = 0; i< rewardLength; i++ ){
				                            	formData.append("reward["+i+"].rewardItem",$("input[name=rewardItem]").eq(i).val());
				                            	formData.append("reward["+i+"].condition",$("input[name=condition]").eq(i).val());
				                            }
				                            
				                            $.ajax({
				                               url:"${pageContext.request.contextPath}/project/moneyInsert",
				                               type:"POST",
				                               dataType:"JSON",
				                               contentType: false,
				                               processData: false,
				                               data: formData,
				                               success:function(result){
				                                  if(result.status=='success'){
				                                	  alert('프로젝트가 등록되었습니다.');
				                                	  $(location).attr("href", "${pageContext.request.contextPath}/project/projectList");
				                                  } else if(result.status =='fail'){
				                                	  alert("등록에 실패했습니다");
				                                  } else {
				                                	  alert("기타오류");
				                                  }
				                                  
				                	               },error:function(request,status,error){
				                            	    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
														}
				                            }); // moneyInsert 끝
		                        		} //유효성 if문
		                        	};// if문 종료
		                        		
		                        		if($("#goods_picker").is(":checked")){
		                        			if(moneyValidation()){
		                        				if($('#itemGoal').val()==''){
			                        				alert("물품을 검색한 후 물품을 등록해주세요");
			                        				$('#itemGoal').focus();
			                        				return false;
			                        			}
		                        	    		var id = "${sessionScope.userDTO.id}";
					                            var formData = new FormData();
					                            formData.append("id",id);
					                            formData.append("projectSubject",$("#projectSubject").val());
					                            formData.append("category",$("#category").val());
					                            formData.append("story",editor.getValue());
					                            formData.append("projectEnd",$("#projectend_date").val());
					                            formData.append("goal",$("#itemGoal").val());
					                            formData.append("file",$("#file")[0].files[0]);
					                            
					                            var length = $("#itemList div").length-1;
					                            
					                            for(var i = 0; i< length; i++ ){
					                            	formData.append("item["+i+"].itemName",$("#itemName"+i+"").val());
					                            	formData.append("item["+i+"].goalAmount",$("#goalAmount"+i+"").val());
					                            	formData.append("item["+i+"].itemPrice",$("#itemPrice"+i+"").val());
					                            }
					                            var rewardLength = $("#rewardInput input").length/2;
					                            
					                            for(var i = 0; i< rewardLength; i++ ){
					                            	formData.append("reward["+i+"].rewardItem",$("input[name=rewardItem]").eq(i).val());
					                            	formData.append("reward["+i+"].condition",$("input[name=condition]").eq(i).val());
					                            }
					                            
					                            $.ajax({
						                               url:"${pageContext.request.contextPath}/project/itemInsert",
						                               type:"POST",
						                               dataType:"JSON",
						                               contentType: false,
						                               processData: false,
						                               data: formData,
						                               success:function(result){
						                                  if(result.status=='success'){
						                                	  alert('프로젝트가 등록되었습니다.');
						                                	  $(location).attr("href", "${pageContext.request.contextPath}/project/projectList");
						                                  } else if(result.status =='fail'){
						                                	  alert("등록에 실패했습니다");
						                                  } else {
						                                	  alert("기타오류");
						                                  }
						                                  
						                               },error:function(request,status,error){
						                            	    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
														}
					                            });//item insert 끝
				                            }//유효성 if문
	                        	 		}//if문 끝
		                        		
			                         });    //submit 후
                        	 		
                        	 		
                        	 	
                        	 		
		                        }) // document.ready
                       
						</script>
                	   </div>
                	   
                    </div>
                    <div class="register-images">
                        <div class="field"><span>커버 이미지</span><span style="color:red;">*</span></div>
                        <div class="input"><input type="file" id="file"></div>
                    </div>
                    <div class="register-projectend">
                        <div class="field"><span>프로젝트 마감일</span><span style="color:red;">*</span></div>
                        <div class="input"><input type="text" name="projectEnd" placeholder="클릭" id="projectend_date" ></div>
                    </div>
					  <div class="register-reword">
                        <div class="field"><span>리워드</span><span style="color:red;">*</span></div>
                        <div class="input" id="rewardInput" style="height:100%;"></div>
                       	<input type="button" class="btn_2" id="rewardBtn" value="추가" style="width:80px;">
                       	<input type="button" class="btn_2" id="rewardDeleteBtn" value="삭제" style="width:80px;">
                    </div>
                    <!-- 등록 버튼 -->
                    <div class="signup-save" style="margin-top:20px;display:flex;justify-content: center;">
                        <input type="button" class="btn_2" id="save" value="등록" style="width:100px;">
                    </div>
            </div>
        
    </div>
</div>


<script>

$(function(){
    $("#projectend_date").datepicker();
    
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
});

    
    
    $(function(){
    	
    	//항목-물품 라디오 박스 동적처리
        $("input:radio[name=kind]").on("click",function(){
        	if($(this).val()=='goods'){
        		$("#categoryItem").show();
        	} else {
        		$("#categoryItem").hide();
        	}
        });
    	
    	//물품 검색 버튼 클릭시 팝업창 생성
        $("#itemSearch").on("click",function(){
        	window.open("${pageContext.request.contextPath}/data/dataSelectForm", "MsgWindow", "width=800,height=800");
        });
        
    	
    	//카테고리 삽입
    	$(".register-category-detail li li").on("click",function(){
    		var str ="";
    		str += $(this).parent().parent().find("p").html()+">";
    		str += $(this).html();
    		$("#category").val(str);
    	})
    	
    	
        $("#cash_picker").click(function(){
            $("#goods_goal_input").addClass("hidden");
            $("#cash_goal_input").removeClass("hidden");
            $("#goods_goal_input>input").val('');
            $("#goods_goal_input>input").attr("name","");
            $("#cash_goal_input>input").attr("name","goal");
            $("#goodsOutput").text('');
        });
        $("#goods_picker").click(function(){
            $("#cash_goal_input").addClass("hidden");
            $("#goods_goal_input").removeClass("hidden");
            $("#cash_goal_input>input").val('');
            $("#cash_goal_input>input").attr("name","");
            $("#goods_goal_input>input").attr("name","goal");
            $("#cashOutput").text('');
        })
    });
    
    $(function(){
        var cashInput = $("#cash_goal_input>input");
        var cashOutput = $("#cashOutput");
        var goodsInput = $("#goods_goal_input>input");
        var goodsOutput = $("#goodsOutput");
        
        $("#cash_goal_input>input").blur(function(){
            var value = cashInput.val();
            var result = won(value);
            
            cashOutput.html(result + "원");
        });
        
        $("#goods_goal_input>input").blur(function(){
            var value = goodsInput.val();
            var result = won(value);
            goodsOutput.html(result + "개");
        });
        
        function won(value){
            if(value.length<= 3){
                return value;
            }
            var count = Math.floor((value.length - 1) / 3);
            var result = "";
            
            for(var i=0;i<count;i++){
                var length = value.length;
                var strCut = value.substr(length -3, length);
                value = value.slice(0, length - 3);
                result = "," + strCut + result;
            }
            result = value + result;
            return result;
        }
        
    $("#rewardBtn").on("click",function(){
		var str ='';
    	str += '<input type="text" class="reward" name="rewardItem" placeholder="리워드 제품명" style="width:200px;margin:0 0 10px 10px;">';
    	str += '<input type="text" class="reward" name="condition" placeholder="조건금액" style="width:200px;margin:10px 0 0 10px;">';
    	$("#rewardInput").append(str);
    	
        

    });
	
    $("#rewardDeleteBtn").on("click",function(){
    	$("#rewardInput input:last-child").remove();
    	$("#rewardInput input:last-child").remove();        

    });
    
});  

    function moneyValidation(){
    	
		if($('#projectSubject').val()==''){
			alert("'프로젝트 제목'을 입력해주세요");
			$('#projectSubject').focus();
			return false;
		}
		
		if($('#category').val()==''){
			alert("'카테고리'를 선택해주세요");
			return false;
		}
		
		if($('.tui-editor-contents').children().html() == '<br>'){
			alert("'스토리'를 입력해주세요");
			return false;
		}
		
		if($("#file")[0].files[0]==null){
			alert("'커버 이미지'를 선택해주세요");
			$('#projectend_date').focus();
			return false;
		}
		
		if($('#projectend_date').val()==''){
			alert("'프로젝트 마감일'을 설정해주세요");
			$('#projectend_date').focus();
			return false;
		}
		
		if($('#rewardInput input').length==0){
			alert("한 가지 이상의 '리워드'를 등록해주세요");
			return false;
		}
		
		if($('#rewardInput input').length!=0){
			var flag = 1;
			
    		$('.input input[name=rewardItem]').each(function (index, item) {
    			if($(item).val()==''){
    				alert("리워드로 등록할 '제품명'을 모두 입력해주세요");
    				flag = 0;
    				return false;
    			}
    			
    		});
    		
    		$('.input input[name=condition]').each(function (index, item) {
    			if($(item).val()==''){
    				alert("리워드의 '조건금액'을 모두 입력해주세요");
    				flag = 0;
    				return false;
    			}
    		});
    		
    		if(flag==0)
    			return false;
    		
    	}
		
		return true;
	}

    
    
</script>

<%@ include file="../common/footer.jsp" %>