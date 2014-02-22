<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html> 
	<head>
		<title>储位编辑</title>
		<link type="text/css" rel="stylesheet" href="css/common.css" />
	</head>
	<body>
		<html:form action="/locationEdit.do?method=save">
		<div id="form_stylized" class="myform">
			<label>所属仓库 </label><html:text property="warehouseId"/><br/>
			<label>id </label><html:text property="id"/><br/>
			<label>区 </label><html:text property="zoneId"/><br/>
			<label>架 </label><html:text property="rackId"/><br/>
			<label>层 </label><html:text property="storeyId"/><br/>
			<label>位 </label><html:text property="positionId"/><br/>
			<label>类型 </label><html:text property="type"/><br/>
			
			<html:hidden property="id"/><html:errors property="id"/><br/>
			<html:submit/><html:cancel/>
		</div>	
		</html:form>
	</body>
</html>

