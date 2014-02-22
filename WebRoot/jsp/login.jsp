<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="common/tags.jsp" flush="true" />
<html>
  <head>
  
    
    <title>硕春冷库仓储管理系统</title>
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" media="screen" /> 

  </head>
  
  <body>
    <html:form action="login.do?method=check" method="post" >
      <div style="position: relative;background-image: url('images/login.jpg');width: 545px; height: 270px;margin: 100px auto 0px auto">
      	<c:if test="${!empty message}">
	      	<div style="position: absolute;
	      				top: 50px;
	      				left:295px;
	      				width: 185px;
	      				padding:2px 2px 2px 25px;
	      				background-image: url(images/warning.gif);
	      				background-repeat: no-repeat;
	      				background-position: 5px;
	      				background-color: #FFF2F2;
	      				border: 1px solid #FF8080;
	      				font-size: 12px">
	      		<c:out value="${message}" />
	      	</div>
      	</c:if>
      	<div style="position: absolute;top: 90px;left:295px">
      		
	    	<label>用户名 </label><input name="userName" type="text" style=" font-size:14px;border:solid 1px #999;width: 120px"/><br/>
	    	<label>密&nbsp;&nbsp;&nbsp;&nbsp;码 </label><input name="password" type="password" style=" font-size:14px;border:solid 1px #999;margin-top: 10px;width: 120px"/><br/>
	   		<input type="submit" style="border:solid 1px #666;margin:27px auto 0px 72px;padding:4px 10px 0px 10px" value="登录"/>
	    </div>
      </div>
    </html:form>
  </body>
</html>
