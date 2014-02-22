<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>仓库库存</title>
		
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
			        
			        wholeWeight += parseInt(valString);
			                    
			    });
	       
	       		var wholeQuantity = 0;
	
			    $('td[name="quantity"]').each(function(){
			    
			        var valString = $(this).text() || 0;
			        
			        wholeQuantity += parseInt(valString);
			                    
			    });
	       
	    		$("#wholeWeight").text(wholeWeight);
				$("#wholeQuantity").text(wholeQuantity);
				
				
			});
		</script>

	</head>
	<body>
		<div id="main" style="width: 880px;margin: 2px auto">
		
				<table cellpadding="0" cellspacing="0" border="0" class="stockItems">
				
					<thead>
						<tr>               
							<th>客户名称</th>
							<th>货物编码</th>
							<th>货物名称</th>
							<th>批号</th>
							<th>生产日期</th>
							<th>类型</th>
							<th>重量(kg)/单位</th>
							<th>库存数量</th>
							<th>库存总重量</th>
							<th>储位</th>
						</tr>
					</thead>
					<c:forEach items="${requestScope['cargo.list']}" var="cargo">
			
						<tr>
							<td> 
								<c:out value="${cargo.customerName}" /> 
								
							</td>						
							<td>
								<c:out value="${cargo.number}" /> 
								<input name="id" type="hidden" value="${cargo.id}"/>
							</td>
							<td>
								<c:out value="${cargo.name}" />
							</td>	
							<td>
								<c:out value="${cargo.batchNumber}" />
								<input type="hidden"  name="batchNumber" value="${cargo.batchNumber}"/>
							</td>
							<td>
								<c:out value="${cargo.dateProduce}" />
								<input type="hidden"  name="dateProduce" value="${cargo.dateProduce}"/>
							</td>
							<td align="right">
								<c:out value="${cargo.category}" />
							</td>
							<td  align="right">
								<c:out value="${cargo.weight}" />kg/<c:out value="${cargo.unit}" />
								
							</td>
							<td name="quantity" align="right">
								<c:out value="${cargo.quantity}" />
							</td>
							<td name="totalWeight" align="right">
								<a href="#" onclick="openBox(${cargo.id},${cargo.locationId});return false;" >
									<c:out value="${cargo.totalWeight}" />
								</a>
							</td>
							<td align="right">
								<c:out value="${cargo.locationName}" />
							</td>
							
						</tr>      
					</c:forEach>
					<tfoot>
				
						<tr>
							<th colspan="7" align="right">合计</th>
							<th style="font-family: Tahoma;" align="right" valign="top" id="wholeQuantity">
								
							</th>
							<th style="font-family: Tahoma;" align="right" valign="top" id="wholeWeight">
								
							</th>
							<th>&nbsp;</th>
							
						</tr>
				
					</tfoot>
				</table>
			<script type="text/javascript">
				function openBox(id,locationId){
					window.showModalDialog("cargo.do?method=items&cargoId="+id+"&locationId="+locationId,"","dialogWidth=950px;dialogHeight=600px;");
					
				};
			</script>
			
			
		</div>
	</body>
</html>

