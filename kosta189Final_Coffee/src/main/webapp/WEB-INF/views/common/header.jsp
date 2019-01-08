<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
   <head>
	<!-- meta -->
	<meta charset="UTF-8">
    <meta http-equiv="Content-Script-Type" content="text/javascript">
    <meta http-equiv="Content-Style-Type" content="text/css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=1100">
	<title>Donut</title>
	<!-- script -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
    <!-- favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" type="image/x-icon">
    <!-- css -->
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome-animation.min.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/animate.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/odometer-theme-default.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/progress.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/SpoqaHanSans-kr.css"/>
    <!-- aos -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/aos-styles.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/aos.css" />
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
    <script src="${pageContext.request.contextPath}/resources/bower_components/jquery/dist/jquery.js"></script>
    <script src='${pageContext.request.contextPath}/resources/bower_components/markdown-it/dist/markdown-it.js'></script>
	<script src="${pageContext.request.contextPath}/resources/bower_components/to-mark/dist/to-mark.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bower_components/tui-code-snippet/dist/tui-code-snippet.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bower_components/codemirror/lib/codemirror.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bower_components/highlightjs/highlight.pack.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bower_components/squire-rte/build/squire-raw.js"></script>
	<script src="${pageContext.request.contextPath}/resources/bower_components/tui-editor/dist/tui-editor-Editor.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/codemirror/lib/codemirror.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/highlightjs/styles/github.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/tui-editor/dist/tui-editor.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bower_components/tui-editor/dist/tui-editor-contents.css">
           
</head>
           
</head>
<body>
   <!-- 상단 공통 -->
        <div class="menu-wrap none">
            <div class="menu">
                   <ul>
                    <li><a class="notice_menu" href="${pageContext.request.contextPath}/notice/noticeList"><b>공지사항</b><span class="arr"></span></a></li>
                    <li><a class="project_menu" href="${pageContext.request.contextPath}/project/projectList"><b>프로젝트</b><span class="arr"></span></a></li>
                     <li><a class="match_menu" href="${pageContext.request.contextPath}/match/matchStart"><b>맞춤기부</b><span class="arr"></span></a></li>
                    <c:if test="${userDTO.statusFlag==2}">
                       <li><a class="project_register_menu" href="${pageContext.request.contextPath}/project/projectInsertForm"><b>프로젝트등록</b><span class="arr"></span></a></li>
                    </c:if>
                    <li><a href="${pageContext.request.contextPath}/honor/honorList"><b>명예의전당</b><span class="arr"></span></a></li>
                </ul>
            </div>
        </div>
        
        <div class="nav-wrap">
            <div class="nav"> 
                <ul>
                   <c:choose>
                       <c:when test="${not empty userDTO}">
                          <c:if test="${userDTO.statusFlag==0}">
                             *관리자*
                          </c:if>
                          <c:if test="${empty userDTO.pwd}">
                             ${userDTO.name}님 환영합니다.   
                          </c:if>
                          <c:if test="${not empty userDTO.pwd}">
                             ${userDTO.id}님 환영합니다.
                          </c:if>
                          <c:if test="${userDTO.statusFlag==1}">
                              <li><a class="mypage_nav" id="memberM" href="${pageContext.request.contextPath}/member/memberMypage">마이페이지 </a>
                                <c:choose>
                                 <c:when test="${newAlarm==1||qnaNewAlarm==1}">
                                   <i class="fa fa-bell faa-tada animated" id="alarm" style="color:#FF607F"></i>
                                 </c:when>
                              </c:choose> 
                              </li> 
                           </c:if>
                           <c:if test="${userDTO.statusFlag==2}">
                             <li><a class="mypage_nav" id="companyM" href="${pageContext.request.contextPath}/company/companyMypage">기업마이페이지</a></li>                                           
                          </c:if>
                          <c:if test="${userDTO.statusFlag==0}">
                             <li><a class="mypage_nav" id="adminM" href="${pageContext.request.contextPath}/admin/adminPage">관리자페이지</a></li>                                           
                          </c:if>
                          <li><a class="login_nav" id="loginC" href="${pageContext.request.contextPath}/member/logOut">로그아웃</a></li>
                  </c:when>           
                       <c:otherwise>
                          <li><a class="signup_nav" id="joinC" href="${pageContext.request.contextPath}/member/signUp">회원가입</a></li>
                            <li><a class="login_nav" id="loginC" href="${pageContext.request.contextPath}/member/login">로그인</a></li>
                       </c:otherwise>
                    </c:choose>
                </ul>
            </div>
            <!-- 플로팅 메뉴 -->
            <div id="floatMenu">
                <ul>
                    <li><a href="${pageContext.request.contextPath}/">홈</a></li>
                   <c:choose>
                       <c:when test="${not empty userDTO}">
                           <li><a class="login_nav" id="loginC" href="${pageContext.request.contextPath}/member/logOut">로그아웃</a></li>
                           <c:if test="${userDTO.statusFlag==1}">
                              <li><a class="mypage_nav" id="memberM" href="${pageContext.request.contextPath}/member/memberMypage">마이페이지</a></li> 
                           </c:if>
                           <c:if test="${userDTO.statusFlag==2}">
                             <li><a class="mypage_nav" id="companyM" href="${pageContext.request.contextPath}/company/companyMypage">기업마이페이지</a></li>                                           
                          </c:if>
                          <c:if test="${userDTO.statusFlag==0}">
                             <li><a class="mypage_nav" id="adminM" href="${pageContext.request.contextPath}/admin/adminPage">관리자페이지</a></li>                                           
                          </c:if>
                  	</c:when>           
                       <c:otherwise>
                          <li><a class="login_nav" href="${pageContext.request.contextPath}/member/login">로그인</a></li>
                          <li><a class="signup_nav" href="${pageContext.request.contextPath}/member/signUp">회원가입</a></li>
                       </c:otherwise>
                    </c:choose>
                    <li><a href="#">맨위로</a></li>
                </ul>
            </div>
			<!-- chat -->
			<!--
            <div id="chat">
                <div class="chat-close">
                    <button>닫기<i class="fas fa-angle-up"></i></button>
                </div>
                <div class="chat-area">
                    <textarea id="chatBoxArea" style="width: 100%;resize: none;" rows="10" cols="50" readonly></textarea>
                </div>
                <div class="input-area">
                    <input id="inputMsgBox" type="text" onkeypress="inputMsgBox_onkeypress()">
                    <input id="sendButton" type="button" value="전송" onclick="sendButton_onclick()"> 
                </div>
            </div>     
            -->
        </div>   
        <div align="center" class="logo">
            <a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/logo/donut.png"></a>
        </div>

        <div class="menu-wrap">
            <div class="menu">
                   <ul>
                    <li><a class="notice_menu" href="${pageContext.request.contextPath}/notice/noticeList"><b>공지사항</b><span class="arr"></span></a></li>
                    <li><a class="project_menu" href="${pageContext.request.contextPath}/project/projectList"><b>프로젝트</b><span class="arr"></span></a></li>
                     <li><a class="match_menu" href="${pageContext.request.contextPath}/match/matchStart"><b>맞춤기부</b><span class="arr"></span></a></li>
                    <c:if test="${userDTO.statusFlag==2}">
                       <li><a class="project_register_menu" href="${pageContext.request.contextPath}/project/projectInsertForm"><b>프로젝트등록</b><span class="arr"></span></a></li>
                    </c:if>
                    <li><a href="${pageContext.request.contextPath}/honor/honorList"><b>명예의전당</b><span class="arr"></span></a></li>             
                    </ul>
            </div>
        </div>