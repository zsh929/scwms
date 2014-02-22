<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>储位管理</title>  
		
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
				
				$("div.toolbar").html('<a href="#" onclick="openBox();return false;">新建</a>');
				
			} );
	
</script>
	
	
	</head>
	<body >
		<div id="main">
		<jsp:include page="common/top.jsp" flush="true" />
		<html:form action="/location">
		<div>
			当前位置>>
			<a href="warehouse.do?method=view">仓库管理</a>>>
			<a href="warehouse.do?method=view&warehouseId=${requestScope['warehouseId']}">${requestScope['warehouseName']}</a>>>
			<a href="#">${requestScope['subWarehouseName']}</a>
			
			<div style="float: left">
		
				<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
				
					<thead>
						<tr>
							<th>编号</th>
							<th>区</th>
							<th>架</th>
							<th>层</th>
							<th>位</th>
							<th>类型</th>
							<th>操作</th>
							
						</tr>
					</thead>
					<c:forEach items="${requestScope['location.list']}" var="location">
					
						<tr>						
							<td>
								<c:out value="${location.id}" /> 
							</td>
							<td>
								<c:out value="${location.zoneId}" /> 
							</td>
							<td>
								<c:out value="${location.rackId}" />
							</td>	
							<td>
								<c:out value="${location.storeyId}" />
							</td>
							<td>
								<c:out value="${location.positionId}" />
							</td>
							<td>
								<c:out value="${location.type}" />
							</td>	
							
							<td>
								<a href="#" onclick="openBox(${location.id});return false;">编辑</a>  
							</td>		
						</tr>      
					</c:forEach>
				</table>
			</div>
			</div>
			
		</html:form>
			<script type="text/javascript">
			function openBox(id){
			
				$.weeboxs.open('locationEdit.do?method=init&warehouseId=${requestScope['subWarehouseId']}&locationId='+id, {title:'库房信息', contentType:'ajax'});
			};
			</script>
		</div>
	</body>
</html>

