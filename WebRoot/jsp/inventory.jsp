<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>盘点</title>
		
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
			.a{border: 0px;padding: 0px;font-size: 10px}
			
		</style>
		<link type="text/css" rel="stylesheet" href="plug-in/weebox/weebox.css" />
		<script type="text/javascript" src="plug-in/jquery-1.8.0/jquery-1.8.0.js"></script>
	
		<script type="text/javascript" language="javascript" src="plug-in/dataTables/js/jquery.dataTables.js"></script>
		
		<script type="text/javascript" src="plug-in/weebox/bgiframe.js"></script>
		<script type="text/javascript" src="plug-in/weebox/weebox.js"></script>
		
		<script type="text/javascript" src="plug-in/monthlycalendar/dropdownmenu.js"></script>
	
		
		<link type="text/css" rel="stylesheet" href="plug-in/monthlycalendar/css/default.css" />
		
		
		
		<script type="text/javascript">
	        function query(type){   
				location.href="customerInventory.do?method=view&customerId="+ ${customer.id} +"&isDL="+type;   
            }
            
            function add(id) { 
			   
			    var a = $('#'+id).parent().parent();
             	
             	var quantity = a.find('input[name="quantity"]').val();
		     	var weight = a.parent().parent().parent().parent().find('input[name="weight"]').val();
		        weight = parseFloat(weight); 	
	         	var totalWeight;
         		if(quantity == '' || quantity == 0){
         			quantity = 1;
         			
         			totalWeight = quantity*weight;
				}else if(quantity > 0){
					quantity = parseInt(quantity);
					quantity = quantity + 1;
					
					totalWeight = quantity*weight;
				}
				
				a.find('input[name="quantity"]').val(quantity);
				a.parent().parent().parent().parent().find('input[name="totalWeight"]').val(totalWeight);
			      
			    var id = id.split("_");
			   
			    var b = $('#'+id[0]).parent().parent();
			    var stockQuantity = b.find('input[name="stockQuantity"]').val();
			    var stockTotalWeight = b.find('input[name="stockTotalWeight"]').val();
			    
			    stockQuantity = parseFloat(stockQuantity) - 1;
			    
			    stockTotalWeight = parseFloat(stockTotalWeight) - 1*weight;
			    b.find('input[name="stockQuantity"]').val(stockQuantity);
			    
			    b.find('input[name="stockTotalWeight"]').val(stockTotalWeight);   
			}
			
			 function subtract(id) { 
			      
				var a = $('#'+id).parent().parent();
             	
             	var quantity = a.find('input[name="quantity"]').val();
		     	var weight = a.parent().parent().parent().parent().find('input[name="weight"]').val();
		        weight = parseFloat(weight); 	
	         	var totalWeight;
         		if(quantity > 0){
					quantity = parseInt(quantity);
					quantity = quantity - 1;
					
					totalWeight = quantity*weight;
					
					a.find('input[name="quantity"]').val(quantity);
					a.parent().parent().parent().parent().find('input[name="totalWeight"]').val(totalWeight);
				      
				    var id = id.split("_");   
						
					var b = $('#'+id[0]).parent().parent();
				    var stockQuantity = b.find('input[name="stockQuantity"]').val();
				    var stockTotalWeight = b.find('input[name="stockTotalWeight"]').val();
				    
				    stockQuantity = parseFloat(stockQuantity) + 1;
				    
				    stockTotalWeight = parseFloat(stockTotalWeight) + 1*weight;
				    b.find('input[name="stockQuantity"]').val(stockQuantity);
				    
				    b.find('input[name="stockTotalWeight"]').val(stockTotalWeight);   	
				}
				
				
					
			}
			
			function change(id){
			
				var a = $('#'+id).parent().parent();
             	
             	var quantity = a.find('input[name="quantity"]').val();
             	quantity = parseFloat(quantity);
             	var weight = a.parent().parent().parent().parent().find('input[name="weight"]').val();
		        weight = parseFloat(weight); 	
				
				a.parent().parent().parent().parent().find('input[name="totalWeight"]').val(quantity*weight);
				
				var id = id.split("_");
			   
			    var b = $('#'+id[0]).parent().parent();
			    var originalStockQuantity = b.find('input[name="originalStockQuantity"]').val();
			    
			    var originalStockTotalWeight = b.find('input[name="originalStockTotalWeight"]').val();
			    
			    quantity = 0;
			    $('#tbody_'+id[0]).find('input[name="quantity"]').each(function(){
			        
					quantity = quantity + parseFloat($(this).val());
					                
				 });
				 
				
			    
			    var stockQuantity = parseFloat(originalStockQuantity) - quantity;
			    
			    var stockTotalWeight = parseFloat(originalStockTotalWeight) - quantity*weight;
			      
			    
			    b.find('input[name="stockQuantity"]').val(stockQuantity);
			    
			    b.find('input[name="stockTotalWeight"]').val(stockTotalWeight);  
			}
            
            function totalWeightChange(id){
			
				var id = id.split("_");
			   
			    var b = $('#'+id[0]).parent().parent();
			    
			    var originalStockTotalWeight = b.find('input[name="originalStockTotalWeight"]').val();
			    
			    var stockTotalWeight = 0;
			    
			    $('#tbody_'+id[0]).find('input[name="totalWeight"]').each(function(){
			        
			        stockTotalWeight = stockTotalWeight + parseFloat($(this).val());
					
					                
				});
			    
			     
			    var stockTotalWeight = parseFloat(originalStockTotalWeight) - stockTotalWeight;
			      
			    b.find('input[name="stockTotalWeight"]').val(stockTotalWeight);  
			}
            
            function a(id1){  
             		
             		var a = $('#'+id1).parent().parent();
             		var index = $('#'+id1).parent().find('input[name="index"]').val();
             		index = parseInt(index) + 1;
             		
             		$('#'+id1).parent().find('input[name="index"]').val(index);
             		
            		var customerName = a.find('input[name="customerName"]').val();
            		var id = a.find('input[name="id"]').val();
            		var number = a.find('input[name="number"]').val();
            		var name = a.find('input[name="name"]').val();
            		var category = a.find('input[name="category"]').val();
            		var weight = a.find('input[name="weight"]').val();
            		var unit = a.find('input[name="unit"]').val();
            		var i = id1+"_"+index;
            		
            		var aaaaa = "<a id='"+i+"' onclick=add('"+i+"');return false; >aa</a>";
            		var bbbbb = "<a id='"+i+"' onclick=subtract('"+i+"');return false; >bb</a>";
            		var ccccc = "<input style='width: 25px' name='quantity' onchange=change('"+i+"')  value='0'/>";
    				a.after("<tr>" +	
							"<td>" +	
							customerName +	
								
							"</td>				" +	
							"<td>" +	
							number +	
							"	<input name='id' type='hidden' value="+ id +"/>" +	
							"</td>" +	
							"<td>" +	
							 name
							 +	
							"</td>	" +	
							
							"<td align='right'>" +	
							category +	
							"</td>" +	
							"<td align='right'>" +	
							
								weight + "kg/" + unit +	
							"	<input name='weight' type='hidden' value="+ weight +"/>" +	
							"</td>" +	
							"<td align='right'>" +	
							"<table name='dd' cellpadding='0' cellspacing='0' border='0' style='margin:0px;padding:0px'>" + 
							"	<tr name='cc'><td style='border: 0px;padding: 0px' rowspan='2'>"+
							ccccc+
							"</td><td name='bb' style='border: 0px;padding: 0px;font-size: 10px'>"+
							
							 aaaaa+
							
							"</td></tr>" + 
							"<tr><td style='border: 0px;padding: 0px;font-size: 10px'> " +
							bbbbb+

							"</td></tr>" + 
							"</table>"  +
							"</td>" +	
							"<td align='right' class='totalWeight'>" +	
							"<input  style='width: 25px' name='totalWeight' onchange=totalWeightChange('"+i+"') value='0'/>"
							 +	
							"</td>" +	
							"<td align='right'>" +	
							
							 +	
							"</td>" +	
							"<td align='right'>" +	
							"	<a name='inserRow' ></a>" +	
							"</td>" +	
							
						"</tr>");
             
             }
             
             
             
            $(document).ready(function() {
            
	            $('input[name="stockQuantity"]').each(function(){
				   
					var stockQuantity = $(this).val();
				    stockQuantity = parseFloat(stockQuantity);    
				    
				    var stockTotalWeight = $(this).parent().parent().find('input[name="stockTotalWeight"]').val();
				    stockTotalWeight = parseFloat(stockTotalWeight);    
				   
				    if(stockQuantity == 0 && stockTotalWeight == 0){
				    	
				    	$(this).parent().parent().remove();
				    }
					                
				 });
            	     		
            	var wholeWeight = 0;
            	$(".totalWeight").each(function() {
		   	    	var valString = $(this).text() || 0;
			        
			        wholeWeight += parseFloat(valString);
            
            	});
            	$("#wholeWeight").text(wholeWeight);
         
            	
            });
            
            
		</script>

	</head>
	<body >
		<div id="main">
		<jsp:include page="common/top.jsp" flush="true" />
		<html:form action="/customerStock">
		<div >
			<div class="w936" > 
			    <div id="tb_" class="tb_"> 
		            <ul id="nav"> 
		            	<li style="text-align: left;font-size: 14px;font-weight: bold;padding-top: 3px">盘点</li> 
		                <!--  
		                <li style="margin-right: 50px" >
		               	
							<div id="sddm">
								<a class="function" href="#" onmouseover="mopen('m2')" onmouseout="mclosetime()" >当前库存</a>
									<div id="m2" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
										<a href="stockItems.do?method=view&customerId=${customer.id}&month=<fmt:formatDate value="${month}" pattern="yyyyMM"/>">出入库明细</a>
										<a href="dailyBalance.do?method=view&customerId=${customer.id}&month=<fmt:formatDate value="${month}" pattern="yyyyMM"/>">每日结存</a>
										<a href="stockCustomer.do?method=view">返回</a>
									</div>	
									
							</div>
		                </li> 
		              	-->
		              	
		              	<li style="margin-right: 10px;float: right" >
		               		<div id="sddm">
								 <!--  <a class="button" href="stockCustomer.do?method=view" >返回</a> -->
							</div>
		                </li> 
		            </ul> 
		            
			    </div> 
			     <!--
			   <div id="form_stylized"  class="myform" style="width: 100%;background-color: #F9F9F9;border-bottom: 1px solid #CCCCCC;margin-bottom: 5px">
			    	
			    	<div style="font-size: 14px;font-weight: bold;margin: 10px 5px 5px 65px">查询</div>
			    	
			   
			    	<br/>
			    		  					
			    </div>
			    -->
			</div>
			
			<div >
		
				<table cellpadding="0" cellspacing="0" border="0" class="stockItems">
				
					<thead>
						<tr>
							<th>客户名称</th>
							<th>货物编码</th>
							<th>货物名称</th>
							<th>类型</th>
							<th>重量(kg)/单位</th>
							<th>库存数量</th>
							<th>库存总重量</th>
							<th>储位</th>
							<th>操作</th>
						</tr>
					</thead>
					<c:forEach items="${requestScope['cargoes.list']}" var="cargo" varStatus="index">
						<tbody id="tbody_${index.index}">
						<tr >		
							<td>
								<c:out value="${cargo.customerName}" /> 
								<input name="customerName" type="hidden" value="${cargo.customerName}"/>
							</td>				
							<td>
								<c:out value="${cargo.number}" /> 
								<input name="id" type="hidden" value="${cargo.id}"/>
								<input name="number" type="hidden" value="${cargo.number}"/>
							</td>
							<td>
								<a  href="#" onclick="openBox(${cargo.id},'${cargo.name}');return false;" >
									<c:out value="${cargo.name}" />
								</a>	
								<input name="name" type="hidden" value="${cargo.name}"/>
							</td>	
							
							<td align="right">
								<c:out value="${cargo.category}" />
								<input name="category" type="hidden" value="${cargo.category}"/>
							</td>
							<td align="right">
								
								<c:choose>
									<c:when test="${cargo.weight=='' and cargo.quantity != '' and cargo.quantity != 0.0 and cargo.quantity != -0.0}">
										<fmt:formatNumber value="${cargo.totalWeight/cargo.quantity}" pattern="#.#"></fmt:formatNumber>kg/<c:out value="${cargo.unit}" />
										
										<input type="hidden" name="weight" value="<fmt:formatNumber value="${cargo.totalWeight/cargo.quantity}" pattern="#.#"/>"/>
										
										<input type="hidden" name="unit" value="${cargo.unit}"/>
										
									</c:when>
									<c:otherwise>
										<c:out value="${cargo.weight}" />kg/<c:out value="${cargo.unit}" />
										<input type="hidden" name="weight" value="${cargo.weight}"/>
										
										<input type="hidden" name="unit" value="${cargo.unit}"/>
										
									</c:otherwise>
								</c:choose>
								
							</td>
							<td align="right">
								<input name="stockQuantity" style="border: 0px;width:95px;text-align:right;background-color:transparent"  readonly="readonly"  value="${cargo.quantity}" />
								<input name="originalStockQuantity" type="hidden" value="${cargo.quantity}" />
								
							</td>
							<td align="right" class="totalWeight">
								<input name="stockTotalWeight" style="border: 0px;width:95px;text-align:right;background-color:transparent" readonly="readonly"  value="${cargo.totalWeight}" />
								<input name="originalStockTotalWeight" type="hidden" value="${cargo.totalWeight}" />
			
							</td>
							<td align="right">
								<c:out value="${cargo.locationName}" />
							</td>
							<td align="right">
								<a id="${index.index}" onclick="a(${index.index});return false;">移库</a>
								<input name="index" type="hidden" value="0"/>
							</td>
							
						</tr>   
						</tbody>
					</c:forEach>
					<!-- 
						<tfoot>
					
							<tr>
								<th colspan="7" align="right">合计</th>
								
								<th align="right" valign="top" id="wholeWeight">
									0
								</th>
								<th align="right" valign="top" >
									
								</th>
							</tr>
							
						</tfoot>
					-->
				</table>
			</div>
			</div>
			
		</html:form>
			<script type="text/javascript">
				function openBox(id,name){
					window.showModalDialog("cargo.do?method=items&cargoId="+id,"","dialogWidth=950px;dialogHeight=600px;");
					
				};
			</script>
		</div>
	</body>
</html>

