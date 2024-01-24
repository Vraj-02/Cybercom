$().ready(function() {

    $("#frm").validate({
    rules: {
       txtFirstname: "required",
       txtLastname: "required",
       patientGender: "required",
       day:"required",
       month:"required",
       year:"required",
       numHeight:{
           required:true,
           max:300,
       },
       numWeight:"required",
       patEmail:{
           required:true,
           email:true
       },
       txtReason:"required",
    },
   messages: {
       patientGender: "Please select gender",
       txtFirstname: "Please enter your firstname",
       txtLastname: "Please enter your lastname",
       patEmail: "Please enter a valid email address",
       day:"select day",
       month:"select month",
       year:"select year",
       numHeight:{
           required:"Enter Height",
           max:"height is too high"
       },
       numWeight:"Enter Weight",
       patEmail:{
           required:"Enter Email",
           email:"Enter Valid Email"
       },
       txtReason: "Enter Reason"
    },
    errorPlacement: function (error, element) {
       error.css({ "color": "red" });
       error.insertAfter(element);
   },

   highlight: function (element, errorClass, validClass) {
       $(element).css({ "border": "1px solid red" });
   },
   unhighlight: function (element, errorClass, validClass) {
       $(element).css({ "border": "1px solid #ccc" });
   },
    submitHandler: function(form) {          
       form.submit();
       alert("your details has been succesfully added");        
    },
    invalidHandler: function (event, validator) {           
       alert("missing data go to top of form");
   }
});
});