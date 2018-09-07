$("#new_service").validate({
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
    },
    "service[city_ids][]":{
      required: true
    }
  },
  // error messages
  messages: {
    name:{
      required: "Service name is required!",
      maxlength: "Service name must be less than 110.",
      minlength: "Service name must be more than 3."
    },
    city_ids:{
      required: "At leaset 1 city should be selected!",
    }
  }
});