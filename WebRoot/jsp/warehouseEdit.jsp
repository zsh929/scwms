<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html> 
	<head>
		<title>库房编辑</title>
		<link type="text/css" rel="stylesheet" href="css/common.css" />
	</head>
	<body>
		<html:form action="/warehouseEdit.do?method=save">
		<div id="form_stylized" class="myform">
			<label>库房名称 </label><html:text property="name"/><html:errors property="name"/><br/>
			<label>库房编号 </label><html:text property="serialNumber"/><html:errors property="serialNumber"/><br/>
			<label>库房序号 </label><html:text property="serialKey"/><html:errors property="serialKey"/><br/>
			<html:hidden property="parentKey" value="0"></html:hidden>
			
			<label>尺寸 </label><html:text property="size"/><html:errors property="size"/><br/>
			<label>面积 </label><html:text property="area"/><html:errors property="area"/><br/>
			<label>容量 </label><html:text property="volume"/><html:errors property="volume"/><br/>
			<label>排序 </label><html:text property="orderId"/><html:errors property="orderId"/><br/>
			<label>说明 </label><html:textarea property="memo" rows="5"/><html:errors property="memo"/><br/>
			
			<html:hidden property="id"/><html:errors property="id"/><br/>
			
		</div>	
		</html:form>
	</body>
</html>

