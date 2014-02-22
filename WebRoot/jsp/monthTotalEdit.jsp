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
		<html:form action="/monthTotalEdit.do?method=save">
		<div id="form_stylized" class="myform">
			<html:hidden property="id"></html:hidden>
			<label>客户名称 </label><html:text property="customerId"/><br/>
			
			<label>货物名称 </label><html:text property="cargoName"/><html:errors property="cargoName"/><br/>
			<html:hidden property="cargoId"/>
			<label>月份 </label><html:text property="month"/><html:errors property="month"/><br/>
			
			<label>入库数量 </label><html:text property="inQuantity"/><html:errors property="inQuantity"/><br/>
			<label>入库重量</label><html:text property="inWeight"/>
			<br/>
            <label>出库数量</label><html:text property="outQuantity"/><html:errors property="outQuantity"/><br/>
			<label>出库重量</label><html:text property="outWeight"/><html:errors property="outWeight"/><br/>
			<label>结存数量</label><html:text property="balanceQuantity"/><html:errors property="balanceQuantity"/><br/>
			<label>结存重量</label><html:text property="balanceWeight"/><html:errors property="balanceWeight"/><br/>
			
			
			<html:submit/><html:cancel/>
		</div>
		</html:form>
	</body>
</html>

