const notice_update_button = document.querySelector('.notice_update_button');
const notice_delete_button = document.querySelector('.notice_delete_button');
notice_update_button.onclick = () => {
	const notice_code = document.querySelector('#notice_code');
	location.href = 'notice-update?notice_code=' + notice_code.value;
}

notice_delete_button.onclick = () => {
	const notice_code = document.querySelector('#notice_code');
	location.href = 'notice-delete?notice_code=' + notice_code.value;
}