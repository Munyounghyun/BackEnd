<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>뉴스</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/mainNav.css">
    <link rel="stylesheet" href="css/notice.css">
</head>
<body>
    <div class="container">
        <jsp:include page="../include/index_include/index_header.jsp"></jsp:include>
        <main>
            <div class="notice_header">
                <ul>
                    <li class="notice_num">번호</li>
                    <li class="notice_title">제목</li>
                    <li class="notice_writer">작성자</li>
                    <li class="notice_date">작성일</li>
                    <li class="notice_count">조회수</li>
                </ul>
            </div>
            <div class="notice_main">
            
            	<c:forEach var="notice" items="${noticeList }">
            		<a href="notice-dtl?notice_code=${notice.notice_code }">
	                    <ul>
	                        <li class="notice_num">${notice.notice_code }</li>
	                        <li class="notice_title">${notice.notice_title }</li>
	                        <li class="notice_writer">${notice.notice_writer }</li>
	                        <li class="notice_date">${notice.notice_date }</li>
	                        <li class="notice_count">${notice.notice_count }</li>
	                    </ul>
	                </a>
            	</c:forEach>
                
            </div>
            
            <div class="notice_footer">
           		<c:if test="${not empty login_user }">
           			<div class="notice_insert_div">
	            		<button type="button" class="notice_insert_button" onclick="location.href='notice-insert'">글쓰기</button>
	            	</div>
           		</c:if>
				<ul>
					<a href="notice?pageNumber=${noticeBean.startPage - 1 eq 0 ? 1 : noticeBean.pageNumber - 1 }"><li><i class="fas fa-arrow-circle-left"></i></li></a>
					
					<c:forEach var="i" begin="${noticeBean.startPage }" end="${noticeBean.endPage }">
						<a href="notice?pageNumber=${i }"><li>${i }</li></a>
					</c:forEach>
					
					<a href="notice?pageNumber=${noticeBean.totalPage eq noticeBean.pageNumber ? noticeBean.totalPage : noticeBean.pageNumber + 1 }"><li><i class="fas fa-arrow-circle-right"></i></li></a>
				</ul>
            </div>
            
        </main>
        <footer>

        </footer>
    </div>
    <script src="https://kit.fontawesome.com/c3df4d7d1c.js" crossorigin="anonymous"></script>
</body>
</html>