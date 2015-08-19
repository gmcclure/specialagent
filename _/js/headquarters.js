$(document).ready(function() {
    var typewatchOptions = {
        callback: function() { checkKeywordAvailability(); },
        captureLength: 0,
        wait: 500
    };

    $('#id_slug').typeWatch(typewatchOptions);

    function checkKeywordAvailability() {
        $('#availability_message').text('Checking availability ...');

        if (!$('#id_slug').val().match(/^[a-zA-Z0-9-_]+$/)) {
            $('#availability_message').text('Can only contain letters, numbers, underscores, or hyphens.');
        } else if ($('#id_slug').val().length < 3) {
            $('#availability_message').text('Too short ...');
        } else if ($('#id_slug').val().length > 100) {
            $('#availability_message').text('Too long ...');
        } else {
            $.get('/api/keycheck/' + $('#id_slug').val(),
                function(data) {
                    if (data['avail']) {
                        $('#availability_message').text('Available.');
                    } else {
                        $('#availability_message').text('Not available.');
                    }
                }
            );
        }
    }
});
