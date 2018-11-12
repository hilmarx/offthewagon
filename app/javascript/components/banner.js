import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Ruby", "Javascript", "Python", "C", "Swift"],
    typeSpeed: 100,
    loop: true
  });
}

export { loadDynamicBannerText };
