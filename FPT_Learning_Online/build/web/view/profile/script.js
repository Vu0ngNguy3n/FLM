/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


var li_link = document.querySelectorAll(".links ul li");
var view_wraps = document.querySelectorAll(".view_wrap");

li_link.forEach(function (link) {
    link.addEventListener("click", function () {
        li_link.forEach(function (item) {
            item.classList.remove("active")
        })
        link.classList.add("active");

        var li_view = link.getAttribute("data-view");

        view_wraps.forEach(function (view) {
            view.style.display = "none";
        })


        if (li_view == "list-view") {
            document.querySelector("." + li_view).style.display = "block";
        } else {
            document.querySelector("." + li_view).style.display = "block";
        }

    })
})

