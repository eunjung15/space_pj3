package com.sc.spaceCollection.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.sc.spaceCollection.usermain.model.Coupon;

@Configuration
public class AppConfig {
    @Bean
    public Coupon couponBean() {
        return new Coupon();
    }
}
