<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>카카오계정 만들기</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/sign_up.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
    <div class="container">
        <div class="inner_container">
            <jsp:include page="../include/sign_up_include/sign_up_header.jsp"></jsp:include>
            <main>
                <div class="warp_form">
                    <form action="signUp" method="post">
                    	<input type="hidden" name="submit_status" value="password">

                    	<input type="hidden" id="id" name="id" value="${id }">
                        <div class="navigation_wrap">
                            <progress class="bar_navigation" value="40" max="100"></progress>
                        </div>
                        <h2>카카오계정 가입을 위해<br>
                            비밀번호를 입력해 주세요.</h2>
                        <div class="item_tf">
                            <input type="password" class="item_ip" name="password" placeholder="비밀번호 입력" autofocus="autofocus">
                        </div>
                        <div class="item_msg">
                        	<span class="msg1">필수 항목입니다.</span>
                        	<span class="msg2"></span>
                        </div>
                        <div class="confirm_btn">
                            <button type="button" class="btn_g">다음</button>
                        </div>
                    </form>
                </div>
            </main>
            <jsp:include page="../include/sign_up_include/sign_up_footer.jsp"></jsp:include>
        </div>
    </div>
    <script type="text/javascript" src="js/sign_up_password.js"></script>
</body>

</html>