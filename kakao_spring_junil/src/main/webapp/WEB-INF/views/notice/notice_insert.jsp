<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>뉴스</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/mainNav.css">
    <link rel="stylesheet" href="css/notice_insert.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
    <div class="container">
        <jsp:include page="../include/index_include/index_header.jsp"></jsp:include>
        <main>
            <div class="notice_insert_header">
                공지사항 글 작성
            </div>

            <div class="notice_insert_main">
                <form id="insert_form">
                    <ul class="ni_title_ul">
                        <li class="ni_title_li">제목</li>
                        <li><input type="text" class="notice_title" name="notice_title"></li>
                    </ul>
                    <ul class="ni_info_ul">
                        <li>작성자</li>
                        <input type="hidden" class="notice_writer" name="notice_writer" value="${login_user.user_name }">
                        <li>${login_user.user_name }</li>
                        <li>작성일</li>
                        <li><fmt:formatDate value="${now }" pattern="yyyy-MM-dd"/> </li>
                    </ul>
                    <ul class="ni_file_ul">
                        <li class="ni_file_li">첨부파일</li>
                        <li><input type="file" multiple="multiple" name="notice_file"></li>
                    </ul>
                    <ul class="ni_content_ul">
                        <li>
                            <textarea class="notice_content" name="notice_content"></textarea>
                        </li>
                    </ul>

                    <button type="button" class="notice_submit">작성완료</button>
                    <button type="reset">다시쓰기</button>
                </form>
            </div>
        </main>
        <footer>

        </footer>
    </div>
    <script src="https://kit.fontawesome.com/c3df4d7d1c.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/notice_insert.js"></script>
</body>
</html>










