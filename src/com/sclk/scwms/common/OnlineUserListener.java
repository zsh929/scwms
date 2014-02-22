package com.sclk.scwms.common;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequestEvent;
import javax.servlet.ServletRequestListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.sclk.scwms.model.SystemLog;
import com.sclk.scwms.model.Users;
import com.sclk.scwms.service.SystemLogManager;

public class OnlineUserListener implements HttpSessionListener,ServletRequestListener  {
	private SystemLogManager systemLogManager;
	private  HttpServletRequest  request;
   
	public void setSystemLogManager(SystemLogManager systemLogManager) {
		this.systemLogManager = systemLogManager;
	}
	public void sessionCreated(HttpSessionEvent event) {
		//System.out.println("新建session:"+event.getSession().getId());
		HttpSession session = event.getSession();
		
		Users user = new Users();
		user.setUserName("未知");
		user.setLoginTime(new Date());
		user.setLoginAddress(request.getRemoteAddr());
		user.setSessionId(session.getId());
		
		
		session.setAttribute("user",user);
		
		ServletContext application = session.getServletContext();
		List<Users> onlineUserList = null;
		if(application.getAttribute("onlineUserList") != null){
			onlineUserList = (List<Users>) application.getAttribute("onlineUserList");
		}else{
			onlineUserList = new ArrayList<Users>();
			application.setAttribute("onlineUserList",onlineUserList);
        }
		onlineUserList.add(user);
		
		SystemLog systemLog = new SystemLog();
		systemLog.setUserName(user.getUserName());
		systemLog.setType("1");
		systemLog.setLoginAddress(user.getLoginAddress());
	    systemLog.setOperationTime(user.getLoginTime());
	    systemLog.setOperationContent("用户登录");
	    systemLog.setSessionId(session.getId());
		
		SystemLogManager systemLogManager = (SystemLogManager)this.getObjectFromApplication(session.getServletContext(), "systemLogManager");
		systemLogManager.sava(systemLog);
	}
	public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession session = event.getSession();
        ServletContext application = session.getServletContext();
        // 取得登录的用户名
        Users user = (Users)session.getAttribute("user");
        
        Date logoffTime = new Date();
		String operationContent = "用户注销";
		SystemLog systemLog = new SystemLog();
		systemLog.setUserName(user.getUserName());
		systemLog.setType("1");
		systemLog.setLoginAddress(user.getLoginAddress());
	    systemLog.setOperationTime(logoffTime);
	    systemLog.setOperationContent(operationContent);
	    systemLog.setSessionId(session.getId());
	    SystemLogManager systemLogManager = (SystemLogManager)this.getObjectFromApplication(session.getServletContext(), "systemLogManager");
	    systemLogManager.sava(systemLog);
        // 从在线列表中删除用户名
        List onlineUserList = (List) application.getAttribute("onlineUserList");
        if(onlineUserList != null){
        	onlineUserList.remove(user);
        }
       
	}
	
	/**
	 * 通过WebApplicationContextUtils 得到Spring容器的实例。根据bean的名称返回bean的实例。
	 * @param servletContext  ：ServletContext上下文。
	 * @param beanName  :要取得的Spring容器中Bean的名称。
	 * @return 返回Bean的实例。
	 */
	private Object getObjectFromApplication(ServletContext servletContext,String beanName){
		//通过WebApplicationContextUtils 得到Spring容器的实例。
		ApplicationContext application = WebApplicationContextUtils.getWebApplicationContext(servletContext);
		//返回Bean的实例。
		return application.getBean(beanName);
	}
	public void requestDestroyed(ServletRequestEvent arg0) {
		// TODO Auto-generated method stub
		
	}
	public void requestInitialized(ServletRequestEvent sre) {
		// TODO Auto-generated method stub
		 request=(HttpServletRequest)sre.getServletRequest();
	}
}