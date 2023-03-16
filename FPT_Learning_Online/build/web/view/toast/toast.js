/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function showToast() {
    const successToast = document.getElementById('success-toast');
    successToast.classList.remove('hide');
    successToast.classList.add('show');
    setTimeout(() => {
      successToast.classList.remove('show');
      successToast.classList.add('hide');
    }, 3000);
  }
  
  