<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>用户管理</title>
		
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
				  {"sDom": '<"toolbar">frtip', "iDisplayLength": 20
				  } 
				);
				
				$("div.toolbar").html('<a href="#" onclick="openBox();return false;">新建</a>');
				
			} );
	
</script>
	
	
	</head>
	<body >
		<div id="main">
		<jsp:include page="common/top.jsp" flush="true" />
		<html:form action="/user">
		<div>
			
			<div style="float: left">
		
				<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
				
					<thead>
						<tr>
							<th>姓名</th>
							<th>用户名</th>
							<th>角色</th>
							<th>身份证号码</th>
							<th>电话号码</th>
							<th>手机号码</th>
							<th>住址</th>
							<th>操作</th>
							
						</tr>
					</thead>
					<c:forEach items="${requestScope['user.list']}" var="user">
					
						<tr>						
							<td>
								<c:out value="${user.name}" /> 
							</td>
							<td>
								<c:out value="${user.userName}" /> 
							</td>
							<td>
								<c:choose> 
									<c:when test="${user.role==1}"> 
								    	普通用户
									</c:when> 
									<c:when test="${user.role==2}"> 
								    	仓库管理员
									</c:when>
									<c:when test="${user.role==3}"> 
								    	系统管理员
									</c:when>  
								</c:choose> 
								
							</td>	
							<td >
								<c:out value="${user.cardId}" />
							</td>
							<td>
								<c:out value="${user.phoneNumber1}" />
							</td>
							<td >
								<c:out value="${user.phoneNumber2}" />
							</td>
							<td>
								<c:out value="${user.address}" />
							</td>	
							<td>
								<a href="#" onclick="openBox(${user.id});return false;">编辑</a>  
							</td>		
						</tr>      
					</c:forEach>
				</table>
			</div>
			</div>
			
		</html:form>
			<script type="text/javascript">
			function openBox(id){
				$.weeboxs.open('userEdit.do?method=init&id='+id, {title:'用户编辑', contentType:'ajax',
																						onok:function(){
																							userEditForm.submit();														
																					 	}});
			};
			</script>
		</div>
	</body>
</html>

