package com.jewelry.cms;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

/**
 * Created by godlikehzj on 2017/12/30.
 */
@SpringBootApplication

public class JewelryCmsApplication extends SpringBootServletInitializer {
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(JewelryCmsApplication.class);
    }

    public static void main(String[] args) throws Exception {
        SpringApplication.run(JewelryCmsApplication.class, args);
    }
}
