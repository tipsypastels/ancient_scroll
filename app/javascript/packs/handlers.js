import $ from 'jquery';

$(window).on('turbolinks:load', () => {
  $('.spoiler').click(function(e) {
    if (!this.classList.contains('spoiled'))
      e.preventDefault();
    this.classList.add('spoiled');
  });
});