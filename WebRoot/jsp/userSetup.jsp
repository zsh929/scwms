<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib prefix="logic" uri="/WEB-INF/tlds/struts-logic.tld" %>
<%@ taglib prefix="html"  uri="/WEB-INF/tlds/struts-html.tld"  %>

<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>用户设置</title>
		
		<style type="text/css" title="currentStyle">
			@import "plug-in/dataTables/css/demo_page.css";
			@import "plug-in/dataTables/css/demo_table.css";
			.toolbar {
				float: left;
			}
		</style>
		<link type="text/css" rel="stylesheet" href="plug-in/weebox/weebox.css" />
		<script type="text/javascript" src="plug-in/lightTreeview/jquery-1.2.6.js"></script>
		<script type="text/javascript" src="plug-in/dynamicorderform/js/order.js"></script>
		<script type="text/javascript" language="javascript" src="plug-in/dataTables/js/jquery.dataTables.js"></script>
		<script type="text/javascript" src="plug-in/weebox/bgiframe.js"></script>
		<script type="text/javascript" src="plug-in/weebox/weebox.js"></script>
		
	</head>
	<body >
	
		<div id="main">
		<jsp:include page="common/top.jsp" flush="true" />
		<html:form action="/userEdit.do?method=setup">
			
		<div id="form_stylized" class="myform" >
		 	<h1>用户设置</h1>
        	<p></p>
        	<label>姓名 </label><html:text style="border:0px" readonly="true" property="name"/><br/>
			<label>用户名 </label><html:text style="border:0px" readonly="true" property="userName"/><br/>
			<label>当前密码 </label><html:password property="oldPassword"/><br/>
			<p></p>	
			<c:if test="${!empty message}">
		      	<div style="margin:0px auto;
		      				width: 185px;
		      				padding:5px 2px 5px 25px;
		      				background-image: url(images/warning.gif);
		      				background-repeat: no-repeat;
		      				background-position: 5px;
		      				background-color: #FFF2F2;
		      				border: 1px solid #FF8080;
		      				font-size: 14px">
		      		<c:out value="${message}" />
		      	</div>
      		</c:if>
			<label>新用户名 </label><html:text property="newUserName"/>	<br/>		
			<label>新密码 </label><html:password property="newPassword"/><br/>
			
			<label>确认新密码 </label><html:password property="repeatPassword"/><br/>
			<html:hidden property="id"/>
		</div>
		<div style="width: 50px;margin: 0px auto">
			<html:submit value="保存"/>
		</div>
		</html:form>
			
		</div>
	</body>
</html>


