<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib prefix="logic" uri="/WEB-INF/tlds/struts-logic.tld" %>
<%@ taglib prefix="html"  uri="/WEB-INF/tlds/struts-html.tld"  %>

<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>进货登记</title>
		
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
		function del(id){
			
	        document.stockInForm.action = "stockIn.do?method=delete&index="+id;   
	        
	        document.stockInForm.submit();
           	
		}
		var customers = ${stockInForm.customerJsonList};
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
				
			});
			$('input[name="customerName"]').blur(function(event,data,formatted) {
				var thisValue = $(this).val(); 
				if(thisValue != ''){
				
					$("#addStockInCargo").attr("disabled",false);
				}else{
					$("#addStockInCargo").attr("disabled",true);
				}
			});
			
			
			var wholeWeight = 0;

		    $('input[name="totalWeight"]').each(function(){
		    
		        var valString = $(this).val() || 0;
		        
		        wholeWeight += parseFloat(valString);
		                    
		    });
       
       		var wholeQuantity = 0;

		    $('input[name="quantity"]').each(function(){
		    
		        var valString = $(this).val() || 0;
		        
		        wholeQuantity += parseInt(valString);
		                    
		    });
       
    		$("#wholeWeight").text(wholeWeight);
			$("#wholeQuantity").text(wholeQuantity);
			
			
		});
		
		
		</script>
		<script language="javascript" type="text/javascript" src="plug-in/My97DatePicker/WdatePicker.js"></script>

	</head>
	<body >
	
		<div id="main">
		<jsp:include page="common/top.jsp" flush="true" />
		<html:form action="/stockIn.do?method=save">
			
		<div id="form_stylized" class="myform">
		 	<h1>进货登记</h1>
        	<p></p>
			<label>入库单号 </label><html:text property="serialNumber"/><html:errors property="serialNumber"/>
			<label>供货商名称 </label><html:text property="customerName"/><html:errors property="customerName"/>
								   <html:hidden property="customerId"/><html:errors property="customerId"/><br/>
								   <html:hidden property="index"/>
			
			<label>经办人 </label>
			<select id="personHandling" name="personHandling" >
			<option  value="0">--请选择--</option>
				<c:forEach var="user" items="${stockInForm.userList}" >
					<c:choose>
						<c:when test="${stockInForm.personHandling==user.id}">
							<option selected="selected" value="${user.id}">${user.name}</option>
						</c:when>
						<c:otherwise>
							<option value="${user.id}">${user.name}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
			<br/>
			
			
			<label>入库日期 </label><html:text property="time" styleClass="Wdate"  onclick="WdatePicker()"/><html:errors property="time"/><br/>
		</div>
		<div style="margin: 2px auto">
		<table cellpadding="0" cellspacing="0" border="0" class="display"  >
				
			<thead>
				<tr>
					<th>货物名称</th>
					<th>批号</th>
					<th >生产日期</th>
					<th >类型</th>
					<th >重量/单位</th>
					<th >数量</th>
					<th >总重量</th>
					<th >单价</th>
					<th >总价</th>
					<th >储位</th>
					<th >操作</th>
					
				</tr>
			</thead>
			<c:forEach items="${sessionScope['cargoList']}" var="cargo" varStatus="status">
			
				<tr>						
					
					<td align="right">
						<c:out value="${cargo.name}" />
					</td>
					<td align="right">
						<c:out value="${cargo.batchNumber}" />
						<input name="batchNumber" type="hidden" value="${cargo.batchNumber}"/>
					</td>
					
					<td align="right">
						<c:out value="${cargo.dateProduce}" />
						<input name="dateProduce" type="hidden" value="${cargo.dateProduce}"/>
						
					</td>	
					<td align="center">
						<c:out value="${cargo.category}" />
					</td>
					<td align="right">
						<c:out value="${cargo.weight}" />kg/<c:out value="${cargo.unit}" />
						<input name="weight" type="hidden" value="${cargo.weight}"/>
					</td>
					<td align="right">
						<c:out value="${cargo.quantity}" />
						<input name="quantity" type="hidden" value="${cargo.quantity}"/>
						
					</td>	
					<td align="right">
						
						
						<c:out value="${cargo.totalWeight}" />
						
						<input  name="totalWeight" type="hidden" value="${cargo.totalWeight}"/>
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
					
					<td>
						<a href="#" onclick="position(${status.index});return false;"><c:out value="${cargo.locationName}" /></a>
						<input name="locationId" type="hidden" value="${cargo.locationId}"/>
						<input name="id" type="hidden" value="${cargo.id}"/>
						<input id=${status.index} name="postionQuantity"  type="hidden"/>
					</td>
					<td>
						<!-- <a disabled onclick="return false;" href="#" onclick="openBox(${cargo.id});return false;">编辑</a> --> 
						<a href="#" onclick="del(${status.index});return false;">删除</a>
						
					<!--<a href="#" onclick=document.stockInForm.index.value="+${status.index}+";document.stockInForm.submit();>删除</a>-->   
					
					</td>		
				</tr>      
			</c:forEach>
			<tfoot>
				
				<tr>
					<th colspan="6" align="right">合计</th>
					<th align="right" valign="top" id="wholeQuantity">
						
					</th>
					<th align="right" valign="top" id="wholeWeight">
						
					</th>
					<th>&nbsp;</th>
					<th>&nbsp;</th>
				</tr>
				
			</tfoot>
			</table>
			
			<div>
				
				<input type="button" disabled="disabled" id="addStockInCargo"  value="增加" onclick="openBox();return false;"/>
				<!-- 
					<a style="float: left;"  href="#" onclick="openBox();return false;">增加</a>
				-->
				
			</div>
		</div>
		<html:hidden property="inOut" value="1"/>
		<div style="width: 100px;margin: 0px auto">
			<html:submit value="保存"/>
		</div>
		</html:form>
			<script type="text/javascript">
			function openBox(id){

            //document.forms[0].action="/save.do";
	      		var customerId = $('input[name="customerId"]').val();
	      		
				$.weeboxs.open('addStockInCargo.do?method=initStockInCargo&customerId='+customerId, {title:'录入进货货物', 
																					 contentType:'ajax',
																					 onok:function(){
																						addStockInCargo.submit();														
																				
																					 	}
																					});
			
			};
			function position(index){
									
				var sRet = window.showModalDialog("stockPostion.do?method=init&index="+index,"","dialogWidth=720px;dialogHeight=600px;");
				$('input[id='+index+']').val(sRet);	
			            
				};
			</script>
		</div>
	</body>
</html>


