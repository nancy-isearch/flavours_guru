/**
 * @author ashutosh.joshi
 */ (function () {
    var b, a = Array.prototype.indexOf || function (e) {
            for (var d = 0, c = this.length; d < c; d++) {
                if (d in this && this[d] === e) {
                    return d
                }
            }
            return -1
        };
    b = jQuery;
    b.fn.validateCreditCard = function (j) {
        var c, e, g, i, d, h, f;
        c = [{
            name: "amex",
            pattern: /^3[47]/,
            valid_length: [15]
        }, {
            name: "diners_club_carte_blanche",
            pattern: /^30[0-5]/,
            valid_length: [14]
        }, {
            name: "diners_club_international",
            pattern: /^36/,
            valid_length: [14]
        }, {
            name: "jcb",
            pattern: /^35(2[89]|[3-8][0-9])/,
            valid_length: [16]
        }, {
            name: "laser",
            pattern: /^(6304|630[69]|6771)/,
            valid_length: [16, 17, 18, 19]
        }, {
            name: "visa_electron",
            pattern: /^(4026|417500|4508|4844|491(3|7))/,
            valid_length: [16]
        }, {
            name: "visa",
            pattern: /^4/,
            valid_length: [16]
        }, {
            name: "rupay",
            pattern: /^6/,
            valid_length: [16]
        }, {
            name: "mastercard",
            pattern: /^5[1-5]/,
            valid_length: [16]
        }, {
            name: "maestro",
            //pattern: /^(5018|5020|5038|6304|6759|676[1-3])/,
            pattern: /^(502964|504433|504435|504437|504441|504445|504465|504493|504645|504753|504774|504775|504809|504817|504834|504883|504884|504958|504973|504993|508000|508125|508126|508159|508192|508227|508588|588599|600206|601794|603845|606362|606989|622018|603123|603741|504848|504681|504434|502260)/,
            valid_length: [12, 13, 14, 15, 16, 17, 18, 19]
        }, {
            name: "discover",
            pattern: /^(6011|622(12[6-9]|1[3-9][0-9]|[2-8][0-9]{2}|9[0-1][0-9]|92[0-5]|64[4-9])|65)/,
            valid_length: [16]
        }];
        e = function (m) {
            var l, n, k;
            for (n = 0, k = c.length; n < k; n++) {
                l = c[n];
                if (m.match(l.pattern)) {
                    return l
                }
            }
            return null
        };
        i = function (m) {
            var q, p, l, k, o;
            l = 0;
            //o = m.split("").reverse().join("");
			// ie7 specific fix for adding "valid" css class to textbox
			o = m.split("").reverse();
            for (p = 0, k = o.length; p < k; p++) {
                q = o[p];
                q = +q;
                if (p % 2) {
                    q *= 2;
                    if (q < 10) {
                        l += q
                    } else {
                        l += q - 9
                    }
                } else {
                    l += q
                }
            }
            return l % 10 === 0
        };
        g = function (l, k) {
            var m;
            return m = l.length, a.call(k.valid_length, m) >= 0
        };
        f = function (n) {
            var k, m, l;
            k = e(n);
            l = false;
            m = false;
            if (k != null) {
                l = i(n);
                m = g(n, k)
            }
            return j({
                card_type: k,
                luhn_valid: l,
                length_valid: m
            })
        };
        h = function () {
            var k;
            k = d(b(this).val());
            return f(k)
        };
        d = function (k) {
            return k.replace(/[ -]/g, "")
        };
        this.bind("input", function () {
            b(this).unbind("keyup");
            return h.call(this)
        });
        this.bind("keyup", function () {
            return h.call(this)
        });
        h.call(this);
        return this
    }
}).call(this);
(function (a) {
    a.InFieldLabels = function (e, i, h) {
        var g = this;
        g.$label = a(e);
        g.label = e;
        g.$field = a(i);
        g.field = i;
        g.$label.data("InFieldLabels", g);
        g.showing = true;
        g.init = function () {
            g.options = a.extend({}, a.InFieldLabels.defaultOptions, h);
            if (g.$field.val() != "") {
                g.$label.hide();
                g.showing = false
            }
            g.$field.focus(function () {
                g.fadeOnFocus()
            }).blur(function () {
                g.checkForEmpty(true)
            }).bind("keydown.infieldlabel", function (b) {
                g.hideOnChange(b)
            }).change(function (b) {
                g.checkForEmpty()
            }).bind("onPropertyChange", function () {
                g.checkForEmpty()
            })
        };
        g.fadeOnFocus = function () {
            if (g.showing) {
                g.setOpacity(g.options.fadeOpacity)
            }
        };
        g.setOpacity = function (b) {
            g.$label.stop().animate({
                opacity: b
            }, g.options.fadeDuration);
            g.showing = (b > 0)
        };
        g.checkForEmpty = function (b) {
            if (g.$field.val() == "") {
                g.prepForShow();
                g.setOpacity(b ? 1 : g.options.fadeOpacity)
            } else {
                g.setOpacity(0)
            }
        };
        g.prepForShow = function (b) {
            if (!g.showing) {
                g.$label.css({
                    opacity: 0
                }).show();
                g.$field.bind("keydown.infieldlabel", function (c) {
                    g.hideOnChange(c)
                })
            }
        };
        g.hideOnChange = function (b) {
            if ((b.keyCode == 16) || (b.keyCode == 9)) {
                return
            }
            if (g.showing) {
                g.$label.hide();
                g.showing = false
            }
            g.$field.unbind("keydown.infieldlabel")
        };
        g.init()
    };
    a.InFieldLabels.defaultOptions = {
        fadeOpacity: 0.5,
        fadeDuration: 300
    };
    a.fn.inFieldLabels = function (b) {
        return this.each(function () {
            var d = a(this).attr("for");
            if (!d) {
                return
            }
            var c = a("input#" + d + "[type='text'],input#" + d + "[type='password'],textarea#" + d);
            if (c.length == 0) {
                return
            }(new a.InFieldLabels(this, c[0], b))
        })
    }
})(jQuery);
(function ($) {
    var msMyTabs = function (element, settings) {
        var settings = $.extend({
            tabs: "a",
            contentSuffix: "_content",
            event: "click",
            selected: "selected",
            effects: "fade",
            callback: "",
            defaultTab: "",
            onInit: "",
            dynamic: false,
            ignoreDynamic: "ignoreDynamic",
            callbackAfterDynamic: "",
            cache: true,
            loadingText: "loading...",
            auto: 0
        }, settings);
        var $this = this;
        var elementid = $(element).attr("id");
        var oProp = new Object();
        oProp.old = "";
        oProp.isFirst = 0;
        oProp.isLast = 0;
        oProp.currenTabCounter = 0;
        var internalTabClassName = "msTabsContents" + elementid;
        var internalTabPointers = "msTabsPointer" + elementid;
        var cacheData = {};
        var intid = 0;
        var init = function () {
            $("#" + elementid + " " + settings.tabs).addClass(internalTabPointers);
            $("#" + elementid + " " + settings.tabs).bind(settings.event, function (evt) {
                $this.switchTab(this.id);
                if (this.id == "ccard" || this.id == "nbanking" || this.id == "dcard" || this.id == "cod" || this.id == "ddcheque" || this.id == "ccardemi"|| this.id == "amexeze") {
                    formdisable();
                    $("#" + this.id + "_content :input").removeAttr("disabled");
                  	$('#'+this.id+'_content :input[state=disabled]').attr('disabled','disabled');
                    $("#ccardemi_content :input, #ccard_content :input, #nbanking_content :input, #dcard_content :input, #cod_content :input, #ddcheque_content :input,#amexeze_content :input").removeClass("onError");
                    $(".errorMsg").html("")
                    checkSavedCardSwitch(this.id);
                }
                if (this.id == "ddcheque") {
                    $(".payBymiles input, .nokiamoney input").attr("disabled", "disabled");
                    $("#saveaddtype04").attr("checked", "checked")
                }
                evt.preventDefault();
                evt.stopPropagation();
                if (true == settings.dynamic) {
                    var href = this.href;
                    var hasIngoreClass = $(this).hasClass(settings.ignoreDynamic);
                    if (typeof (href) != undefined && hasIngoreClass == false) {
                        $this.loadFile(href, this.id)
                    }
                }
            });
            if ($("#" + elementid + " " + settings.tabs + " a").length > 0) {
                $("#" + elementid + " " + settings.tabs + " a").bind(settings.event, function (evt) {
                    evt.preventDefault();
                    evt.stopPropagation();
                    return false
                })
            }
            var allTabs = $("#" + elementid + " " + settings.tabs);
            oProp.allTabs = allTabs;
            if (settings.defaultTab == "") {
                settings.defaultTab = $("#" + elementid + " " + settings.tabs)[0].id
            }
            for (var iCount = 0; iCount < allTabs.length; iCount++) {
                if (settings.defaultTab != allTabs[iCount].id) {
                    $("#" + allTabs[iCount].id + settings.contentSuffix).hide();
                    $("#" + allTabs[iCount].id + settings.contentSuffix).addClass(internalTabClassName)
                }
            }
            $this.switchTab(settings.defaultTab);
            if (settings.auto > 0) {
                $("#" + elementid + " " + settings.tabs).bind("mouseover", function (evt) {
                    evt.preventDefault();
                    pauseTabs()
                });
                $("#" + elementid + " " + settings.tabs).bind("mouseout", function (evt) {
                    evt.preventDefault();
                    startAutoTabs()
                });
                $("." + internalTabClassName).bind("mouseover", function (evt) {
                    evt.preventDefault();
                    pauseTabs()
                });
                $("." + internalTabClassName).bind("mouseout", function (evt) {
                    evt.preventDefault();
                    startAutoTabs()
                });
                startAutoTabs()
            }
            if (settings.onInit != "") {
                eval(settings.onInit)($this)
            }
        };
        var nextTab = function () {
            oProp.isLast = 0;
            var totalTabs = oProp.allTabs;
            if (oProp.currenTabCounter < totalTabs.length - 1) {
                oProp.currenTabCounter++;
                var tabid = totalTabs[oProp.currenTabCounter].id;
                if (oProp.currenTabCounter == totalTabs.length - 1) {
                    oProp.isLast = 1
                }
                $this.switchTab(tabid)
            }
            return oProp.isLast
        };
        var previousTab = function () {
            oProp.isFirst = 0;
            var totalTabs = oProp.allTabs;
            if (oProp.currenTabCounter > 0) {
                oProp.currenTabCounter--;
                var tabid = totalTabs[oProp.currenTabCounter].id;
                if (oProp.currenTabCounter == 0) {
                    oProp.isFirst = 1
                }
                $this.switchTab(tabid)
            }
            return oProp.isFirst
        };
        this.previous = function () {
            var isSuccess = previousTab();
            return isSuccess
        };
        this.next = function () {
            var isSuccess = nextTab();
            return isSuccess
        };
        var getTabPosition = function (id) {
            var allTabs = oProp.allTabs;
            for (var iCount = 0; iCount < allTabs.length; iCount++) {
                if (allTabs[iCount].id == id) {
                    return iCount
                }
            }
            return -1
        };
        var getContentId = function (tabId) {
            var content = tabId + settings.contentSuffix;
            return content
        };
        this.switchTab = function (evt) {
            if (typeof (evt) != "string") {
                evt.preventDefault();
                evt.stopPropagation()
            } else {
                if (typeof (evt) == "string") {
                    $("#" + evt).show()
                }
            }
            var id = (typeof (evt) == "string") ? evt : this.id;
            oProp.tabId = id;
            oProp.currenTabCounter = getTabPosition(id);
            var content = getContentId(id).toString();
            oProp.content = content;
            if (oProp.old != "") {
                $("#" + oProp.old).removeClass(settings.selected);
                if (settings.effects == "fade") {
                    $("#" + oProp.oldContent).hide();
                    $("#" + oProp.oldContent).fadeOut("fast", function (evt) {
                        $("#" + content).fadeIn("fast", function () {
                            fireCallback()
                        })
                    })
                } else {
                    $("#" + oProp.oldContent).slideUp("fast", function (evt) {
                        $("#" + content).slideDown("fast", function () {
                            fireCallback()
                        })
                    })
                }
            } else {
                if (settings.effects == "fade") {
                    $("#" + content).fadeIn("fast", function () {
                        fireCallback()
                    })
                } else {
                    $("#" + content).slideDown("fast", function () {
                        fireCallback()
                    })
                }
            }
            $("#" + id).addClass(settings.selected)
        };
        var fireCallback = function () {
            oProp.old = oProp.tabId;
            oProp.oldContent = oProp.content;
            if (settings.callback != "") {
                eval(settings.callback)($this)
            }
        };
        this.getTitle = function () {
            return $("#" + oProp.tabId).text()
        };
        var autoTabs = function () {
            var totalTabs = oProp.allTabs;
            var isLast = nextTab();
            if (isLast === 1) {
                oProp.currenTabCounter = -1
            }
        };
        var pauseTabs = function () {
            window.clearInterval(intid)
        };
        var startAutoTabs = function () {
            if (settings.auto > 0) {
                if (intid != 0) {
                    window.clearInterval(intid)
                }
                intid = window.setInterval(autoTabs, settings.auto)
            }
        };
        this.getCurrentCounter = function () {
            return oProp.currenTabCounter
        };
        this.getAllTabs = function () {
            return oProp.allTabs
        };
        this.getAllProperties = function () {
            return oProp
        };
        this.switchTabByCounter = function (cnt) {
            var totalTabs = oProp.allTabs;
            oProp.currenTabCounter = cnt;
            var tabid = totalTabs[oProp.currenTabCounter].id;
            $this.switchTab(tabid)
        };
        this.getCurrenTabId = function () {
            return oProp.allTabs[oProp.currenTabCounter].id
        };
        this.getCurrenContentId = function () {
            var tabId = this.getCurrenTabId();
            return tabId + settings.contentSuffix
        };
        this.loadFile = function (loadURL, whereToUpdate, refreh) {
            var url = loadURL;
            var uploadDivTab = whereToUpdate;
            var contentid = getContentId(uploadDivTab);
            if (typeof (cacheData[uploadDivTab]) == "undefined" && settings.cache == true) {
                $.ajax({
                    url: url,
                    type: "post",
                    success: function (res) {
                        $("#" + contentid).html(res);
                        cacheData[uploadDivTab] = res;
                        if (settings.callbackAfterDynamic != "") {
                            eval(settings.callbackAfterDynamic)($this, arguments)
                        }
                    }
                })
            }
        };
        init()
    };
    $.fn.msTabs = function (opt) {
        return this.each(function () {
            var element = $(this);
            var myplugin = new msMyTabs(element, opt);
            element.data("msTabs", myplugin)
        })
    }
})(jQuery);
(function (d) {
    d.tiny = d.tiny || {};
    d.tiny.scrollbar = {
        options: {
            axis: "y",
            wheel: 40,
            scroll: true,
            lockscroll: true,
            size: "auto",
            sizethumb: "auto"
        }
    };
    d.fn.tinyscrollbar = function (a) {
        var b = d.extend({}, d.tiny.scrollbar.options, a);
        this.each(function () {
            d(this).data("tsb", new c(d(this), b))
        });
        return this
    };
    d.fn.tinyscrollbar_update = function (a) {
        return d(this).data("tsb").update(a)
    };

    function c(F, P) {
        var L = this,
            C = F,
            M = {
                obj: d(".viewport", F)
            }, O = {
                obj: d(".overview", F)
            }, S = {
                obj: d(".scrollbar", F)
            }, J = {
                obj: d(".track", S.obj)
            }, G = {
                obj: d(".thumb", S.obj)
            }, K = P.axis === "x",
            I = K ? "left" : "top",
            A = K ? "Width" : "Height",
            E = 0,
            a = {
                start: 0,
                now: 0
            }, H = {}, R = ("ontouchstart" in document.documentElement) ? true : false;

        function T() {
            L.update();
            D();
            return L
        }
        this.update = function (e) {
            M[P.axis] = M.obj[0]["offset" + A];
            O[P.axis] = O.obj[0]["scroll" + A];
            O.ratio = M[P.axis] / O[P.axis];
            S.obj.toggleClass("disable", O.ratio >= 1);
            J[P.axis] = P.size === "auto" ? M[P.axis] : P.size;
            G[P.axis] = Math.min(J[P.axis], Math.max(0, (P.sizethumb === "auto" ? (J[P.axis] * O.ratio) : P.sizethumb)));
            S.ratio = P.sizethumb === "auto" ? (O[P.axis] / J[P.axis]) : (O[P.axis] - M[P.axis]) / (J[P.axis] - G[P.axis]);
            E = (e === "relative" && O.ratio <= 1) ? Math.min((O[P.axis] - M[P.axis]), Math.max(0, E)) : 0;
            E = (e === "bottom" && O.ratio <= 1) ? (O[P.axis] - M[P.axis]) : isNaN(parseInt(e, 10)) ? E : parseInt(e, 10);
            z()
        };

        function z() {
            var e = A.toLowerCase();
            G.obj.css(I, E / S.ratio);
            O.obj.css(I, -E);
            H.start = G.obj.offset()[I];
            S.obj.css(e, J[P.axis]);
            J.obj.css(e, J[P.axis]);
            G.obj.css(e, G[P.axis])
        }
        function D() {
            if (!R) {
                G.obj.bind("mousedown", N);
                J.obj.bind("mouseup", B)
            } else {
                M.obj[0].ontouchstart = function (e) {
                    if (1 === e.touches.length) {
                        N(e.touches[0]);
                        e.stopPropagation()
                    }
                }
            }
            if (P.scroll && window.addEventListener) {
                C[0].addEventListener("DOMMouseScroll", b, false);
                C[0].addEventListener("mousewheel", b, false)
            } else {
                if (P.scroll) {
                    C[0].onmousewheel = b
                }
            }
        }
        function N(e) {
            var f = parseInt(G.obj.css(I), 10);
            H.start = K ? e.pageX : e.pageY;
            a.start = f == "auto" ? 0 : f;
            if (!R) {
                d(document).bind("mousemove", B);
                d(document).bind("mouseup", Q);
                G.obj.bind("mouseup", Q)
            } else {
                document.ontouchmove = function (g) {
                    g.preventDefault();
                    B(g.touches[0])
                };
                document.ontouchend = Q
            }
        }
        function b(g) {
            if (O.ratio < 1) {
                var e = g || window.event,
                    f = e.wheelDelta ? e.wheelDelta / 120 : -e.detail / 3;
                E -= f * P.wheel;
                E = Math.min((O[P.axis] - M[P.axis]), Math.max(0, E));
                G.obj.css(I, E / S.ratio);
                O.obj.css(I, -E);
                if (P.lockscroll || (E !== (O[P.axis] - M[P.axis]) && E !== 0)) {
                    e = d.event.fix(e);
                    e.preventDefault()
                }
            }
        }
        function B(e) {
            if (O.ratio < 1) {
                if (!R) {
                    a.now = Math.min((J[P.axis] - G[P.axis]), Math.max(0, (a.start + ((K ? e.pageX : e.pageY) - H.start))))
                } else {
                    a.now = Math.min((J[P.axis] - G[P.axis]), Math.max(0, (a.start + (H.start - (K ? e.pageX : e.pageY)))))
                }
                E = a.now * S.ratio;
                O.obj.css(I, -E);
                G.obj.css(I, a.now)
            }
        }
        function Q() {
            d(document).unbind("mousemove", B);
            d(document).unbind("mouseup", Q);
            G.obj.unbind("mouseup", Q);
            document.ontouchmove = document.ontouchend = null
        }
        return T()
    }
}(jQuery));
var Base64 = {
    _keyStr: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789",
    encode: function (c) {
        var a = "";
        var k, h, f, j, g, e, d;
        var b = 0;
        c = Base64._utf8_encode(c);
        while (b < c.length) {
            k = c.charCodeAt(b++);
            h = c.charCodeAt(b++);
            f = c.charCodeAt(b++);
            j = k >> 2;
            g = ((k & 3) << 4) | (h >> 4);
            e = ((h & 15) << 2) | (f >> 6);
            d = f & 63;
            if (isNaN(h)) {
                e = d = 64
            } else {
                if (isNaN(f)) {
                    d = 64
                }
            }
            a = a + this._keyStr.charAt(j) + this._keyStr.charAt(g) + this._keyStr.charAt(e) + this._keyStr.charAt(d)
        }
        return a
    },
    decode: function (c) {
        var a = "";
        var k, h, f;
        var j, g, e, d;
        var b = 0;
        c = c.replace(/[^A-Za-z0-9\+\/\=]/g, "");
        while (b < c.length) {
            j = this._keyStr.indexOf(c.charAt(b++));
            g = this._keyStr.indexOf(c.charAt(b++));
            e = this._keyStr.indexOf(c.charAt(b++));
            d = this._keyStr.indexOf(c.charAt(b++));
            k = (j << 2) | (g >> 4);
            h = ((g & 15) << 4) | (e >> 2);
            f = ((e & 3) << 6) | d;
            a = a + String.fromCharCode(k);
            if (e != 64) {
                a = a + String.fromCharCode(h)
            }
            if (d != 64) {
                a = a + String.fromCharCode(f)
            }
        }
        a = Base64._utf8_decode(a);
        return a
    },
    _utf8_encode: function (b) {
        b = b.replace(/\r\n/g, "\n");
        var a = "";
        for (var e = 0; e < b.length; e++) {
            var d = b.charCodeAt(e);
            if (d < 128) {
                a += String.fromCharCode(d)
            } else {
                if ((d > 127) && (d < 2048)) {
                    a += String.fromCharCode((d >> 6) | 192);
                    a += String.fromCharCode((d & 63) | 128)
                } else {
                    a += String.fromCharCode((d >> 12) | 224);
                    a += String.fromCharCode(((d >> 6) & 63) | 128);
                    a += String.fromCharCode((d & 63) | 128)
                }
            }
        }
        return a
    },
    _utf8_decode: function (a) {
        var b = "";
        var d = 0;
        var e = c1 = c2 = 0;
        while (d < a.length) {
            e = a.charCodeAt(d);
            if (e < 128) {
                b += String.fromCharCode(e);
                d++
            } else {
                if ((e > 191) && (e < 224)) {
                    c2 = a.charCodeAt(d + 1);
                    b += String.fromCharCode(((e & 31) << 6) | (c2 & 63));
                    d += 2
                } else {
                    c2 = a.charCodeAt(d + 1);
                    c3 = a.charCodeAt(d + 2);
                    b += String.fromCharCode(((e & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
                    d += 3
                }
            }
        }
        return b
    }
};
String.prototype.reverse = function () {
    splitext = this.split("");
    revertext = splitext.reverse();
    reversed = revertext.join("");
    return reversed
};
String.prototype.encrypt = function () {
    var a = this;
    a = Base64.encode(a);
    return a
};

function isValidCreditCard(b) {
    var b;
    var k = 1;
    var e = 2;
    var j = 0;
    var c = 0;
    var h = "";
    var l = "";
    var d;
    var a;
    for (var f = 0; f != b.length; f++) {
        l = b.substring(f, f + 1);
        if (l == "-") {
            continue
        }
        h = h + l
    }
    d = parseInt(h);
    if (d == 0) {
        return 0
    }
    a = b.length / 2;
    if (b.length - (parseInt(a) * 2) == 0) {
        k = 2;
        e = 1
    }
    for (var g = b.length - 1; g > 0; g--) {
        a = g / 2;
        if (a < 1) {
            a++
        }
        if (g - (parseInt(a) * 2) != 0) {
            c = (parseInt(b.charAt(g - 1))) * k
        } else {
            c = (parseInt(b.charAt(g - 1))) * e
        }
        if (c >= 10) {
            c = c - 10 + 1
        }
        j = j + c
    }
    c = 10 - (j % 10);
    if (c == 10) {
        c = 0
    }
    if (c == (parseInt(b.charAt(b.length - 1)))) {
        return 1
    } else {
        return 0
    }
};