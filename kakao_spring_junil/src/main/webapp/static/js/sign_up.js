const warp_form = document.querySelectorAll('.warp_form');
const item_ip = document.querySelectorAll('.item_ip');
const button_round = document.querySelector('.button_round');
const btn_g = document.querySelectorAll('.btn_g');

signUpOnLoad(0);

var signUpData = {
	signUpEmail: '',
	emailFlag: 0,
	signUpPassword: '',
	signUpName: '',
	signUpPhone: '',
	phoneFlag: 0
}

function signUpOnLoad(indexNumber){
	warp_form[indexNumber].style.display = 'block';
	item_ip[indexNumber].focus();
}

function clearMsgNode(msg){
	while(msg.hasChildNodes()){
		msg.removeChild(msg.firstChild);
	}
	msg.style.display = 'none';
}

function messageService(indexNumber, msgText, msgFlag){
	const errorMsg = document.querySelectorAll('.errorMsg');
	const successMsg = document.querySelector('.successMsg');
	
	clearMsgNode(errorMsg[indexNumber]);
	clearMsgNode(successMsg);
	
	let msgTextNode = document.createTextNode(msgText);
	
	if(msgFlag == 0){
		errorMsg[indexNumber].appendChild(msgTextNode);
		errorMsg[indexNumber].style.display = 'block';
	}else {
		successMsg.appendChild(msgTextNode);
		successMsg.style.display = 'block';
	}
}

function nextPage(indexNumber){
	warp_form[indexNumber].style.display = 'none';
	warp_form[indexNumber+1].style.display = 'block';
	item_ip[indexNumber+1].focus();
}

function emailCheck(indexNumber){
	$.ajax({
		type: "post",
		url: "sign-up-emailCheck",
		data: {
			signUpEmail: item_ip[indexNumber].value
		},
		dataType: "text",
		success: function(data){
			signUpData = JSON.parse(data);
			if(signUpData.emailFlag == 0){
				nextPage(indexNumber);
			}else if(signUpData.emailFlag == 1){
				let msgText = signUpData.signUpEmail + '(은)는 이미 존재하는 아이디입니다.';
				messageService(indexNumber, msgText, 0);
			}
		},
		error:function(){
			alert('비동기 처리 오류!');
		}
	})
}

function passwordCheck(id, password){
    if(!/^[a-zA-Z0-9]{10,15}$/.test(password)){
        let msg = '숫자와 영문자 조합으로 10~15자리를 사용해야 합니다.';
        return msg;
    }
    var checkNumber = password.search(/[0-9]/g);
    var checkEnglish = password.search(/[a-z]/ig);
    if(checkNumber <0 || checkEnglish <0){
        let msg = '숫자와 영문자를 혼용하여야 합니다.';
        return msg;
    }
    if(/(\w)\1\1\1/.test(password)){
        let msg = '444같은 문자를 4번 이상 사용하실 수 없습니다.';
        return msg;
    }
    if(password.search(id) > -1){
        let msg = '비밀번호에 아이디가 포함되었습니다.';
        return msg;
    }
    return 'true';
}

function phoneCheck(indexNumber) {
	$.ajax({
		type: "post",
		url: "phone-number-check",
		data: JSON.stringify(signUpData),
		dataType: "text",
		contentType: "application/json;charset=UTF-8",
		success: function(data) {
			signUpData = JSON.parse(data);
			if(signUpData.phoneFlag == 1){
				let msgText = '인증성공.';
				messageService(indexNumber, msgText, 1);
			}else if(signUpData.phoneFlag == 0){
				let msgText = '인증실패! 존재하지 않는 연락처 입니다.';
				messageService(indexNumber, msgText, 0);
			}else if(signUpData.phoneFlag == 2){
				let msgText = '인증실패! 이미 가입된 연락처 입니다.';
				messageService(indexNumber, msgText, 0);
			}
		},
		error: function() {
			alert('비동기 처리 실패!');
		}
	})
}

function signUpSubmit(){
	$.ajax({
		type: "post",
		url: "sign-up",
		data: JSON.stringify(signUpData),
		contentType: "application/json;charset=UTF8",
		dataType: "text",
		success: function(data){
			if(data == 1){
				alert('회원가입을 축하합니다. 환영합니다.');
				location.replace('sign-in');
			}else{
				alert('회원가입 실패. 다시 시도하세요.')
				location.replace('sign-up');
			}
		},
		error: function(){
			alert('비동기 처리 실패!');
		}
	})
}


//버튼 클릭시 또는 input의 엔터 이벤트가 발생시 호출
function nextService(indexNumber) {
	// input의 입력값 확인(필수입력확인)
	if(item_ip[indexNumber].value.length == 0){
		let msgText = '필수항목입니다.';
		messageService(indexNumber, msgText, 0);
	} 
	// 이메일 중복확인.
	else if(indexNumber == 0) {
		emailCheck(indexNumber);
	} 
	// 비밀번호 정규식 확인.
	else if(indexNumber == 1) {
		let checkMsg = passwordCheck(signUpData.signUpEmail, item_ip[indexNumber].value);
		if(checkMsg == 'true') {
			nextPage(indexNumber);
		}else {
			messageService(indexNumber, checkMsg, 0);
		}
	} 
	// 비밀번호 재확인.(이전의 비밀번호와 일치하는지 확인)
	else if(indexNumber == 2) {
		if(item_ip[1].value == item_ip[2].value){
			signUpData.signUpPassword = item_ip[2].value;
			nextPage(indexNumber);
		}else{
			let msgText = '비밀번호가 일치하지 않습니다.';
			messageService(indexNumber, msgText, 0);
		}
	} 
	// signUpData 객체의 signUpName에 input의 데이터 대입
	else if(indexNumber == 3) {
		signUpData.signUpName = item_ip[indexNumber].value;
		nextPage(indexNumber);
	} 
	// 전화번호 인증 유무 확인 또는 서브밋(insert)
	else if(indexNumber == 4) {
		if(signUpData.phoneFlag != 1){
			let msgText = '전화번호 인증이 되지 않았습니다.';
			messageService(indexNumber, msgText, 0);
		}else{
			if(signUpData.signUpPhone == item_ip[indexNumber].value){
				signUpSubmit();
			}else {
				let msgText = '전화번호 인증이 되지 않았습니다.';
				messageService(indexNumber, msgText, 0);
			}
		}
	}
}

for(let i = 0; i < item_ip.length; i++){
	item_ip[i].onkeypress = () => {
		if(window.event.keyCode == 13){
			window.event.preventDefault();
			nextService(i);
		}
	}
	btn_g[i].onclick = () => {
		nextService(i);
	}
}

button_round.onclick = () => {
	let indexNumber = 4;
	if(item_ip[indexNumber].value.length == 0){
		let msgText = '필수항목입니다.';
		messageService(indexNumber, msgText, 0);
	}else {
		signUpData.signUpPhone = item_ip[indexNumber].value;
		phoneCheck(indexNumber);
	}
}
