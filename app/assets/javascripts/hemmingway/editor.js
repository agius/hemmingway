$(function(){

  if(!$('[data-hw-editor]').length > 0){ return; }

  var styles_path = $('[data-hw-editor]').first().data('hw-styles');

  $.get(styles_path, function(styles){

    var base_config = $.extend(styles, {
      extraAllowedContent: 'dl;dt;dd;*(*);*[id]',
      forcePasteAsPlainText: 'true',
      format_tags: 'p;h1;h2;h3;h4;h5;h6;pre',
      toolbar: [
        { name: 'document',     items: [ 'Source', 'Preview' ] },
        { name: 'basicstyles',  items: [ 'Bold', 'Italic', 'Underline', 'RemoveFormat' ] },
        { name: 'paragraph',    items: [ 'NumberedList','BulletedList','-','Outdent','Indent' ] },
        { name: 'links',        items: [ 'Link','Unlink','Anchor' ] },
        { name: 'styles',       items: [ 'Format' ] },
        { name: 'insert',       items: [ 'Image' ] }
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

  $('[data-hw-button="preview"]').on('click', function(){
    var elem = $(this),
        form = elem.parents('form'),
        original_path = elem.attr('action'),
        original_target = elem.attr('target'),
        path = elem.data('hw-preview-path');

    form.attr('action', path);
    form.attr('target', '_blank');
    form.submit();
    form.attr('action', original_path);
    form.attr('target', original_target);
  });
  
});