package com.zeus.common.interceptor;

import java.lang.reflect.Method;

import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class AccessLoggingInterceptor implements HandlerInterceptor {
	private static final String USER_INFO = "userInfo";

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		String requestURL = request.getRequestURI();
		log.info("requestURL : " + requestURL);
		HandlerMethod handlerMethod = (HandlerMethod) handler;
		Method method = handlerMethod.getMethod();
		
		Class cla = method.getDeclaringClass();
		
		String className = cla.getName();
		
		String classSimpleName = cla.getSimpleName();
		String methodName = method.getName();
		log.info("[ACCESS CONTROLLER] " + className + "." + methodName);
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
