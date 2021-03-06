﻿/*---------------------------------------------------------------------

Template Name: 	lim.it
Version:	 	1.0
Release Date: 	July 12, 2010

File:       	lim.it.js
Updated:    	2010-07-12

Copyright (c) 2010 Chanry Ian - http://wcweb.us

-----------------------------------------------------------------------

WARNING! DO NOT EDIT THIS FILE UNLESS YOU KNOW WHAT YOU ARE DOING!

---------------------------------------------------------------------*/
// globle use 

// sometime you can preload some images
// imageObj = new Image();
// imgs = ["/static/style/img/toggle.gif", "/static/style/img/nyro/ajaxLoader.gif", "/static/style/img/nyro/prev.gif", "/static/style/img/nyro/next.gif"];
// for (i = 0; i <= imgs.length; i++) imageObj.src = imgs[i];

// lim object setup


if (!Limit) var Limit = {}

Limit.scrollToTop = function (e) {
    $(e).hide().removeAttr("href");
    if ($(window).scrollTop() != "0") {
        $(e).fadeIn("slow")
    }
    var scrollDiv = $(e);
    $(window).scroll(function () {
        if ($(window).scrollTop() == "0") {
            $(scrollDiv).fadeOut("slow")
        } else {
            $(scrollDiv).fadeIn("slow")
        }
    });
    $(e).click(function () {
        $("html, body").animate({
            scrollTop: 0
        }, "slow")
    })
}

Limit.setup = function () {
    // Open external link in new windows
    $('a[href^="http://"]').filter(function () {
        return this.hostname && this.hostname !== location.hostname;
    }).attr('target', '_blank');

    // build an animated footer
    $('#animated').each(function () {
        $(this).hover(function () {
            $(this).stop().animate({
                opacity: 0.9
            }, 400);
        }, function () {
            $(this).stop().animate({
                opacity: 0.0
            }, 200);
        });
    });



    // scroll to top on request
    if ($("a#totop").length) Limit.scrollToTop("a#totop");

    // setup content boxes
    if ($(".content-box").length) {
        $(".content-box .head").css({
            "cursor": "s-resize"
        });
        $(".content-box .body").slideUp();

        // Give the header in content-box a different cursor	
        $(".content-box .head").toggle(
        function () {
            var that = this;
            $(this).parent().find('.body').slideDown('slow', function () {
                $(that).find('.caption').toggleClass("content-box-closed");
            }); // Toggle the content     

        }, function () {
            var that = this;
            $(this).parent().find('.body').slideUp('slow', function () {
                $(that).find('.caption').toggleClass("content-box-closed");
            }); // Toggle the content

        });
    }

    // custom tooltips to replace the default browser tooltips for <a title=""> <div title=""> and <span title="">
    //$("a[title], div[title], span[title]").tipTip();
    if ($('.dropdown-toggle').length) {
        $('.dropdown-toggle').dropdown();
    }
    if ($(".collapse").length) {
        //$(".collapse").collapse();
    }

}

Limit.setup();
if ($('.tabs').length) {
    $('.tabs').tab();
}
if ($('#list-grid-toggle').length) {
    $('.list-toggle-btn').click(function (e) {
        if ($(e.currentTarget).hasClass("list-toggle-btn-up")) {
            $(e.currentTarget).toggleClass("list-toggle-btn-on list-toggle-btn-up");
            $('.grid-toggle-btn').toggleClass("grid-toggle-btn-on grid-toggle-btn-up");

            $('#list-grid-toggle').addClass("videolist-heng");
        }
        e.preventDefault();

    });
    $('.grid-toggle-btn').click(function (e) {
        if ($(e.currentTarget).hasClass("grid-toggle-btn-up")) {
            $('.list-toggle-btn').toggleClass("list-toggle-btn-on list-toggle-btn-up");
            $(e.currentTarget).toggleClass("grid-toggle-btn-on grid-toggle-btn-up");

            $('#list-grid-toggle').removeClass("videolist-heng");
        }
        e.preventDefault();
    });
}

$(function () {
    $('.toggle-info').slideUp('fast');
    $('.toggle-info-btn').toggle(
        function () {
            var that = this;

            $("#" + $(this).attr('rel')).slideDown(
                'slow', function () {
                    $(that).children().html('隐藏信息');
                }

            );
        },
        function () {
            var that = this;
            $("#" + $(this).attr('rel')).slideUp(
                'fast', function () {
                    $(that).children().html('显示信息');
                }
            );
        }
        )
});
(function (doc) {
    var addEvent = 'addEventListener',
        type = 'gesturestart',
        qsa = 'querySelectorAll',
        scales = [1, 1],
        meta = qsa in doc ? doc[qsa]('meta[name=viewport]') : [];
    function fix() {
        meta.content = 'width=device-width,minimum-scale=' + scales[0] + ',maximum-scale=' + scales[1];
        doc.removeEventListener(type, fix, true);
    }
    if ((meta = meta[meta.length - 1]) && addEvent in doc) {
        fix();
        scales = [.25, 1.6];
        doc[addEvent](type, fix, true);
    }
}(document));


function is_ie() {
    /MSIE/g.test(window.navigator.userAgent);
}