package com.project.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.project.common.security.CustomAccessDeniedHandler;
import com.project.common.security.CustomLoginSuccessHandler;
import com.project.common.security.CustomNoOpPasswordEncoder;
import com.project.common.security.CustomUserDetailsService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
// 1. 데이터정보설정
@EnableWebSecurity
//시큐리티 애너테이션 활성화를 위한 설정
@EnableMethodSecurity(prePostEnabled=true, securedEnabled=true)
public class SecurityConfig {
	//데이터 정보 설정
	@Autowired
	DataSource dataSource;
	// 시큐리티 설정관리 함수
	@Bean
	SecurityFilterChain fiterChain(HttpSecurity http) throws Exception {
		// 1. csrf 토큰 비활성화
		http.csrf().disable();
		// 2. /board/list 인증만 하면 OK, /board/register 인증, 인가(MEMBER)
		// 인가설정
		/*
		 * http.authorizeRequests().requestMatchers("/board/**").authenticated();
		 * http.authorizeRequests().requestMatchers("/manager/**").hasRole("MANAGER");
		 * http.authorizeRequests().requestMatchers("/admin/**").hasRole("ADMIN");
		 * http.authorizeRequests().anyRequest().permitAll();
		 */
		// 3. id , pass 기존 사용하지 않고 우리가 설계한 아이디와 패스워드, 인가정책 세워서 제시하겠다.(DB테이블 연결, 인증 인가)
		// 4. 아이디, 패스워드 잘못 되었을때 화면에 인증이 안됩니다 다시입력해주세요(화면)
		// http.exceptionHandling().accessDeniedPage("/accessError");
		
		// 개발자가 정의한 로그인 페이지의 URI 지정하고 권한설정
		http.formLogin().loginPage("/auth/login").loginProcessingUrl("/login")
				.successHandler(createAuthenticationSuccessHandler());
		//로그인 실패시 접근거부
		http.exceptionHandling().accessDeniedHandler(createAccessDeniedHandler());
		// 개발자가 정의한 로그인 페이지의 URI를 지정한다.
		// 로그인 성공 후 처리를 담당하는 처리자로 지정한다.
		// http.formLogin().loginPage("/login").successHandler(createAuthenticationSuccessHandler());
		//7.
		// 로그아웃 처리를 위한 URI를 지정하고, 로그아웃한 후에 세션을 무효화 한다.
		http.logout().logoutUrl("/auth/logout").invalidateHttpSession(true).deleteCookies("remember-me","JSESSION_ID");
		// 로그아웃을 하면 자동 로그인에 사용하는 쿠키도 삭제한다
		// 데이터 소스를 지정하고 테이블을 이용해서 기존 로그인 정보를 기록
		// 쿠키의 유효 시간을 지정한다(24시간).
		http.rememberMe().key("zeus").tokenRepository(createJDBCRepository()).tokenValiditySeconds(60 * 60 * 24);

		return http.build();
	}
	//1. read me
	private PersistentTokenRepository createJDBCRepository() {
		JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
		repo.setDataSource(dataSource);
		return repo;
	}
	// 2. 
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(createUserDetailsService()).passwordEncoder(createPasswordEncoder());
	}

	// 3. 스프링 시큐리티의 UserDetailsService를 구현한 클래스를 빈으로 등록한다.
	@Bean
	public UserDetailsService createUserDetailsService() {
		return new CustomUserDetailsService();
	}

	// 4. 사용자가 정의한 비번 암호화 처리기를 빈으로 등록한다.
	@Bean
	public PasswordEncoder createPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}

	// 5. 로그인 잘못 되었을때 발생되는 핸들러 처리 CustomAccessDeniedHandler를 빈으로 등록한다
	@Bean
	public AccessDeniedHandler createAccessDeniedHandler() {
		return new CustomAccessDeniedHandler();
	}

	// 6. 로그인이 성공 되었을때 핸들러 처리 CustomLoginSuccessHandler를 빈으로 등록한다.
	@Bean
	public AuthenticationSuccessHandler createAuthenticationSuccessHandler() {
		return new CustomLoginSuccessHandler();
	}


}
