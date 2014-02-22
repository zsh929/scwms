<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>系统编码</title>
		
		<link href="plug-in/lightTreeview/jquery.lightTreeview.css" rel="stylesheet" type="text/css" />
		<style type="text/css" title="currentStyle">
			@import "plug-in/dataTables/css/demo_page.css";
			@import "plug-in/dataTables/css/demo_table.css";
			.toolbar {
				float: left;
			}
		</style>
		<link type="text/css" rel="stylesheet" href="plug-in/weebox/weebox.css" />
		
		<script type="text/javascript" src="plug-in/lightTreeview/jquery-1.2.6.js"></script>
		<script type="text/javascript" src="plug-in/lightTreeview/jquery.lightTreeview.pack.js"></script>
		
		<script type="text/javascript" language="javascript" src="plug-in/dataTables/js/jquery.dataTables.js"></script>
		
		<script type="text/javascript" src="plug-in/weebox/bgiframe.js"></script>
		<script type="text/javascript" src="plug-in/weebox/weebox.js"></script>
		
	<script type="text/javascript">
	$(document).ready(function() {
				$('#example').dataTable(
				  {"bPaginate": false,
					"bLengthChange": false,
					"bFilter": false,
					"bInfo": false
					} 
				);
				
			} );
	$(function() {
		$('#demo1').lightTreeview({  //指定需要转化成treeview的ul或ol
			collapse: true, //是否允许收缩或展开树型菜单。默认为true
			line: true, //是否始用连接线。默认为true。你也可以直接对根节点加入类“treeview-noline”来实现同样的效果
			nodeEvent: true,  //是否将节点标题的点击也绑定菜单收缩展开的事件。默认为true
			unique: true,  //同级节点是否互斥。默认为false
			animate: 200,  //动画效果。0为无效果。默认为200
			//style: 'black',  菜单风格。目前有默认,灰色,红色,黑色,fam 共5种风格，风格可以通过添加CSS来增加。你也可以直接对根节点加入类“treeview-风格名称”来实现同样的效果
			fileico: false,  //是否显示文件的图标。默认为false。你也可以对节点的DOM加入类“treeview-file”来实现同样的效果
			folderico: true  //是否显示节点文件夹的图标。默认为false。你也可以对节点的DOM加入类“treeview-folder”来实现同样的效果
		});
		
		    
		$.lightTreeview.open("ul li[name='corp']");
	
	});
	
</script>
	
	</head>
	<body >
		<div id="main">
		<jsp:include page="common/top.jsp" flush="true" />
		<html:form action="/syscode" >
		<div>
			<div style="width:200px;float: left;">
				<c:out value="${treeview}" escapeXml="false"/> 
			</div>
			
			<div style="width:700px;float: left">
				<div>
					为<${syscode.codeValue}><a href="#" onclick="openBox(${syscode.id},'createInit');return false;">新增</a>下级栏目
				</div>
				<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
				
					<thead>
						<tr>
							<th>内容</th>
							<th>编号</th>
							<th>上级</th>
							<th>排序</th>
							<th>说明</th>
							<th>操作</th>
						</tr>
					</thead>
					<c:forEach  items="${syscode.children}" var="syscode">
					
						<tr>						
							<td>
								<c:out value="${syscode.codeValue}" /> 
							</td>
							<td>
								<c:out value="${syscode.codeKey}" />
							</td>	
							<td>
								<c:out value="${syscode.parentKey}" />
							</td>
							<td>
								<c:out value="${syscode.orderId}" />
							</td>
							<td>
								<c:out value="${syscode.memo}" />
							</td>	
							<td>
								<a href="#" onclick="openBox(${syscode.id},'modifyInit');return false;">编辑</a>  

											
							</td>		
						</tr>      
					</c:forEach>
				</table>
			</div>
			</div>
			
		</html:form>
			<script type="text/javascript">
			function openBox(id,action){
			
			if (!isNaN(id)){ 
			
			   $.weeboxs.open('syscodeEdit.do?method='+ action +'&syscodeId='+id, {title:'编码编辑', contentType:'ajax',
			   																			onok:function(){
																							syscodeEditForm.submit();														
																					 	}});
			}
			
				
			};
			</script>
		</div>
	</body>
</html>

