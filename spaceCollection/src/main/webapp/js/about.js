// introLogo

const introPlay = () => {
  const intro = document.querySelector(".introLogo");
  const introTxt = document.querySelector(".introLogo p");
  document.body.style.overflowY = "hidden";
  intro.classList.add("play");
  setTimeout(function () {
    introTxt.style.fontSize = "20em";
    introTxt.style.opacity = "0";
    setTimeout(function () {
      intro.style.display = "none";
      introTxt.style.display = "none";
      document.body.style.overflowY = "scroll";
    }, 1000);
  }, 1000);
};
addEventListener("DOMContentLoaded", introPlay);

// introLogo ------------------------

const sec3 = document.querySelector(".sec3");
const sticky = document.querySelector(".sticky");
const ulHo = document.querySelector(".ulHo");

function calcHt(ht) {
  return (
    ht.scrollWidth -
    document.documentElement.clientWidth +
    document.documentElement.clientHeight
  );
}

sec3.style.height = `${calcHt(ulHo)}px`;

addEventListener("scroll", scrolled);

function scrolled() {
  console.log("sticky.offsetTop:", sticky.offsetTop);
  ulHo.style.transform = `translateX(-${sticky.offsetTop}px)`;
}

/* ------------------------------------------- */

// 1214
// 사라지는 효과

const fadeOutAll = document.querySelectorAll(".fade-out");

const fadeOut1 = document.querySelector(".fadeOut1");
const fadeOut2 = document.querySelector(".fadeOut2");
const fadeOut3 = document.querySelector(".fadeOut3");
const fadeOut4 = document.querySelector(".fadeOut4");
const fadeOut5 = document.querySelector(".fadeOut5");

addEventListener("scroll", () => {
  sticky.offsetTop > 100
    ? (fadeOut1.style.opacity = 0)
    : (fadeOut1.style.opacity = 1);
  sticky.offsetTop > 1000
    ? (fadeOut2.style.opacity = 0)
    : (fadeOut2.style.opacity = 1);
  sticky.offsetTop > 1700
    ? (fadeOut3.style.opacity = 0)
    : (fadeOut3.style.opacity = 1);
  sticky.offsetTop > 2580
    ? (fadeOut4.style.opacity = 0)
    : (fadeOut4.style.opacity = 1);
  sticky.offsetTop > 3000
    ? (fadeOut5.style.opacity = 0)
    : (fadeOut5.style.opacity = 1);
});

//   sticky.offsetTop 값 --------------------------------------------------------------------------------------------------

/* ------------------------------------------- */

// 원 애니메이션 효과
const pageLoad = () => {
  const clipImg = document.querySelector(".clipImg");
  const bgMask = document.querySelector(".bgMask");
  // menu랑 bgBox(메뉴에서 mission역할)는 메인메뉴에서도  어차피 써야되니까 전역으로 선언하세요.그냥 참고하라고 함수 안에 넣어둔 것
  const bgBox = document.querySelector("#bgBox");
  // const menu = document.querySelector(".container");

  const bgEnd = () => (bgMask.style.clipPath = "inset(0% 0% 0% 0% round 0)");
  const bgScaleUp = () => (clipImg.style.transform = "scale(1)");
  const bgLoad = () => (bgBox.style.clipPath = "inset(0% 0% 0% 0%)");
  const bgOut = () => (bgMask.style.display = "none");
  const menuDown = () => (menu.style.top = 0);

  menu.style.top = `-${menu.offsetHeight}px`;
  setTimeout(function () {
    // bgEnd: bgMask 커지는 함수
    setTimeout(bgEnd, 500);
    // bgScaleUp: clipImg 살짝 커지는 함수
    setTimeout(bgScaleUp, 500);
    // bgLoad: 원래 이미지 커지는 함수. 생략 가능
    setTimeout(bgLoad, 1430);
    // bgMask 애니메이션 끝나고 사라지는 함수.
    setTimeout(bgOut, 2000);
    // 모든 애니메이션 후 메인메뉴 나타나는 함수.
    setTimeout(menuDown, 1280);
  }, 1500);
};

addEventListener("DOMContentLoaded", pageLoad);

/* ---------------------------------------
// 휠 스크롤 부드럽게
class Scrooth {
  constructor({element = window, strength=10, acceleration = 1.2,deceleration = 0.975}={}) {
    this.element = element;
    this.distance = strength;
    this.acceleration = acceleration;
    this.deceleration = deceleration;
    this.running = false;

    this.element.addEventListener('wheel', this.scrollHandler.bind(this), {passive: false});
    this.element.addEventListener('mousewheel', this.scrollHandler.bind(this), {passive: false});
    this.scroll = this.scroll.bind(this);
  }

  scrollHandler(e) {
    e.preventDefault();

    if (!this.running) {
      this.top = this.element.pageYOffset || this.element.scrollTop || 0;
      this.running = true;
      this.currentDistance = e.deltaY > 0 ? 0.1 : -0.1;
      this.isDistanceAsc = true;
      this.scroll();
    } else {
      this.isDistanceAsc = false;
      this.currentDistance = e.deltaY > 0 ? this.distance : -this.distance;
    }
  }

  scroll() {
    if (this.running) {
      this.currentDistance *= this.isDistanceAsc === true ? this.acceleration : this.deceleration;
      Math.abs(this.currentDistance) < 0.1 && this.isDistanceAsc === false ? this.running = false : 1;
      Math.abs(this.currentDistance) >= Math.abs(this.distance) ? this.isDistanceAsc = false : 1;

      this.top += this.currentDistance;
      this.element.scrollTo(0, this.top);
      
      requestAnimationFrame(this.scroll);
    }
  }
}

const scroll = new Scrooth({
  element: window,
  strength: 20,
  acceleration: 1.5,
  deceleration: 0.975,
});
 */
