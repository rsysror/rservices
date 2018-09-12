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
$("#new_service").validate({
  //error place
  errorPlacement: function (error, element) {
    error.insertBefore(element);
  },
  //adding rule
  rules: {
    // name is required with max of 20 and min of 6
    "service[name]":{
      required: true,
      maxlength: 115,
      minlength: 3
    },
    "service[city_ids][]":{
      required: true
    },
    "service[photo]":{
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
    },
    "service[photo]":{
      required: "Please upload a photo!",
    }
  }
});


// Validating 'Sub Service' on cient side.
$(".sub_service").validate({
  //error place
  errorPlacement: function (error, element) {
    error.insertBefore(element);
  },
  //adding rule
  rules: {
    // name is required with max of 20 and min of 6
    "service[name]":{
      required: true,
      maxlength: 115,
      minlength: 3
    },
    "service[price]":{
      required: true
    }
  },
  // error messages
  messages: {
    "service[name]":{
      required: "Sub service name is required!",
      maxlength: "Sub service name must be less than 115 characters.",
      minlength: "Sub service name must be more than 3 characters."
    },
    "service[price]":{
      required: "Price is required!"
    }
  }
});

// Validating 'address' on cient side.
$("#address_form").validate({
  //error place
  errorPlacement: function (error, element) {
    error.insertBefore(element);
  },
  //adding rule
  rules: {
    // name is required with max of 20 and min of 6
    "address[flat_number]":{
      required: true,
      maxlength: 50,
      minlength: 1
    },
    "address[street_name]":{
      maxlength: 150,
      minlength: 5
    },
    "address[pin_code]":{
      required: true,
      maxlength: 10,
      minlength: 5
    },
    "address[landmark]":{
      maxlength: 150,
      minlength: 5
    },
    "country_selection":{
      required: true
    },
    "state_selection":{
      required: true
    },
    "city_id":{
      required: true
    }
  },
  // error messages
  messages: {
    "address[flat_number]":{
      required: "Flat No. is required!",
      maxlength: "Flat No. must be less than 50 characters.",
      minlength: "Flat No. must be at-least 1 character."
    },
    "address[street_name]":{
      maxlength: "Street name must be less than 150 characters.",
      minlength: "Street name must be at-least 5 characters."
    },
    "address[pin_code]":{
      required: "Pin code is required!",
      maxlength: "Pin code must be less than 10 characters.",
      minlength: "Pin code must be at-least 5 characters."
    },
    "address[landmark]":{
      maxlength: "Landmark must be less than 150 characters.",
      minlength: "Landmark must be at-least 1 character."
    },
    "country_selection":{
      required: "Country is required!",
    },
    "state_selection":{
      required: "State is required!",
    },
    "city_id":{
      required: "City is required!",
    },
  }
}); 