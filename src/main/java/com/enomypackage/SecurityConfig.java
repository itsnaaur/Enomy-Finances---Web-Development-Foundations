package com.enomypackage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import javax.sql.DataSource; // Import DataSource from javax package

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private DataSource dataSource; // Inject DataSource bean
    
    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication()
            .dataSource(dataSource)
            .usersByUsernameQuery("SELECT username, password, enabled, role FROM users WHERE username=?")
            .authoritiesByUsernameQuery("SELECT username, role FROM users WHERE username=?")
            .passwordEncoder(passwordEncoder());
    }


    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .authorizeRequests(authorize -> {
                authorize
                    .antMatchers("/loginPage.jsp").permitAll() // Allow access to login page
                    .antMatchers("/register").permitAll() // Allow access to registration
                    .anyRequest().authenticated();
            })
            .formLogin(form -> {
                form
                    .loginPage("/loginPage.jsp") // Specify your custom login page
                    .defaultSuccessUrl("/mainPage.jsp") // Redirect after successful login
                    .permitAll();
            })
            .logout(logout -> logout.permitAll());
    }

}
