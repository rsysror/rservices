// Validating User form on client side.
$("#new_user").validate({
  //error place
  errorPlacement: function (error, element) {
    error.insertBefore(element);
  },
//adding rule
  rules: {
    // username is required with max of 20 and min of 6
    "user[name]":{
      required: true,
      maxlength: 20,
      minlength: 6
    },
    // // email is required with format
    // "user[email]": {
    //   required: true,
    //   email: true
    // },
    // // password is required
    // "user[password]": {
    //   required: true
    // },
    // // password_confirmation is required and is the same with password
    // "user[password_confirmation]": {
    //   required: true,
    //   equalTo: "#user_password"
    // },
    // // introduction is optional with maxlenght 500
    // "user[password_confirmation]": {
    //   maxlength: 500
    // }
  },
  // error messages
  messages: {
    name:{
      required: "User name is required.",
      maxlength: "User name must be less than 20",
      minlength: "User name must be more than 6"
    },
    // mail:{
    //   required: "Email is required",
    //   email: "Please enter a valid email address"
    // },
    // password: {
    //   required: "Password is required"
    // },
    // password_confirmation: {
    //   required: "Password confirmation is required",
    //   equalTo: "Password and password confirmation must be same"
    // }
  }
});


// Validating service on cient side.
$("#service_form").validate({
  //error place
  errorPlacement: function (error, element) {
    error.insertBefore(element);
  },
  debug: true,
//adding rule
  rules: {
    // username is required with max of 20 and min of 6
    "service[name]":{
      required: true,
      maxlength: 115,
      minlength: 3
    },
    "service[city_ids][]":{
      required: true
    }
  },
  // error messages
  messages: {
    "service[name]":{
      required: "Service name is required!",
      maxlength: "Service name must be less than 115 characters.",
      minlength: "Service name must be more than 3 characters."
    },
    "service[city_ids][]":{
      required: "At leaset 1 city should be selected!",
    }
  }
});


// Validating service on cient side.
$("#sub_service_form").validate({
  //error place
  errorPlacement: function (error, element) {
    error.insertBefore(element);
  },
  //adding rule
  rules: {
    // username is required with max of 20 and min of 6
    "service[name]":{
      required: true,
      maxlength: 115,
      minlength: 3
    }
  },
  // error messages
  messages: {
    "service[name]":{
      required: "Sub service name is required!",
      maxlength: "Sub service name must be less than 115 characters.",
      minlength: "Sub service name must be more than 3 characters."
    }
  }
});