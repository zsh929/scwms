<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html> 
	<head>
		<title>JSP for CustomerForm form</title>
		<link type="text/css" rel="stylesheet" href="css/common.css" />
		
	</head>
	<body>
		<html:form action="/userEdit.do?method=save">
		<div id="form_stylized" class="myform">
			<html:hidden property="id"></html:hidden>
			<label>姓名 </label><html:text property="name"/><br/>
			<label>用户名 </label><html:text property="userName"/><br/>
			
			<label>角色 </label>
			<html:select property="role" >
				<html:option  value="">--请选择--</html:option>
				<html:option  value="3">系统管理员</html:option>
				<html:option  value="2">仓库管理员</html:option>
				<html:option  value="1">普通用户</html:option>
			</html:select>
			
			<br/>
			<label>有效 </label>
			<html:select property="enabled" >
				<html:option  value="1">有效</html:option>
				<html:option  value="0">无效</html:option>
			</html:select>
			
			<br/>
			
			<label>出生日期 </label><html:text property="birthday"/><br/>
			
			<label>身份证号码 </label><html:text property="cardId"/><br/>
			<label>电话号码 </label><html:text property="phoneNumber1"/><br/>
            
			<label>手机号码 </label><html:text property="phoneNumber2"/><br/>
			<label>电话号码 </label><html:text property="phoneNumber3"/><br/>
			<label>住址 </label><html:text property="address"/><br/>
			<label>教育程度 </label><html:text property="education"/><br/>
			<label>职位 </label><html:text property="duty"/><br/>
			
			
		</div>
		</html:form>
	</body>
</html>

