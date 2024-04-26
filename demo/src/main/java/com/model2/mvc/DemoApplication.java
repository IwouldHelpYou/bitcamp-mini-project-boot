package com.model2.mvc;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.CorsFilter;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.model2.mvc.common.web.LogonCheckInterceptor;

@SpringBootApplication
public class DemoApplication {

	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

}


@Configuration
class MvcConfig implements WebMvcConfigurer {
    
	public MvcConfig() {
		System.out.println("==> WebConfig default Constructor call.............");
	}
	
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                .allowedOrigins("*")
                .allowedMethods("*")
                .allowedHeaders("*");
    }

    public void addViewControllers(ViewControllerRegistry registry) {
    	registry.addViewController("/").setViewName("forward:/index.jsp");
    	System.out.println("forward ==> loginView"); 
    }
//    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler("/**")
//                .addResourceLocations("classpath:webapp/*")
//                .setCachePeriod(0);
//    }
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		// URL Pattern 을 확인하고. interceptor 적용유무 등록함.
		registry.addInterceptor( new LogonCheckInterceptor()).addPathPatterns("/user/**");
			
	}
}
