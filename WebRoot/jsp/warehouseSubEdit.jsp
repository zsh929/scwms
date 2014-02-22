<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html> 
	<head>
		<title>库房编辑</title>
		<link type="text/css" rel="stylesheet" href="css/common.css" />
		<script type="text/javascript">
	   
		$().ready(function() {
			
			   $('input[name="length"],input[name="width"],input[name="height"]').blur(function(){
    
			      var length = $('input[name="length"]').val();
			      
			      var width = $('input[name="width"]').val();
			      
			      var height = $('input[name="height"]').val();
			      
			    $('input[name="area"]').val(length*width);
			    $('input[name="volume"]').val(length*width*height);
			    
			    });
		});
		
		</script>
	</head>
	<body>
		<html:form action="/warehouseEdit.do?method=save">
		<div id="form_stylized" class="myform">
			<label>库房名称 </label><html:text property="name"/><html:errors property="name"/><br/>
			<label>库房编号 </label><html:text property="serialNumber"/><html:errors property="serialNumber"/><br/>
			<label>所属仓库 </label><html:text property="parentKey"/>
			
			
			<html:errors property="parentKey"/><br/>
			<label>类型 </label>
 			<select id="type" name="type" >
				<c:forEach var="sys" items="${warehouseEditForm.typeList}" >
					<c:choose>
						<c:when test="${warehouseEditForm.type==sys.codeKey}">
							<option selected="selected" value="${sys.codeKey}">${sys.codeValue}</option>
						</c:when>
						<c:otherwise>
							<option  value="${sys.codeKey }">${sys.codeValue }</option>
						</c:otherwise>
					
					</c:choose>
				
					
				</c:forEach>
			</select>
			<label>温度 </label><html:text property="temperature"/><html:errors property="temperature"/><br/>
			
			
			<label>长 </label><html:text property="length"/>
			<label>宽 </label><html:text property="width"/>
			<label>高 </label><html:text property="height"/>
			<label>尺寸 </label><html:text property="size"/><html:errors property="size"/><br/>
			<label>面积 </label><html:text property="area"/><html:errors property="area"/><br/>
			<label>容量 </label><html:text property="volume"/><html:errors property="volume"/><br/>
			<label>排序 </label><html:text property="orderId"/><html:errors property="orderId"/><br/>
			<label>说明 </label><html:textarea property="memo"/><html:errors property="memo"/><br/>
			
			<html:hidden property="id"/><html:errors property="id"/><br/>
			
		</div>	
		</html:form>
	</body>
</html>

