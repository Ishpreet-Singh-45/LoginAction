$(document).ready(function()
{
    $(".d-flex").hover(function()
    {
        $(this).find($('span')).removeClass("bi-eye");
        $(this).find($('span')).addClass("bi-eye-fill");
    }, function()
    {
        $(this).find($('span')).removeClass("bi-eye-fill");
        $(this).find($('span')).addClass("bi-eye");
    });
});

// Log Out Functionality
var logout = document.getElementById("logout");
if (logout.onclick = function()
{
    localStorage.removeItem("username");
    localStorage.removeItem("password");
    window.location = "/LoginAction/";
});

// Users heading name Functionality
function getCookie(name)
{
    var name = name + "=";
    let array = decodeURIComponent(document.cookie).split(';'); // decode and get individual cookies
    // loop through each cookie to find the desired one
    for(let i =0; i < array.length; i++)
    {
        var cookie = array[i];
        while(cookie.charAt(0) == " ")
        {
            cookie = cookie.substring(1);
        }
        if (cookie.indexOf(name) == 0)
        {
            return cookie.substring(name.length, cookie.length)
        }
    }
}
var headingUserName = document.querySelector("#headingUserName");
let username = getCookie('username');
username = username.charAt(0).toUpperCase() + username.substring(1); // making the first character uppercase.
headingUserName.innerHTML = username;