<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html> 
	<head>
		<title></title>
		<link type="text/css" rel="stylesheet" href="css/common.css" />
		<script language="javascript" type="text/javascript" src="plug-in/My97Datepicker/WdatePicker.js"></script>
		<script type='text/javascript' src='plug-in/autocomplete/jquery.autocomplete.js'></script>
		
		<link rel="stylesheet" type="text/css" href="plug-in/autocomplete/jquery.autocomplete.css" />
	
	<script type="text/javascript">
	   
		</script>
	</head>
	<body>
		
		<html:form styleId="addStockInCargo" action="/addStockInCargo.do?method=add">
		<div id="form_stylized" class="myform" >
			编号重复，是否仍然保存？
			
		</div>
		
		</html:form>
			
	</body>
</html>

