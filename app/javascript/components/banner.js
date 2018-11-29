import Typed from 'typed.js';

function loadDynamicBannerText() {
  if (document.getElementById("banner-typed-text")) {
    new Typed('#banner-typed-text', {
      strings: ["birthdays", "parties", "anniversaries", "weddings", "graduations", "babyshowers", "Christmas", "housewarmings", "office parties"],
      typeSpeed: 80,
      loop: true
    });
  }
}

export { loadDynamicBannerText };
