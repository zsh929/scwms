package com.sclk.scwms.web.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.actions.DispatchAction;

public class BaseAction extends DispatchAction {
	protected String back = "back";
	protected String create = "create";
	protected String delete = "delete";
	protected String display = "display";
	protected String edit = "edit";
	protected String init = "init";
	protected String include = "include";
	protected String reset = "reset";
	protected String success = "success";
	protected String failed = "failed";
	protected String exit = "exit";
	protected String list = "list";
	protected String copy = "copy";
	protected static final long tempUserID = 1;
	

	public static Integer getSessUserId(HttpServletRequest request) {
		Integer userId=0;
		Object reqUserId = request.getSession().getAttribute("userId");
		if (reqUserId!=null) {
			String UserIdStr = reqUserId.toString();
			if (!"".equals(UserIdStr)) {
				userId = new Integer(UserIdStr);
			}
		}
		return userId;
	}
	
	protected String getSessUserName(HttpServletRequest request) {
		String userName="";
		Object sessUserName = request.getSession().getAttribute("userName");
		if (sessUserName!=null) {
			String UserNameStr = sessUserName.toString();
			if (!"".equals(UserNameStr)) {
				userName = UserNameStr;
			}
		}
		return userName;
	}
	protected int getSessUserType(HttpServletRequest request) {
		String userType="";
		Object sessUserType = request.getSession().getAttribute("userType");
		if (sessUserType!=null) {
			String UserTypeStr = sessUserType.toString();
			if (!"".equals(UserTypeStr)) {
				userType = UserTypeStr.trim();
			}
		}
		return Integer.valueOf(userType).intValue();
	}
	
	protected String getSessLastLoginTime(HttpServletRequest request) {
		String lastLoginTime="";
		Object sessLastLoginTime = request.getSession().getAttribute("lastLoginTime");
		if (sessLastLoginTime!=null) {
			String UserTypeStr = sessLastLoginTime.toString();
			if (!"".equals(UserTypeStr)) {
				lastLoginTime = UserTypeStr;
			}
		}
		return lastLoginTime;
	}
	
	
	//-------------------- ?1?7?1?7 ?1?7?1?7 ?1?7?1?7 ?1?7?1?7 ----------------------------
	public int StringToInt (String str){
		if (!StringUtils.equals("", str)) {
			return Integer.parseInt(str);
		}else {
			return 0;
		}
	}
	
	public String intToString(int i){
		return String.valueOf(i);
	}
	public Date stringConversionToDate(String _strDate)
	{
		Date date = null ;
		try
		{
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd") ;
			date = sdf.parse(_strDate) ;	
		}
		catch(Exception ex)
		{
			ex.printStackTrace() ;
		}
		return date ;
	}
}
