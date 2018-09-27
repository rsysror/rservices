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
$("#service_request_form").validate({
  errorPlacement: function (error, element) {
    error.insertBefore(element);
  },
  rules: {
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


// Validating 'Sub Service' on cient-side.
$("#sub_service_form").validate({
  errorPlacement: function (error, element) {
    error.insertBefore(element);
  },
  rules: {
    "service[name]":{
      required: true,
      maxlength: 115,
      minlength: 3
    },
    "service[price]":{
      required: true
    }
  },
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
  errorPlacement: function (error, element) {
    error.insertBefore(element);
  },
  rules: {
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
      minlength: 5,
      number: true
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
      minlength: "Pin code must be at-least 5 characters.",
      number: "Only digits are allowed!"
    },
    "address[landmark]":{
      maxlength: "Landmark must be less than 150 characters.",
      minlength: "Landmark must be at-least 5 character."
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


// Client-side validation for edit employee.
$("#edit_employee").validate({
  errorPlacement: function (error, element) {
    error.insertBefore(element);
  },
  rules: {
    "user[first_name]":{
      required: true,
      maxlength: 50,
      minlength: 3
    },
    "user[last_name]":{
      maxlength: 50,
      minlength: 3
    },
    "user[phone]":{
      maxlength: 13,
      minlength: 10,
      number: true
    }
  },
  messages: {
    "user[first_name]":{
      required: "First name is required!",
      maxlength: "Maximum 50 characters are allowed!",
      minlength: "Minimum 3 characters required!"
    },
    "user[last_name]":{
      maxlength: "Maximum 50 characters are allowed!",
      minlength: "Minimum 3 characters required!"
    },
    "user[phone]":{
      maxlength: "Maximum 13 characters are allowed!",
      minlength: "Minimum 10 characters required!",
      number: "Only digits are allowed!"
    }
  }
}); 

// Client-side validation for comment.
$("#comment_form").validate({
  errorPlacement: function (error, element) {
    error.insertBefore(element);
  },
  rules: {
    "service_request[comment]":{
      required: true,
      maxlength: 150,
      minlength: 15
    }
  },
  messages: {
    "service_request[comment]":{
      required: "Description is required!",
      maxlength: "Maximum 150 characters are allowed!",
      minlength: "Minimum 15 characters required!"
    }
  }
});

// validating company edit form.
$("#company_portfolio_edit").validate({
  errorPlacement: function (error, element) {
    error.insertBefore(element);
  },
  rules: {
    "portfolio[company_name]":{
      required: true,
      maxlength: 150,
      minlength: 3
    },
    "portfolio[experience]":{
      required: true,
      maxlength: 3,
      minlength: 1,
      number: true
    },
    "portfolio[company_ph_no]":{
      required: true,
      maxlength: 13,
      minlength: 10,
      number: true
    },
    "portfolio[about]":{
      maxlength: 190,
      required: true,
      minlength: 25
    },
    "portfolio[address]":{
      required: true,
      maxlength: 190,
      minlength: 25
    }
  },
  messages: {
    "portfolio[company_name]":{
      required: "Company name is required!",
      maxlength: "Maximum 150 characters are allowed!",
      minlength: "Minimum 5 characters required!"
    },
    "portfolio[experience]":{
      required: "Phone is required!",
      maxlength: "Maximum 3 characters are allowed!",
      minlength: "Minimum 1 characters required!",
      number: "Only digits are allowed!"
    },
    "portfolio[company_ph_no]":{
      required: "Phone is required!",
      maxlength: "Maximum 13 characters are allowed!",
      minlength: "Minimum 10 characters required!",
      number: "Only digits are allowed!"
    },
    "portfolio[about]":{
      required: "About is required!",
      maxlength: "Maximum 190 characters are allowed!",
      minlength: "Minimum 25 characters required!"
    },
    "portfolio[address]":{
      required: "Address is required!",
      maxlength: "Maximum 190 characters are allowed!",
      minlength: "Minimum 25 characters required!"
    }
  }
});

// Validating employee invation form.
$("#forgot-password").validate({
  errorPlacement: function (error, element) {
    error.insertBefore(element);
  },
  rules: {
    "user[email]":{
      required: true,
      maxlength: 150,
      email: true
    }
  },
  messages: {
    "user[email]":{
      required: "Description is required!",
      maxlength: "Maximum 150 characters are allowed!",
      email: "Wrong email formate!"
    }
  }
});

// Validating Company form.
$("#company_form").validate({
  errorPlacement: function (error, element) {
    error.insertBefore(element);
  },
  rules: {
    "portfolio_service[price]":{
      required: true,
      maxlength: 7,
      minlength: 1,
      number: true
    },
    "portfolio_service[service_id]":{
      required: true
    }
  },
  messages: {
    "portfolio_service[price]":{
      required: "Price is required!",
      minlength: "Minimum 1 characters required!",
      maxlength: "Maximum 7 characters are allowed!",
      number: "Only digits are allowed!"
    },
    "portfolio_service[service_id]":{
      required: "Sub service is required!"
    }
  }
});

// Validating Company eedit form.
$("#company_edit_form").validate({
  errorPlacement: function (error, element) {
    error.insertBefore(element);
  },
  rules: {
    "portfolio_service[price]":{
      required: true,
      maxlength: 7,
      minlength: 1,
      number: true
    }
  },
  messages: {
    "portfolio_service[price]":{
      required: "Price is required!",
      minlength: "Minimum 1 characters required!",
      maxlength: "Maximum 7 characters are allowed!",
      number: "Only digits are allowed!"
    }
  }
});