var win = null;
	function NewWindow(mypage, myname, w, h, scroll) {
		LeftPosition = (screen.width) ? (screen.width - w) / 2 : 0;
		TopPosition = (screen.height) ? (screen.height - h) / 4 : 0;
		settings = 'height=' + h + ',width=' + w + ',top=' + TopPosition
				+ ',left=' + LeftPosition + ',scrollbars=' + scroll
				+ ', resizable'
		win = window.open(mypage, myname, settings)
	}

	var win2 = null;
	function NewWindow2(mypage, myname, w, h, scroll) {
		LeftPosition = (screen.width) ? (screen.width - w) / 2 : 0;
		TopPosition = (screen.height) ? (screen.height - h) / 2 : 0;
		settings = 'height=' + h + ',width=' + w + ',top=' + TopPosition
				+ ',left=' + LeftPosition + ',scrollbars=' + scroll
				+ ', resizable'
		win2 = window.open(mypage, myname, settings)
	}
	
	function checkLogin(){
		var id = document.getElementById("loginId").value;
		var pwd = document.getElementById("loginPwd").value;
		console.log('id :' + id);
		console.log('pwd : ' + pwd);
		
		if(id == "" && pwd == ""){
			alert('아이디와 패스워드를 입력해 주세요.');
			return false;
		}else if(pwd == ""){
			alert('패스워드를 입력해 주세요.');
			return false;
		}else if(id == ""){
			alert('아이디를 입력해 주세요.');
			return false;
		}
}