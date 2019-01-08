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
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script>
    function andiamo()
    {
		window.opener.document.getElementById('pwd').value=document.getElementById("picchio").value;
		window.opener.processRequest();
        window.close();
    }
	</script>
    
</head>
<body>
		<div class="mypage-1-content">
			<div class="inform-container">
				<div class="inform-items">
							<div class="inform-label">
								<span> 비밀번호 확인</span>
							</div>
							<div class="inform-input">
      							<input type="password" name="picchio" id="picchio">
								</div>
						</div>
						<input type="button" value="확인"  class="btn_2" onclick="andiamo();" style="width: 100px;margin:auto;">
					</div>
				</div>
</body>
</html>
