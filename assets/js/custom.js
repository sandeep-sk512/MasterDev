
var slider_single_image = $('.slider-single-image');
	    if (slider_single_image.length) {
	    //select box
	    slider_single_image.slick({
			dots: false,
			infinite: true,
			speed: 300,
			slidesToShow: 1,
			autoplay: false,
			arrows: true,
			autoplaySpeed: 3000,
			adaptiveHeight: true,
      responsive: [
    {
      breakpoint: 540,
      settings: {
        slidesToShow: 1,
        slidesToScroll: 1,
        dots: true,
        arrows:false
      }
    }
    // You can unslick at a given breakpoint now by adding:
    // settings: "unslick"
    // instead of a settings object
  ]
      
	    });
	  }