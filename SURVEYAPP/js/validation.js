
(function ($) {

  // Override nextPage function
  Drupal.multipageControl.prototype.nextPage = function() {
    var form = this.wrapper.closest('form');
    if (this.wrapper.hasClass('multipage-pane')) {
      validated = 1;
      $('input.required', this.wrapper).each(function(index) {
        if (!form.validate().element(this)) {
          validated = 0;
        }
      });
    }
    if (validated == 1) {
      this.wrapper.next().data('multipageControl').focus();
    }
    else {
      $('html, body').animate({scrollTop:0}, 'slow');
    }
  }

})(jQuery);


