/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
window.alert = function (message) {
    const alert = document.createElement('div');
    alert.classList.add('alert');
    const alertButton = document.createElement('button');
    alertButton.innerText = 'OK';
    alert.setAttribute('style',`
        position: fixed;
        background-color: white;
        top:5%;
        left:50%;
        padding:20px;
        border-radius: 10px;
        box-shadow: 0 10px 5px 0 #00000022;
        display: flex;
        flex-direction: column;
        border: 1px solid #333;
        transform: translateX(-50%);
    `);
    alertButton.setAttribute('style',`
        border: 1px solid #333;
        background: orange;
        border-radius:5px;
        padding: 5px;
    `);
    alert.innerHTML = `<span style="padding:10px;">${message}</span>`;
    alert.appendChild(alertButton);
    alertButton.addEventListener('click', (e)=>{
        alert.remove();
    });
    setTimeout(alert.remove(),3000);
    document.body.appendChild(alert);
};

