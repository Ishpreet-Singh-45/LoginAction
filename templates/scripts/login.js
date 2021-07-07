// to submit a form via Ajax, remember the following points
/**
 * Capture the form submit button so that default action does not take place. 
 * Get all the data of the form using JQuery in JSON format
 * Submit the form using Ajax
 * Display errors if any
 */

function validate(data) // returns bool
{
    // check for empty strings
    if (data.length > 5){return true}else{return false};
}

$(document).ready(function()
{
    $('form').submit((event) =>
    {
        event.preventDefault();

        var formData = {
            username: $('#username').val(),
            password: $('#password').val()
        };

        // check if strings are empty or length is greater than 5
        if (validate(formData.username) && validate(formData.password))
        {
            // collect all values and post to the php file
            
            try
            {
                $.post("/LoginAction/server/login.php", formData, (data, status, xhr) =>
                {
                    var data = JSON.parse(data);
                    console.log(data); // debugging purposes
                
                    // admin authentication
                    if (data.adminauth)
                    {
                        redirect("/LoginAction/server/dashboard.php");
                    }
                    
                    let check = $('#rememberMe').is(":checked"); // returns boolean
                    console.log(check);
                    // For other users
                    if(status == "success" && xhr.readyState == 4 && data.details.auth == true)
                    {
                        if(check)
                        {
                            localStorage.setItem("user", formData.username);
                        }else
                        {
                            sessionStorage.setItem("user", formData.username);
                        }
                        redirect("/LoginAction/server/dashboard.php");
                    }else
                    {
                        // show message
                        $('#errorModal').modal('show');
                        $('.modal-body h4').css('color', "red");
                        $('#detailsError').text(data.details.error);
                    }
                });
            }catch(err)
            {
                console.log("Syntax Error!");
            }
        }else if(username.length == 0 || password.length == 0)
        {
            // show message
            $('#errorModal').modal('show');
            $('.modal-body h4').css('color', "red");
            $('#detailsError').text("Please fill all the fields!");
        }else
        {
            $('#errorModal').modal('show');
            $('.modal-body h4').css('color', "red");
            $('#detailsError').text("Invalid Details! Please try again. ");
        }
    });
});



function redirect(url)
{
    window.location = url;
}