<%@ page language="java" pageEncoding="GB18030"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
 
<html> 
	<head>
		<title>JSP for ContractEditForm form</title>
		<link rel="stylesheet" type="text/css" href="plug-in/datePicker/css/datePicker.css" />
<script src="plug-in/datePicker/js/jquery-1.3.2.min.js" type="text/javascript"></script>
<script src="plug-in/datePicker/js/jquery.datePicker-min.js" type="text/javascript"></script>
<!--[if IE]><script type="text/javascript" src="plug-in/datePicker/js/jquery.bgiframe.min.js"></script><![endif]-->
		<script type="text/javascript">
			$(window).ready(function(){		
				$('.date-pick').datePicker({clickInput:true,startDate:'01/01/1996'});
			});
</script>
	</head>
	<body>
		<html:form action="/contractEdit">
			signingDate : <html:text property="signingDate"/><html:errors property="signingDate"/><br/>
			type : <html:text property="type"/><html:errors property="type"/><br/>
			validity : <html:text property="validity"/><html:errors property="validity"/><br/>
			effectiveDate : <html:text property="effectiveDate" styleClass="date-pick"/><html:errors property="effectiveDate"/><br/>
			comment : <html:textarea property="comment"/><html:errors property="comment"/><br/>
			status : <html:text property="status"/><html:errors property="status"/><br/>
			endDate : <html:text property="endDate"/><html:errors property="endDate"/><br/>
			<html:hidden property="id"/><html:errors property="id"/><br/>
			<html:submit/><html:cancel/>
		</html:form>
	</body>
</html>

