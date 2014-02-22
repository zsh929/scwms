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
		<html:form styleId="monthWarehouseEdit" action="/monthWarehouseEdit.do?method=save">
		<div id="form_stylized" class="myform">
			<html:hidden property="id"></html:hidden>
			<html:hidden property="monthTotalId"></html:hidden>
			<label>客户名称 </label><html:text property="customerId"/><br/>
			
			<label>货物名称 </label><html:text property="cargoName"/><html:errors property="cargoName"/><br/>
			<html:hidden property="cargoId"/>
			<label>月份 </label><html:text property="month"/><html:errors property="month"/><br/>
			
			<label>总数量</label><html:text property="balanceQuantity"/><html:errors property="balanceQuantity"/><br/>
			<label>总重量</label><html:text property="balanceWeight"/><html:errors property="balanceWeight"/><br/>
			<label>仓库</label><select name="warehouseId" style="width: 120px">
									<option value="">--请选择--</option>
									<c:forEach var="warehouse" items="${requestScope['stockWarehouse.list']}" >
										<option value="${warehouse.id }" disabled="disabled">${warehouse.name }</option>
										<c:forEach var="subWarehouse" items="${warehouse.subWarehouseList}" >
											<option value="${subWarehouse.id }">--${subWarehouse.name }</option>
										</c:forEach>
									</c:forEach>
								</select><br/>
			<label>数量</label><html:text property="quantity"/><br/>
			<label>重量</label><html:text property="weight"/><br/>
			
			
		</div>
		</html:form>
	</body>
</html>

