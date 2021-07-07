$(document).ready(function()
{
    $('button').on("click", function()
    {
        let name = $(this).attr('name');
        console.log(name);
        $.post("/LoginAction/server/joins.php", name, (data, status) =>
        {
            var data = JSON.parse(data);
            console.log(data);

            $('.tables').remove();
            $('.table-header-row').empty(); //remove tables from page after getting the data
            $('.table-data-row').empty(); //remove tables from page after getting the data

            let data_length = Object.keys(data).length;
            // loop over every index and display in the table

            // For Inner Join
            if(name == "inner")
            {
                $('.table-header-row').html(`
                    <td>Order Id</td>
                    <td>Customer Name</td>
                `);
                $('.table-data-row').html("<span class=\"table-data-row-data\"></span>")
                for(index in data)
                {
                    let rowData = JSON.parse(data[index]);
                    console.log(rowData);
                    // display data
                    // $('.table-data-row').append(`
                    //     <td>` + rowData.orderID + `</td>
                    //     <td>` + rowData.customer_name + `</td>`
                    // );
                }
            }
            // For Left Join
            if(name == "left")
            {
                for(index in data)
                {
                    let rowData = JSON.parse(data[index]);
                    console.log(rowData);
                    // display data
                    $('.table-header-row').html(`
                        <td>Customer Name</td>
                        <td>Order Id</td>
                    `);
                    $('.table-data-row').html(`
                        <td>` + rowData.customer_name + `</td>
                        <td>` + rowData.orderID + `</td>`
                    );
                }
            }
            // For Right Join
            if(name == "right")
            {
                for(index in data)
                {
                    let rowData = JSON.parse(data[index]);
                    console.log(rowData);
                    // display data
                    $('.table-header-row').html(`
                        <td>Customer Id</td>
                        <td>Customer Name</td>
                        <td>Country</td>
                    `);
                    $('.table-data-row').html(`
                        <td>` + rowData.customerID + `</td>
                        <td>` + rowData.customer_name + `</td>
                        <td>` + rowData.country + `</td>`
                    );
                }
            }
        });
    });
});

// Log Out Functionality
var logout = document.getElementById("logout");
if (logout.onclick = function()
{
    localStorage.removeItem("user");
    sessionStorage.removeItem("user");
    window.location = "/LoginAction/";
});

// Users heading name Functionality

var headingUserName = document.querySelector("#headingUsername");
if (localStorage.getItem("user") !== null)
{
    var username = localStorage.getItem("user");
}else
{
    var username = sessionStorage.getItem("user");
}
username = username.charAt(0).toUpperCase() + username.substring(1); // making the first character uppercase.
headingUserName.innerHTML = username;