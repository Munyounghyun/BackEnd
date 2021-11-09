<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
    <div class="nav">
        <a href="index" class="brand_logo"><h1>kakao</h1></a>
        <ul class="nav_item">
            <a href=""><li>카카오</li></a>
            <a href="notice?pageNumber=1"><li>뉴스</li></a>
            <a href=""><li>기술과 서비스</li></a>
            <a href=""><li>약속과 책임</li></a>
        </ul>
        <c:set var="emailAddress" value="@kakao.com" />
        
        <c:choose>
        	<c:when test="${empty login_user }">
        		<ul class="nav_user">
		            <a href="sign-in"><li><i class="fas fa-user"></i></li></a>
		            <a href="sign-up"><li><i class="fas fa-user-plus"></i></li></a>
		        </ul>
        	</c:when>
        	<c:otherwise>
        		<ul class="nav_user">
		            <a href="mypage"><li><i class="fas fa-user-circle"></i> ${login_user.user_email }<span>${emailAddress }</span></li></a>
		            <a href="logout"><li><i class="fas fa-sign-out-alt"></i></li></a>
		        </ul>
        	</c:otherwise>
        </c:choose>
    </div>
</header>