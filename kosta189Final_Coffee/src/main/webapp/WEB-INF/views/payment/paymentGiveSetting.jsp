<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../common/header.jsp" %>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
  function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
  </script>    


<div class="payment-wrap" data-aos="fade-in">
    <div class="payment-container">
        <div class="payment-title">결제</div>
        <div class="payment-1">
            <table>
                <tr>
                    <th>기부정보</th>
                    <th>단체명</th>
                    <th>결제금액</th>
                </tr>
                <tr>
                    <th>
                        <ul>
                            <li style="list-style: none;">
                            	<div class="thumb">
                            		<img src="${pageContext.request.contextPath}/resources/finalPhoto/project/${param.projectImg}"
                            		onerror="this.src='${pageContext.request.contextPath}/resources/images/thumbs/test2.jpg'">
                           		</div>
                         	</li>
                            <li>
                                <div class="thumb_description">${param.projectSubject}</div>
                                <c:if test="${param.moneyOrItem == 2}">
                                	<c:forEach var="giveItem" items="${giveDTO.giveItem}" varStatus="status">
                                		<ul style="color:#afafaf">
                                			<li>${giveItem.giveItemName} : ${giveItem.giveItemAmount}개</li>
										</ul>
									</c:forEach>
                                </c:if>
                            </li> 
                        </ul>
                    </th>
                    <th><span>${param.companyName}</span></th>
                    <th><fmt:formatNumber type="number" value="${giveDTO.giveMoney}"/>원</th>
                </tr>
            </table>
        </div>
        
        	<form method="get" action='${pageContext.request.contextPath }/payment/paymentGive'>
       		 <div class="payment-2">
            <p class="shipping-title">배송정보</p>
            <table>
                <tr>
                    <td>받는사람<span>*</span></td>
                    <td><input type='text' name='receiver' /> </td>
                </tr>
                <tr>
                    <td>연락처<span>*</span></td>
                    <td><input type='text' name='call' style="width: 100px"/>
                    	<!-- 수정해야함 <span> - </span><input type="text" maxlength="4"><span> - </span><input type="text" maxlength="4">-->
                     </td>
                </tr>
                <tr>
                    <td>주소<span>*</span></td>
                    <td>
                    <input type="text" id="postcode" name="postcode" placeholder="우편번호" readonly="readonly" style="width: 100px">
					<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소" size="40" readonly="readonly">
					<input type="text" id="jibunAddress" placeholder="지번주소" size="40" readonly="readonly">
					<span id="guide" style="color:#999;display:none"></span>
					<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" size="40">
					<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목" size="40" readonly="readonly" style="width: 200px"> <p>
                    
                    <!-- 도훈이형꺼 
                        <input type="text" placeholder="우편번호" readonly><input type="button" value="검색"><br>
                        <input type="text" readonly placeholder="도로명주소"><input type="text" placeholder="상세주소"><br>
                        <input type="text" readonly placeholder="지번주소">
                        -->
                        
                    </td>
                </tr>
                <tr>
                    <td>배송메모</td>
                    <td>
                    <input type='text' id="shippingMemo" name='memo' size="50"/> 
                        <!-- <input type="text" id="shippingMemo" maxlength="50"> -->
                        <span style="font-size:13px;">0/50</span>
                    </td>
                </tr>
            </table>
        </div>
        <!-- 히든 시작 -->
        <!-- 금액 설정한 것(GiveDTO) -->
			<input type="hidden" name='projectNo' value = '${giveDTO.projectNo}'/>
			<input type="hidden" name='id' value = '${giveDTO.id}'/>
			<input type='hidden' name='giveMoney' value = '${giveDTO.giveMoney}'/>
			
			<!-- 물품 설정한 것 -->
			<c:if test="${param.moneyOrItem == 2}">
				<c:forEach var="giveItem" items="${giveDTO.giveItem}" varStatus="status">
					<input type="hidden" name="giveItem[${status.index}].giveItemName" value = '${giveItem.giveItemName}'/><!-- setGiveItem().setGiveItemName() -->
					<input type="hidden" name="giveItem[${status.index}].giveItemPrice" value = '${giveItem.giveItemPrice}'/>
					<input type="hidden" name="giveItem[${status.index}].giveItemAmount" value = '${giveItem.giveItemAmount}'/> <br/><!-- getGiveItem()로 giveItem 호출 후에 setGiveItemAmount(String giveItemAmount)을 호출함 -->
				</c:forEach>
			</c:if>
			
			<!-- 프로젝트 정보 -->
			<input type='hidden' name='projectSubject' value = '${param.projectSubject}'/>
			<input type="hidden" name='moneyOrItem' value = '${param.moneyOrItem}'/>
			<!-- 히든 끝-->
        <div class="payment-3">
            <input type="submit" value="결제하기">
        </div>
        </form>
    </div>
</div>




<script>
$("#shippingMemo").on('keyup',function(){
    var length = $(this).val().length;
    $(this).next().html(' '+length+'/50');
})

</script>


<%@ include file="../common/footer.jsp" %>