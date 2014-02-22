<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>仓库管理</title>  
		
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
		<html:form action="/warehouse">
		<div>
			
			<div style="float: left">
		
				<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
				
					<thead>
						<tr>
							<th>编号</th>
							<th>仓库名称</th>
							
						<!--<th>长</th>
							<th>宽</th>
							<th>高</th>-->
							<th>尺寸</th>
							<th>面积</th>
							<th>容量</th>
							<th>操作</th>
							
						</tr>
					</thead>
					<c:forEach items="${warehouseForm.warehouseList}" var="warehouse">
					
						<tr>						
							<td>
								<c:out value="${warehouse.serialNumber}" /> 
							</td>
							<td>
								<a href="warehouse.do?method=view&warehouseId=${warehouse.id}">
									<c:out value="${warehouse.name}" />
								</a>
							</td>	
							
							<td>
								<c:out value="${warehouse.size}" />
							</td>	
							<td>
								<c:out value="${warehouse.area}" />
							</td>	
							<td>
								<c:out value="${warehouse.volume}" />
							</td>
							<td>
								<a href="#" onclick="openBox(${warehouse.id});return false;">编辑</a>  
							</td>		
						</tr>      
					</c:forEach>
				</table>
			</div>
			</div>
			
		</html:form>
			<script type="text/javascript">
			function openBox(id){
				$.weeboxs.open('warehouseEdit.do?method=init&warehouseId='+id, {title:'库房信息', contentType:'ajax',
																						onok:function(){
																							warehouseEditForm.submit();														
																					 	}});
			};
			</script>
		</div>
	</body>
</html>

