<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib prefix="logic" uri="/WEB-INF/tlds/struts-logic.tld" %>
<%@ taglib prefix="html"  uri="/WEB-INF/tlds/struts-html.tld"  %>
<!--打印控件 --> 
<object id="factory" style="display:none" classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814" codebase="/jsp/smsx.cab" viewastext></object> 

<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>入库登记</title>
		
		<style type="text/css" title="currentStyle">
			@import "plug-in/dataTables/css/demo_page.css";
			@import "plug-in/dataTables/css/demo_table.css";
			.toolbar {
				float: left;
			}
			.color1 {background-color:#F0F0F0;border-bottom:1px dotted #D5D5D5;border-top:1px dotted #D5D5D5}
			
			table.printTableHead{font-size: 14px;margin:0px}
			table.printTableMain{border-collapse:collapse;margin:0px}
			table.printTableMain th{border-bottom: 2px solid #000;font-size: 14px;padding:5px 0px}
			table.printTableMain td{border-bottom: 1px solid #000;font-size: 14px;padding:2px;text-align: center;}
			
			table.printTableFoot{font-size: 14px;}
			table.printTableFoot td{padding: 5px 0px}
        	
        	#printArea{display:block;visibility: hidden;}    	
	      		
		</style>
		<style media="print">
			.noprint{display:none;}
			table.printTableHead{font-size: 14px;margin:0px}
			table.printTableMain{border-collapse:collapse;margin:0px}
			table.printTableMain th{border-bottom: 2px solid #000;font-size: 14px;padding:5px 0px}
			table.printTableMain td{border-bottom: 1px solid #000;font-size: 14px;padding:2px;}
			
			table.printTableFoot{font-size: 14px;}
			table.printTableFoot td{padding: 5px 0px}
			
			#printArea{display:block;};
			
		</style>
		
		
		<link type="text/css" rel="stylesheet" href="plug-in/weebox/weebox.css" />
		<script type="text/javascript" src="plug-in/lightTreeview/jquery-1.2.6.js"></script>
		<script type="text/javascript" src="plug-in/dynamicorderform/js/order.js"></script>
		<script type="text/javascript" language="javascript" src="plug-in/dataTables/js/jquery.dataTables.js"></script>
		<script type="text/javascript" src="plug-in/weebox/bgiframe.js"></script>
		<script type="text/javascript" src="plug-in/weebox/weebox.js"></script>
		<script type='text/javascript' src='plug-in/autocomplete/jquery.autocomplete.js'></script>
		<link rel="stylesheet" type="text/css" href="plug-in/autocomplete/jquery.autocomplete.css" />
		
		<script type="text/javascript" src="plug-in/validator/validator.js"></script>
		<link rel="stylesheet" type="text/css" href="plug-in/validator/validator.css" />
		
		<script language="javascript" type="text/javascript" src="plug-in/print/print.js"></script>
	
	<script type="text/javascript">
		
		var customers = ${stockInForm.customerJsonList};
		$().ready(function(){
			
			jQuery(".display tr:odd td").addClass("color1");
			var chargeTypeList = eval('<%=request.getAttribute("chargeType.list")%>');
			
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
			
			    if($("#customerId").val() != data.id){
		          $("#cargoList").html("");
		        }
				
				$("#customerId").val(data.id);
				       		    
				$.ajax({  
					   type: "post",  
					   url: "chargeDetail.do?method=getChargeList&chargeMethod=1",  
					   data:"customerId="+ data.id, 
					   dataType:'text',
					   contentType: "application/x-www-form-urlencoded;charset=utf-8", 
					   cache: false,  
					   success: function(msg){ 
						 var obj = "";  
					   	 if(msg != ""){
					     	obj = eval('('+msg+')'); 
					   	 }
					     $("#chargeList").html("");
					     
					     $(obj).each(function(index) { 

				                var val = obj[index]; 
				               	var chargeType = $("#chargeType").html();
				               	
				               	var string = "<div><select name='chargeType' style='width:80px;margin-left:0px' >"+
				         				 "<option value='0'>--请选择--</option>";
				         				 
				         				 
				         				$(chargeTypeList).each(function(i) { 
				         	       			 var chargeType = chargeTypeList[i]; 
				         	       			 if(chargeType.codeKey == val.type){
				         	       				string = string + "	<option selected='selected' value='"+chargeType.codeKey+"'>"+chargeType.codeValue+"</option>"
				         	       			 }else{
				         	       				string = string + "	<option value='"+chargeType.codeKey+"'>"+chargeType.codeValue+"</option>"						
				         	       				 
				         	       			 }
				         	    				
				         	    				
				         	       		    })
				         	       		    
				                		string = string+ "</select>"+
				                		 
				            			"<input type='text' name='chargeWeight' style='width:60px;margin:0px 2px 0px 2px' />kg,"+
				            			"<input type='text' name='unitPrice' style='width:25px;margin:0px 2px 0px 2px;text-align:right;' value='"+ val.unitPrice +"''/>元&nbsp;/&nbsp;吨,"+
				            			"合计<input type='text' name='totalPrice' style='width:50px;margin:0px 2px 0px 2px'/>元"+
				            			"&nbsp;<a href='#' onclick='delChargeType(this);return false;'>删除</a>"+
				            			"<br/><div/>";
				               
				            			$("#chargeList").append(string);
				            			bind();
				            }); 
					   }
					   
				   });
				
				checkAddStockInCargo();
				
				
			});
			$('input[name="customerName"]').bind("propertychange",function() {
				checkAddStockInCargo();
			});
			
			
		
			
			var print = <%=request.getParameter("print")%>;
			var saveSuccess = <%=request.getParameter("saveSuccess")%>;
			
			if(${stockInForm.verify == false}){
				
				$.weeboxs.open('stockIn.do?method=initVerify', {title:'提示', 
																contentType:'ajax',
																onok:function(){
																if(print == true){
																	stockIn.action="stockIn.do?method=save&print=true";
																}
																else {
																	stockIn.action="stockIn.do?method=save";
																}
																stockIn.submit();														
															
																}
															});
		
			}else if (${saveSuccess == true && print == true}){
				//alert(1);
				$('#printCustomerName').html($('input[name="customerName"]').val());
				$('#printDate').html($('input[name="time"]').val());
				$('#printSerialNumber').html($('input[name="serialNumber"]').val());
				
				var printWholeWeight = 0;

			    $('input[name="printTotalWeight"]').each(function(){
			    
			        var valString = $(this).val() || 0;
			        
			        printWholeWeight += parseFloat(valString);
			                    
			    });
	       
	       		var printWholeQuantity = 0;
	
			    $('input[name="printQuantity"]').each(function(){
			    
			        var valString = $(this).val() || 0;
			        
			        printWholeQuantity += parseInt(valString);
			                    
			    });
	       
	    		$("#printWholeWeight").text(printWholeWeight);
				$("#printWholeQuantity").text(printWholeQuantity);
					
				var printContent_height = $('#printContent').height();
				alert(printContent_height);	
				if(printContent_height < 190){
					var aaa = 190 - printContent_height;
					$('#printContent').append(
						"<tr > " +			
						"<td colspan='7'   height="+ aaa  +">&nbsp;" +
						"</td>" +
						"</tr > " 	
					);
				}	
				
				pagePrintView();
			
			
			
			
			}
			var validateList = ['serialNumber','customerName','personHandling','time','cargoList'];
			cancelErrorMessage(validateList,"");
			
			$("#save").click(function(){
				
				 var validateResult = validateNotEmpty(validateList);
				
				 var serialNumber = $("#serialNumber").val();
				 var customerName = $("#customerName").val();
				 
				 if(validateResult == false){
					 return;
				 }
				           
				 $.ajax({  
					   type: "post",  
					   url: "stockIn.do?method=verify",  
					   data:"serialNumber="+serialNumber+"&customerName="+customerName, 
					   dataType:'text',
					   contentType: "application/x-www-form-urlencoded;charset=utf-8", 
					   cache: false,  
					   success: function(msg){ 
					   	 
					     if(msg == "false"){
					    	 $.weeboxs.open('stockIn.do?method=initVerify', {title:'提示', 
									contentType:'ajax',
									onok:function(){
									
										stockIn.action="stockIn.do?method=save";
									
									stockIn.submit();														
								
									}
								});
					    	 
					     }
					    
					    
					   }
					   
				   });   
	      });
		
		 $("#addChargeType").click(function(){
			
			 var wholeWeight = $("#wholeWeight").text();
			 
			 var string = "<select name='chargeType' style='width:80px;margin-left:0px' >"+
				 "	<option value='0'>--请选择--</option>";
				 
				 
				$(chargeTypeList).each(function(i) { 
	       		  var chargeType = chargeTypeList[i]; 
	       			string = string + "	<option value='"+chargeType.codeKey+"'>"+chargeType.codeValue+"</option>"						
	       			
	       		})
	       		    
    		string = string+ "</select>"+
			 
			 
			 $("#chargeList").append(
             	"<div>" +
             		string + 
         			"<input type='text' name='chargeWeight' style='width:60px;margin:0px 2px 0px 2px' value='"+ wholeWeight +"'/>kg,"+
         			"<input type='text' name='unitPrice' style='width:25px;margin:0px 2px 0px 2px;text-align:right;'/>元&nbsp;/&nbsp;吨,"+
         			"合计<input type='text' name='totalPrice' style='width:50px;margin:0px 2px 0px 2px'/>元"+
         			"&nbsp;<a href='#' onclick='delChargeType(this);return false;'>删除</a>"+
         			"<br/>"+
         		"</div>"
             );
    		
    		bind();	  
		 });
		 
		 	
			
		});
		
		function bind(){
			
			$('input[name="chargeWeight"]').bind("propertychange", function () {
				var chargeWeight = $(this).val();
			    var unitPrice = $(this).parent().find('input[name="unitPrice"]').val();
			    $(this).parent().find('input[name="totalPrice"]').val(unitPrice*chargeWeight);
			 })
			 $('input[name="unitPrice"]').bind("propertychange", function () {
				var unitPrice = $(this).val();
			    var chargeWeight = $(this).parent().find('input[name="chargeWeight"]').val();
			    $(this).parent().find('input[name="totalPrice"]').val(unitPrice*chargeWeight);
			 })
			
			
			
		}
		
		function delChargeType(obj){
			$(obj).parent().remove();
		}
		function calculateTotal(){
			 
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
				
				$('input[name="chargeWeight"]').each(function(){
				    
			       $(this).val(wholeWeight);
			                    
			    });
				$('input[name="totalPrice"]').each(function(){
				    
				      var unitPrice = $(this).parent().find('input[name="unitPrice"]').val();
				      
				      $(this).parent().find('input[name="totalPrice"]').val(unitPrice*wholeWeight/1000);
				                    
				});
				
				
		 }
		
		function del(obj){
			
			$(obj).parent().parent().remove();
			calculateTotal();
           	  
		}
		
		function checkAddStockInCargo(){
			
			var customerName =$("#customerName").val(); 
			var customerId = $("#customerId").val();
			if(customerName != '' && customerId != ''){
				$("#addStockInCargo").attr("disabled",false);
			}else{
				$("#addStockInCargo").attr("disabled",true);
			}
		}
		</script>
		<script language="javascript" type="text/javascript" src="plug-in/My97DatePicker/WdatePicker.js"></script>
		
	</head>
	<body >
	
		<div id="main" class="noprint">
		<jsp:include page="common/top.jsp" flush="true" />
		<html:form styleId="stockIn" action="/stockIn.do?method=verify" >
			
		<div id="form_stylized" class="myform" style="width:580px;">
		 	<h1>入库登记</h1>
        	<p></p>
			<label style="width:150px;">入库单号 </label><html:text styleId="serialNumber" property="serialNumber" /><span id="serialNumberErrorMessage" class="errorMessage">请输入入库单号！</span><br/>
			<label style="width:150px;">客户名称 </label><html:text styleId="customerName" property="customerName"/><span id="customerNameErrorMessage" class="errorMessage">请输入客户名称！</span>
								   <html:hidden styleId="customerId" property="customerId"/><html:errors property="customerId"/><br/>
								   <html:hidden property="index"/>
			
			<label style="width:150px;">经办人 </label>
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
			<span id="personHandlingErrorMessage" class="errorMessage">请选择经办人！</span>
			<br/>
			
			
			<label style="width:150px;">入库日期 </label><html:text styleId="time" property="time" styleClass="Wdate"  onclick="WdatePicker()"/><span id="timeErrorMessage" class="errorMessage">请输入入库日期！</span><br/>
			<label style="width:150px;">收费 </label>
			<div id="chargeList" style="width:420px;float:right;">
			
			</div>
			<div style="width:420px;float:right;">
				<input id="addChargeType" type="button" value="增加" style="width:55px;margin-left:0px"/>
			</div>
			
			<div id="chargeType" style="visibility:hidden; ">
				
			</div>
			
			
		</div>
		<div style="margin: 2px auto">
		<table cellpadding="0" cellspacing="0" border="0" class="display"  >
				
			<thead>
				<tr>
					<th>货物编码</th>
					<th>货物名称</th>
					
					<th width="95px">批号</th>
					
					<th width="95px">生产日期</th>
					<th width="85px">类型</th>
					<th width="85px">重量/单位</th>
					<th width="85px">数量</th>
					<th width="85px">总重量</th>
					<th width="115px">储位</th>
					<th width="85px">操作</th>
					
				</tr>
			</thead>
			<tbody id="cargoList">
			
			
			
			
			
			
			</tbody>
			<tfoot>
				
				<tr>
					<th colspan="6" align="right">合计</th>
					<th align="right" valign="top" id="wholeQuantity">
						&nbsp;
					</th>
					<th align="right" valign="top" id="wholeWeight">
						&nbsp;
					</th>
					<th>&nbsp;</th>
					<th>&nbsp;</th>
				</tr>
				
			</tfoot>
			</table>
			
			<div>
				
				<input type="button" disabled="disabled" id="addStockInCargo"  value="增加" onclick="openBox();return false;"/>
				<span id="cargoListErrorMessage" class="errorMessage">请增加入库项目！</span>
				<!-- 
					<a style="float: left;"  href="#" onclick="openBox();return false;">增加</a>
				-->
				
			</div>
		</div>
		<html:hidden property="inOut" value="1"/>
		<div style="width: 100px;margin: 0px auto">
			
			<input type="button" id="save" value="保存"/>
			<input type="button"  value="打印" onclick="print();return false;"/>
			
		</div>
		</html:form>
			<script type="text/javascript">
			function openBox(id){

            //document.forms[0].action="/save.do";
	      		var customerId = $('input[name="customerId"]').val();
	      		
				$.weeboxs.open('addStockInCargo.do?method=initStockInCargo&customerId='+customerId, {title:'录入入库货物', 
																						 contentType:'ajax',
																						onok:function(box){
																							//addStockInCargo.submit();	
																							addStockInCargo(box);
																							
																							
																						},
																						onclose:function(){
																							calculateTotal();
																							
																						}
				
																						 
																					});
			
			};
			function position(index){
									
				var sRet = window.showModalDialog("stockPostion.do?method=init&index="+index,"","dialogWidth=720px;dialogHeight=600px;");
				$('input[id='+index+']').val(sRet);	
			            
				};
				
			function print(){
				
				stockIn.action="stockIn.do?method=verify&print=true";
				stockIn.submit();				
			
			}	
				
			</script>
		</div>
		<div id="printArea" style="width: 170mm; height: 93mm; margin:0px;">
		
			<div >
			 	<h1 style="font-size: 16px; text-align: center; padding:0px;margin: 0px;">硕春冷库入库单</h1>
	  			<table class="printTableHead" width="100%">
		  			<tr>
						<td width="33%">对方：<font  id="printCustomerName"></font></td>
						<td width="33%">入库日期：<font  id="printDate"></font></td>
						<td width="33%">单号：<font  id="printSerialNumber"></font></td>
					</tr>
				</table>
			</div>
			<div id="div11">
				<table cellpadding="0" cellspacing="0" border="0" class="printTableMain"  width="100%" style="table-layout:fixed;" >
				<thead style="">
					<tr>
						<th style="width: 25mm;">编码<br /></th>
						<th style="width: 35mm">名称<br /></th>
						<th style="width: 20mm">规格<br /></th>
						<th style="width: 15mm">数量<br /></th>
						<th style="width: 20mm">总重量(kg)<br /></th>
						<th style="width: 25mm">储位<br /></th>
						<th>备注<br /></th>
					</tr>
				</thead>
				<tbody id="printContent">
					<c:forEach items="${requestScope['printCargoList']}" var="cargo" varStatus="status">
			
						<tr>						
							<td align="right">
								<c:out value="${cargo.number}" /> 
							</td>
							<td align="right">
								<c:out value="${cargo.name}" />
							</td>
							
							<td align="right">
								<c:out value="${cargo.weight}" />kg/<c:out value="${cargo.unit}" />
								
							</td>
							<td align="right" >
								<c:out value="${cargo.quantity}" />
								<input type="hidden"  name="printQuantity" value="${cargo.quantity}"/>
						
							</td>	
							<td align="right" >
								
								<c:out value="${cargo.totalWeight}" />
								<input type="hidden"  name="printTotalWeight"  value="${cargo.totalWeight}"/>
						
							</td>
							<td>
								<c:out value="${cargo.locationName}" />
								
							</td>
							<td>
								
							</td>
							
						</tr>      
					</c:forEach>
				</tbody>
				<tfoot>
					
					<tr>
						<th colspan="3" align="right">合计<br /></th>
						<th align="right" id="printWholeQuantity">
							
						</th>
						<th align="right" id="printWholeWeight">
							
						</th>
						<th colspan="2" align="right" valign="top" >
							
						</th>
					</tr>
					
				</tfoot>
				</table>
				
			</div>
			<div id="">
			 	
	  			<table class="printTableFoot" width="100%">
		  			<tr>
						<td id="aa" width="25%">保管：</td>
						<td width="25%">验收：</td>
						<td width="25%">交物人：</td>
						<td width="25%">制票：</td>
					</tr>
				</table>
			</div>
			
		
		</div>
		
	</body>
</html>


