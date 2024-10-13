function getURLVar(key) {
    var value = [];
    var query = String(document.location).split('?');
    if (query[1]) {
        var part = query[1].split('&');
        for (i = 0; i < part.length; i++) {
            var data = part[i].split('=');
            if (data[0] && data[1]) {
                value[data[0]] = data[1];
            }
        }
        if (value[key]) {
            return value[key];
        } else {
            return '';
        }
    }
}

function scrollToDesc() {
    //$.scrollTo($('#personallised-pro1').offset().top - 100, 1000);
    $('html, body').animate({
        scrollTop: $("#personallised-pro1").offset().top
    }, 500)
}

function showHidePassword() {
    var typ = $('#input-regpassword').attr('type');
    //console.log($('#input-regpassword').attr('type'));
    
    if(typ === "password") {
        document.getElementById('input-regpassword').type = 'text';
        $('.pass_show').addClass('show');
    }
    else {
        document.getElementById('input-regpassword').type = 'password';
        $('.pass_show').removeClass('show');
    }
}


$(document).ready(function() {
    $('.text-danger').each(function() {
        var element = $(this).parent().parent();
        if (element.hasClass('form-group')) {
            element.addClass('has-error');
        }
    });
    $('#form-currency .currency-select').on('click', function(e) {
        e.preventDefault();
        $('#form-currency input[name=\'code\']').val($(this).attr('name'));
        $('#form-currency').submit();
    });
    $('#form-language .language-select').on('click', function(e) {
        e.preventDefault();
        $('#form-language input[name=\'code\']').val($(this).attr('name'));
        $('#form-language').submit();
    });
    $('#search input[name=\'search\']').parent().find('button').on('click', function() {
        var url = $('base').attr('href') + 'index.php?route=product/search';
        var value = $('header #search input[name=\'search\']').val();
        if (value) {
            url += '&search=' + encodeURIComponent(value.split(' ').join('-'));
        }
        location = url;
    });
    $('#search input[name=\'search\']').on('keydown', function(e) {
        if (e.keyCode == 13) {
            $('header #search input[name=\'search\']').parent().find('button').trigger('click');
        }
    });
    $('#menu .dropdown-menu').each(function() {
        var menu = $('#menu').offset();
        var dropdown = $(this).parent().offset();
        var i = (dropdown.left + $(this).outerWidth()) - (menu.left + $('#menu').outerWidth());
        if (i > 0) {
            $(this).css('margin-left', '-' + (i + 10) + 'px');
        }
    });
    $('#list-view').click(function() {
        $('#content .product-grid > .clearfix').remove();
        $('#content .row > .product-grid').attr('class', 'product-layout product-list col-xs-6');
        $('#grid-view').removeClass('active');
        $('#list-view').addClass('active');
        localStorage.setItem('display', 'list');
    });
    $('#grid-view').click(function() {
        var cols = $('#column-right, #column-left').length;
        if (cols == 2) {
            $('#content .product-list').attr('class', 'product-layout product-grid col-lg-6 col-md-6 col-sm-12 col-xs-6');
        } else if (cols == 1) {
            $('#content .product-list').attr('class', 'product-layout product-grid col-lg-3 col-md-4 col-sm-6 col-xs-6');
        } else {
            $('#content .product-list').attr('class', 'product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-6');
        }
        $('#list-view').removeClass('active');
        $('#grid-view').addClass('active');
    });
    if (localStorage.getItem('display') == 'list') {
        $('#list-view').trigger('click');
        $('#list-view').addClass('active');
    } else {
        $('#grid-view').trigger('click');
        $('#grid-view').addClass('active');
    }
    $(document).on('keydown', '#collapse-checkout-option input[name=\'email\'], #collapse-checkout-option input[name=\'password\']', function(e) {
        if (e.keyCode == 13) {
            $('#collapse-checkout-option #button-login').trigger('click');
        }
    });
    $('[data-toggle=\'tooltip\']').tooltip({
        container: 'body'
    });
    $(document).ajaxStop(function() {
        $('[data-toggle=\'tooltip\']').tooltip({
            container: 'body'
        });
    });
});
var cart = {
    'add': function(product_id, quantity) {
        $.ajax({
            url: 'index.php?route=checkout/cart/add',
            type: 'post',
            data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
            dataType: 'json',
            beforeSend: function() {
                $('#cart > button').button('loading');
            },
            complete: function() {
                $('#cart > button').button('reset');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();
                if (json['redirect']) {
                    location = json['redirect'];
                }
                if (json['success']) {
                    $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    setTimeout(function() {
                        $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
                    }, 100);
                    $('html, body').animate({
                        scrollTop: 0
                    }, 'slow');
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    },
    'update': function(key, quantity) {
        $.ajax({
            url: 'index.php?route=checkout/cart/edit',
            type: 'post',
            data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
            dataType: 'json',
            beforeSend: function() {
                $('#cart > button').button('loading');
            },
            complete: function() {
                $('#cart > button').button('reset');
            },
            success: function(json) {
                setTimeout(function() {
                    $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
                }, 100);
                if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/cart';
                } else {
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    },
    'remove': function(key) {
        $.ajax({
            url: 'index.php?route=checkout/cart/remove',
            type: 'post',
            data: 'key=' + key,
            dataType: 'json',
            beforeSend: function() {
                $('#cart > button').button('loading');
            },
            complete: function() {
                $('#cart > button').button('reset');
            },
            success: function(json) {
                /*setTimeout(function() {
                    $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
                }, 100);
                if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/cart';
                } else {
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }*/
                location = 'index.php?route=checkout/cart';
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }
}
var voucher = {
    'add': function() {},
    'remove': function(key) {
        $.ajax({
            url: 'index.php?route=checkout/cart/remove',
            type: 'post',
            data: 'key=' + key,
            dataType: 'json',
            beforeSend: function() {
                $('#cart > button').button('loading');
            },
            complete: function() {
                $('#cart > button').button('reset');
            },
            success: function(json) {
                setTimeout(function() {
                    $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
                }, 100);
                if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
                    location = 'index.php?route=checkout/cart';
                } else {
                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    }
}
var wishlist = {
    'add': function(product_id) {
        $.ajax({
            url: 'index.php?route=account/wishlist/add',
            type: 'post',
            data: 'product_id=' + product_id,
            dataType: 'json',
            success: function(json) {
                $('.alert').remove();
                if (json['redirect']) {
                    location = json['redirect'];
                }
                /*if (json['success']) {
                    $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                }*/
                $('#wishlist-total span').html(json['total']);
                $('#wishlist-total').attr('title', json['total']);
                /*$('html, body').animate({
                    scrollTop: 0
                }, 'slow');*/
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    },
    'remove': function() {}
}
var compare = {
    'add': function(product_id) {
        $.ajax({
            url: 'index.php?route=product/compare/add',
            type: 'post',
            data: 'product_id=' + product_id,
            dataType: 'json',
            success: function(json) {
                $('.alert').remove();
                if (json['success']) {
                    $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                    $('#compare-total').html(json['total']);
                    $('html, body').animate({
                        scrollTop: 0
                    }, 'slow');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    },
    'remove': function() {}
}
$(document).delegate('.agree', 'click', function(e) {
    e.preventDefault();
    $('#modal-agree').remove();
    var element = this;
    $.ajax({
        url: $(element).attr('href'),
        type: 'get',
        dataType: 'html',
        success: function(data) {
            html = '<div id="modal-agree" class="modal">';
            html += '  <div class="modal-dialog">';
            html += '    <div class="modal-content">';
            html += '      <div class="modal-header">';
            html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
            html += '        <h4 class="modal-title">' + $(element).text() + '</h4>';
            html += '      </div>';
            html += '      <div class="modal-body">' + data + '</div>';
            html += '    </div';
            html += '  </div>';
            html += '</div>';
            $('body').append(html);
            $('#modal-agree').modal('show');
        }
    });
});
(function($) {
    $.fn.autocomplete = function(option) {
        return this.each(function() {
            this.timer = null;
            this.items = new Array();
            $.extend(this, option);
            $(this).attr('autocomplete', 'off');
            $(this).on('focus', function() {
                this.request();
            });
            $(this).on('blur', function() {
                setTimeout(function(object) {
                    object.hide();
                }, 200, this);
            });
            $(this).on('keydown', function(event) {
                switch (event.keyCode) {
                    case 27:
                        this.hide();
                        break;
                    default:
                        this.request();
                        break;
                }
            });
            this.click = function(event) {
                event.preventDefault();
                value = $(event.target).parent().attr('data-value');
                if (value && this.items[value]) {
                    this.select(this.items[value]);
                }
            }
            this.show = function() {
                var pos = $(this).position();
                $(this).siblings('ul.dropdown-menu').css({
                    top: pos.top + $(this).outerHeight(),
                    left: pos.left
                });
                $(this).siblings('ul.dropdown-menu').show();
            }
            this.hide = function() {
                $(this).siblings('ul.dropdown-menu').hide();
            }
            this.request = function() {
                clearTimeout(this.timer);
                this.timer = setTimeout(function(object) {
                    object.source($(object).val(), $.proxy(object.response, object));
                }, 200, this);
            }
            this.response = function(json) {
                html = '';
                if (json.length) {
                    for (i = 0; i < json.length; i++) {
                        this.items[json[i]['value']] = json[i];
                    }
                    for (i = 0; i < json.length; i++) {
                        if (!json[i]['category']) {
                            html += '<li data-value="' + json[i]['value'] + '"><a href="#">' + json[i]['label'] + '</a></li>';
                        }
                    }
                    var category = new Array();
                    for (i = 0; i < json.length; i++) {
                        if (json[i]['category']) {
                            if (!category[json[i]['category']]) {
                                category[json[i]['category']] = new Array();
                                category[json[i]['category']]['name'] = json[i]['category'];
                                category[json[i]['category']]['item'] = new Array();
                            }
                            category[json[i]['category']]['item'].push(json[i]);
                        }
                    }
                    for (i in category) {
                        html += '<li class="dropdown-header">' + category[i]['name'] + '</li>';
                        for (j = 0; j < category[i]['item'].length; j++) {
                            html += '<li data-value="' + category[i]['item'][j]['value'] + '"><a href="#">&nbsp;&nbsp;&nbsp;' + category[i]['item'][j]['label'] + '</a></li>';
                        }
                    }
                }
                if (html) {
                    this.show();
                } else {
                    this.hide();
                }
                $(this).siblings('ul.dropdown-menu').html(html);
            }
            $(this).after('<ul class="dropdown-menu"></ul>');
            $(this).siblings('ul.dropdown-menu').delegate('a', 'click', $.proxy(this.click, this));
        });
    }
})(window.jQuery);
$("dcoumnent").ready(function() {
    $("#seacrchHeader").keyup(function() {
        var e = this.value.trim();
        var base_url = window.location.origin;
        e ? ($("#Hajaxtargetresult").show(), $.ajax({
            type: "POST",
            url: base_url+"/index.php?route=common/search/searchProduct",
            data: "searchProduct=" + e,
            beforeSend: function() {
                $("#Hajaxtargetresult").html('<img src="image/loader.gif" class="" id="" />')
            },
            success: function(e) {
                console.log(e);
                var a = jQuery.parseJSON(e);
                console.log(a);
                var t = "";
                $.each(a, function(e, a) {
                    t += '<li class="Hselectli" data-cust-name="' + a.name + '" data-cust-href="' + a.href + '" >' + a.name + "</li>"
                }), $("#Hajaxtargetresult").html(t)
            }
        })) : $("#Hajaxtargetresult").empty().hide()
    })

    //$('.logincontinue').click(function() {
    $(document).on("click", ".logincontinue" , function() {

        
        var email = $('#check-email').val();
        var base_url = window.location.origin;
        if(email != '') {
            $.ajax({
            type: "POST",
                url: base_url+"/index.php?route=account/login/validateemail",
                data: "email=" + email,
                beforeSend: function() {
                    
                },
                success: function(e) {
                    console.log(e);
                    var a = jQuery.parseJSON(e);
                    console.log(a);
                    if(a.status == 1) {
                        $('.well-check').css('display','none');
                        $('.well-login').css('display','block');
                        $('.well-register').css('display','none');
                        $('#login-email').val(a.email);
                        $('.orotp').css('display','block');
                        $('.otpsubmit').css('display','block');
                    }
                    else if(a.status == 0) {
                        $('.well-register').css('display','block');
                        $('.well-check').css('display','none');
                        $('.well-login').css('display','none');
                        $('#reg-email').val(a.email);
                        $('.orotp').css('display','none');
                        $('.otpsubmit').css('display','none');
                    }
                    
                }
            })
        }
        
    });

    //$('.otpsubmit').click(function() {
    $(document).on("click", ".otpsubmit" , function() {
        var email = $('#check-email').val();
        var base_url = window.location.origin;
        $.ajax({
            type: "POST",
            url: base_url+"/index.php?route=account/login/sendloginotp",
            data: "email=" + email,
            beforeSend: function() {
                
            },
            success: function(e) {
                console.log(e);
                var a = jQuery.parseJSON(e);
                console.log(a); 
                if(a.status == 1) {
                    $('#hidMobile').val(a.mobile);
                    $('.well-login').css('display','none');
                    $('.orotp').css('display','none');
                    $('.otpinput').css('display','block');
                    $('#usermail').html(a.email);
                    $('#userphone').html(a.mobile);
                    $('#otpcountdownbox').css('display','block');
                    $('.otpsubmit').css('display', 'none');

                    var timeleft = 60;
                    var downloadTimer = setInterval(function(){
                        if(timeleft <= 0){
                            clearInterval(downloadTimer);
                            $('#otpcountdownbox').css('display','none');
                            $('#resendotp').css('display','block');
                        } 
                        else {
                            $('#resendotp').css('display','none');
                            $('#otpcountdown').html(timeleft);
                        }
                        timeleft -= 1;
                    }, 1000);
                }
            }
        })
    });


    //$('#loginotp').click(function() {
    $(document).on("click", "#loginotp" , function() {
        var mobile = $('#hidMobile').val();
        var otp = $('#input-otp').val();
        var base_url = window.location.origin;
        if(otp != '') {
            $.ajax({
            type: "POST",
                url: base_url+"/index.php?route=account/login/validatelogin",
                data: "mobile=" + mobile + "&otp=" + otp,
                beforeSend: function() {
                    
                },
                success: function(e) {
                    var a = jQuery.parseJSON(e);
                    console.log(a);
                    if(a.status == 0) {
                        $('#input-otp-error').html(a.message);
                    }
                    else if(a.status == 1) {
                        window.location.href = a.url;
                    }
                    
                }
            })
        }
        else {
            $('#input-otp-error').html('Please enter otp.')
        }

    })

    //$('.notme').click(function() {
    $(document).on("click", ".notme" , function() {
        $('.well-check').css('display','block');
        $('.well-login').css('display','none');
        $('.well-register').css('display','none');
        $('.orotp').css('display','none');
        $('.otpsubmit').css('display','none');
        $('#check-email').val('');
    });



}), $(document).on("click", ".Hselectli", function(e) {
    var a = $(this).attr("data-cust-name");
    $("#seacrchHeader").val(a), location.href = $(this).attr("data-cust-href")
});