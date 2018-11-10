import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["Ask a TA what the fuck is happening after Le Wagon is done!"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
