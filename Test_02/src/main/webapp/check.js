function valueChecked() {
	if(document.form_insert.code.value.length === 0){
		alert("code값이 비었습니다.")
		document.form_insert.code.focus();
		return false;
	}
	if(document.form_insert.name.value.length === 0){
		alert("name값이 비었습니다.")
		form_insert.name.focus();
		return false;
	}
	if(document.form_insert.score.value.length === 0){
		alert("score값이 비었습니다.")
		form_insert.score.focus();
		return false;
	}
		
	if(document.form_insert.lecture.value === 0){
		alert("lecturer값이 비었습니다.")
		form_insert.lecturer.focus();
		return false;
	}
	if(document.form_insert.day.value.length === 0){
		alert("day값이 비었습니다.")
		form_insert.day.focus();
		return false;
	}
	if(document.form_insert.startTime.value.length === 0){
		alert("startTime값이 비었습니다.")
		form_insert.startTime.focus();
		return false;
	}
	if(document.form_insert.endTime.value.length === 0){
		alert("endTime값이 비었습니다.")
		form_insert.endTime.focus();
		return false;
	}
	
	alert("교과목 추가가 완료되었습니다.")
	document.form_insert.submit();
	return true;
}

function listLocation(){
	location="list.jsp";
}

function modify(){
	alert("교과목 수정 완료되었습니다.")
	document.form_insert.submit();	
	return true;
}