<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>每日出入库及结存量</title>
		
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
		<script language="javascript" type="text/javascript" src="plug-in/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="plug-in/autocomplete/jquery.autocomplete.js"></script>
		<link rel="stylesheet" type="text/css" href="plug-in/autocomplete/jquery.autocomplete.css" />
	
		
		<script type="text/javascript">
			//var customers = ${requestScope['customer.list']};
			var cargoes = ${requestScope['cargo.list']};
			$(function(){ 
			
			//$('input[name="customerName"]').focus().autocomplete(customers, {
		
			//	formatItem: function(row, i, max) {
			//		return i + "/" + max + ": \"" + row.name + "\" [" + row.id + "]";
			//	},
			//	formatMatch: function(row, i, max) {
			//		return row.name + " " + row.id;
			//	},
			//	formatResult: function(row) {
					
			//		return row.name;
			//	}

			//});
			//$('input[name="customerName"]').result(function(event,data,formatted) {
			
			//	$('input[name="customerId"]').val(data.id);
				
			//});
			
			$('input[name="cargoName"]').focus().autocomplete(cargoes, {
		
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
			$('input[name="cargoName"]').result(function(event,data,formatted) {
			
				$('input[name="cargoId"]').val(data.id);
				
			});
			
			
			 var totalWeightIn = 0;
			 var totalWeightOut = 0;
			 var totalWeightAccumulate = 0;
			 var avgWeightAccumulate = 0;
			 var i = ${fn:length(list)};
			 $(".weightIn").each(function() {
    	        var thisValue = $(this).text();
		        if (thisValue != '') {
		            totalWeightIn += parseFloat(thisValue);
		        };
		     });
	         $(".weightOut").each(function() {
    	        var thisValue = $(this).text();
			 	if (thisValue != '') {
			    	totalWeightOut += parseFloat(thisValue);
			        
			    };
			 });
			 $(".weightAccumulate").each(function() {
    	        var thisValue = $(this).text();
			 	if (thisValue != '') {
			    	totalWeightAccumulate += parseFloat(thisValue);
			        
			    };
			 });
			 $(".totalWeightIn").text(totalWeightIn.toFixed(1));
			 $(".totalWeightOut").text(totalWeightOut.toFixed(1));
			 $(".totalWeightAccumulate").text(totalWeightAccumulate.toFixed(1));
			 $(".avgWeightAccumulate").text((totalWeightAccumulate/i).toFixed(1));
			}) 
			
			//function changeDisplay(){   
			 	
            //	var helloDivObj = $("#form_stylized");   
            //  var helloDivObj = $("#form_stylized").toggle(); 
                
            //}
           
            function query(type){   
				
				var bDate = $('input[name="bDate"]').val();
				var eDate = $('input[name="eDate"]').val();	
				var locationId = $('select[name="locationId"]').val();
				var categoryId = $('select[name="categoryId"]').val();
				var customerId = $('select[name="customerId"]').val();
				//alert(customerId);
				var cargoId = $('input[name="cargoId"]').val();
				//alert(bDate + eDate + locationId + categoryId + customerId); 
            	if(type == 'chart' || type == 'sumChart'){
            		window.open("stockAnalyze.do?method=query&type="+type+"&bDate="+bDate+"&eDate="+eDate+"&locationId="+locationId+"&categoryId="+categoryId+"&customerId="+customerId+"&cargoId="+cargoId,"");
				
            	}
            	else if(type == 'countChart'){
            		
            		window.open("stockAnalyze.do?method=query&type="+type+"&bDate="+bDate+"&eDate="+eDate+"&locationId="+locationId+"&categoryId="+categoryId+"&customerId="+customerId+"&cargoId="+cargoId,"");
				
            	}
            	else{
            		location.href="stockAnalyze.do?method=query&type="+type+"&bDate="+bDate+"&eDate="+eDate+"&locationId="+locationId+"&categoryId="+categoryId+"&customerId="+customerId+"&cargoId="+cargoId;   
            	
            	}
            	
            	
            	
            }
		</script>

	</head>
	<body >
		<div id="main">
		<jsp:include page="common/top.jsp" flush="true" />
		<html:form action="/stockWarehouse">
		<div >
			<div class="w936" > 
			    <div id="tb_" class="tb_"> 
		            <ul id="nav"> 
		            	<li style="width:180px;text-align: left;font-size: 14px;font-weight: bold;padding-top: 3px">每日出入库及结存量</li> 
		               <!-- 
		                <li style="margin-right: 50px" >
						
							<div id="sddm">
								<a class="function" href="#"  onclick="changeDisplay()">更多查询方式</a>
							</div>
						
						</li> 
					   --> 
		               <!-- 
		                <li id="tb_1" class="hovertab" onmouseover="xgz:HoverLi(1);">近一个月记录</li> 
		                <li id="tb_2" class="normaltab" onmouseover="xgz:HoverLi(2);">近三个月记录</li> 
		                --> 
		            </ul> 
		           
			    </div>
			    <div id="form_stylized"  class="myform" style="width: 100%;background-color: #F9F9F9;border-bottom: 1px solid #CCCCCC;margin-bottom: 5px">
			    	
			    	<div style="font-size: 14px;font-weight: bold;margin: 10px 5px 5px 65px">查询</div>
			    	<label>起止日期</label><input name="bDate" class="Wdate" onclick="WdatePicker()" style="width: 100px" value="${requestScope['bDate']}"/>
			    							<font style="vertical-align: middle;padding-left: 7px">至</font><input name="eDate" class="Wdate" onclick="WdatePicker()" style="width: 100px" value="${requestScope['eDate']}"/><br />
			    	<label>库房</label>
			    	<select name="locationId" >
						<option value="">--全部--</option>
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
					</select><br />
			    	<label>货物类型</label>
			    	<select id="category" name="categoryId" >
			    		<option value="">--全部--</option>
						<c:forEach var="sys" items="${requestScope['category.list']}" >
							<option value="${sys.codeKey }">${sys.codeValue }</option>
						</c:forEach>
					</select><br/>
			    	<label>客户</label>
						<!-- 
						<input name="customerName" onmouseover="mopen('customer')" onmouseout="mclosetime()" value="${requestScope['customerName']}" />
						<input type="hidden" name="customerId" value="${requestScope['customerId']}"/><br/>
					 	-->
					 	 <select name="customerId" >
				    		<option value="">--全部--</option>
				    		<option value="227,388,390">第五肉联厂合计</option>
							<c:forEach var="customer" items="${requestScope['customer.list']}" >
							<c:choose>
								<c:when test="${customerId==customer.id}">
									<option selected="selected"  value="${customer.id }">${customer.name }</option>
								</c:when>
								<c:otherwise>
									<option value="${customer.id }">${customer.name }</option>
								</c:otherwise>
							</c:choose>
							</c:forEach>
						</select><br/>
					<label>货物名称</label>
						<input name="cargoName" onmouseover="mopen('cargo')" onmouseout="mclosetime()" />
						<input type="hidden" name="cargoId"/><br/>	
					<div style="padding-left: 155px">
						<input style="width:105px;background-color: D4D0C8;border: 1px solid #666;padding-top: 4px;font-size: 12px" type="button" onclick="query('table')" value="查询"/>
						<input style="width:105px;background-color: D4D0C8;border: 1px solid #666;padding-top: 4px;font-size: 12px" type="button" onclick="query('chart')" value="出入库量图"/>
						<input style="width:105px;background-color: D4D0C8;border: 1px solid #666;padding-top: 4px;font-size: 12px" type="button" onclick="query('sumChart')" value="出入库累计图"/>
						<input style="width:105px;background-color: D4D0C8;border: 1px solid #666;padding-top: 4px;font-size: 12px" type="button" onclick="query('countChart')" value="出入库业务数量图"/>
					
					</div>			  					
			    </div>
		                
			</div>
			
			<div >
		
				<table style="width: 600px" cellpadding="0" cellspacing="0" border="1" class="stockItems" >
				
					<thead>
						<tr>
							<th width="120px" align="center">日期</th>
							<th>入库量(kg)</th> 
							<th>出库量(kg)</th>
							<th>结存量(kg)</th>
							
							
						</tr>
					</thead>
						
					<c:forEach items="${requestScope['list']}" var="object">
					
						<tr >						
			
							<td align="center">
								<fmt:formatDate value="${object[0]}"  pattern= 'yyyy-MM-dd' />
							</td>	
							
							<td class="weightIn" align="right">
								<c:if test="${object[4]!=-0.0}">
									<c:out value="${object[4]}" />
								</c:if>	
							</td>
							<td  class="weightOut"  align="right">
								<c:if test="${object[3]*-1!=0}">
									<c:out value="${object[3]*-1}" />
								</c:if>	
							</td>
							<td  class="weightAccumulate"  align="right">
								<c:out value="${object[5]}" />
							</td>	
							
						</tr>      
					</c:forEach>
					
						<tr class="parent" >						
			
							<td align="center">
								平账
							</td>	
							
							<td >
								
							</td>
							<td  >
								
							</td>
							<td  class="weightAccumulate"  align="right">
								${equal}
							</td>	
							
						</tr>   
					
						<tr class="parent" id="row_${stockWarehouse.id}">						
			
							<td align="center">
								合计
							</td>	
							
							<td class="totalWeightIn" align="right">
								
							</td>
							<td  class="totalWeightOut"  align="right">
								
							</td>
							<td  class="totalWeightAccumulate"  align="right">
								
							</td>	
							
						</tr>   
						
						
						
						<tr class="parent" id="row_${stockWarehouse.id}">						
			
							<td align="center">
								平均日库存			
							</td>	
							
							<td align="right">
								
							</td>
							<td align="right">
								
							</td>
							<td class="avgWeightAccumulate" align="right">
								
							</td>	
							
						</tr>   
				</table>
			</div>
			</div>
			
		</html:form>
			
		</div>
	</body>
</html>

