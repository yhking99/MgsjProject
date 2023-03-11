// [1] 아이디 중복검사
let joinButton = document.querySelector(".signUp button");

let dupCheckId = 0;

function checkDuplicateId() {

	let id = document.getElementById("userId").value;
	
	if (id.length < 4 || id == "") {
		alert("아이디를 4자 이상 입력해주세요");

		return false;
	}

	$.ajax({
		url: '/member/checkDuplicateId',
		type: 'post',
		data:
		{
			'userId': id
		},
		dataType: 'json',

		success: function(returnDupIdResult) {

			if (returnDupIdResult == true) {

				alert('사용 가능한 아이디 입니다.');

				dupCheckId = 1;

				joinButton.style.background = '#297eff';
				joinButton.style.cursor = 'pointer';

				joinButton.disabled = false;
			

			} else {

				alert('중복된 아이디입니다.');

				dupCheckId = 0;

			}

		}
	})
}


// [2] 가입 양식 확인.
function signUpCheck() {

	let id = document.getElementById("userId").value
	let name = document.getElementById("userName").value
	let pwd = document.getElementById("userPwd").value
	let rePwd = document.getElementById("rePwd").value
	let email = document.getElementById("userEmail").value
	let check = true;

	// 아이디확인
	if (id === "") {
		document.getElementById("idError").innerHTML = "아이디는 필수입력 항목입니다"
		check = false
	} else {
		document.getElementById("idError").innerHTML = ""
	}


	// 이메일확인
	if (email.includes('@')) {
		let emailId = email.split('@')[0]
		let emailServer = email.split('@')[1]
		if (emailId === "" || emailServer === "") {
			document.getElementById("emailError").innerHTML = "이메일은 필수입력 항목입니다"
			check = false
		}
		else {
			document.getElementById("emailError").innerHTML = ""
		}
	} else {
		document.getElementById("emailError").innerHTML = "이메일이 올바르지 않습니다."
		check = false
	}


	// 이름확인
	if (name === "") {
		document.getElementById("nameError").innerHTML = "이름은 필수입력 항목입니다"
		check = false
	} else {
		document.getElementById("nameError").innerHTML = ""
	}


	// 비밀번호 확인
	if (pwd !== rePwd) {
		document.getElementById("re-pwdError").innerHTML = "비밀번호가 동일하지 않습니다."
		check = false
	} else if (pwd === "") {
		document.getElementById("pwdError").innerHTML = "비밀번호를 입력해주세요."
		check = false
	} else if (rePwd === "") {
		document.getElementById("re-pwdError").innerHTML = "비밀번호를 입력해주세요."
		check = false
	} else {
		document.getElementById("pwdError").innerHTML = ""
		document.getElementById("re-pwdError").innerHTML = ""
	}


	// 성별체크확인
	if (!gender_man && !gender_woman) {
		document.getElementById("genderError").innerHTML = "성별을 선택해주세요."
		check = false
	} else {
		document.getElementById("genderError").innerHTML = ""
	}

	// 전체가 빈칸이 아닐때 회원가입을 가능하게 만든다.
	if (check) {
		
		if(dupCheckId == 1){

		//비동기 처리이벤트
		setTimeout(function() {
			alert("가입이 완료되었습니다.");
		}, 0);
			
		} else {
			
			alert("아이디 중복확인을 확인 해 주십시오.");
			
			return false;
			
		}
		
	} else {
		
		alert("필수 입력 사항을 확인 해 주세요.");
		
		event.preventDefault();
		
		return false;
	}

}


/*
// 약관동의 모두선택
function selectAll(selectAll) {
	let checkboxes
		= document.getElementsByName('agree');

	checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked;
	})

}*/
