$().ready(function () {
 
    $("#registrationForm").validate({
        rules: {
           txtName: "required",
           registerEmail: "required",
           registerPassword:{
            required: true,
            minlength: 3
           },        
           registerConfirmPassword: {
                required: true,
                equalTo: "registerPassword"
            },
        },
        messages:{
            txtName:"Enter Your Name",
            registerEmail: "required",
            registerPassword:{
                required:"Enter Password",
                minlength: "must be 3 characters or more"
            },
            registerConfirmPassword: {
                required: "Enter Pasword",
                equalTo:"Enter Same Password as Above"
            }
   
        }
    });
   });