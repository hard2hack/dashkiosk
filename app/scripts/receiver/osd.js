module.exports = (function(window, undefined) {
  'use strict';

  return {
    hide: function() {
      Array.prototype.forEach.call(
        document.querySelectorAll('.osd'),
        function(osd) { osd.classList.remove('show'); });
    },
    show: function(text) {
      document.querySelector('.osd.text').textContent = text;
      Array.prototype.forEach.call(
        document.querySelectorAll('.osd'),
        function(osd) { osd.classList.add('show'); });
    }
  };

})(window);
