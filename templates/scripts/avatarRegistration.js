$(document).ready(function()
{
    $("form").submit(function(event)
    {
        // fetching all the values from the form inn json format
        var formdata = {
            image: $("#avatar").val(),
            name: $("#name").val(),
            nickname: $("#nickname").val(),
            gender: $("#gender").val(),
            age: $("#age").val()
        };
        console.log(formdata);
        // performing an Ajax resquest to process form data
        $.ajax({
            type: "POST",
            url: "./database/validate.php",
            data: formdata,
            dataType: json,
            encode: true,
        }).done(function(data)
        {
            console.log(data);
        });
        event.preventDefault();
    });
});