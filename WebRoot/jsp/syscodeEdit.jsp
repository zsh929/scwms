<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 
<html> 
	<head>
		<title>编码修改</title>
		<link type="text/css" rel="stylesheet" href="css/common.css" />
	</head>
	<body>
		<html:form action="/syscodeEdit.do?method=save">
		<div id="form_stylized" class="myform">
			<html:hidden property="id"/>
			<label>内容 </label><html:text property="value"/><html:errors property="value"/><br/>
			<label>编号 </label><html:text property="key"/><html:errors property="key"/><br/>
			<label>上级 </label><html:text property="parentKey"/><html:errors property="parentKey"/><br/>
			<label>排序 </label><html:text property="orderId"/><html:errors property="orderId"/><br/>
			<label>说明 </label><html:textarea property="memo"/><html:errors property="memo"/><br/>
			
			
		</div>
		</html:form>
	</body>
</html>

