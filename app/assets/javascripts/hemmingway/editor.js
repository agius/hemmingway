$(function(){
  $('[data-summernote]').each(function(){
    var elem = $(this);
    elem.summernote({
      height: 500,
      codemirror: {
        lineNumbers: true,
        tabSize: 2,
        theme: "solarized light"
      }
    });
    
    elem.code(elem.val());
    elem.closest('form').on('submit', function(){
      elem.val(elem.code());
      return true;
    });
  });

  $('[data-air-mode]').each(function(){
    var elem, form;
    
    elem = $(this);
    elem.summernote({
      airMode: true
    });

    form = $(elem.data('form-target'));
    form.on('submit', function(){
      form.find('#page_html').val(elem.code());
      return true;
    });

  });
  
});