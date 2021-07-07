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
    $(".createDB").hover(function()
    {
        $(this).find($('span')).removeClass("bi-plus");
        $(this).find($('span')).addClass("bi-plus-lg");
    }, function()
    {
        $(this).find($('span')).removeClass("bi-plus-lg");
        $(this).find($('span')).addClass("bi-plus");
    });
    $(".createRec").hover(function()
    {
        $(this).find($('span')).removeClass("bi-file-earmark-plus");
        $(this).find($('span')).addClass("bi-file-earmark-plus-fill");
    }, function()
    {
        $(this).find($('span')).removeClass("bi-pfile-earmark-plus-fill");
        $(this).find($('span')).addClass("bi-file-earmark-plus");
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