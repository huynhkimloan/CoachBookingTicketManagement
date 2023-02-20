/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

const toggleSwitch = document.querySelector('.theme-switch input[type="checkbox"]');

function switchTheme(e) {
    if (e.target.checked) {
        document.documentElement.setAttribute('data-theme', 'dark');
    }
    else {
        document.documentElement.setAttribute('data-theme', 'light');
    }    
}

toggleSwitch.addEventListener('change', switchTheme, false);


const name = document.getElementById('name');
const email = document.getElementById('email');
const message = document.getElementById('message');
const contactForm = document.getElementById('contact-form');
const errorElement = document.getElementById('error');
const successMsg = document.getElementById('success-msg');
const submitBtn = document.getElementById('submit');
  
const validateName = (e) => {
  e.preventDefault();
 
  if (name.value.length < 3) {
    errorElement.innerHTML = 'Tên của bạn phải dài ít nhất 3 ký tự.';
    return false;
  } 

  return true;

}

const validateEmail = (e) => {
  e.preventDefault();
 
 
  if (!(email.value.includes('.') && (email.value.includes('@')))) {
    errorElement.innerHTML = 'Vui lòng nhập một địa chỉ email hợp lệ.';
    return false;
  } 

  if (!emailIsValid(email.value)) {
    errorElement.innerHTML = 'Vui lòng nhập một địa chỉ email hợp lệ.';
    return false;
  }

  return true;

}
const validateMessage = (e) => {
  e.preventDefault();
 
  if (message.value.length < 15) {
    errorElement.innerHTML = 'Hãy viết một tin nhắn dài hơn 15 kí tự.';
    return false;
  }
  return true;

}
const emailIsValid = email => {
  return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);

}

name.addEventListener('click', validateName);
email.addEventListener('click', validateEmail);
message.addEventListener('click', validateMessage);