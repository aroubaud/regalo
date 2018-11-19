import Typed from 'typed.js';

function loadDynamicBannerText() {
  new Typed('#banner-typed-text', {
    strings: ["birthdays", "house warmings", "Christmas", "office parties", "weddings", "house parties", "baby showers"],
    typeSpeed: 80,
    loop: true
  });
}

export { loadDynamicBannerText };
