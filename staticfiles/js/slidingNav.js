var hidWidth;
var scrollBarWidths = 0;

var widthOfList = function(){
  var itemsWidth = 0;
  $('.mylist li').each(function(){
    var itemWidth = $(this).outerWidth();
    itemsWidth+=itemWidth;
  });
  return itemsWidth;
};

var widthOfHidden = function(){
  return (($('.mywrapper').outerWidth())-widthOfList()-getLeftPosi())-scrollBarWidths;
};

var getLeftPosi = function(){
  return $('.mylist').position().left;
};

var reAdjust = function(){
  if (($('.mywrapper').outerWidth()) < widthOfList()) {
    $('.myscroller-right').show();
  }
  else {
    $('.myscroller-right').hide();
  }
  
  if (getLeftPosi()<0) {
    $('.myscroller-left').show();
  }
  else {
    $('.item').animate({left:"-="+getLeftPosi()+"px"},'slow');
  	$('.myscroller-left').hide();
  }
}

reAdjust();

$(window).on('resize',function(e){  
  	reAdjust();
});

$('.myscroller-right').click(function() {
  
  $('.myscroller-left').fadeIn('slow');
  $('.myscroller-right').fadeOut('slow');
  
  $('.mylist').animate({left:"+="+widthOfHidden()+"px"},'slow',function(){

  });
});

$('.myscroller-left').click(function() {
  
	$('.myscroller-right').fadeIn('slow');
	$('.myscroller-left').fadeOut('slow');
  
  	$('.mylist').animate({left:"-="+getLeftPosi()+"px"},'slow',function(){
  	
  	});
});    