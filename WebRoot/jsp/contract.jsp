<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>存储协议管理</title>
		
		<style type="text/css" title="currentStyle">
			@import "plug-in/dataTables/css/demo_page.css";
			@import "plug-in/dataTables/css/demo_table.css";
			.toolbar {
				float: left;
			}
		</style>
		<link type="text/css" rel="stylesheet" href="plug-in/weebox/weebox.css" />
		<script type="text/javascript" src="plug-in/lightTreeview/jquery-1.2.6.js"></script>
		<script type="text/javascript" language="javascript" src="plug-in/dataTables/js/jquery.dataTables.js"></script>
		
		<script type="text/javascript" src="plug-in/weebox/bgiframe.js"></script>
		<script type="text/javascript" src="plug-in/weebox/weebox.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#example').dataTable(
				  {"sDom": '<"toolbar">frtip'} 
				);
				
				$("div.toolbar").html('<a href="#" onclick="openBox(${syscode.parentKey});return false;">新建</a>');
				
			} );
	
</script>
	
	
	</head>
	<body >
		<div id="main">
		<jsp:include page="common/top.jsp" flush="true" />
		<html:form action="/contract">
		<div>
			
			<div style="float: left">
		
				<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
				
					<thead>
						<tr>
							<th>编号</th>
							<th>协议名称</th>
							<th>客户名称</th>
							<th>生效日期</th>
							<th>截止日期</th>
							<th>储期</th>
							<th>操作</th>
							
						</tr>
					</thead>
					<c:forEach items="${requestScope['contract.list']}" var="cargo">
					
						<tr>						
							<td>
								<c:out value="${contract.serialNumber}" /> 
							</td>
							<td>
								<c:out value="${contract.name}" />
							</td>	
							<td>
								<c:out value="${contract.customerName}" />
							</td>
							<td>
								<c:out value="${contract.effectiveDate}" />
							</td>
							<td>
								<c:out value="${contract.endDate}" />
							</td>	
							<td>
								<c:out value="${contract.validity}" />
							</td>	
							<td>
								<a href="#" onclick="openBox(${contract.id});return false;">编辑</a>  
							</td>		
						</tr>      
					</c:forEach>
				</table>
			</div>
			</div>
			
		</html:form>
			<script type="text/javascript">
			function openBox(id){
				$.weeboxs.open('contractEdit.do?method=init&id='+id, {title:'存储协议', contentType:'ajax'});
			};
			</script>
		</div>
	</body>
</html>

