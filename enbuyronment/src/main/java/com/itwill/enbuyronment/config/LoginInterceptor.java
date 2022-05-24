package com.itwill.enbuyronment.config;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String requestURI = request.getRequestURI();

        HttpSession session = request.getSession(false);

        if (session == null || (session.getAttribute("userId") == null && session.getAttribute("mode") == null)){
        	response.sendRedirect("/user/login?redirectUrl=" + requestURI);
            return false;
        }
        
        return true;
        
	}


}
