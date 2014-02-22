<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html> 
	<head>
		<title>JSP for CargoForm form</title>
		<link type="text/css" rel="stylesheet" href="css/common.css" />
	</head>
	<body>
		<div id="form_stylized" class="myform">	
		<html:form styleId="cargoEdit" action="/cargoEdit?method=save">
			<html:hidden property="id"/><html:errors property="id"/><br/>
			<label>编号 </label><html:text property="number"/><html:errors property="number"/><br/>
			<label>货物名称 </label> <html:text property="name"/><html:errors property="name"/><br/>
			<label>货物类型 </label>
			<select id="category" name="category" >
				<c:forEach var="sys" items="${cargoEditForm.categoryList}" >
					<c:choose>
						<c:when test="${cargoEditForm.category==sys.codeKey}">
							<option selected="selected" value="${sys.codeKey }">${sys.codeValue }</option>
						</c:when>
						<c:otherwise>
							<option  value="${sys.codeKey }">${sys.codeValue }</option>
						</c:otherwise>
					
					</c:choose>
				
					
				</c:forEach>
			</select>
			
			
			
			<html:errors property="category"/><br/>
			<label>规格 </label><html:text property="size"/><html:errors property="size"/><br/>
			<label>单位 </label>
			<select id="unit" name="unit" >
				<c:forEach var="sys" items="${cargoEditForm.unitList}" >
					<c:choose>
						<c:when test="${cargoEditForm.unit==sys.codeKey}">
							<option selected="selected" value="${sys.codeKey }">${sys.codeValue }</option>
						</c:when>
						<c:otherwise>
							<option  value="${sys.codeKey }">${sys.codeValue }</option>
						</c:otherwise>
					
					</c:choose>
					
				</c:forEach>
			</select>


			<br/>
			<label>重量 </label><html:text property="weight" style="width:100px"/><html:errors property="weight"/><br/>
			<label>客户 </label>
			<select id="customerId" name="customerId" >
				<option selected="selected" value="0">--请选择--</option>
				<c:forEach var="customer" items="${cargoEditForm.customerList}" >
					<c:choose>
						<c:when test="${cargoEditForm.customerId==customer.id}">
							<option selected="selected" value="${customer.id }">${customer.name }</option>
						</c:when>
						<c:otherwise>
							<option  value="${customer.id }">${customer.name }</option>
						</c:otherwise>
					
					</c:choose>
					
				</c:forEach>
			</select><br/>
			
		</html:form>
		</div>
	</body>
</html>

