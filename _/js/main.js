$(function(){
    $.ajaxSetup({
        // ajax responses should not be cached
        cache: false
    });

    // csrf protection for ajax post requests
    // https://docs.djangoproject.com/en/1.3/ref/contrib/csrf/
    $(document).ajaxSend(function(event, xhr, settings) {
        function getCookie(name) {
            var cookieValue = null;
            if (document.cookie && document.cookie != '') {
                var cookies = document.cookie.split(';');
                for (var i = 0; i < cookies.length; i++) {
                    var cookie = jQuery.trim(cookies[i]);
                    // Does this cookie string begin with the name we want?
                    if (cookie.substring(0, name.length + 1) == (name + '=')) {
                        cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                        break;
                    }
                }
            }
            return cookieValue;
        }
        function sameOrigin(url) {
            // url could be relative or scheme relative or absolute
            var host = document.location.host; // host + port
            var protocol = document.location.protocol;
            var sr_origin = '//' + host;
            var origin = protocol + sr_origin;
            // Allow absolute or scheme relative URLs to same origin
            return (url == origin || url.slice(0, origin.length + 1) == origin + '/') ||
                (url == sr_origin || url.slice(0, sr_origin.length + 1) == sr_origin + '/') ||
                // or any other URL that isn't scheme relative or absolute i.e relative.
                !(/^(\/\/|http:|https:).*/.test(url));
        }
        function safeMethod(method) {
            return (/^(GET|HEAD|OPTIONS|TRACE)$/.test(method));
        }

        if (!safeMethod(settings.type) && sameOrigin(settings.url)) {
            xhr.setRequestHeader("X-CSRFToken", getCookie('csrftoken'));
        }
    });
    
    // available typefaces for the precis editor
    window.typefaces = [
        ['default', 'Arial'], ['2dumb', '2Dumb'], ['3dumb', '3Dumb'], ['aaargh', 'Aaargh'], ['aftasans', 'AftaSans'], 
        ['anagram', 'Anagram'], ['aurulentsans', 'AurulentSans'], ['ballpark', 'Ballpark Weiner'], ['bebasneue', 'BebasNeue'], 
        ['bevan', 'Bevan'], ['bitstreamverasans', 'Bitstream Vera Sans'], ['calligraffiti', 'Calligraffiti'],
        ['charissil', 'Charissil'], ['chunkfive', 'ChunkFive'], ['destroy', 'Destroy'], ['devroye', 'Devroye'],
        ['district', 'District'], ['ebgaramond', 'EBGaramond'], ['elliotsix', 'ElliotSix'], ['eraser', 'Eraser'],
        ['fanwood', 'Fanwood'], ['ffftusjbold', 'FFFTusJ'], ['gladifiltheftegladifilthefte', 'GladIFilTheFte'], 
        ['goudybookletter1911', 'Goudy Book Letter 1911'], ['harabarahanditalic', 'Harabarahand'], ['hillhousemedium', 'HillHouse'], 
        ['honeyscriptlight', 'HoneyScript'], ['impactlabel', 'Impact'], ['jinky', 'Jinky'], ['justoldfashion', 'JustOldFashion'], 
        ['kfon', 'KFon'], ['komikatitle', 'Komika'], ['kristimedium', 'Kristi'], ['lindenhill', 'Linden Hill'], 
        ['marketingscript', 'Marketing Script'], ['mutluornamental', 'Mutlo'], ['powellantique', 'Powell Antique'], 
        ['raleway', 'Raleway'], ['riesling', 'Riesling'], ['romancaps', 'RomanCaps'], ['scriptina', 'Scriptina'], 
        ['seasideresortnf', 'Seaside Resort'], ['serif', 'Times'], ['sfwondercomic', 'SF Wonder Comic'], ['slingnormal', 'Sling'], 
        ['snickles', 'Snickles'], ['soucisans', 'SouciSans'], ['tenderness', 'Tenderness'], ['uppereastside', 'Upper Eastside'], 
        ['vag', 'VAG'], ['windsong', 'Windsong'],
    ];

    function pagesync(method, model, success, error) {
        var resp;

        this.read = function (model) {
            console.log('reading: ' + JSON.stringify(model));
        }

        this.update = function (model) {
            $.ajax({
                type: 'PUT',
                url: '/page/' + model.id,
                data: JSON.stringify(model),
                success: function(msg) { alert(msg); }
            });
            console.log('updating: ' + model.url());
        }

        switch(method) {
            case 'read': 
                resp = this.read(model);
                break;

            case 'update':
                resp = this.update(model);
                break;
            
            default:
                return success;
        }

        return success;
    }

    window.Page = Backbone.Model.extend({
        'sync' : pagesync,
        'url'  : function() { return '/page/' + this.id },
    });

    window.PageView = Backbone.View.extend({
        el: $('div#controlpanel'),

        initialize: function() {
            _.bindAll(this, 'render');
            this.model.bind('change', this.render);
        },

        markdown: new Showdown.converter(),

        render: function() {
            $('body').css('background-color', this.model.get('bgColor'));

            // headline rendering
            $('#headline').css('color', this.model.get('headlineColor'));
            $('#headline').css('font-size', this.model.get('headlinePixelSize') + 'px');
            $('#headline').text(this.model.get('headlineText'));
            // -- next line fixes position shifting bug by taking element out of flow
            $('#headline').css('position', 'absolute');
            $('#headline').offset({ 
                'top'  : window.page.get('headlineTop'),
                'left' : window.page.get('headlineLeft')
            });
            $('#headline_text').val(this.model.get('headlineText'));
            $('#headline').removeClass().addClass('ui-draggable').addClass(this.model.get('headlineFontclass'));

            // status rendering
            $('#status').css('color', this.model.get('statusColor'));
            $('#status').css('font-size', this.model.get('statusPixelSize') + 'px');
            $('#status').text(this.model.get('statusText'));
            // -- next line fixes position shifting bug by taking element out of flow
            $('#status').css('position', 'absolute');
            $('#status').offset({ 
                'top'  : window.page.get('statusTop'),
                'left' : window.page.get('statusLeft')
            });
            $('#status_text').val(this.model.get('statusText'));
            $('#status').removeClass().addClass('ui-draggable').addClass(this.model.get('statusFontclass'));

            // story rendering
            $('#story').css('color', this.model.get('storyColor'));
            $('#story').css('font-size', this.model.get('storyPixelSize') + 'px');
            $('#story').html(this.markdown.makeHtml(this.model.get('storyText')));
            // -- next line fixes position shifting bug by taking element out of flow
            $('#story').css('position', 'absolute');
            $('#story').offset({
                'top'  : window.page.get('storyTop'),
                'left' : window.page.get('storyLeft')
            });
            $('#story_text').val(window.page.get('storyText'));
            $('#story').removeClass().addClass('ui-draggable').addClass(this.model.get('storyFontclass'));

            // background rendering
            if (this.model.get('bgImage') != '' && this.model.get('bgPaint')) {
                this.model.set({bgPaint: false}, { silent: true });
                if (this.model.get('bgDisabled')) {
                    $('#background_toggle').text('Show Background');
                    $.backstretch( '/_/images/transparent.png' );
                } else {
                    $('#background_toggle').text('Hide Background');
                    $.backstretch( window.page.get('bgImage') );
                }
            }

            // contact form
            $('#linkbox').offset({
                'top'  : window.page.get('linkboxTop'),
                'left' : window.page.get('linkboxLeft')
            });

            if (this.model.get('linkboxEnabled') && $('#contact_form_button').length == 0) {
                $('#contact_form_toggle').button({ label: 'Hide Contact Button' });
                $('#linkbox').append('<button id="contact_form_button">Contact Agent</button>');
                $('#contact_form_button').button()
                $('#contact_form_button').bind('click', this.displayContactForm);
            } else if (!this.model.get('linkboxEnabled')) {
                $('#contact_form_toggle').button({ label: 'Show Contact Button' });
                $('#contact_form_button').remove();
            } else {
                ;
            }

            // end o'the line
            return this;
        },

        events: {
            'keyup #headline_text'           : 'changeHeadline',
            'click #headline_inflater'       : 'inflateHeadline',
            'click #headline_deflater'       : 'deflateHeadline',
            'change #headline_font_selector' : 'changeHeadlineFont',
            'keyup #status_text'             : 'changeStatus',
            'click #status_inflater'         : 'inflateStatus',
            'click #status_deflater'         : 'deflateStatus',
            'change #status_font_selector'   : 'changeStatusFont',
            'keyup #story_text'              : 'changeStory',
            'click #story_inflater'          : 'inflateStory',
            'click #story_deflater'          : 'deflateStory',
            'change #story_font_selector'    : 'changeStoryFont',
            'click #background_toggle'       : 'toggleBackground',
            'click #contact_form_toggle'     : 'toggleContactForm',
        },

        changeHeadline: function() {
            var headlineText = $('#headline_text').val();
            this.model.set({headlineText: headlineText});
        },

        inflateHeadline: function() {
            var headlineSize = parseInt(this.model.get('headlinePixelSize'));
            if (headlineSize < 96) {
                headlineSize += 4;
            }
            this.model.set({headlinePixelSize: headlineSize});
        },

        deflateHeadline: function() {
            var headlineSize = parseInt(this.model.get('headlinePixelSize'));
            if (headlineSize > 8) {
                headlineSize -= 4;
            }
            this.model.set({headlinePixelSize: headlineSize});
        },

        changeHeadlineFont: function() {
            var newFontclass = $('#headline_font_selector option:selected').val();
            this.model.set({headlineFontclass: newFontclass});
        },

        changeStatus: function() {
            var statusText = $('#status_text').val();
            this.model.set({statusText: statusText});
        },

        inflateStatus: function() {
            var statusSize = parseInt(this.model.get('statusPixelSize'));
            if (statusSize < 96) {
                statusSize += 4;
            }
            this.model.set({statusPixelSize: statusSize});
        },

        deflateStatus: function() {
            var statusSize = parseInt(this.model.get('statusPixelSize'));
            if (statusSize > 8) {
                statusSize -= 4;
            }
            this.model.set({statusPixelSize: statusSize});
        },

        changeStatusFont: function() {
            var newFontclass = $('#status_font_selector option:selected').val();
            this.model.set({statusFontclass: newFontclass});
        },

        changeStory: function() {
            this.model.set({storyText: $('#story_text').val()});
        },

        inflateStory: function() {
            var storySize = parseInt(this.model.get('storyPixelSize'));
            if (storySize < 96) {
                storySize += 4;
            }
            this.model.set({storyPixelSize: storySize});
        },

        deflateStory: function() {
            var storySize = parseInt(this.model.get('storyPixelSize'));
            if (storySize > 8) {
                storySize -= 4;
            }
            this.model.set({storyPixelSize: storySize});
        },

        changeStoryFont: function() {
            var newFontclass = $('#story_font_selector option:selected').val();
            this.model.set({storyFontclass: newFontclass});
        },

        toggleBackground: function() {
            this.model.set({bgPaint: true}, { silent: true });
            if (this.model.get('bgDisabled')) {
                this.model.set({bgDisabled: false});
            } else {
                this.model.set({bgDisabled: true});
            }
        },

        toggleContactForm: function() {
            if (this.model.get('linkboxEnabled')) {
                this.model.set({linkboxEnabled: false});
            } else {
                this.model.set({linkboxEnabled: true});
            }
        },

        displayContactForm: function() {
            $('#contact_form').dialog({
                modal: true,
                title: 'Send Message to Agent',
                width: 370,
                buttons: {
                    'Close': function() { $(this).dialog('close'); }
                }
            });
        },
    });

    // initialize page elements
    $.getJSON('/page/' + $('#profile_id').val(), function(data){
        window.page = new Page({ 
            'id'                : data['profile_id'],
            'bgColor'           : data['bg_color'],
            'bgImage'           : data['bg_image'],
            'bgDisabled'        : data['bg_disabled'],
            // bgPaint is not a database field
            // set to true so bg shows when page initialized
            'bgPaint'           : true,
            'headlineText'      : data['headline_text'],
            'headlineTop'       : data['headline_top'],
            'headlineLeft'      : data['headline_left'],
            'headlineColor'     : data['headline_color'],
            'headlinePixelSize' : data['headline_pixel_size'],
            'headlineFontclass' : data['headline_fontclass'],
            'statusText'        : data['status_text'],
            'statusTop'         : data['status_top'],
            'statusLeft'        : data['status_left'],
            'statusColor'       : data['status_color'],
            'statusPixelSize'   : data['status_pixel_size'],
            'statusFontclass'   : data['status_fontclass'],
            'storyText'         : data['story_text'],
            'storyTop'          : data['story_top'],
            'storyLeft'         : data['story_left'],
            'storyColor'        : data['story_color'],
            'storyPixelSize'    : data['story_pixel_size'],
            'storyFontclass'    : data['story_fontclass'],
            'linkboxTop'        : data['linkbox_top'],
            'linkboxLeft'       : data['linkbox_left'],
            'linkboxEnabled'    : data['linkbox_enabled'],
        });

        window.pageview = new PageView({ model: page });
        window.page.change(); // trigger page render

        // populate font selector dropdowns
        var typeface_sz = window.typefaces.length;
        for (var i=0; i<typeface_sz; ++i) {
            $('<option />')
                .attr('value', 'typeface-' + window.typefaces[i][0])
                .text(window.typefaces[i][1])
                .appendTo('.font_selector');
        }

		if ($('#controlpanel').size()>0) {
			// initialize jquery ui elements
			$('#headline').draggable({ containment: 'document', handle: 'div.draghandle' });
			$('#status').draggable({ containment: 'document' });
			$('#story').draggable({ containment: 'document' });
			$('#linkbox').draggable({ containment: 'document' });
			$('#controlpanel').draggable({ containment: 'document' });
			$('#cp_tabs').tabs();
			$('#text_controls').accordion({ fillSpace: true });
			$('#contact_form_toggle').button();
		}

        /* 
        // setup bindings & set initial values
        */ 

        // binding to toggle the control panel
        $('a#cp_toggle').click(function(){
            $('div#controlpanel').toggle('slow');
        });

        // binding to save the page model
        $('button#cp_save').click(function(){
            window.page.save();
        });

        // create & bind background color picker
        $('input#background_color_button').val(window.page.get('bgColor'));
        $('input#background_color_button').miniColors({
            change: function(hex, rgb) { 
                window.page.set({ bgColor: hex });
            }
        });

        // background image
        if (window.page.get('bgImage') != '' && window.page.get('bgDisabled') === '0') {
            $.backstretch( window.page.get('bgImage') );
        }

        // setup headline
        $('#headline').bind('dragstop', function() {
            var headlineoffset = $('#headline').offset();
            window.page.set({ 'headlineLeft': headlineoffset.left, 'headlineTop': headlineoffset.top });
        });

        // create & bind headline color picker
        $('input#headline_color_button').val(window.page.get('headlineColor'));
        $('input#headline_color_button').miniColors({
            change: function(hex, rgb) { 
                window.page.set({ headlineColor: hex });
            }
        });
        $('#headline_font_selector').val(window.page.get('headlineFontclass'));

        // setup status
        $('#status').bind('dragstop', function() {
            var statusoffset = $('#status').offset();
            window.page.set({ 'statusLeft': statusoffset.left, 'statusTop': statusoffset.top });
        });

        // create & bind status color picker
        $('input#status_color_button').val(window.page.get('statusColor'));
        $('input#status_color_button').miniColors({
            change: function(hex, rgb) { 
                window.page.set({ statusColor: hex });
            }
        });
        $('#status_font_selector').val(window.page.get('statusFontclass'));

        // setup story
        $('#story').bind('dragstop', function() {
            var storyoffset = $('#story').offset();
            window.page.set({ 'storyLeft': storyoffset.left, 'storyTop': storyoffset.top });
        });

        // create & bind story color picker
        $('input#story_color_button').val(window.page.get('storyColor'));
        $('input#story_color_button').miniColors({
            change: function(hex, rgb) { 
                window.page.set({ storyColor: hex });
            }
        });
        $('#story_font_selector').val(window.page.get('storyFontclass'));

        // setup linkbox
        $('#linkbox').bind('dragstop', function() {
            var linkboxoffset = $('#linkbox').offset();
            window.page.set({ 'linkboxLeft': linkboxoffset.left, 'linkboxTop': linkboxoffset.top });
        });

        // setup contact form bindings
        $('form#contact').submit(function(e) {
            e.preventDefault();

            $.post('/contact_agent/', $('form#contact').serialize(),
                function(data) {
                    if (data['success']) {
                        $('#contact_form').html(data['html']);
                        $('#contact_form').one('dialogclose', function() {
                            window.location.reload();
                        });
                    } else {
                        $('#contact_form #form_inputs').html(data['html']);
                    }
                }
            );
        });
    });
});
