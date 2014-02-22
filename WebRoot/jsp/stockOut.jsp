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
		<title>出库登记</title> 
		
		<style type="text/css" title="currentStyle" media="screen">
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
        	
        	a.filter{font-size:12px;color:#0088CC;text-decoration:none;}
			a.filter:hover{font-size:12px;color:#0088CC;text-decoration:underline;}
			a.filter1{border:1px solid #0188CC;padding:5px 5px 2px 5px;text-decoration:none;background-color: #0188CC;color:#ffffff;font-size: 12px}
        	#printArea{display:block;visibility: hidden;}    	
		</style>
		<style media="print">
			.noprint{display:none;}
			table.printTableHead{font-size: 14px;margin:0px}
			table.printTableMain{border-collapse:collapse;margin:0px}
			table.printTableMain th{border-bottom: 2px solid #000;font-size: 14px;padding:5px 0px}
			table.printTableMain td{border-bottom: 1px solid #000;font-size: 14px;padding:2px;}
			
			table.printTableFoot{font-size: 14px; }
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
	<script type="text/javascript">
	//乘法

    function mul(arg1, arg2) {

        var m = 0, s1 = arg1.toString(), s2 = arg2.toString();

        try { m += s1.split('.')[1].length } catch (e) { }

        try { m += s2.split('.')[1].length } catch (e) { }

        return Number(s1.replace('.', '')) * Number(s2.replace('.', '')) / Math.pow(10, m)

    }

	
	var customers = ${stockOutForm.customerJsonList};
		$().ready(function() {
			 
			var chargeTypeList = eval('<%=request.getAttribute("chargeType.list")%>');

			$("#filter2").hide();	
			var customerId = <%=request.getAttribute("customerId")%>;
			if(customerId != null){
				
				getCargoesList(customerId);
				getChargeList(customerId);
			}
			
			
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
			
				var customerId = data.id;
				getCargoesList(customerId);
				
				getChargeList(customerId);
				
				$('input[name="customerId"]').val(data.id);
			});
			
			function getCargoesList(customerId){
				
				$.ajax({  
					   type: "post",  
					   url: "stockOut.do?method=getCargoesList",  
					   data:"customerId="+ customerId, 
					   dataType:'text',
					   contentType: "application/x-www-form-urlencoded;charset=utf-8", 
					   cache: false,  
					   success: function(msg){ 
						 var obj = "";  
					   	 if(msg != ""){
					     	obj = eval('('+msg+')'); 
					   	 }
					     $("#cargoesList").html("");
					     
					     $(obj).each(function(index) { 

				                var val = obj[index]; 
				               	
				                var string = "<tr>"+						
											  "<td align='center'>"+	
													"<input name='printNumber' type='hidden' value="+ val.number +"/>"+	
												
													val.number +	
													"<input name='id' type='hidden' value='"+ val.id +"'/>"+	
											  "</td>"+	
											  "<td align='center'>"+	
													"<a href='#' onclick='openBox("+ val.id +",\""+ val.name +"\");return false;' >"+	
													 val.name + 	
													"</a>	" +	
													
													"<input name='printName' type='hidden' value="+ val.name +"/>"+	
											  "</td>	"+	
												
											  "<td align='center'>";
								
					               if(val.weight=='' && val.quantity != '' && val.quantity != 0.0 && val.quantity != -0.0){
					            	   string = string + val.totalWeight/val.quantity + "kg/" + val.unit +"(平均)"+	
										
										"<input type='hidden' name='weight' value='" + val.totalWeight/val.quantity + "'/>";	
										
		         	       			 }else{
		         	       				string = string + val.weight + "kg/" + val.unit+	
										"<input type='hidden' name='weight' value='" + val.weight + "'/>";	
		         	       			 }
									
					               string = string + "<input type='hidden' name='printUnit' value='" + val.unit + "'/>"+
															val.grossWeight +	
															"<input type='hidden' name='printGrossWeight' value='"+ val.grossWeight +"'/>"+	
															
														"</td>"+	
														"<td align='right' >"+	
															"<input name='stockQuantity' style='border: 0px;width:95px;text-align:right;background-color:transparent'  readonly='readonly'  value='" + val.quantity + "' />"+	
														"</td>"+	
														"<td align='right'>"+	
															
															"<input name='stockTotalWeight' style='border: 0px;width:95px;text-align:right;background-color:transparent' readonly='readonly'  value='" + val.totalWeight + "' />"+	
															
														"</td>"+	
														"<td align='right'>"+	
															"<a href='#' onclick='position("+ index +");return false;'>"+ val.locationName +"</a>"+	
															"<input type='hidden' name='printLocationName' value='"+ val.locationName +"'/>"+	
																	
															
															"<input type='hidden'  name='locationId' value='"+val.locationId+"'/>"+	
															"<input type='hidden' id="+ index +" name='postionQuantity'  />"+	
														"</td>"+	
														"<td align='center' >"+	
															"<input style='border: 1px solid #333;width: 50px' name='quantity' align='right' />"+	
															
														"</td>"+	
														"<td align='center'>"+	
															"<input style='border: 1px solid #333;width: 50px' name='totalWeight' align='right' />"+	
															
														"</td>"+	
													"</tr> ";     
				               	
				               
				            	$("#cargoesList").append(string);
				               
				            });
					     balanceWeightIsNotNull();
					     
					   },
					  
					   complete: function(msg) {
						   bind1();
					   }
					   
				   });
				
			}
			
			function getChargeList(customerId){
				
				$.ajax({  
					   type: "post",  
					   url: "chargeDetail.do?method=getChargeList&chargeMethod=0",  
					   data:"customerId="+ customerId, 
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
				                		 
				            			"<input type='text' name='chargeWeight' style='width:60px;margin:0px 2px 0px 2px' />吨"+
				            			"<input type='text' name='unitPrice' style='width:25px;margin:0px 2px 0px 2px;text-align:right;' value='"+ val.unitPrice +"''/>元&nbsp;/&nbsp;吨,"+
				            			"合计<input type='text' name='totalPrice' style='width:50px;margin:0px 2px 0px 2px'/>元"+
				            			"&nbsp;<a href='#' onclick='delChargeType(this);return false;'>删除</a>"+
				            			"<br/><div/>";
				            			
				            			$("#chargeList").append(string);
				               
				            }); 
					   },
					  
					   complete: function(msg) {
						   bind2();
					   }
					   
				   });
				
				
			}
			
			
			 $("#addChargeType").click(function(){
					
				 var wholeWeight = $("#wholeWeight").text()/1000;
				 
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
	         			"<input type='text' name='chargeWeight' style='width:60px;margin:0px 2px 0px 2px' value='"+ wholeWeight +"'/>吨"+
	         			"<input type='text' name='unitPrice' style='width:25px;margin:0px 2px 0px 2px;text-align:right;'/>元&nbsp;/&nbsp;吨,"+
	         			"合计<input type='text' name='totalPrice' style='width:50px;margin:0px 2px 0px 2px'/>元"+
	         			"&nbsp;<a href='#' onclick='delChargeType(this);return false;'>删除</a>"+
	         			"<br/>"+
	         		"</div>"
	             );
	    		
	    		bind2();	  
			 });
			 
			 var validateList = ['serialNumber','customerName','personHandling','time'];
			 cancelErrorMessage(validateList,"");
			 $("#save").click(function(){
					
				 var validateResult = validateNotEmpty(validateList);
				 
				 var serialNumber = $("#serialNumber").val();
				 var customerName = $("#customerName").val();
				 
				 if(validateResult == false){
					 return;
				 }
				 stockOut.action="stockOut.do?method=save";
					
				 stockOut.submit();	           
				
	      	});
			if(${stockOutForm.verify == false}){
				
				$.weeboxs.open('stockOut.do?method=initVerify', {title:'提示', 
																contentType:'ajax',
																onok:function(){
																stockOut.action="stockOut.do?method=save";
																stockOut.submit();														
															
																}
															});
		
			}
			
		});
		
		function bind1(){
			
			$('input[name="quantity"]').bind("propertychange",function(){
				
				var quantity = $(this).val();
				
			    var weight = $(this).parent().parent().find('input[name="weight"]').val();
			     
			    $(this).parent().parent().find('input[name="totalWeight"]').val(mul(quantity,weight));
			    calcTotal();
			});
			$('input[name="totalWeight"]').bind("propertychange",function(){
			
				calcTotal();
			
			});
			
			
		}
		
		function bind2(){
			
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
			editChargeWeightList(wholeWeight);
			
		}
		
		function editChargeWeightList(wholeWeight){
			 $('input[name="chargeWeight"]').each(function(){
			      $(this).val(wholeWeight/1000);
			    });
		}
		
		function delChargeType(obj){
			$(obj).parent().remove();
		}
		
		function balanceWeightIsNull(){
			
           	$('input[name="stockQuantity"]').each(function(){
			   
				var stockQuantity = $(this).val();
			    stockQuantity = parseFloat(stockQuantity);    
			    
			    var stockTotalWeight = $(this).parent().parent().find('input[name="stockTotalWeight"]').val();
			    stockTotalWeight = parseFloat(stockTotalWeight);    
			    	
			   	$(this).parent().parent().show();
			   
			    if(stockQuantity != 0 || stockTotalWeight != 0){
			    	
			    	$(this).parent().parent().hide();
			    }
				                
			 });
			jQuery("tr:visible:odd td").addClass("color1");
			$("#filter1").hide();
			$("#filter2").show();
			
        }
        
        function balanceWeightIsNotNull(){
        
           	$('input[name="stockQuantity"]').each(function(){
			   
				var stockQuantity = $(this).val();
			    stockQuantity = parseFloat(stockQuantity);    
			    
			    var stockTotalWeight = $(this).parent().parent().find('input[name="stockTotalWeight"]').val();
			    stockTotalWeight = parseFloat(stockTotalWeight);    
			    	
			    	$(this).parent().parent().show();
			   
			    if(stockQuantity == 0 && stockTotalWeight == 0){
			    	
			    	$(this).parent().parent().hide();
			    }
				                
			 });
			jQuery("tr:visible:odd td").addClass("color1");
			$("#filter1").show();
			$("#filter2").hide();
			
        }
        
		</script>
		<script language="javascript" type="text/javascript" src="plug-in/My97DatePicker/WdatePicker.js"></script>
		<script language="javascript" type="text/javascript" src="plug-in/print/print.js"></script>

	</head>
	<body >
	
		<div id="main" class="noprint">
		<jsp:include page="common/top.jsp" flush="true" />
		<html:form  styleId="stockOut"  action="/stockOut.do?method=save">
			
		<div id="form_stylized" class="myform" style="width:580px;">
		 	<h1>出库登记</h1>
        	<p></p>
			<label style="width:150px;">出库单号 </label><html:text styleId="serialNumber" property="serialNumber" value="${serialNumber}"/><span id="serialNumberErrorMessage" class="errorMessage">请输入出库单号！</span><br/>
			<label style="width:150px;">客户名称 </label><html:text styleId="customerName" property="customerName"/><span id="customerNameErrorMessage" class="errorMessage">请输入客户名称！</span>
								                         <html:hidden property="customerId"/><br/> 
			<label style="width:150px;">经办人 </label>
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
			<span id="personHandlingErrorMessage" class="errorMessage">请选择经办人！</span>
			<br/>
			
			
			<label style="width:150px;">出库日期 </label><html:text styleId="time" property="time" styleClass="Wdate"  onclick="WdatePicker()"/><span id="timeErrorMessage" class="errorMessage">请输入出库日期！</span><br/>
			
			<label style="width:150px;">收费 </label>
				<div id="chargeList" style="width:420px;float:right;">
				
				</div>
				<div style="width:420px;float:right;">
					<input id="addChargeType" type="button" value="增加" style="width:55px;margin-left:0px"/>
				</div>
				<div id="chargeType" style="visibility:hidden;height:10px ">
				
				</div><br/>
				
		</div>
		
		
		<div style="background-color:#F9F9F9;border-top: 1px solid #bbbbbb;border-bottom: 1px solid #bbbbbb;float: right;width:100%;">
			<div id="filter1" style="padding:10px">
				<span style="font-size:14px;font-weight:bolder;">
					库存不为零的记录
				</span>
				<a class="filter" onclick="balanceWeightIsNull()" href="#">库存为零的记录</a>
			</div>
			<div id="filter2" style="padding:10px">
				<span style="font-size:14px;font-weight:bolder;margin:10px">
					库存为零的记录
				</span>
				<a class="filter" onclick="balanceWeightIsNotNull()" href="#">库存不为零的记录</a>
			</div>
			
		</div>
		
		
			
		
		<div style="margin: 2px auto">
		<table cellpadding="0" cellspacing="0" border="0" class="display"  >
				
			<thead>
				<tr>
					<th >货物编码</th>
					<th >货物名称</th>
					<!--
					<th width="95px">批号</th> 
					<th width="95px">生产日期</th>-->
					<!--<th>类型</th>-->
					<th width="155px" style="text-align: center">重量/单位</th>
					<th width="95px">库存数量</th>
					<th width="95px">库存总重量</th>
					<th width="125px">储位</th>
					<th width="65px">出库数量</th>
					<th width="65px">出库重量</th>
					
					
				</tr>
			</thead>
			<tbody id="cargoesList">
			
			
			
			
			
			
			</tbody>
			<tfoot>
				
				<tr>
					<th colspan="6" align="right">合计</th>
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
			<input id="save" type="button" value="保存"/>
			<input type="button"  value="打印" onclick="print();return false;"/>
			
		</div> 
     
		
		
		
		</html:form>
			<script type="text/javascript">
			//function verify(id){
            //document.forms[0].action="/save.do";
			//	$.weeboxs.open('stockOut.do?method=verify&id='+id, {title:'录入出库货物', contentType:'ajax'});
			//};
			
			function openBox(id,name){
				
				window.showModalDialog("cargo.do?method=items&cargoId="+id,"","dialogWidth=950px;dialogHeight=600px;");
			};
			
			function position(index){
				
				var sRet = window.showModalDialog("stockPostion.do?method=init&index="+index,"","dialogWidth=720px;dialogHeight=600px;");
				$('input[id='+index+']').val(sRet);
					
			};
			function print(){
				
				$('#printContent').html("");
				
				$('#printCustomerName').html($('input[name="customerName"]').val());
				$('#printDate').html($('input[name="time"]').val());
				$('#printSerialNumber').html($('input[name="serialNumber"]').val());
				
				$('#printArea').css("display","block");
				var id = 1;
				var printContent_height_1 = 0;
				 $('input[name="quantity"]').each(function(){
			    	
			    	var quantity = $(this).val();
			      
			    	var totalWeight = $(this).parent().parent().find('input[name="totalWeight"]').val();
			     	
			     	if((quantity != null && quantity != "") || (totalWeight != null && totalWeight != "") ){
			     		
			     		var number = $(this).parent().parent().find('input[name="printNumber"]').val();
			     		var name = $(this).parent().parent().find('input[name="printName"]').val();
			     		var weight = $(this).parent().parent().find('input[name="weight"]').val();
			     		var unit = $(this).parent().parent().find('input[name="printUnit"]').val();
			     		var locationName = $(this).parent().parent().find('input[name="printLocationName"]').val();  	
			     		var grossWeight = $(this).parent().parent().find('input[name="printGrossWeight"]').val();  	
			     		var totalGrossWeight = mul(quantity,grossWeight);
			     		var grossWeightStr = "";
			     		if(grossWeight != ""){
			     		  grossWeightStr = grossWeight + "kg(" + totalGrossWeight + "kg)";
			     		}
			     		
			     		$('#printContent').append(
			     			
			     			"<tr > " +			
								"<td align='left' style='word-break:break-all;'>" +
									number +
								"</td>" +
								"<td align='left'  style='word-break:break-all;'>" +
									name +
								"</td>" +
								
								"<td align='center' style='word-break:break-all;'>" +
									weight +"kg/"+ unit+
								"</td>" +
								"<td align='right' style='word-break:break-all;'>" +
									quantity +
									
								"</td>	" +
								"<td align='right'  style='word-break:break-all;'>" +
									totalWeight +"kg" +
									
									
									
								"</td>" +
								"<td align='center' style='word-break:break-all;'>" +
									locationName+
								"</td>" +
								"<td style='word-break:break-all;'>" +
									grossWeightStr +
								"</td>		" +
							"</tr>      " 
			     		
			     		
			     		
			     		);
			     		
			     		
			     	}
			     	
			    	
			                    
			    });
				
						var printContent_height = $('#printContent').height();
						
						if(printContent_height < 190){
							var aaa = 190 - printContent_height;
							$('#printContent').append(
								"<tr > " +			
								"<td colspan='7'   height="+ aaa  +">&nbsp;" +
								
								"</td>" +
								"</tr > " 	
							
							);
					
			     	}
				
				
				//$.weeboxs.open('#printArea', {title:'出库单打印',width:900,height:500 
				//												
				//											});
					
				//$('#main').addClass("noprint");	
				//alert($('#printContent').html());		
				
				$('#printWholeWeight').text($('#wholeWeight').text());
				$('#printWholeQuantity').text($('#wholeQuantity').text());
				
				$('#printArea').css("display","");
				pagePrintView();
				stockOut.action="stockOut.do?method=save";
				stockOut.submit();			
			}	
			function save(){
				var time  = $('input[name="time"]').val();
				if(time == ""){
					alert("请输入出库日期！");
				}else {
					stockOut.action="stockOut.do?method=save";
					stockOut.submit();	
				}	
			}
			
			</script>
		</div>
		<div id="printArea" style="width: 170mm; height: 93mm; margin:0px;">
		
			<div >
			 	<h1 style="font-size: 16px; text-align: center; padding:0px;margin: 0px;">硕春冷库出库单</h1>
	  			<table class="printTableHead" width="100%">
		  			<tr>
						<td width="33%">对方：<font  id="printCustomerName"></font></td>
						<td width="33%">出库日期：<font  id="printDate"></font></td>
						<td width="33%">单号：<font  id="printSerialNumber"></font></td>
					</tr>
				</table>
			</div>
			<div id="div11">
				<table cellpadding="0" cellspacing="0" border="0" class="printTableMain"  width="100%" style="table-layout:fixed;" >
				<thead style="">
					<tr>
						<th style="width: 25mm;">编码<br /></th>
						<th style="width: 25mm">名称<br /></th>
						<th style="width: 18mm">规格<br /></th>
						<th style="width: 12mm">数量<br /></th>
						<th style="width: 17mm">总重量<br /></th>
						<th style="width: 25mm">储位<br /></th>
						<th align="left">毛重(总毛重)<br /></th>
					</tr>
				</thead>
				<tbody id="printContent">
					
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
						<td width="25%">收物人：</td>
						<td width="25%">制票：</td>
					</tr>
				</table>
			</div>
			<!--  
			<div class="noprint"> 
			
				
				<span style="font-family:'Arial',sans-serif;font-size:22.964;"><input value="打 印" type="button" onClick="pageprint()"/></span> 
				<span style="font-family:'Arial',sans-serif;font-size:22.964;"><input value="打印预览" type="button" onClick="pagePrintView()"/></span> 
				<span style="font-family:'Arial',sans-serif;font-size:22.964;"><input value="打印设置" type="button" onClick="pagePrintSet()"/></span> 
			</div> 
		 	-->
		
		
		</div>
		
		
		
	</body>
</html>


