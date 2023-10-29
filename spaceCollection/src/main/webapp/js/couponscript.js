document.addEventListener('DOMContentLoaded', () => {
    const couponList = document.getElementById('couponList');
    const generateButton = document.getElementById('generateButton');

    generateButton.addEventListener('click', () => {
        generateCoupons();
    });

    function generateCoupons() {
        const numberOfCoupons = 10; // 생성할 쿠폰 번호 수

        couponList.innerHTML = ''; // 기존 리스트 초기화

        for (let i = 0; i < numberOfCoupons; i++) {
            fetch('/generateCoupon') // 서버의 API 엔드포인트 호출
                .then(response => response.json())
                .then(data => {
                    const coupon = data.coupon;
                    const listItem = document.createElement('li');
                    listItem.textContent = coupon;
                    couponList.appendChild(listItem);
                });
        }
    }
});
