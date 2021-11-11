const notice_submit = document.querySelector(".notice_submit");
const insert_form = document.querySelector('#insert_form');

function noticeInsert(){
	let formData = new FormData(insert_form);

	$.ajax({
		type: "post",
		url: "notice-insert",
		enctype: "multipart/form-data",
		data: formData,
		processData: false,
		contentType: false,
		success: function(data){
			if(data == 0){
				alert('공지사항 등록에 실패하였습니다.');
				location.href = 'notice?pageNumber=1';
			}else{
				alert('공지사항 등록이 완료되었습니다.');
				location.href = 'notice-dtl?notice_code=' + data;
			}
		},
		error: function(){
			alert("전송 실패");
		}
	})
}


notice_submit.onclick = () => {
	const notice_title = document.querySelector(".notice_title");
	const notice_writer = document.querySelector(".notice_writer");
	const notice_content = document.querySelector(".notice_content");
	if(notice_title.value.length == 0){
		alert("공지사항의 제목을 입력해 주세요.");
	}else if(notice_writer.value.length == 0){
		alert("로그인이 되지 않았습니다. 로그인 후 사용바랍니다.");
	}else if(notice_content.value.length == 0){
		alert("공지사항 내용을 입력해 주세요.");
	}else {
		noticeInsert();
	}
}