package com.zeus.common.interceptor;

import java.lang.reflect.Method;

import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class LoginInterceptor implements HandlerInterceptor {
	private static final String USER_INFO = "userInfo";

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String requestURL = request.getRequestURI();
		log.info("preHandle requestURL : " + requestURL);

		HandlerMethod handelmethod = (HandlerMethod) handler;
		Method methodObj = handelmethod.getMethod();
		log.info("preHandle Bean: " + handelmethod.getBean());

		log.info("preHandle Method: " + methodObj);
		HttpSession session = request.getSession();
		if (session.getAttribute(USER_INFO) != null) {
			session.removeAttribute(USER_INFO);
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.info("postHandle");
		String requestURL = request.getRequestURI();
		// requestURL : /login

		log.info("postHandle requestURL : " + requestURL);
		HandlerMethod handlemethod = (HandlerMethod) handler;
		// Bean: com.zeus.controller.Logincontroller@13ed2e22

		Method methodObj = handlemethod.getMethod();
		log.info("postHandle Bean: " + handlemethod.getBean());
		// Method: public void com.zeus.controller.Logincontroller.login()

		log.info("postHandle Method: " + methodObj);
		
		HttpSession session = request.getSession();
		//모델에 user라는 키값으로 member를 넣었다. login() 함수에 실행  model.addAttribute("user",model)
		ModelMap modelMap = modelAndView.getModelMap();
		Object member = modelMap.get("user");

		if (member != null) {
			log.info("member != null");
			session.setAttribute(USER_INFO, member);
			response.sendRedirect("/");
		}
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		log.info("afterCompletion");
		String requestURL = request.getRequestURI();
		log.info("afterCompletion requestURL : " + requestURL);

		HandlerMethod handelmethod = (HandlerMethod) handler;
		log.info("afterCompletion Bean: " + handelmethod.getBean());

		Method methodObj = handelmethod.getMethod();
		log.info("afterCompletion Method: " + methodObj);
	}

}
