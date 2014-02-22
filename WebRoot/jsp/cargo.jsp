<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>货物管理</title>
		
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
				  {"sDom": '<"toolbar">frtip',
				   "iDisplayLength": 20} 
				);
				
				$("div.toolbar").html('<a href="#" onclick="openBox(${syscode.parentKey});return false;">新建</a>');
				
			} );
	
</script>
	
	
	</head>
	<body >
		<div id="main">
		<jsp:include page="common/top.jsp" flush="true" />
		<html:form action="/cargo">
		<div>
			
			<div style="float: left">
		
				<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
				
					<thead>
						<tr>
							<th>编号</th>
							<th>货物名称</th>
							<th>类型</th>
							<th>尺寸规格</th>
							<th>重量(kg)/单位</th>
							<th>客户</th>
							<th>操作</th>
							
						</tr>
					</thead>
					<c:forEach items="${requestScope['cargo.list']}" var="cargo">
					
						<tr>						
							<td>
								<c:out value="${cargo.number}" /> 
							</td>
							<td>
								<c:out value="${cargo.name}" />
							</td>	
							<td>
								<c:out value="${cargo.category}" />
							</td>
							<td>
								<c:out value="${cargo.size}" />
							</td>
							<td>
								<c:out value="${cargo.weight}" />kg/<c:out value="${cargo.unit}" />
								
							</td>	
							<td>
								<c:out value="${cargo.customerName}" />
							</td>
							<td align="center">
								<a href="#" onclick="openBox(${cargo.id});return false;">编辑</a> 
								<a href="monthTotal.do?method=view&customerId=${cargo.customerId}" >月盘存</a>
							</td>		
						</tr>      
					</c:forEach>
				</table>
			</div>
			</div>
			
		</html:form>
			<script type="text/javascript">
			function openBox(id){
				$.weeboxs.open('cargoEdit.do?method=init&cargoId='+id, {title:'货物信息', 
																		contentType:'ajax',
																		onok:function(){
																		cargoEdit.submit();														
																			
																	}});
			}
			</script>
		</div>
	</body>
</html>

