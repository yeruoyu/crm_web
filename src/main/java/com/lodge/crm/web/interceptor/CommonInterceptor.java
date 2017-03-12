package com.lodge.crm.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.lodge.crm.core.entity.hibernate.User;

public class CommonInterceptor extends HandlerInterceptorAdapter {

	//private final Logger log = LoggerFactory.getLogger(CommonInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			String contextPath = request.getContextPath();
			response.sendRedirect(contextPath + "/login");
			return false;
		}
		String menuCss ="";
		try{
			String requestUri = request.getRequestURI();
			String contextPath = request.getContextPath();
			String url = requestUri.substring(contextPath.length());
			
			int len = url.indexOf("/", 1);
	
			menuCss = url.substring(1, len);
			menuCss = menuCss.replace("activity", "project");
			menuCss = menuCss.replace("school", "project");
			menuCss = menuCss.replace("country", "project");
			menuCss = menuCss.replace("channel", "system");
			menuCss = menuCss.replace("menu", "system");
			menuCss = menuCss.replace("user", "system");
		}catch(Exception ex){
			
		}
		if(menuCss.isEmpty()){
			menuCss = "customer";
		}
		request.setAttribute("menuCss", menuCss);

		return super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		super.afterCompletion(request, response, handler, ex);
	}

}
