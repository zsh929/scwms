<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib prefix="logic" uri="/WEB-INF/tlds/struts-logic.tld" %>
<%@ taglib prefix="html"  uri="/WEB-INF/tlds/struts-html.tld"  %>

<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>销售登记</title> 
		
		<style type="text/css" title="currentStyle">
			@import "plug-in/dataTables/css/demo_page.css";
			@import "plug-in/dataTables/css/demo_table.css";
			.toolbar {
				float: left;
			}
			.color1 {background-color:#F0F0F0;border-bottom:1px dotted #D5D5D5;border-top:1px dotted #D5D5D5}
			
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
	
	var customers = ${stockOutForm.customerJsonList};
		$().ready(function() {
		
			jQuery(".display tr:odd td").addClass("color1");
			
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
				$('form').attr('action', "stockOut.do?method=init&customerId="+data.id);
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
		<html:form action="/stockOut.do?method=save">
			
		<div id="form_stylized" class="myform">
		 	<h1>销售登记</h1>
        	<p></p>
			<label>出库单号 </label><html:text property="serialNumber"/><html:errors property="serialNumber"/>
			<label>客户名称 </label><html:text property="customerName"/><html:errors property="customerName"/>
								   <html:hidden property="customerId"/><html:errors property="customerId"/><br/>
			<label>经办人 </label>
			<select id="personHandling" name="personHandling" >
			<option  value="0">--请选择--</option>
				<c:forEach var="user" items="${stockOutForm.userList}" >
					<c:choose>
						<c:when test="${stockOutForm.personHandling==user.id}">
							<option selected="selected" value="${user.id}">${user.name}</option>
						</c:when>
						<c:otherwise>
							<option value="${user.id}">${user.name}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
			<br/>
			
			
			<label>出库日期 </label><html:text property="time" styleClass="Wdate"  onclick="WdatePicker()"/><html:errors property="time"/><br/>
		</div>
		<div style="margin: 2px auto">
		<table cellpadding="0" cellspacing="0" border="0" class="display"  >
				
			<thead>
				<tr>
					
					<th>货物名称</th>
					<th width="95px">批号</th> 
					<th width="95px">生产日期</th>
					<!--<th>类型</th>-->
					<th width="65px">重量/单位</th>
					<th width="75px">库存数量</th>
					<th width="75px">库存总重量</th>
					<th>储位</th>
					<th width="65px">出库数量</th>
					<th width="65px">出库重量</th>
					<th >单价</th>
					<th >总价</th>
					
				</tr>
			</thead>
			<c:forEach items="${requestScope['cargoes.list']}" var="cargo" varStatus="status">
			
				<tr>						
					<td align="right">
						<c:out value="${cargo.number}" /> 
						<input name="id" type="hidden" value="${cargo.id}"/>
					</td>
					<td align="right">
						<a href="#" onclick="openBox(${cargo.id},'${cargo.name}');return false;" >
							<c:out value="${cargo.name}" />
						</a>	
					</td>	
					<td align="right">
						<c:out value="${cargo.batchNumber}" />
						<input type="hidden"  name="batchNumber" value="${cargo.batchNumber}"/>
					</td>
					<td align="right">
						<c:out value="${cargo.dateProduce}" />
						<input type="hidden"  name="dateProduce" value="${cargo.dateProduce}"/>
					</td>
					<!--<td align="center">
						<c:out value="${cargo.category}" />
					</td>-->
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
						<a href="#" onclick="position(${status.index});return false;"><c:out value="${cargo.locationName}" /></a>
						<input type="hidden"  name="locationId" value="${cargo.locationId}"/>
						<input type="hidden" id=${status.index} name="postionQuantity"  />
					</td>
					<td align="center">
						<input style="border: 1px solid #333;width: 50px" name="quantity" align="right" />
						
					</td>
					<td align="center">
						<input style="border: 1px solid #333;width: 50px" name="totalWeight" align="right" />
						
					</td>
					
					<td align="right">
						<c:out value="${cargo.unitPrice}" />
						
						<input  name="unitPrice" type="hidden" value="${cargo.unitPrice}"/>
						
						<c:choose> 
							  <c:when test="${cargo.countUnit==0}"> 
							       /吨
							  </c:when> 
							  <c:when test="${cargo.countUnit==1}"> 
							       /件
							  </c:when> 
						</c:choose> 
						
						<input  name="countUnit" type="hidden" value="${cargo.countUnit}"/>
					</td>
					<td align="right">
						<c:out value="${cargo.totalPrice}" />
						<input  name="totalPrice" type="hidden" value="${cargo.totalPrice}"/>
					</td>
					
				</tr>      
			</c:forEach>
			<tfoot>
				
				<tr>
					<th colspan="8" align="right">合计</th>
					<th align="right" valign="top" id="wholeQuantity">
						0
					</th>
					<th align="right" valign="top" id="wholeWeight">
						0
					</th>
					
				</tr>
				
			</tfoot>
			</table>
			
			<div>
				
			</div>
		</div>
		<html:hidden property="inOut" value="1"/>
		<div style="width: 200px;margin: 0px auto">
			<html:submit value="保存"/>
		</div>
		</html:form>
			<script type="text/javascript">
			//function openBox(id){
            //document.forms[0].action="/save.do";
			//	$.weeboxs.open('addStockInCargo.do?method=initStockInCargo&id='+id, {title:'录入出库货物', contentType:'ajax'});
			//};
			
			function openBox(id,name){
					window.showModalDialog("cargo.do?method=items&cargoId="+id,"","dialogWidth=950px;dialogHeight=600px;");
			};
			
			function position(index){
				
				var sRet = window.showModalDialog("stockPostion.do?method=init&index="+index,"","dialogWidth=720px;dialogHeight=600px;");
				$('input[id='+index+']').val(sRet);
					
			};
			
			</script>
		</div>
	</body>
</html>


