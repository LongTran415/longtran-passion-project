//= require bootstrap/scrollspy
//= require bootstrap/modal
//= require bootstrap/dropdowni
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function myFunction() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
        x.className += " responsive";
    } else {
        x.className = "topnav";
    }
}
