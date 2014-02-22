<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>库房信息</title>
		
		<style type="text/css" title="currentStyle">
			@import "plug-in/dataTables/css/demo_page.css";
			@import "plug-in/dataTables/css/demo_table.css";
			.toolbar {
				float: left;
			}

			UL{list-style-type:none; margin:0px;} 
			/* 标准盒模型 */ 
			.w936{margin:0;clear:both;} 
			/* TAB 切换效果 */ 
			.tb_{background-image: url('images/barbg_tab.gif'); background-repeat: repeat-x;} 
			.tb_ ul{height:24px;font-size: 12px} 
			
			#nav li{
				display: block;
				float: left;
				margin: 0px;
				padding: 0px;
				height: 24px;
			}
			
			
			
			
		</style>
		<link type="text/css" rel="stylesheet" href="plug-in/weebox/weebox.css" />
		<script type="text/javascript" src="plug-in/lightTreeview/jquery-1.2.6.js"></script>
		<script type="text/javascript" language="javascript" src="plug-in/dataTables/js/jquery.dataTables.js"></script>
		
		<script type="text/javascript" src="plug-in/weebox/bgiframe.js"></script>
		<script type="text/javascript" src="plug-in/weebox/weebox.js"></script>
		<script type="text/javascript" src="plug-in/monthlycalendar/dropdownmenu.js"></script>
		<link type="text/css" rel="stylesheet" href="plug-in/monthlycalendar/css/default.css" />
		<script type="text/javascript">
			
		</script>

	</head>
	<body >
		<div id="main">
		<jsp:include page="common/top.jsp" flush="true" />
		<html:form action="/stockWarehouse">
		<div >
			<div class="w936" > 
			    <div id="tb_" class="tb_"> 
		            <ul id="nav"> 
		            	<li style="width:100px;text-align: left;font-size: 14px;font-weight: bold">库房信息</li> 
		                <li style="margin-right: 50px">
		                <div id="sddm">
							<a class="function" target="page" href="stockWarehouse.do?method=chart" >平面图</a>
						</div>
		               	</li>
		            </ul> 
			    </div> 
			</div>
			
			<div >
		
				<table cellpadding="0" cellspacing="0" border="0" class="stockItems">
				
					<thead>
						<tr>
							<th width="48px">仓库名称</th>
							<th width="35px">类型</th> 
							<th width="70px">温度</th>
							<th width="110px">长×宽×高</th>
							<!--<th>已堆放面积</th>-->
							<th width="60px">总面积</th>
							<!--<th width="80px">面积利用率(%)</th>-->
							<th width="80px">已使用容积(吨)</th>
							<th width="60px">总容积(吨)</th>
							<th width="80px">容积利用率(%)</th>
							<th >客户</th>
						</tr>
					</thead>
					<c:forEach items="${requestScope['stockWarehouse.list']}" var="stockWarehouse">
					
						<tr class="parent" id="row_${stockWarehouse.id}">						
			
							<td>
								<c:out value="${stockWarehouse.name}" />
							</td>	
							
							<td>
								<c:out value="${stockWarehouse.type}" />
								
							</td>
							<td align="right">
								<c:out value="${stockWarehouse.temperature}" />
								
							</td>
							<td>
								<c:out value="${stockWarehouse.length}" />
								<c:out value="${stockWarehouse.width}" />
								<c:out value="${stockWarehouse.height}" />
							</td>	
							<!--<td  align="right">
								
								
							</td>-->		
							<td  align="right">
								<c:out value="${stockWarehouse.area}" />m<sup>2</sup>									 
							</td>
							<!--<td  align="right">
										 
							</td>	-->		
							<td  align="right">
								
								<!--<c:out value="${stockWarehouse.totalWeight/1000}" />-->		
								<fmt:formatNumber value="${stockWarehouse.totalWeight/1000}" type="number" pattern="#.##"/>				
							</td>		
							<td  align="right">
								<c:out value="${stockWarehouse.volume}" />								 
							</td>
							<td  align="right">
								<fmt:formatNumber value="${stockWarehouse.totalWeight/1000/stockWarehouse.volume}" type="number" pattern="0.0%"/>									 
													 
							</td>	
							<td  align="right">
													 
							</td>	
						</tr>      
						<tbody class="child_row_${stockWarehouse.id}" style="background-color:#FFFFE3;border: 1px solid #FBECB3">
							
							<c:forEach items="${stockWarehouse.subWarehouseList}" var="subWarehouse">
								<tr >
									
									<td>
										<a href="#" onclick="openBox(${subWarehouse.id},'${subWarehouse.name}');return false;" >
											<c:out value="${subWarehouse.name}" />
											
										</a>	
										
									</td>
									
									<td>
										<c:out value="${subWarehouse.type}" />
										
									</td>
									<td  align="right">
										<c:out value="${subWarehouse.temperature}" />
										
									</td>
									<td align="center">
									<c:if test= "${not empty(subWarehouse.length)}">
										<c:out value="${subWarehouse.length}"/>×
										<c:out value="${subWarehouse.width}"/>×
										<c:out value="${subWarehouse.height}"/>
									</c:if>
									</td>	
									<!--  <td  align="right">
										
										
									</td>	-->	
									<td  align="right">
										<c:out value="${subWarehouse.area}" />m<sup>2</sup>								 
									</td>
									<!--  <td  align="right">
										 
									</td>	 -->		
									<td  align="right">
										<!--<c:out value="${subWarehouse.totalWeight/1000}" />	-->		
										<fmt:formatNumber value="${subWarehouse.totalWeight/1000}" type="number" pattern="#.##"/>							 
										
									</td>		
									<td  align="right">
										<c:out value="${subWarehouse.volume}" />									 
									</td>
									<td align="right">
										<fmt:formatNumber value="${subWarehouse.totalWeight/1000/subWarehouse.volume}" type="number" pattern="0.0%"/>									 
									</td>	
									<td title="" >
										<a title="<c:forEach items="${subWarehouse.customerList}" var="customer"><c:out value="${customer.name}" />,</c:forEach>">
											<c:forEach items="${subWarehouse.customerList}" var="customer">
									 			<c:out value="${customer.name}" />,	
									 		</c:forEach>
								 		</a>
									</td>
									  
								</tr>
							
							</c:forEach>
								<tr>
									<td colspan="7" class="child_td" style="border-bottom: 1px solid #FAE2B9">   
										
									</td>
								</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
			</div>
			
		</html:form>
			<script type="text/javascript">
			function openBox(id,name){
				window.showModalDialog("warehouseInventory.do?method=view&warehouseId="+id,"","dialogWidth=950px;dialogHeight=600px;");
				//window.open("warehouseInventory.do?method=view&warehouseId="+id);
				//$.weeboxs.open('warehouseInventory.do?method=view&warehouseId='+id, {title:name+'  仓库库存', type:'alert', contentType:'ajax',width:880});
			};
			</script>
		</div> 
	</body>
</html>

