// to submit a form via Ajax, remember the following points
/**
 * Capture the form submit button so that default action does not take place. 
 * Get all the data of the form using JQuery in JSON format
 * Submit the form using Ajax
 * Display errors if any
 */

 function validate(data)
 {
     if(data.length > 0){return true;}else{return false;}
 }

$(document).ready(function()
{
    $('form').submit((event) =>
    {
        event.preventDefault();

        var formData = {
            name: $('#name').val(),
            email: $('#email').val(),
            contact: $('#contact').val(),
            username: $('#username').val(),
            password: $('#password').val()
        };

        if (validate(formData.name) && validate(formData.email) && validate(formData.contact) && validate(formData.username) && validate(formData.password))
        {
            $.post("/LoginAction/server/signup.php", formData, (data,status, xhr) =>
            {
                var data = JSON.parse(data);
                console.log(data); // debugging purposes

                if (status == 'success' && xhr.readyState == 4 && data.is_valid)
                {
                    // show success message
                    $('#saved').html("<span style='font-size: 2rem; font-weight: 400'>" + data.message + "</span>");
                    $('#saved').append("<span class='bi bi-check2-circle ms-2' style='font-size: 2rem;'></span>");

                    // redirect to login page after 1.5 secs
                    setTimeout(function(){
                        window.location = "/LoginAction/templates/login.html";
                    }, 1500);
                }else if(data.is_valid == false)
                {
                    switch(data.errors.errorPoint)
                    {
                        case 'name':
                            $('#errorModal').modal('show');
                            $('.modal-body h4').css('color', "red");
                            $('#detailsError').text(data.errors.name);
                            break;
                        case 'email':
                            $('#errorModal').modal('show');
                            $('.modal-body h4').css('color', "red");
                            $('#detailsError').text(data.errors.email);
                            break;
                        case 'contact':
                            $('#errorModal').modal('show');
                            $('.modal-body h4').css('color', "red");
                            $('#detailsError').text(data.errors.contact);
                            break;
                        case 'username':
                            $('#errorModal').modal('show');
                            $('.modal-body h4').css('color', "red");
                            $('#detailsError').text(data.errors.username);
                            break;
                        case 'password':
                            $('#errorModal').modal('show');
                            $('.modal-body h4').css('color', "red");
                            $('#detailsError').text(data.errors.password);
                            break;
                        default:
                            $('#errorModal').modal('show');
                            $('.modal-body h4').css('color', "red");
                            $('#detailsError').text("Invalid Data! Please try again. ");
                    }
                }else
                {
                    console.log("Bugs Bunny!");
                }
            });
        }else
        {
            // show modal if all fields are empty
            $('#errorModal').modal('show');
            $('.modal-body h4').css('color', "red");
            $('#detailsError').text("Please fill all the fields!");
        }
    });
});
 
 

 

 
 function setCookie(name, value, exdays)
 {
     var date = new Date();
     date.setTime(date.getTime() + (exdays*24*60*60*1000));
     var expires = "expires=" + date.toUTCString();
     document.cookie = `${name}=${value}; ${expires}; path=/LoginAction`;
 }

/*
.alert-success
{
    color: #0f5132;
    background-color: #d1e7dd;
    border-color: #badbcc;
}
*/