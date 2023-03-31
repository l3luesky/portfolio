const signInBtn = document.getElementById("signIn");
const signUpBtn = document.getElementById("signUp");
const form1 = document.getElementById("form1");
const form2 = document.getElementById("form2");
const container = document.querySelector(".container");

signInBtn.addEventListener("click", () => {
	container.classList.remove("right-panel-active");
});

signUpBtn.addEventListener("click", () => {
	container.classList.add("right-panel-active");
});

form1.addEventListener("submit", signUp);
form2.addEventListener("submit", signIn);


function signIn(event) {
	event.preventDefault();
	console.log(event);
	event.target.submit();
}



function signUp(event) {

	const inputs = document.querySelectorAll(".container--signup .input");

	for (let i = 0; i < inputs.length; i++) {
		if (inputs[i].value === "") {

			alert("모든 정보를 입력해주세요.");
			event.preventDefault();
			return;
		}
	}

	console.log(event);
	event.target.submit();
}

