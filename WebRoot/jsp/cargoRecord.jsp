<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>明细</title>
		
		<link type="text/css" rel="stylesheet" href="plug-in/weebox/weebox.css" />
		<script type="text/javascript" src="plug-in/lightTreeview/jquery-1.2.6.js"></script>
		<script type="text/javascript" language="javascript" src="plug-in/dataTables/js/jquery.dataTables.js"></script>
		
		<script type="text/javascript" src="plug-in/weebox/bgiframe.js"></script>
		<script type="text/javascript" src="plug-in/weebox/weebox.js"></script>
		<script type="text/javascript">
	
	
			$().ready(function() {
				
				var wholeWeight = 0;
	
			    $('td[name="totalWeight"]').each(function(){
			    
			        var valString = $(this).text() || 0;
			        
			        wholeWeight += parseFloat(valString);
			                    
			    });
	       
	       		var wholeQuantity = 0;
	
			    $('td[name="quantity"]').each(function(){
			    
			        var valString = $(this).text() || 0;
			        
			        wholeQuantity += parseFloat(valString);
			                    
			    });
	       
	    		$("#wholeWeight").text(wholeWeight.toFixed(1));
				$("#wholeQuantity").text(wholeQuantity);
				
				
			});
		</script>
		<style type="text/css" title="currentStyle">
			#caption{margin: 5px;5px;10px;5px}
			#caption td{font-size: 14px;padding: 2px}
		</style>
	</head>
	<body>
		<div id="main" style="width: 880px;margin: 2px auto">
			<table width="250px" cellpadding="0" cellspacing="0" border="0" id="caption">
				<tr>     
					<td align="right">客户名称：</td> 
					<td align="left">${stockRecord.customerName}</td>
				</tr>
				<tr>     
					<td align="right">日期：</td> 
					<td align="left">
						<fmt:formatDate value="${stockRecord.time}" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
				<tr>     
					<td align="right">单号：</td> 
					<td align="left">${stockRecord.serialNumber}</td>
				</tr>
				<tr>     
					<td align="right">出库/入库：</td> 
					<td align="left">
						<c:choose> 
						  <c:when test="${stockRecord.inOut==1}"> 
						        <font style="color: #009966;font-weight: bold;">入库</font>
						  </c:when> 
						  <c:when test="${stockRecord.inOut==0}"> 
						        <font style="color: #FF6600;font-weight: bold;">出库</font>
						  </c:when> 
						</c:choose> 

					</td>
				</tr>
				<tr>     
					<td align="right">入库温度：</td> 
					
						<td align="left">${stockRecord.temperature}</td>

				
				</tr>
				<tr>     
					<td align="right">包装：</td> 
					
						<td align="left">${stockRecord.packing}</td>

					
				</tr>
			</table>
			<table cellpadding="0" cellspacing="0" border="0" class="stockItems">
			
				<thead>
					<tr>               
						
						<th>货物编码</th>
						<th width="80px">货物名称</th>
						<th>批号</th>
						<th>生产日期</th>
						<th width="80px">重量(kg)/单位</th>
						<th width="60px">数量</th>
						<th width="60px">总重量</th>
						<th>储位</th>
					</tr>
				</thead>
				<c:forEach items="${stockRecord.cargoRecords}" var="cargoRecord">
		
					<tr>
									
						<td> 
							<c:out value="${cargoRecord.cargoVO.number}" /> 
							
						</td>
						<td align="right">
							<c:out value="${cargoRecord.cargoVO.name}" />
						</td>	
						<td>
							<c:out value="${cargoRecord.batchNumber}" />
							
						</td>
						<td>
							<fmt:formatDate value="${cargoRecord.dateProduce}" pattern="yyyy-MM-dd"/>
							
						</td>
						
						<td  align="center">
							<c:out value="${cargoRecord.cargoVO.weight}" />kg/<c:out value="${cargoRecord.cargoVO.unit}" />
							
						</td>
						<td name="quantity" align="right">
							<c:out value="${cargoRecord.quantity}" />
						</td>
						<td name="totalWeight" align="right">
							<c:out value="${cargoRecord.totalWeight}" />
							
						</td>
						<td align="center">
							<c:out value="${cargoRecord.locationName}" />
						</td>
						
					</tr>      
				</c:forEach>
				<tfoot>
			
					<tr>
						<th colspan="5" align="right">合计</th>
						<th style="font-family: Tahoma;" align="right" valign="top" id="wholeQuantity">
							
						</th>
						<th style="font-family: Tahoma;" align="right" valign="top" id="wholeWeight">
							
						</th>
						<th>&nbsp;</th>
						
					</tr>
			
				</tfoot>
			</table>
		
			
			
		</div>
	</body>
</html>

