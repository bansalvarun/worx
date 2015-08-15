/* jquery.scrolly v1.0.0-dev | (c) n33 | n33.co @n33co | MIT */
(function(e){function u(s,o){var u,a,f;if((u=e(s))[t]==0)return n;a=u[i]()[r];switch(o.anchor){case"middle":f=a-(e(window).height()-u.outerHeight())/2;break;default:case r:f=Math.max(a,0)}return typeof o[i]=="function"?f-=o[i]():f-=o[i],f}var t="length",n=null,r="top",i="offset",s="click.scrolly",o=e(window);e.fn.scrolly=function(i){var o,a,f,l,c=e(this);if(this[t]==0)return c;if(this[t]>1){for(o=0;o<this[t];o++)e(this[o]).scrolly(i);return c}l=n,f=c.attr("href");if(f.charAt(0)!="#"||f[t]<2)return c;a=jQuery.extend({anchor:r,easing:"swing",offset:0,parent:e("body,html"),pollOnce:!1,speed:1e3},i),a.pollOnce&&(l=u(f,a)),c.off(s).on(s,function(e){var t=l!==n?l:u(f,a);t!==n&&(e.preventDefault(),a.parent.stop().animate({scrollTop:t},a.speed,a.easing))})}})(jQuery);
/* jquery.scrollex v0.2.1 | (c) n33 | n33.co @n33co | MIT */
!function(t){function e(t,e,n){return"string"==typeof t&&("%"==t.slice(-1)?t=parseInt(t.substring(0,t.length-1))/100*e:"vh"==t.slice(-2)?t=parseInt(t.substring(0,t.length-2))/100*n:"px"==t.slice(-2)&&(t=parseInt(t.substring(0,t.length-2)))),t}var n=t(window),i=1,o={};n.on("scroll",function(){var e=n.scrollTop();t.map(o,function(t){window.clearTimeout(t.timeoutId),t.timeoutId=window.setTimeout(function(){t.handler(e)},t.options.delay)})}).on("load",function(){n.trigger("scroll")}),jQuery.fn.scrollex=function(l){var s=t(this);if(0==this.length)return s;if(this.length>1){for(var r=0;r<this.length;r++)t(this[r]).scrollex(l);return s}if(s.data("_scrollexId"))return s;var a,u,h,c,p;switch(a=i++,u=jQuery.extend({top:0,bottom:0,delay:0,mode:"default",enter:null,leave:null,initialize:null,terminate:null,scroll:null},l),u.mode){case"top":h=function(t,e,n,i,o){return t>=i&&o>=t};break;case"bottom":h=function(t,e,n,i,o){return n>=i&&o>=n};break;case"middle":h=function(t,e,n,i,o){return e>=i&&o>=e};break;case"top-only":h=function(t,e,n,i,o){return i>=t&&n>=i};break;case"bottom-only":h=function(t,e,n,i,o){return n>=o&&o>=t};break;default:case"default":h=function(t,e,n,i,o){return n>=i&&o>=t}}return c=function(t){var i,o,l,s,r,a,u=this.state,h=!1,c=this.$element.offset();i=n.height(),o=t+i/2,l=t+i,s=this.$element.outerHeight(),r=c.top+e(this.options.top,s,i),a=c.top+s-e(this.options.bottom,s,i),h=this.test(t,o,l,r,a),h!=u&&(this.state=h,h?this.options.enter&&this.options.enter.apply(this.element):this.options.leave&&this.options.leave.apply(this.element)),this.options.scroll&&this.options.scroll.apply(this.element,[(o-r)/(a-r)])},p={id:a,options:u,test:h,handler:c,state:null,element:this,$element:s,timeoutId:null},o[a]=p,s.data("_scrollexId",p.id),p.options.initialize&&p.options.initialize.apply(this),s},jQuery.fn.unscrollex=function(){var e=t(this);if(0==this.length)return e;if(this.length>1){for(var n=0;n<this.length;n++)t(this[n]).unscrollex();return e}var i,l;return(i=e.data("_scrollexId"))?(l=o[i],window.clearTimeout(l.timeoutId),delete o[i],e.removeData("_scrollexId"),l.options.terminate&&l.options.terminate.apply(this),e):e}}(jQuery);

(function($) {

	skel
		.breakpoints({
			xlarge:	'(max-width: 1680px)',
			large:	'(max-width: 1280px)',
			medium:	'(max-width: 980px)',
			small:	'(max-width: 736px)',
			xsmall:	'(max-width: 480px)'
		});

	$(function() {

		var	$window = $(window),
			$body = $('body'),
			$wrapper = $('#page-wrapper'),
			$banner = $('#banner'),
			$header = $('#header');

		// Disable animations/transitions until the page has loaded.
			$body.addClass('is-loading');

			$window.on('load', function() {
				window.setTimeout(function() {
					$body.removeClass('is-loading');
				}, 100);
			});

		// Mobile?
			if (skel.vars.mobile)
				$body.addClass('is-mobile');
			else
				skel
					.on('-medium !medium', function() {
						$body.removeClass('is-mobile');
					})
					.on('+medium', function() {
						$body.addClass('is-mobile');
					});

		// Fix: Placeholder polyfill.
			$('form').placeholder();

		// Prioritize "important" elements on medium.
			skel.on('+medium -medium', function() {
				$.prioritize(
					'.important\\28 medium\\29',
					skel.breakpoint('medium').active
				);
			});

		// Scrolly.
			$('.scrolly')
				.scrolly({
					speed: 1500,
					offset: $header.outerHeight()
				});

		// Menu.
			$('#menu')
				.append('<a href="#menu" class="close"></a>')
				.appendTo($body)
				.panel({
					delay: 500,
					hideOnClick: true,
					hideOnSwipe: true,
					resetScroll: true,
					resetForms: true,
					side: 'right',
					target: $body,
					visibleClass: 'is-menu-visible'
				});

		// Header.
			if (skel.vars.IEVersion < 9)
				$header.removeClass('alt');

			if ($banner.length > 0
			&&	$header.hasClass('alt')) {

				$window.on('resize', function() { $window.trigger('scroll'); });

				$banner.scrollex({
					bottom:		$header.outerHeight() + 1,
					terminate:	function() { $header.removeClass('alt'); },
					enter:		function() { $header.addClass('alt'); },
					leave:		function() { $header.removeClass('alt'); }
				});

			}

	});

})(jQuery);
