package com.zeus.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
@EnableWebSecurity
public class SecurityConfig {

	@Bean
	SecurityFilterChain fiterChain(HttpSecurity http) throws Exception {
		log.info("SecurityConfig");
		// 1. csrf 토큰 비활성화
		http.csrf().disable();
		// 2. /board/list 인증만 하면 OK, /board/register 인증, 인가(MEMBER)
		http.authorizeRequests().requestMatchers("/board/list").permitAll();
		http.authorizeRequests().requestMatchers("/board/register").hasRole("MEMBER");
		http.authorizeRequests().requestMatchers("/notice/list").permitAll();
		http.authorizeRequests().requestMatchers("/board/register").hasRole("ADMIN");

		http.formLogin();
		// 3. id , pass 기존 사용하지 않고 우리가 설계한 아이디와 패스워드, 인가정책 세워서 제시하겠다.(DB테이블 연결, 인증 인가)
		// 4. 아이디, 패스워드 잘못 되었을때 화면에 인증이 안됩니다 다시입력해주세요(화면)
		http.exceptionHandling().accessDeniedPage("/accessError");
		//5. 로그인 기본폼을 사용
		
		return http.build();
	}

	@Autowired
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// 지정된 아이디와 패스워드로 로그인이 가능하도록 설정한다.
		auth.inMemoryAuthentication().withUser("member").password("{noop}1234").roles("MEMBER");
		auth.inMemoryAuthentication().withUser("admin").password("{noop}1234").roles("ADMIN");
	}
}
