<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>出入库明细</title>
		
		<link type="text/css" rel="stylesheet" href="plug-in/weebox/weebox.css" />
		<script type="text/javascript" src="plug-in/lightTreeview/jquery-1.2.6.js"></script>
		<script type="text/javascript" language="javascript" src="plug-in/dataTables/js/jquery.dataTables.js"></script>
		
		<script type="text/javascript" src="plug-in/weebox/bgiframe.js"></script>
		<script type="text/javascript" src="plug-in/weebox/weebox.js"></script>
		<script type="text/javascript">
		$().ready(function aaa() {
				
				var wholeInQuantity = 0;
				var wholeInWeight = 0;
				var wholeOutQuantity = 0;
				var wholeOutWeight = 0;
				
				var wholeEqualQuantity = 0;
				var wholeEqualWeight = 0;
				
				
				$('font[name="inQuantity"]').each(function(){
			    
			        var valString = $(this).text() || 0;
			        //alert(valString);
			        wholeInQuantity += parseInt(valString);
			                    
			    });
			    $('font[name="inTotalWeight"]').each(function(){
			    
			        var valString = $(this).text() || 0;
			        
			        wholeInWeight += parseFloat(valString);
			                    
			    });
	       		$('font[name="outQuantity"]').each(function(){
			    
			        var valString = $(this).text() || 0;
			        
			        wholeOutQuantity += parseInt(valString);
			                    
			    });
			    $('font[name="outTotalWeight"]').each(function(){
			    
			        var valString = $(this).text() || 0;
			        
			        wholeOutWeight += parseFloat(valString);
			                    
			    });
	       		
	       		 $('font[name="equalQuantity"]').each(function(){
			    
			        var valString = $(this).text() || 0;
			        
			        wholeEqualQuantity += parseFloat(valString);
			                    
			    });
			    
			     $('font[name="equalTotalWeight"]').each(function(){
			    
			        var valString = $(this).text() || 0;
			        
			        wholeEqualWeight += parseFloat(valString);
			                    
			    });
	       		
	       		
	       		$('font[name="balanceQuantity"]').each(function(){
			    
			        var outQuantity = $(this).parent().parent().find('font[name="outQuantity"]').text() || 0;
			        var inQuantity = $(this).parent().parent().find('font[name="inQuantity"]').text() || 0;
			        var balanceQuantity = $(this).parent().parent().prev().find('font[name="balanceQuantity"]').text() || 0;
			       
			        var equalQuantity = $(this).parent().parent().find('font[name="equalQuantity"]').text() || 0;
			       
			       
			        $(this).text(parseFloat(balanceQuantity) + parseFloat(outQuantity) + parseFloat(inQuantity)+parseFloat(equalQuantity));
			       	
			       	var outTotalWeight = $(this).parent().parent().find('font[name="outTotalWeight"]').text() || 0;
			        var inTotalWeight = $(this).parent().parent().find('font[name="inTotalWeight"]').text() || 0;  
			        var balanceWeight = $(this).parent().parent().prev().find('font[name="balanceWeight"]').text() || 0;
			       
			        var equalTotalWeight = $(this).parent().parent().find('font[name="equalTotalWeight"]').text() || 0;
			       
			       
			        $(this).parent().parent().find('font[name="balanceWeight"]').text((parseFloat(balanceWeight) + parseFloat(outTotalWeight) + parseFloat(inTotalWeight)+ parseFloat(equalTotalWeight)).toFixed(1)) ;
			    });
				
				//$('font[name="balanceQuantity"]').each(function(){
			    

			    //  alert(outQuantity+outQuantity);
			       // var balanceQuantity = $(this).parent().parent().prev().find('font[name="balanceQuantity"]').text() || 0;
			      //  $(this).text(parseFloat(balanceQuantity) + parseFloat(outQuantity) + parseFloat(inQuantity));
			                    
			   // });
	      	 	
	      	 	$("#wholeInQuantity").text(wholeInQuantity);
	    		$("#wholeInWeight").text(wholeInWeight);
				$("#wholeOutQuantity").text(wholeOutQuantity);
				$("#wholeOutWeight").text(wholeOutWeight);
				
				$("#wholeEqualQuantity").text(wholeEqualQuantity);
				$("#wholeEqualWeight").text(wholeEqualWeight);
				
				$("#totalBalanceQuantity").text(wholeInQuantity+wholeOutQuantity+wholeEqualQuantity);
				$("#totalBalanceWeight").text((wholeInWeight+wholeOutWeight+wholeEqualWeight));
			});
			
			function changeLocationName(id){
				         
				$('tr[name^="locationId_"]').hide();
				
				$('font[name="inQuantity"]').attr('name',"inQuantity_1");
			    $('font[name="inTotalWeight"]').attr('name',"inTotalWeight_1");
	       		$('font[name="outQuantity"]').attr('name',"outQuantity_1");
			    $('font[name="outTotalWeight"]').attr('name',"outTotalWeight_1");
	       		$('font[name="equalQuantity"]').attr('name',"equalQuantity_1");
		    	$('font[name="equalTotalWeight"]').attr('name',"equalTotalWeight_1");
				   
				if(id == 0){
					$('tr[name^="locationId_"]').show();
					$('tr[name^="locationId_"]').find('font[name^="inQuantity_"]').attr('name',"inQuantity");
		            $('tr[name^="locationId_"]').find('font[name^="inTotalWeight_"]').attr('name',"inTotalWeight");
		            $('tr[name^="locationId_"]').find('font[name^="outQuantity_"]').attr('name',"outQuantity");
		            $('tr[name^="locationId_"]').find('font[name^="outTotalWeight_"]').attr('name',"outTotalWeight");
		            $('tr[name^="locationId_"]').find('font[name^="equalQuantity_"]').attr('name',"equalQuantity");
		            $('tr[name^="locationId_"]').find('font[name^="equalTotalWeight_"]').attr('name',"equalTotalWeight");
					
				
				}else{
				
					$('tr[name="locationId_'+id+'"]').show();
					$('tr[name="locationId_'+id+'"]').find('font[name="inQuantity_1"]').attr('name',"inQuantity");
		            $('tr[name="locationId_'+id+'"]').find('font[name="inTotalWeight_1"]').attr('name',"inTotalWeight");
		            $('tr[name="locationId_'+id+'"]').find('font[name="outQuantity_1"]').attr('name',"outQuantity");
		            $('tr[name="locationId_'+id+'"]').find('font[name="outTotalWeight_1"]').attr('name',"outTotalWeight");
		            $('tr[name="locationId_'+id+'"]').find('font[name="equalQuantity_1"]').attr('name',"equalQuantity");
		            $('tr[name="locationId_'+id+'"]').find('font[name="equalTotalWeight_1"]').attr('name',"equalTotalWeight");
	            }
	            aaa();
	            
			}
			
		</script>
		<style type="text/css" title="currentStyle">
			#caption{margin: 5px;5px;10px;5px}
			#caption td{font-size: 14px;padding: 2px}
			
		</style>
	</head>
	<body style="margin: 0px">
		<div id="main" style="width: 100%;margin: 2px auto">
				
				<table width="250px" cellpadding="0" cellspacing="0" border="0" id="caption">
					<tr>     
						<td align="right">客户名称：</td> 
						<td align="left">${cargoVO.customerName}</td>
					</tr>
					<tr>     
						<td align="right">编号：</td> 
						<td align="left"> ${cargoVO.number}</td>
					</tr>
					<tr>     
						<td align="right">货物名称：</td> 
						<td align="left">${cargoVO.name}</td>
					</tr>
					<tr>     
						<td align="right">类型：</td> 
						<td align="left">${cargoVO.category}</td>
					</tr>
					<tr>     
						<td align="right">重量(kg)/单位：</td> 
						<td align="left">${cargoVO.weight}kg/${cargoVO.unit}</td>
					</tr>
					<tr>     
						<td align="right">重量(kg)/单位：</td> 
						<td align="left">
							<select style="width: 120px" onchange="changeLocationName(this.options[this.options.selectedIndex].value)">
					    		<option value="0">--全部--</option>
					    		<c:forEach var="location" items="${requestScope['listLocation']}" >
									<option value="${location.id }">${location.warehouseName }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
				</table>
				<table cellpadding="0" cellspacing="0" border="0" class="stockItems">
				
					<thead>
						<tr>                    
							<th class="row" width="80px">日期</th>
							<th class="row" width="75px">单号</th>
							<th class="row" width="70px" >入库数量</th>
							<th class="row" width="70px">入库重量</th>
							<th class="row" width="70px">出库数量</th>
							<th class="row" width="70px">出库重量</th>
							<th class="row" width="80px">平账数量</th>
							<th class="row" width="80px">平账重量</th>
							<th class="row" width="80px">结存数量</th>
							<th class="row" width="80px">结存重量</th>
							<th class="row" width="110px">储位</th>
						</tr>
					</thead>
					<c:forEach items="${requestScope['cargoItems.list']}" var="cargoItems">
			
						<tr name="locationId_${cargoItems.locationId}">
							<td class="row" align="center">
								<fmt:formatDate value="${cargoItems.time}" pattern="yyyy-MM-dd"/>
							</td>
							<td class="row" align="center">
								<c:out value="${cargoItems.serialNumber}" />
							</td>	
							<!--  
							<td>
								<c:choose> 
								  <c:when test="${cargoItems.inOut==1}"> 
								        <font style="color: #009966">入库</font>
								  </c:when> 
								  <c:when test="${cargoItems.inOut==0}"> 
								        <font style="color: #FF6600;float:right">出库</font>
								  </c:when> 
								</c:choose> 
								
							</td>
							-->
							<c:choose> 
								<c:when test="${cargoItems.inOut==1}"> 
									<td class="row" align="right" >
								  		<font name="inQuantity"  style="color: #009966;font-weight: bold;">
								    		<c:out value="${cargoItems.quantity}" />
								    	</font>
								  	</td>     
								  	<td class="row"  align="right" >
								  		<font name="inTotalWeight" style="color: #009966;font-weight: bold;">
								  			<c:out value="${cargoItems.totalWeight}" />
								  		</font>
								  	</td> 
									<td class="row" align="right">
									</td>
									<td class="row" align="right">
									</td>
									<td class="row" align="right">
									</td>
									<td class="row" align="right">
									</td>
							  </c:when> 
							  <c:when test="${cargoItems.inOut==0}"> 
								  <td class="row" align="right">
								  </td>
								  <td class="row" align="right">
								  </td>
								  <td class="row" align="right" >
								  	<font name="outQuantity" style="color: #FF6600;font-weight: bold;">
								    	<c:out value="${cargoItems.quantity}" />
								    </font>
								  </td>
								  <td class="row"  align="right" >
								  	<font name="outTotalWeight" style="color: #FF6600;font-weight: bold;">
										<c:out value="${cargoItems.totalWeight}" />
								  	</font>
								  </td>
								   <td class="row" align="right">
								  </td>
								  <td class="row" align="right">
								  </td>
							  </c:when> 
							  <c:when test="${cargoItems.inOut==3}"> 
								  <td class="row" align="right">
								  </td>
								  <td class="row" align="right">
								  </td>
								   <td class="row" align="right">
								  </td>
								  <td class="row" align="right">
								  </td>
								  <td class="row" align="right" >
								  	<font name="equalQuantity" style="color: #666666;font-weight: bold;">
								    	<c:out value="${cargoItems.quantity}" />
								    </font>
								  </td>
								  <td class="row" align="right" >
								  	<font name="equalTotalWeight" style="color: #666666;font-weight: bold;">
										<c:out value="${cargoItems.totalWeight}" />
								  	</font>
								  </td>
							  </c:when> 
							</c:choose> 
						 	<td class="row" align="right" >
								<font name="balanceQuantity" style="color: #000000;font-weight: bold;">
							    	
							    </font>
							</td>
							<td class="row"  align="right" >
							  	<font name="balanceWeight" style="color: #000000;font-weight: bold;">
									
							  	</font>
							</td>
							<td class="row" align="center" >
								<c:out value="${cargoItems.locationName}" />
								
							</td>  
							           
						</tr>      
					</c:forEach>
					<tfoot>
				
						<tr>
							<th colspan="2" align="right">合计</th>
							<th width="65px" style="font-family:Tahoma;font-size: 14px;color: #009966;font-weight: bold;" align="right" valign="top" id="wholeInQuantity">
								
							</th>
							<th width="75px" style="font-family: Tahoma;font-size: 14px;color: #009966;font-weight: bold;" align="right" valign="top" id="wholeInWeight">
								
							</th>
							<th width="65px" style="font-family: Tahoma;font-size: 14px;color: #FF6600;font-weight: bold;" align="right" valign="top" id="wholeOutQuantity">
								
							</th>
							<th width="75px" style="font-family: Tahoma;font-size: 14px;color: #FF6600;font-weight: bold;" align="right" valign="top" id="wholeOutWeight">
								
							</th>
							<th width="65px" style="font-family: Tahoma;font-size: 14px;color: #666666;font-weight: bold;" align="right" valign="top" id="wholeEqualQuantity">
								
							</th>
							<th width="75px" style="font-family: Tahoma;font-size: 14px;color: #666666;font-weight: bold;" align="right" valign="top" id="wholeEqualWeight">
								
							</th>
							
							
							<th>&nbsp;</th>
							<th>&nbsp;</th>
							<th>&nbsp;</th>
						</tr>
						<tr>
							<th colspan="8" align="right">结存</th>
							<th width="65px" style="font-family:Tahoma;font-size: 14px;color: #000000;font-weight: bold;" align="right" valign="top" id=totalBalanceQuantity>
								
							</th>
							<th width="75px" style="font-family: Tahoma;font-size: 14px;color: #000000;font-weight: bold;" align="right" valign="top" id="totalBalanceWeight">
								
							</th>
							
							<th>&nbsp;</th>
							
						</tr>
					</tfoot>
				</table>
			
			
			
		</div>
	</body>
</html>

