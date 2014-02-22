<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>月合计</title>
		
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
			
			#nav a{margin-left:2px; 
					float:left;
					background: url(images/tab_1_l.gif) no-repeat left top;
					padding-left: 3px;
					text-decoration: none}
			#nav a span{
				display:block;
				background: url(images/tab_1_r.gif) no-repeat right top;
				padding:6px 6px 2px 6px;
				font-weight:bold;
				
			}	
			
			#nav a.normaltab{margin-left:2px; 
					
					background: url(images/tab_2_l.gif) no-repeat left top;
					}
			#nav a.normaltab span{
				
				background: url(images/tab_2_r.gif) no-repeat right top;
				font-weight:normal;
				padding:8px 6px 2px 6px;
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
			$(function(){ 
			 $('tr.parent').click(function(){ // 获取所谓的父行 
			
			 $('tbody.child_'+this.id).toggle(); // 隐藏/显示所谓的子行 
			 }).click(); 
			}) 
		</script>

	</head>
	<body >
		<div id="main">
		<jsp:include page="common/top.jsp" flush="true" />
		<html:form action="/monthTotal">
		<div >
			<div class="w936" > 
			    <div id="tb_" class="tb_"> 
		            <ul id="nav" > 
		            	<li style="text-align: left;font-size: 14px;font-weight: bold;padding-top: 3px">${customer.name}</li> 
		                <li style="margin-right: 90px" >
		               	<div id="sddm">
							<a class="month" href="#" onmouseover="mopen('m1')" onmouseout="mclosetime()"><fmt:formatDate value="${month}" pattern="yyyy年MM月"/></a>
							<div id="m1" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
								<a href="monthTotal.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=200908">2009年8月</a>
								<a href="monthTotal.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=200909">2009年9月</a>
								<a href="monthTotal.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=200910">2009年10月</a>
								<a href="monthTotal.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=200911">2009年11月</a>
								<a href="monthTotal.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=200912">2009年12月</a>
								<a href="monthTotal.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=201001">2010年1月</a>
								<a href="monthTotal.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=201002">2010年2月</a>
								<a href="monthTotal.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=201003">2010年3月</a>
								<a href="monthTotal.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=201004">2010年4月</a>
							</div>
						</div>
		                <div id="sddm">
							<a class="function" href="#" onmouseover="mopen('m2')" onmouseout="mclosetime()" >盘存</a>
								<div id="m2" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
									<a href="cargo.do?method=view">返回</a>
								</div>	
								
						</div>
		                	
		                
		                </li> 
		                
		            </ul> 
			    </div> 
			</div>
			
			<div >
				
				<table cellpadding="0" cellspacing="0" border="0" class="stockItems">
				
					<thead>
						
						<tr>
							<th align="center" width="150px">名称</th>
							<th align="center" >入库数量</th>
							<th align="center" >入库重量(kg)</th>
							<th align="center" >出库数量</th>
							<th align="center" >出库重量(kg)</th>
							<th align="center" >结存数量</th>
							<th align="center" >结存重量(kg)</th>
							<th>操作</th>
						</tr>
					</thead>
						
					<c:forEach items="${requestScope['monthTotal.list']}" var="monthTotal">
					
						<tr class="parent" id="row_${monthTotal.id}">						
							
							<td>
								<c:out value="${monthTotal.cargoName} (${monthTotal.weight}kg / ${monthTotal.unit})" />
							</td>	
							
							
								
					        <td style="text-align: right;color: #339966;font-weight: bold;padding-right: 25px" class="inQuantity">
					        	
					        		<c:out  value="${monthTotal.inQuantity}" />
					        	
							</td>
							<td style="text-align: right;color: #339966;font-weight: bold;padding-right: 25px" class="inWeight">
				        		<c:out  value="${monthTotal.inWeight}" />
							</td>
							<td style="text-align: right;color: #FF6600;font-weight: bold;padding-right: 25px">
								<c:out  value="${monthTotal.outQuantity}" />
							</td>
							<td  style="text-align: right;color: #FF6600;font-weight: bold;padding-right: 25px">
								<c:out  value="${monthTotal.outWeight}" />
							</td>

								 
							<td align="right" style="font-weight: bold;padding-right: 25px" class="balanceQuantity">
								<c:out  value="${monthTotal.balanceQuantity}" />
							</td>
							<td align="right" style="font-weight: bold;padding-right: 25px" class="balanceWeight">
								<c:out  value="${monthTotal.balanceWeight}" />
							</td>
								
							
							<td>
							<c:choose> 
								<c:when test="${monthTotal.id==null}"> 
			        				<a href="#" onclick="openBox('&cargoId=${monthTotal.cargoId}');return false;">编辑</a>
			        		 	</c:when> 
						     	<c:otherwise>
									<a href="#" onclick="openBox('&monthTotalId=${monthTotal.id}&cargoId=${monthTotal.cargoId}');return false;">编辑</a>|
							 		<a href="#" onclick="openBox1('&monthTotalId=${monthTotal.id}&cargoId=${monthTotal.cargoId}');return false;">仓库</a>  
							
							 	</c:otherwise>
								  
			        		</c:choose>
							</td>		
						
						</tr> 
						
						<tbody class="child_row_${monthTotal.id}" style="background-color:#FFFFE3;border: 1px solid #FBECB3">
							
							<c:forEach items="${monthTotal.monthWarehouseList}" var="monthWarehouse">
								<tr >
									
									<td>
										<c:out value="${monthWarehouse.quantity}" />
									</td>
									
									<td>
										<c:out value="${monthWarehouse.weight}" />
										
									</td>
									<td>
										<c:out value="${monthWarehouse.warehouseName}" />
										
									</td>
									
									  <td>
										
									</td>
									 <td>
										
									</td>
									 <td>
										
									</td>
									 <td>
										
									</td>
									 <td>
										
									</td>
								</tr>
							
							</c:forEach>
								<tr>
									<td colspan="6" class="child_td" style="border-bottom: 1px solid #FAE2B9">   
										
									</td>
								</tr>
						</tbody>
						     
					</c:forEach>
					
					
				</table>
			</div>
			</div>
			
		</html:form>
			<script type="text/javascript">
			function openBox(p){
			
				$.weeboxs.open('monthTotalEdit.do?method=init&month=<fmt:formatDate value="${month}" pattern="yyyyMM"/>'+p, {title:'合计编辑', contentType:'ajax'});
			};
			
			function openBox1(p){
			
				$.weeboxs.open('monthWarehouseEdit.do?method=init&month=<fmt:formatDate value="${month}" pattern="yyyyMM"/>'+p, {title:'仓库', 
																																 contentType:'ajax',
																																 onok:function(){
																																	monthWarehouseEdit.submit();														
																															
																																 	}
																					 	});
			};
			</script>
		</div>
	</body>
</html>

