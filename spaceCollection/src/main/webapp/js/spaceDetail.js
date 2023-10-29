const paymentButtonss = document.querySelectorAll('.payment_type');

	  paymentButtonss.forEach(function(button) {
	      button.addEventListener('click', function(e) {
	          e.preventDefault();

	          paymentButtonss.forEach(function(btn) {
	              btn.style.border = 'none';
	          });

	          this.style.border = '#193D76 5px solid';
	          this.style.borderRadius = '1rem';
	      });
	  });


const navTabs = document.getElementsByClassName("nav-item");
const navItems = document.getElementsByClassName("detail-navTab");
const stickyTop = document.querySelector(".sticky-top"); // sticky-top 요소 선택
const getAbsoluteTop = (element) => {
  const rect = element.getBoundingClientRect();
  const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
  return rect.top + scrollTop;
};
// navItems의 offsetTop 값에 추가할 값을 설정합니다.
const offsetValue = 185;

const scrollToElementWithStickyTop = (element) => {
  const targetTop = getAbsoluteTop(element);
  const stickyTopHeight = stickyTop.offsetHeight; // sticky-top 요소의 높이
  const scrollY = targetTop - stickyTopHeight; // 추가로 위로 스크롤할 위치
  
  // 요소 위치로 스크롤하면서 sticky-top 요소의 높이만큼 더 위로 스크롤
  window.scroll({ top: scrollY, behavior: 'smooth' });
};

for (let i = 0; i < navTabs.length; i++) {
  navTabs[i].addEventListener('click', function() {
    scrollToElementWithStickyTop(navItems[i]);
  });
}


// 각 navTabs 요소에 클릭 이벤트를 추가합니다.
for (let i = 0; i < navTabs.length; i++) {
    navTabs[i].onclick = function () {
        const scrollTo = navItems[i].offsetTop - offsetValue;
        window.scroll({ top: scrollTo, behavior: 'smooth' });
    };
}


const buttons = document.querySelectorAll('.button');

    buttons.forEach(function(button, index) {
      button.addEventListener('click', function(e) {
        e.preventDefault();
        
        this.parentNode.classList.toggle('on');
        
        buttons.forEach(function(button2, index2) {
          if ( index !== index2 ) {
            button2.parentNode.classList.remove('on');
          }
        });
      });
    });
    
    
const inButtons = document.querySelectorAll('.inButton');

    inButtons.forEach(function(button, index) {
      button.addEventListener('click', function(e) {
        e.preventDefault();
        
        this.parentNode.classList.toggle('on');
        
        inButtons.forEach(function(button2, index2) {
          if ( index !== index2 ) {
            button2.parentNode.classList.remove('on');
          }
        });
      });
    });
    
    

let timeSlots = document.querySelectorAll('.swiper-inBox');
let selectedStartTime = null;

timeSlots.forEach(function(slot) {
    slot.addEventListener('click', function(e) {
        e.preventDefault();

        const clickedIndex = Array.from(timeSlots).indexOf(this);

        if (selectedStartTime === null) {
            selectedStartTime = clickedIndex;
             timeSlots.forEach(function(slot){
				slot.classList.remove('on');
			});
            this.classList.add('on');
        } else {
            timeSlots.forEach(function(slot) {
                slot.classList.remove('on');
            });

            const minIndex = Math.min(selectedStartTime, clickedIndex);
            const maxIndex = Math.max(selectedStartTime, clickedIndex);

            let hasReservedBetween = false;
            
            for (let i = minIndex + 1; i < maxIndex; i++) {
                if (timeSlots[i].classList.contains('reserved')) {
                    hasReservedBetween = true;
                    break;
                }
            }

            if (hasReservedBetween) {
                alert('이미 예약된 날짜가 포함되어있습니다!');
            } else {
                timeSlots.forEach(function(slot, index) {
                    if (index >= minIndex && index <= maxIndex) {
                        slot.classList.add('on');
                    }
                });
            }
            
            selectedStartTime = null;
        }
    });
});




function timeTableReset(){
	timeSlots.forEach(function(slot){
		slot.classList.remove('on');
		$('.totalPrice').text("예약 시간을 선택해주세요.");
		
	})
}



   
