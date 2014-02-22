<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>客户管理</title>
		
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
				  "iDisplayLength": 20,
				  "bSort": false
				  } 
				);
				
				$("div.toolbar").html('<a href="#" onclick="openBox();return false;">新建</a>');
				
			} );
	
</script>
	
	
	</head>
	<body >
		<div id="main">
		<jsp:include page="common/top.jsp" flush="true" />
		<html:form action="/customer">
		<div>
			
			<div style="float: left">
		
				<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
				
					<thead>
						<tr>
							<th>客户名称</th>
							<th>类型</th>
							<th>联系人</th>
							<th>电话1</th>
							<th>电话2</th>
							<th>地址</th>
							<th>操作</th>
							
						</tr>
					</thead>
					<c:forEach items="${requestScope['customer.list']}" var="customer">
					
						<tr>						
							<td>
								<c:out value="${customer.name}" /> 
							</td>
							<td>
								<c:out value="${customer.type}" />
							</td>	
							<td>
								<c:out value="${customer.contact}" />
							</td>
							<td>
								<c:out value="${customer.phoneNumber1}" />
							</td>
							<td>
								<c:out value="${customer.phoneNumber2}" />
							</td>	
							<td>
								<c:out value="${customer.address}" />
							</td>	
							<td>
								<a href="#" onclick="openBox(${customer.id});return false;">编辑</a>  
							</td>		
						</tr>      
					</c:forEach>
				</table>
			</div>
			</div>
			
		</html:form>
			<script type="text/javascript">
			function openBox(id){
				$.weeboxs.open('customerEdit.do?method=init&id='+id, {title:'客户编辑', contentType:'ajax',
																						onok:function(){
																							customerEditForm.submit();														
																					 	}
																					 	});
			};
			</script>
		</div>
	</body>
</html>

