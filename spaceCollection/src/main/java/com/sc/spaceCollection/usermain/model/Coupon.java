package com.sc.spaceCollection.usermain.model;
import java.util.UUID;

import java.util.HashSet;
import org.springframework.stereotype.Component;

@Component
public class Coupon {
	
    public static String generateCoupon() {
        UUID uuid = UUID.randomUUID();
        // UUID에서 '-' 제거하고 대문자로 변환하여 쿠폰 번호 생성
        String coupon = uuid.toString().replace("-", "").toUpperCase();
        return coupon.substring(0, 12); // 쿠폰 번호 길이 조절
    }

    public static boolean isUniqueCoupon(HashSet<String> coupons, String coupon) {
        return !coupons.contains(coupon);
    }

    public static void main(String[] args) {
        int numberOfCoupons = 1; // 생성할 쿠폰 번호 수

        HashSet<String> generatedCoupons = new HashSet<>();
        for (int i = 0; i < numberOfCoupons; i++) {
            String coupon = generateCoupon();
            while (!isUniqueCoupon(generatedCoupons, coupon)) {
                coupon = generateCoupon();
            }
            generatedCoupons.add(coupon);
            System.out.println("Generated coupon: " + coupon);
        }
    }

}
