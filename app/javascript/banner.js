import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Hello #{@user.first_name}", "welcome on Pilou"],
    typeSpeed: 2,
    loop: false
  });
}

export { loadDynamicBannerText };
