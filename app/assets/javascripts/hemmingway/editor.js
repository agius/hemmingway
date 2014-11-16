$(function(){

  CKEDITOR.stylesSet.add('hemmingway:/hemmingway/pages/styles.json');

  $.get('/hemmingway/pages/styles.json', function(styles){

    var base_config = $.extend(styles, {
      extraAllowedContent: 'dl;dt;dd;*(*);*[id]',
      forcePasteAsPlainText: 'true',
      format_tags: 'p;h1;h2;h3;h4;h5;h6;pre',
      toolbar: [
        { name: 'document',     items: [ 'Source', 'Preview' ] },
        { name: 'basicstyles',  items: [ 'Bold', 'Italic', 'Underline', 'RemoveFormat' ] },
        { name: 'paragraph',    items: [ 'NumberedList','BulletedList','-','Outdent','Indent' ] },
        { name: 'links',        items: [ 'Link','Unlink','Anchor' ] },
        { name: 'styles',       items: [ 'Format' ] }
      ]
    });


    $('[data-hw-editor="full"]').each(function(){
      var elem = $(this),
          config = $.extend(base_config, { height: '25rem' });
      elem.ckeditor(config);
    });

    $('[data-hw-editor="inline"]').each(function(){
      var elem,
          config = $.extend(base_config, { inline: 'true' });
      
      elem = $(this);
      CKEDITOR.inline(elem.attr('id'), config);

    });

  });
  
});