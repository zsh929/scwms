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
			<label>客户名称 </label><html:text property="name"/><html:errors property="name"/><br/>
			<label>简称 </label><html:text property="shortName"/><html:errors property="shortName"/><br/>
			<label>助记符 </label><html:text property="symbol"/><html:errors property="symbol"/><br/>
			
			<label>联系人 </label><html:text property="contact"/><html:errors property="contact"/><br/>
			<label>客户类型 </label>
			 <select id="type" name="type" >
				<c:forEach var="sys" items="${customerEditForm.typeList}">
					<option value="${sys.codeKey }">${sys.codeValue }</option>
				</c:forEach>
			  </select>
			
			<html:errors property="type"/><br/>
            
			<label>电话号码_1 </label><html:text property="phoneNumber1"/><html:errors property="phoneNumber1"/><br/>
			<label>电话号码_2 </label><html:text property="phoneNumber2"/><html:errors property="phoneNumber2"/><br/>
			<label>传真 </label><html:text property="fax"/><html:errors property="fax"/><br/>
			<label>地址 </label><html:text property="address"/><html:errors property="address"/><br/>
			<label>邮编 </label><html:text property="postcode"/><html:errors property="postcode"/><br/>
			
			<label>税务登记号 </label><html:text property="dutyId"/><html:errors property="dutyId"/><br/>
			<label>开户行 </label><html:text property="openingBank"/><html:errors property="openingBank"/><br/>
			<label>银行账号 </label><html:text property="account"/><html:errors property="account"/><br/>
			
			<label>备注 </label><html:textarea property="memo"/><html:errors property="memo"/><br/>
			
			
		</div>
		</html:form>
	</body>
</html>

