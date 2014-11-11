$(function(){
  var summer_note = $('#page_html');

  summer_note.summernote({
    height: 500,
    codemirror: {
      lineNumbers: true,
      tabSize: 2,
      theme: "solarized light"
    }
  });
  
  summer_note.code(summer_note.val());
  summer_note.closest('form').on('submit', function(){
    summer_note.val(summer_note.code());
    return true;
  });
});