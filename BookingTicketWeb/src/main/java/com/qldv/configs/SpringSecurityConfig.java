/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.qldv.configs;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.qldv.configs.handlers.LoginSuccessHandler;
import com.qldv.configs.handlers.LogoutHandler;
import java.util.Properties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 *
 * @author dieuh
 */
@Configuration
@EnableWebSecurity
@EnableTransactionManagement
@ComponentScan(basePackages = {
    "com.qldv"
//    "com.qldv.service"
})
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsService userDetailsService;
    @Autowired
    private AuthenticationSuccessHandler loginSuccessHandler;
    @Autowired
    private LogoutSuccessHandler logoutHandler;
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

   @Bean
    public Cloudinary cloudinary() {
        Cloudinary c = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "dvsqhstsi",
                "api_key", "811136311528217",
                "api_secret", "W4hY0CZswRXzLwb5_FbRd7iOO7k",
                "secure", true
        ));
        return c;
    }
    
    @Bean
    public AuthenticationSuccessHandler loginSuccessHandler() {
       return new LoginSuccessHandler();
    }
    @Bean
    public LogoutSuccessHandler logoutHandler() {
        return new LogoutHandler();
    }
    
    @Bean
    public JavaMailSender getMailSender(){
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);
        mailSender.setUsername("1951052049Hien@ou.edu.vn");
        mailSender.setPassword("phanthidieuhien1");
        mailSender.setDefaultEncoding("UTF-8");

        
        Properties javaMailProperties = new Properties();
        javaMailProperties.put("mail.smtp.starttls.enable", "true");
        javaMailProperties.put("mail.smtp.auth", "true");
        javaMailProperties.put("mail.transport.protocol", "smtp");
        javaMailProperties.put("mail.debug", "true");
        
        mailSender.setJavaMailProperties(javaMailProperties);
        return mailSender;
    }
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService)
                .passwordEncoder(passwordEncoder()); // C??ch th???c b??m m???t kh???u
    }
    
    @Override
    protected void configure(HttpSecurity http) throws Exception {
//        C???u h??nh form login
        http.formLogin().loginPage("/login")
                .usernameParameter("username")
                .passwordParameter("password");
//        C???u h??nh login th??nh c??ng hay th???t b???i
        http.formLogin().defaultSuccessUrl("/").failureUrl("/login?error");
        http.formLogin().successHandler(this.loginSuccessHandler);
//        C???u h??nh logout
        //http.logout().logoutSuccessUrl("/login");
        http.logout().logoutSuccessHandler(this.logoutHandler);
//        C???u h??nh khi ngo???i l???
        http.exceptionHandling().accessDeniedPage("/login?accessDenied");
//        Ph??n quy???n
        http.authorizeRequests().antMatchers("/").permitAll();
        http.authorizeRequests().antMatchers("/admin/**").access("hasAuthority('Admin')");
        http.authorizeRequests().antMatchers("/tickets/**").access("hasAnyAuthority('Employee', 'Admin')");
        http.authorizeRequests().antMatchers("/ad/driverdetails/list").access("hasAnyAuthority('Driver', 'Admin')");
          
        http.csrf().disable();
    }
    
    
    
}
