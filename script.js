$(document).ready(function() {
    $('#signup-form').validate({
        rules: {
            fname: {
                required: true,
                minlength: 4
            },
            sname: {
                required: true,
                minlength: 4
            },
            emailAddress: {
                required: true,
                email: true,
                number: true
            },
            password: {
                required: true,
                minlength: 8,
                maxlength: 12
            },

            day: {
                required: true
            },
            month: {
                required: true
            },
            year: {
                required: true
            },
            gender: {
                required: true
            }
        }
    })
})