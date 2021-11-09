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
                    <div class="navigation_wrap">
                        <progress class="bar_navigation" value="20" max="100"></progress>
                    </div>
                    <h2>카카오계정 가입을 위해<br>
                        사용하실 이메일을 입력해 주세요.</h2>
                    <div class="item_tf">
                        <input type="text" class="item_ip" placeholder="이메일 입력" autofocus="autofocus">
                        <div class="util_tf">
                            <label class="txt_email">@ kakao.com</label>
                        </div>
                    </div>
                    <div class="item_msg">
                    	<span class="errorMsg"></span>
                    </div>
                    <div class="confirm_btn">
                        <button type="button" class="btn_g">다음</button>
                    </div>
                </div>
                <div class="warp_form">
                    <div class="navigation_wrap">
                        <progress class="bar_navigation" value="40" max="100"></progress>
                    </div>
                    <h2>카카오계정 가입을 위해<br>
                        비밀번호를 입력해 주세요.</h2>
                    <div class="item_tf">
                        <input type="password" class="item_ip" placeholder="비밀번호 입력" autofocus="autofocus">
                    </div>
                    <div class="item_msg">
                    	<span class="errorMsg"></span>
                    </div>
                    <div class="confirm_btn">
                        <button type="button" class="btn_g">다음</button>
                    </div>
                </div>
                <div class="warp_form">
                    <div class="navigation_wrap">
                        <progress class="bar_navigation" value="60" max="100"></progress>
                    </div>
                    <h2>카카오계정 가입을 위해<br>
                        비밀번호를 확인해 주세요.</h2>
                    <div class="item_tf">
                        <input type="password" class="item_ip" placeholder="비밀번호 확인" autofocus="autofocus">
                    </div>
                    <div class="item_msg">
                    	<span class="errorMsg"></span>
                    </div>
                    <div class="confirm_btn">
                        <button type="button" class="btn_g">다음</button>
                    </div>
                </div>
                <div class="warp_form">
                  	<div class="navigation_wrap">
                        <progress class="bar_navigation" value="80" max="100"></progress>
                    </div>
                    <h2>카카오계정 가입을 위해<br>
                        이름을 입력해 주세요.</h2>
                    <div class="item_tf">
                        <input type="text" class="item_ip" placeholder="이름 입력" autofocus="autofocus">
                    </div>
                    <div class="item_msg">
                    	<span class="errorMsg"></span>
                    </div>
                    <div class="confirm_btn">
                        <button type="button" class="btn_g">다음</button>
                    </div>
                </div>
                <div class="warp_form">
                    <div class="navigation_wrap">
                        <progress class="bar_navigation" value="100" max="100"></progress>
                    </div>
                    <h2>카카오계정 가입을 위해<br>
                        휴대폰 인증을 진행해 주세요.</h2>
                    <div class="item_tf">
                        <input type="tel" class="item_ip" placeholder="전화번호 입력" autofocus="autofocus">
                        <div class="util_tf">
                            <button type="button" class="button_round">인증요청</button>
                        </div>
                    </div>
                    <div class="item_msg">
                    	<span class="errorMsg"></span>
                    	<span class="successMsg"></span>
                    </div>
                    <div class="confirm_btn">
                        <button type="button" class="btn_g">마침</button>
                    </div>
                </div>
            </main>
            <jsp:include page="../include/sign_up_include/sign_up_footer.jsp"></jsp:include>
        </div>
    </div>
    <script type="text/javascript" src="js/sign_up.js"></script>
</body>

</html>