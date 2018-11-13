import Typed from 'typed.js';

function loadDynamicBannerText() {
  if (document.getElementById("banner-typed-text")) {
    new Typed('#banner-typed-text', {
      strings: ["Ruby", "Javascript", "Python", "C", "Swift"],
      typeSpeed: 100,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
