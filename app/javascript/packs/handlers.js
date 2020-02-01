import $ from 'jquery';

$(window).on('turbolinks:load', () => {
  $('.spoiler').click(function(e) {
    if (!this.classList.contains('spoiled'))
      e.preventDefault();
    this.classList.add('spoiled');
    delete this.title;
  });

  $('.major-spoiler button').click(function() {
    const $button = $(this);
    const $majorSpoiler = $button.closest('.major-spoiler');
    const spoiled = $majorSpoiler.hasClass('spoiled');

    if (spoiled) {
      $majorSpoiler.removeClass('spoiled');
      $button.text('Show Spoiler');
    } else if (confirm('Are you sure you want to reveal this major spoiler?')) {
      $majorSpoiler.addClass('spoiled');
      $button.text('Hide Spoiler');
    }
  });

  const $spoilers = $('.spoiler, .major-spoiler');

  if ($spoilers.length) {
    $('[data-export-warn-of-spoilers]').click(function(e) {
      if (!confirm('This page contains spoilers, which are not hidden or censored in the exported data. Are you sure you want to proceed?')) {
        e.preventDefault();
        return false;
      }
    })
  }
});