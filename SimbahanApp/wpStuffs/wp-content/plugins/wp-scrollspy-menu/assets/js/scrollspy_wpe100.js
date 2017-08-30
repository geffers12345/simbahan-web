jQuery(document).ready(function(){
	   
   jQuery('a').on('click',function(){
   	 var obj = jQuery(this);
   	 var id = jQuery(this).attr('rel');

   	 if (typeof id !== 'undefined') {
	  	var aTag = jQuery("#"+id);

	    if(obj.closest('li').hasClass('scrollspy')){
	    	jQuery('html,body').animate({scrollTop: aTag.offset().top},'slow');
	    }
	   	   	  
	 }
   	 

   })						
						
});