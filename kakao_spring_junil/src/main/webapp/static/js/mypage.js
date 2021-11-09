const item_ips = document.querySelectorAll('.item_ip');
const user_email = document.querySelector('#user_email');
const user_name = document.querySelector('#user_name');
const msg1 = document.querySelectorAll('.msg1');
const password_flag = document.querySelector('#password_flag');
const repassword_flag = document.querySelector('#repassword_flag');

var phoneNumberCheckFlag = 3;

item_ips[0].onblur = () => {
    if(item_ips[0].value.length != 0){
        checkPassword(user_email.value, item_ips[0].value);
    }else {
		password_flag.value = 2;
		msg1[0].style.display = 'none';
	}
}

item_ips[1].onblur = () => {
    if(item_ips[1].value.length != 0 && item_ips[0].value != item_ips[1].value){
       	repassword_flag.value = 0;
        msg1[1].style.display = 'block';
    }else if(item_ips[1].value.length != 0 && item_ips[0].value == item_ips[1].value){
		repassword_flag.value = 1;
        msg1[1].style.display = 'none';
    }else{
		repassword_flag.value = 2;
        msg1[1].style.display = 'none';
    }
}

function checkPassword(id,password){
	password_flag.value = 0;
	
	while(msg1[0].hasChildNodes()){
		msg1[0].removeChild(msg1[0].firstChild);
	}
	
	
    if(!/^[a-zA-Z0-9]{10,15}$/.test(password)){
        let msg = document.createTextNode('숫자와 영문자 조합으로 10~15자리를 사용해야 합니다.');
        msg1[0].appendChild(msg);
        msg1[0].style.display = 'block';
        return false;
    }
    
    var checkNumber = password.search(/[0-9]/g);
    var checkEnglish = password.search(/[a-z]/ig);
    
    if(checkNumber <0 || checkEnglish <0){
        let msg = document.createTextNode("숫자와 영문자를 혼용하여야 합니다.");
        msg1[0].appendChild(msg);
        msg1[0].style.display = 'block';
        return false;
    }
    
    if(/(\w)\1\1\1/.test(password)){
        let msg = document.createTextNode('444같은 문자를 4번 이상 사용하실 수 없습니다.');
        msg1[0].appendChild(msg);
        msg1[0].style.display = 'block';
        return false;
    }
    
    if(password.search(id) > -1){
        let msg = document.createTextNode("비밀번호에 아이디가 포함되었습니다.");
        msg1[0].appendChild(msg);
        msg1[0].style.display = 'block';
        return false;
    }
    
    password_flag.value = 1;
    msg1[0].style.display = 'none';
    return true;
}


const button_round = document.querySelector('.button_round');
button_round.onclick = () => {
	if(item_ips[2].value.length == 0){
		item_ips[2].value = $("#user_phone").val();
	}
	
	let phoneInfo = {
		user_name:$("#user_name").val(),
		user_phone:item_ips[2].value
	};
	
	$.ajax({
		type:"get",
		url:"phone-number-check",
		data: {
			phoneInfo:JSON.stringify(phoneInfo)
		},
		dataType: "text",
		success: function(data){
			phoneNumberCheckFlag = data;
			const msg2 = document.querySelector('.msg2');
			const msg3 = document.querySelector('.msg3');
			msg1[2].style.display = 'none';
			msg2.style.display = 'none';
			msg3.style.display = 'none';
			
			if(data == 0){
				msg2.style.display = 'block';
			}else if(data == 2){
				msg1[2].style.display = 'block';
			}else if(data == 1){
				msg3.style.display = 'block';
			}
		},
		error: function(){
			
		}
	})
}


const btn_g = document.querySelector('.btn_g');
btn_g.onclick = () => {
	const form = document.querySelector('form');
	if(password_flag.value == 1 && repassword_flag.value == 1){
		if(item_ips[2].value.length != 0){
			if(phoneNumberCheckFlag == 1){
				form.submit();
			}
		}else{
			phoneNumberCheckFlag = 3;
			item_ips[2].value = $("#user_phone").val();
			form.submit();
		}
		
	}else if(password_flag.value == 2 && repassword_flag.value == 2){
		const user_password = document.querySelector('#user_password');
		item_ips[0].value = user_password.value;
		if(item_ips[2].value.length != 0){
			if(phoneNumberCheckFlag == 1){
				form.submit();
			}
		}else{
			phoneNumberCheckFlag = 3;
			item_ips[2].value = $("#user_phone").val();
			alert('수정 할 회원 정보가 없습니다.')
		}
	}else{
		alert('회원 수정 내용을 확인해 주세요.');
	}
	
}



