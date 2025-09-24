
var elUsername  = document.getElementById('isExist'),
    elPwd1      = document.getElementById('pwd1'),
    elPwd2      = document.getElementById('pwd2'),
    elMsg       = document.getElementById('checkUsername'),
    elMsg2      = document.getElementById('checkPassword'),
    elMsg3      = document.getElementById('checkRepeatedPassword');
var xhr;


function checkUsername(username){
    if(username === null || username === '' || username.length === 0){
        elMsg.textContent = 'Username cannot be null';
        return;
    }
    if(username.length <= 2){
        elMsg.textContent = 'The length of the username cannot be less than 3';
        return;
    }
    elMsg.textContent = '';
    sendRequest(username);
}

function checkPassword(pwd1,pwd2){
    if(pwd1 === null || pwd1 === '' || pwd1.length === 0){
        elMsg2.textContent = 'Password cannot be null';
        return;
    }
    if(pwd2 !== pwd1){
        elMsg3.textContent = 'Two password entries are inconsistent';
        return;
    }
    elMsg2.textContent = '';
}

function checkRepeatPassword(pwd1,pwd2){
    if(pwd2 === null || pwd2 === '' || pwd2.length === 0){
        elMsg3.textContent = 'Repeat Password cannot be null';
        return;
    }
    if(pwd2 !== pwd1){
        elMsg3.textContent = 'Two password entries are inconsistent';
        return;
    }
    elMsg3.textContent = '';

}

function sendRequest(username){
    xhr = new XMLHttpRequest();
    xhr.onreadystatechange = process;
    xhr.open('GET','usernameIsExist?username='+username);
    xhr.send(null);

};

function process(){
    if(xhr.readyState === 4){
        if(xhr.status === 200){
            var responseInfo = xhr.responseText;
            console.log(responseInfo);
            if(responseInfo === 'Exist'){
                elMsg.textContent = 'Username is taken';
            }else{
                elMsg.textContent = '';
            }
        }
    }
};

elUsername.addEventListener('blur',function (){
    var username = elUsername.value.trim();
    checkUsername(username);
});
elPwd1.addEventListener('blur',function(){
    var pwd1 = elPwd1.value.trim(),
        pwd2 = elPwd2.value.trim();
    checkPassword(pwd1,pwd2);
});
elPwd2.addEventListener('blur',function(){
    var pwd1 = elPwd1.value.trim(),
        pwd2 = elPwd2.value.trim();
    checkRepeatPassword(pwd1,pwd2);
});