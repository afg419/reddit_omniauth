$(document).ready(function(){
  $('.nav-tabs a').click(function(){
    $(this).tab('show');
  })

  get_posts('.nav-top','all', 'top');
  get_posts('.nav-new','all', 'new');
  get_posts('.nav-rising','all', 'rising');
  get_posts('.nav-controversial','all', 'controversial');
  get_posts('.nav-hot','all', 'hot');
  get_posts('.nav-gilded','all', 'gilded');
})
