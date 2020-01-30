import $ from 'jquery';

$(window).on('load turbolinks:load', () => {
  $('.spoiler').click(function(e) {
    e.preventDefault();
    this.classList.add('spoiled');
  });
});