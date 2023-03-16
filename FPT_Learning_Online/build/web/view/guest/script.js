const form = document.getElementById('form');
const username = document.getElementById('username');
const lastname = document.getElementById('lastname');
const phone = document.getElementById('phone');
const email = document.getElementById('email');
const password = document.getElementById('password');
const cpassword = document.getElementById('cpassword');

form.addEventListener('submit', (event) => {
    event.preventDefault();

    Validate();
});

const sendData = (usernameVal, sRate, Count) => {
    if (sRate === Count) {
        var result = confirm("Do you certainly about the information?");
        if (result === true) {
            document.getElementById('form').submit();
        }
    }
};

const SuccessMsg = (usernameVal) => {
    let formContr = document.getElementsByClassName('form-control');
    var Count = formContr.length - 1;
    for (var i = 0; i < formContr.length; i++) {
        if (formContr[i].className === "form-control success") {
            var sRate = 0 + i;
            console.log(sRate);
            sendData(usernameVal, sRate, Count);
        } else {
            return false;
        }
    }
};


const isEmail = (emailVal) => {
    var atSymbol = emailVal.indexOf('@');
    if (atSymbol < 1)
        return false;
    var dot = emailVal.lastIndexOf('.');
    if (dot <= atSymbol + 2)
        return false;
    if (dot === emailVal.length - 1)
        return false;
    return true;
};

function Validate() {
    const usernameVal = username.value.trim();
    const lastnameVal = lastname.value.trim();
    const emailVal = email.value.trim();
    const phoneVal = email.value.trim();
    const passwordVal = password.value.trim();
    const cpasswordVal = cpassword.value.trim();

    //username
    if (usernameVal === "") {
        setErrorMsg(username, 'FirstName cannot be blank');
    } else if (usernameVal.length <= 2) {
        setErrorMsg(username, 'Min 3 char');
    } else {
        setSuccessMsg(username);
    }

    //last name

    if (lastnameVal === "") {
        setErrorMsg(lastname, 'LastName cannot be blank');
    } else if (lastnameVal.length <= 2) {
        setErrorMsg(lastname, 'Min 3 char');
    } else {
        setSuccessMsg(lastname);
    }

    //email
    if (emailVal === "") {
        setErrorMsg(email, 'Email cannot be blank');
    } else if (!isEmail(emailVal)) {
        setErrorMsg(email, 'Email is not valid');
    } else {
        setSuccessMsg(email);
    }
    //phone
    if (phoneVal === "") {
        setErrorMsg(phone, 'Phone cannot be blank');
    } else if (!isEmail(phoneVal)) {
        setErrorMsg(phone, 'Phone is not valid');
    } else {
        setSuccessMsg(phone);
    }

    //password
    if (passwordVal === "") {
        setErrorMsg(password, 'Password cannot be blank');
    } else if (passwordVal.length <= 7) {
        setErrorMsg(password, 'Min 8 char');
    } else {
        setSuccessMsg(password);
    }

    //confirm password
    if (cpasswordVal === "") {
        setErrorMsg(cpassword, 'Confirm Password cannot be blank');
    } else if (passwordVal !== cpasswordVal) {
        setErrorMsg(cpassword, 'Not Matched!');
    } else {
        setSuccessMsg(cpassword);
    }
    SuccessMsg(usernameVal);


}

function setErrorMsg(input, errormsgs) {
    const formControl = input.parentElement;
    const small = formControl.querySelector('small');
    formControl.className = "form-control error";
    small.innerText = errormsgs;
}

function setSuccessMsg(input) {
    const formControl = input.parentElement;
    formControl.className = "form-control success";
}


