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
		<html:form action="/customerEdit.do?method=save">
		<div id="form_stylized" class="myform">
			<html:hidden property="id"></html:hidden>
			<label>客户名称 </label>
				<html:text property="name"/>			
			<label>联系人 </label>
				<html:text property="contact"/>
			<label>电话号码_1 </label>
				<html:text property="phoneNumber1"/>
			<label>电话号码_2 </label>
				<html:text property="phoneNumber2"/>			
			<label>传真 </label>
				<html:text property="fax"/>
			<label>地址 </label>
				<html:text property="address"/>
			<label>邮编 </label>
				<html:text property="postcode"/>		
			<label>税务登记号 </label>
				<html:text property="dutyId"/>
			<label>开户行 </label>
				<html:text property="openingBank"/>
			<label>银行账号 </label>
				<html:text property="account"/>	
			<label>备注 </label>
				<html:textarea property="memo"/>
			
		</div>
		</html:form>
	</body>
</html>

