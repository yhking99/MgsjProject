function login() {

  let id = document.getElementById("userId").value; // userid 의 값을 받아와 넣음.
  let pwd = document.getElementById("userPwd").value; // userpw 의 값을 받아와 넣음.


  if(id == "test" && pwd == "12345678") {
    alert("로그인 성공");
    console.log("로그인 성공했습니다.");
  } else if(id === ""){
    alert("아이디를 입력해주세요");
    console.log("아이디가 입력되지 않았습니다.");
  }else if(pwd === ""){
    alert("비밀번호를 입력해주세요");
    console.log("비밀번호가 입력되지 않았습니다.");
  }else {
    alert("로그인 실패. 아이디/비밀번호를 확인해주세요.")
  }

}