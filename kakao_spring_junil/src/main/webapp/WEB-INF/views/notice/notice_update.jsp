<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>뉴스</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/mainNav.css">
    <link rel="stylesheet" href="css/notice_update.css">
</head>
<body>
    <div class="container">
        <jsp:include page="../include/index_include/index_header.jsp"></jsp:include>
        <main>
            <div class="notice_insert_header">
                공지사항 글 작성
            </div>

            <div class="notice_insert_main">
                <form action="notice-update" method="post">
                	<input type="hidden" name="notice_code" value="${notice.notice_code }">
                    <ul class="ni_title_ul">
                        <li class="ni_title_li">제목</li>
                        <li><input type="text" class="notice_title" name="notice_title" value="${notice.notice_title }"></li>
                    </ul>
                    <ul class="ni_info_ul">
                        <li>작성자</li>
                        <input type="hidden" class="notice_writer" name="notice_writer" value="${login_user.name }">
                        <li>${login_user.name }</li>
                        <li>작성일</li>
                        <li>${notice.notice_date }</li>
                    </ul>
                    <ul class="ni_content_ul">
                        <li>
                            <textarea class="notice_content" name="notice_content">${notice.notice_content }</textarea>
                        </li>
                    </ul>

                    <button type="button" class="notice_submit">수정완료</button>
                    <button type="reset">다시쓰기</button>
                </form>
            </div>
        </main>
        <footer>

        </footer>
    </div>
    <script src="https://kit.fontawesome.com/c3df4d7d1c.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/notice_update.js"></script>
</body>
</html>










