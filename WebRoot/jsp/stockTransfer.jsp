<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib prefix="logic" uri="/WEB-INF/tlds/struts-logic.tld" %>
<%@ taglib prefix="html"  uri="/WEB-INF/tlds/struts-html.tld"  %>

<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>移库登记</title> 
		
		<style type="text/css" title="currentStyle">
			@import "plug-in/dataTables/css/demo_page.css";
			@import "plug-in/dataTables/css/demo_table.css";
			.toolbar {
				float: left;
			}
		</style>
		<link type="text/css" rel="stylesheet" href="plug-in/weebox/weebox.css" />
		<script type="text/javascript" src="plug-in/lightTreeview/jquery-1.2.6.js"></script>
		<script type="text/javascript" src="plug-in/dynamicorderform/js/order.js"></script>
		<script type="text/javascript" language="javascript" src="plug-in/dataTables/js/jquery.dataTables.js"></script>
		<script type="text/javascript" src="plug-in/weebox/bgiframe.js"></script>
		<script type="text/javascript" src="plug-in/weebox/weebox.js"></script>
		<script type='text/javascript' src='plug-in/autocomplete/jquery.autocomplete.js'></script>
		<link rel="stylesheet" type="text/css" href="plug-in/autocomplete/jquery.autocomplete.css" />
	
	<script type="text/javascript">
	
	var customers = ${stockTransferForm.customerJsonList};
		$().ready(function() {
		
				
		
			$('input[name="customerName"]').focus().autocomplete(customers, {
		
				formatItem: function(row, i, max) {
					return i + "/" + max + ": \"" + row.name + "\" [" + row.id + "]";
				},
				formatMatch: function(row, i, max) {
					return row.name + " " + row.id;
				},
				formatResult: function(row) {
				
					
					return row.name;
				}

			});
			$('input[name="customerName"]').result(function(event,data,formatted) {
			
				$('input[name="customerId"]').val(data.id);
				$('form').attr('action', "stockTransfer.do?method=init&customerId="+data.id);
				$('form').submit();
				
			});
			
			$('input[name="quantity"]').change(function(){
    
				var quantity = $(this).val();
			      
			    var weight = $(this).parent().parent().find('input[name="weight"]').val();
			     
			    $(this).parent().parent().find('input[name="totalWeight"]').val(quantity*weight);
			    calcTotal();
			});
			$('input[name="totalWeight"]').change(function(){
			
				calcTotal();
			
			});
			function calcTotal() {
	  			var wholeWeight = 0;
	
			    $('input[name="totalWeight"]').each(function(){
			    
			        var valString = $(this).val() || 0;
			        
			        wholeWeight += parseFloat(valString);
			                    
			    });
	       
	       		var wholeQuantity = 0;
	
			    $('input[name="quantity"]').each(function(){
			    
			        var valString = $(this).val() || 0;
			        
			        wholeQuantity += parseFloat(valString);
			                    
			    });
	       
	    		$("#wholeWeight").text(wholeWeight);
				$("#wholeQuantity").text(wholeQuantity);
			};
			
			var serialNumber = $('input[name="serialNumber"]').val();
			
			serialNumber = serialNumber.replace(/(^[0]*)/g, "");
			serialNumber = parseInt(serialNumber);
			serialNumber = serialNumber +1;
			
			serialNumber = serialNumber.toString();
			
			var i = serialNumber.length; 
			
			if (i <= 7){ 
				var str0 = "0000000"; 
				serialNumber = str0.substring(0, str0.length- serialNumber.length) + serialNumber; 
			} 
			$('input[name="serialNumber"]').val(serialNumber);
		
		});
		
		
		</script>
		<script language="javascript" type="text/javascript" src="plug-in/My97DatePicker/WdatePicker.js"></script>

	</head>
	<body >
	
		<div id="main">
		<jsp:include page="common/top.jsp" flush="true" />
		<html:form styleId="stockTransfer" action="/stockTransfer.do?method=save">
			
		<div id="form_stylized" class="myform">
		 	<h1>移库登记</h1>
        	<p></p>
			<label>移库单号 </label><html:text property="serialNumber"/><html:errors property="serialNumber"/>
			<label>客户名称 </label><html:text property="customerName"/><html:errors property="customerName"/>
								   <html:hidden property="customerId"/><html:errors property="customerId"/><br/>
			<label>经办人 </label>
			<select id="personHandling" name="personHandling" >
			<option  value="0">--请选择--</option>
				<c:forEach var="user" items="${stockTransferForm.userList}" >
					<c:choose>
						<c:when test="${stockTransferForm.personHandling==user.id}">
							<option selected="selected" value="${user.id}">${user.name}</option>
						</c:when>
						<c:otherwise>
							<option value="${user.id}">${user.name}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
			<br/>
			
			
			<label>移库日期 </label><html:text property="time" styleClass="Wdate"  onclick="WdatePicker()"/><html:errors property="time"/><br/>
		</div>
		<div style="margin: 2px auto">
		<table cellpadding="0" cellspacing="0" border="0" class="display"  >
				
			<thead>
				<tr>
					<th>货物编码</th>
					<th>货物名称</th>
					<!--  
					<th>批号</th>
					<th>生产日期</th>
					-->
					<th>类型</th>
					<th>重量(kg)/单位</th>
					<th>库存数量</th>
					<th>库存总重量</th>
					<th>现储位</th>
					<th width="52px">移库数量</th>
					<th width="52px">移库重量</th>
					<th>移入储位</th>
					
				</tr>
			</thead>
			<c:forEach items="${requestScope['cargoes.list']}" var="cargo">
			
				<tr>						
					<td align="right">
						<c:out value="${cargo.number}" /> 
						<input name="id" type="hidden" value="${cargo.id}"/>
					</td>
					<td align="right">
						<c:out value="${cargo.name}" />
					</td>	
					<!--  
					<td align="right">
						<c:out value="${cargo.batchNumber}" />
						<input type="hidden"  name="batchNumber" value="${cargo.batchNumber}"/>
					</td>
					<td align="right">
						<c:out value="${cargo.dateProduce}" />
						<input type="hidden"  name="dateProduce" value="${cargo.dateProduce}"/>
					</td>
					-->
					<td align="center">
						<c:out value="${cargo.category}" />
					</td>
					<td align="right">
						<c:out value="${cargo.weight}" />kg/<c:out value="${cargo.unit}" />
						<input type="hidden" name="weight" value="${cargo.weight}"/>
					</td>
					<td align="right">
						<c:out value="${cargo.quantity}" />
					</td>
					<td align="right">
						<c:out value="${cargo.totalWeight}" />
					</td>
					<td align="right">
						<c:out value="${cargo.locationName}" />
						<input type="hidden"  name="originalLocationId" value="${cargo.locationId}"/>
					</td>
					<td align="right">
						<input style="border: 1px solid #333;width: 50px" name="quantity" align="right" />
						
					</td>
					<td align="right">
						<input style="border: 1px solid #333;width: 50px" name="totalWeight" align="right" />
						
					</td>
					<td align="right">
						<select name="locationId" style="width: 112px">
							<option value="">--请选择--</option>
							<c:forEach var="entry" items="${requestScope['location.list']}" >
								<!-- 
								<option value="${entry.key}_${entry.value.name}" disabled="disabled">${entry.value.name}</option>
								 -->
								<c:forEach var="location" items="${entry.value.locationList}" >
									<option value="${location.id}">
										<c:if test="${location.zoneId!=''}">
											${location.warehouseName}-${location.zoneId}${location.rackId}${location.storeyId}${location.positionId}
										</c:if>
										${location.warehouseName}
									</option>
								</c:forEach>
							</c:forEach>
						</select>
						
					</td>
					
					
				</tr>      
			</c:forEach>
			<tfoot>
				
				<tr>
					<th colspan="9" align="right">合计</th>
					<th align="right" valign="top" id="wholeQuantity">
						0
					</th>
					<th align="right" valign="top" id="wholeWeight">
						0
					</th>
					<th align="right" valign="top" >
						
					</th>
				</tr>
				
			</tfoot>
			</table>
			
			<div>
				
			</div>
		</div>
		<html:hidden property="inOut" value="1"/>
		<div style="width: 200px;margin: 0px auto">
			<!-- <html:submit value="保存"/> -->
			<input type="button"  value="保存" onclick="save();return false;"/>
		</div>
		</html:form>
			<script type="text/javascript">
			function openBox(id){

            //document.forms[0].action="/save.do";
	      		
				$.weeboxs.open('addStockInCargo.do?method=initStockInCargo&id='+id, {title:'录入出库货物', contentType:'ajax'});
			 

		
			};
			
			function save(){
				var time  = $('input[name="time"]').val();
				if(time == ""){
					alert("请输入移库日期！");
				}else {
					stockTransfer.action="stockTransfer.do?method=save";
					stockTransfer.submit();	
				}	
			}
			</script>
		</div>
	</body>
</html>


