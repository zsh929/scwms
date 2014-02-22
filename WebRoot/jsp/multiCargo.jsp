<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>出入库及结存量</title>
		
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
			
			a.filter{border:1px solid #0188CC;padding:5px 5px 2px 5px;text-decoration:none;font-size: 12px}
			a.filter:hover{border:1px solid #0188CC;padding:5px 5px 2px 5px;text-decoration:underline;background-color: #CBE9F1;font-size: 12px}
			a.filter1{border:1px solid #0188CC;padding:5px 5px 2px 5px;text-decoration:none;background-color: #0188CC;color:#ffffff;font-size: 12px}
			table.stockItems thead th {
	
				padding: 8px 18px 5px 10px;
				border-bottom: 1px solid #D2D2D2;
				border-top: 1px solid #D2D2D2;
				cursor: pointer;
				* cursor: hand;
				background-color: #F5F5F5;
				font-size: 12px;
				font-weight:normal;
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
	
			
            
            var customers = ${requestScope['customer.list']};
			
			$(function(){ 
				var checkedTags = "${requestScope['checkedTags']}";
				checkedTags = checkedTags.split("-");
				
				$("input[name='tags']").each(function() {
					for(i = 0;i <checkedTags.length;i++){
						if($(this).attr("id")==checkedTags[i]){
					    	$(this).attr("checked",true);
					   	};
					}
				 });
			   
			   // $("input[@type=isAll]").attr("checked",${requestScope['isAll']});
				
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
				$("#checkall").click(function(){ 
					if(this.checked){ 
						$("input[name='checkname']").each(function(){
							if($(this).parent().parent().css('display') != 'none'){
								this.checked=true;
							}
						}); 
					}else{ 
						$("input[name='checkname']").each(function(){this.checked=false;}); 
					} 
				});
			$(".checkBox").click(function(){
				var	totalInQuantity = 0;
				var	totalInWeight = 0;
				var	totalOutQuantity = 0;
				var	totalOutWeight = 0;
				var	totalBalanceQuantity = 0;
				var	totalBalanceWeight = 0;
			
				 $(".inQuantity").each(function() {
		   	        var thisValue = $(this).text();
		   	        if (thisValue != '' && $(this).parent().parent().find(".checkBox").attr("checked")) {
			            totalInQuantity += parseFloat(thisValue);
			            
			        };
			     });
			    
		         $(".inWeight").each(function() {
		   	        var thisValue = $(this).text();
				 	if (thisValue != '' && $(this).parent().parent().find(".checkBox").attr("checked")) {
				    	totalInWeight += parseFloat(thisValue);
				        
				    };
				 });
				 $(".outQuantity").each(function() {
		   	        var thisValue = $(this).text();
				 	if (thisValue != '' && $(this).parent().parent().find(".checkBox").attr("checked")) {
				    	totalOutQuantity += parseFloat(thisValue);
				        
				    };
				 });
				 $(".outWeight").each(function() {
		   	        var thisValue = $(this).text();
				 	if (thisValue != '' && $(this).parent().parent().find(".checkBox").attr("checked")) {
				    	totalOutWeight += parseFloat(thisValue);
				        
				    };
				 });
				  $(".balanceQuantity").each(function() {
		   	        var thisValue = $(this).text();
				 	if (thisValue != '' && $(this).parent().parent().find(".checkBox").attr("checked")) {
				    	totalBalanceQuantity += parseFloat(thisValue);
				        
				    };
				 });
				  $(".balanceWeight").each(function() {
		   	        var thisValue = $(this).text();
				 	if (thisValue != '' && $(this).parent().parent().find(".checkBox").attr("checked")) {
				    	totalBalanceWeight += parseFloat(thisValue);
				        
				    };
				 });
			 
			 	 
				 $(".totalInQuantity").text(totalInQuantity.toFixed(1));
				 $(".totalInWeight").text(totalInWeight.toFixed(1));
				 $(".totalOutQuantity").text(totalOutQuantity.toFixed(1));
				 $(".totalOutWeight").text(totalOutWeight.toFixed(1));
				 $(".totalBalanceQuantity").text(totalBalanceQuantity.toFixed(1));
				 $(".totalBalanceWeight").text(totalBalanceWeight.toFixed(1));
				});
			
				$('a[name="filter"]').click(function(){
					$(this).attr("class","filter1").siblings().attr("class","filter");
			
			
				});
				
				balanceWeightIsNotNull();
			
			}) ;
			
           
           
           function balanceWeightIsNotNull(){
            	allItems();
	            $('font[class="balanceWeight"]').each(function(){
				   
					var balanceWeight = $(this).html();
					
				    balanceWeight = parseFloat(balanceWeight);    
				    var balanceQuantity = $(this).parent().parent().find('font[class="balanceQuantity"]').html();
				    
				    balanceQuantity = parseFloat(balanceQuantity);    
				   
				    if(balanceWeight == 0 && balanceQuantity == 0){
				    	
				    	$(this).parent().parent().hide();
				    }
					                
				 });
            };
            
            function isNull(i){
            	if(i.length == 0){
            		return 0;
            	
            	}
            	return i;
            
            }
           
             function inOutBalanceWeightIsNotNull(){
            	allItems();
	            $('font[class="balanceWeight"]').each(function(){
				   
					var balanceWeight = $(this).html();
					
					balanceWeight = isNull(balanceWeight);
				    balanceWeight = parseFloat(balanceWeight);    
				    var balanceQuantity = $(this).parent().parent().find('font[class="balanceQuantity"]').html();
				    balanceQuantity = isNull(balanceQuantity);
				    
				    var inQuantity = $(this).parent().parent().find('font[class="inQuantity"]').html();
				    inQuantity = isNull(inQuantity);
				   
				    
				    var inWeight = $(this).parent().parent().find('font[class="inWeight"]').html();
				    inWeight = isNull(inWeight);
				    
				    var outQuantity = $(this).parent().parent().find('font[class="outQuantity"]').html();
				    outQuantity = isNull(outQuantity);
				    
				    var outWeight = $(this).parent().parent().find('font[class="outWeight"]').html();
				    outWeight = isNull(outWeight);
				    
				    balanceQuantity = parseFloat(balanceQuantity);
				    inQuantity = parseFloat(inQuantity);    
				    inWeight = parseFloat(inWeight);    
				    outQuantity = parseFloat(outQuantity);    
				    outWeight = parseFloat(outWeight);        
				     
				    if(balanceWeight == 0 && balanceQuantity == 0 && inQuantity == 0 && inWeight == 0 && outQuantity == 0 && outWeight == 0){
				    	$(this).parent().parent().hide();
				    }	
				                    
				 });
            }
           
            function allItems(){
           		
           		$('font[class="balanceWeight"]').each(function(){
           			
           			$(this).parent().parent().show();
           	
           		});
           	}
           
            function query(){   
				
				var bDate = $('input[name="bDate"]').val();
				var eDate = $('input[name="eDate"]').val();	
				var customerId = $('input[name="customerId"]').val();
				var tagsIdParameter = "";
				var isAllParameter = "";
				if($("input[name='tags']").length>0){
					var tagsId = "0";
					$("input[name='tags']").each(function(){
					   if($(this).attr("checked")==true){
					    tagsId += "-"+$(this).attr("value");
					   }
					})
					tagsIdParameter = "&tagsId="+tagsId;
				}
				
				isAllParameter = "&isAll="+$('input[@name=isAll][@checked]').val();
				
				location.href="stockAnalyze.do?method=multiCargo&customerId="+customerId+"&bDate="+bDate+"&eDate="+eDate+tagsIdParameter+isAllParameter;   
            
            
            }
            
           
            
            
            
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
		            	<li style="text-align: left;font-size: 14px;font-weight: bold;padding-top: 3px">出入库及结存量</li> 
		               
		            </ul> 
		            
			    </div> 
			    <div id="form_stylized"  class="myform" style="width: 100%;background-color: #F9F9F9;border-bottom: 1px solid #CCCCCC;margin-bottom: 5px">
			    	
			    	<div style="font-size: 14px;font-weight: bold;margin: 10px 5px 5px 65px">查询</div>
			    	<label>起止日期</label><input name="bDate" class="Wdate" onclick="WdatePicker()" style="width: 100px" value="${requestScope['bDate']}"/>
			    							<font style="vertical-align: middle;padding-left: 7px">至</font><input name="eDate" class="Wdate" onclick="WdatePicker()" style="width: 100px"  value="${requestScope['eDate']}"/><br />
			    	
			    	<label>客户</label>
						<input name="customerName" onmouseover="mopen('customer')" onmouseout="mclosetime()"  value="${requestScope['customerName']}"/>
						<input type="hidden" name="customerId"  value="${requestScope['customerId']}"/><br/>
					
					
					<div style="padding-left: 155px;">
						<input style="width:50px;background-color: D4D0C8;border: 1px solid #666;padding-top: 4px;font-size: 12px" type="button" onclick="query()" value="查询"/>
						
					</div>	
					
					<div style="display: none;">
					<label>全部记录</label>
					
						<input style="width: 15px;border: 0px;float: left"  name="isAll" type="radio" value="1" checked/>
						<label style="width: 50px;border: 0px;text-align: left" for="all">是</label>
						<input id="part" style="width: 15px;border: 0px;float: left"  name="isAll" type="radio" value="0"/>
						<label style="width: 50px;border: 0px;text-align: left;float: none" for="part">否</label><br/>
					</div>	
					<c:if test="${not empty(list)}">
						<div style="padding: 10px;border-top: 1px solid #bbbbbb">
							<a name="filter" class="filter" onclick="allItems()" href="#">全部记录</a>
							
							<a name="filter" class="filter1" onclick="balanceWeightIsNotNull()" href="#">只显示库存不为零的记录</a>
							
							<a name="filter" class="filter"  onclick="inOutBalanceWeightIsNotNull()" href="#">只显示出入库及库存均不为零的记录</a>
						</div>
					</c:if>
					
					<c:if test="${not empty(tags)}">
						<label>分类</label>
						<c:forEach items="${requestScope['tags']}" var="tags">
							<div >
								<input style="width: 15px;border: 0px;float: left" name="tags" id="${tags[0]}" type="checkbox"  value="${tags[0]}" />
								<label style="width: 50px;border: 0px;text-align: left" for="${tags[0]}">${tags[1]}</label>
							</div>
						</c:forEach>
						<br/>
					</c:if>
							  					
			    </div>
			</div>
			
			<div >
		
				<table cellpadding="0" cellspacing="0" border="0" class="stockItems">
				
					<thead>
						<tr>
							<th width="25px">序号</th>
							<th width="25px">选择</th>
							<th>货物编码</th>
							<th>货物名称</th>
							<th>入库数量</th>
							<th>入库重量</th>
							<th>出库数量</th>
							<th>出库重量</th>
							<th>库存数量</th>
							<th>库存重量</th>
							
						</tr>
					</thead>
					<c:forEach items="${requestScope['list']}" var="monthTotalVO" varStatus="status">
			
						<tr>	
							<td width="25px" align="center" >
								${status.count} 
								
							</td>	
							<td width="25px" align="center" >
								<input class="checkBox" type="checkbox" name="checkname"/>
								
							</td>					
							<td width="80px" align="right">
								<c:out value="${monthTotalVO.number}" />
								
							</td>
							<td width="180px" align="right">
								<a href="#" onclick="openBox(${monthTotalVO.cargoId},'${monthTotalVO.cargoName}');return false;" >
									<c:out value="${monthTotalVO.cargoName}" />
									(<c:out value="${monthTotalVO.weight}" />kg)
								</a>
							</td>	
						
							<td  align="right">
								<font class="inQuantity" style="color: #009966;font-weight: bold;">
									<c:out value="${monthTotalVO.inQuantity}" />
								</font>	
							</td>
							<td align="right">
								<font class="inWeight" style="color: #009966;font-weight: bold;">
									<c:out value="${monthTotalVO.inWeight}" />
								</font>
							</td>
							<td align="right">
							 	<font class="outQuantity" style="color: #FF6600;font-weight: bold;">
									<c:out value="${monthTotalVO.outQuantity}" />
								</font>	
							</td>
							
							<td align="right">
							 	<font class="outWeight" style="color: #FF6600;font-weight: bold;">
									<c:out value="${monthTotalVO.outWeight}" />
								</font>	
							</td>
							<td align="right">
								<font class="balanceQuantity" style="color: #000000;font-weight: bold;">
									<c:out value="${monthTotalVO.balanceQuantity}" />
								</font>
							</td>
							<td align="right">
								<font class="balanceWeight" style="color: #000000;font-weight: bold;">
									<c:out value="${monthTotalVO.balanceWeight}" />
								</font>	
							</td>
							
						</tr>      
					</c:forEach>
					<tr class="parent">						
							<td>
								
							</td>
							<td align="center" width="25px">
								<input id="checkall" class="checkBox" type="checkbox"/>
							</td>	
							<td align="right" colspan="2"  style="color: #000000;font-weight: bold;">
								合计
							</td>	
							<td class="totalInQuantity" align="right" style="color: #000000;font-weight: bold;">
								
							</td>
							<td class="totalInWeight" align="right" style="color: #000000;font-weight: bold;">
								
							</td>
							<td  class="totalOutQuantity"  align="right" style="color: #000000;font-weight: bold;">
								
							</td>
							<td class="totalOutWeight" align="right" style="color: #000000;font-weight: bold;">
								
							</td>
							<td  class="totalBalanceQuantity"  align="right" style="color: #000000;font-weight: bold;">
								
							</td>	
							<td  class="totalBalanceWeight"  align="right" style="color: #000000;font-weight: bold;">
								
							</td>
							
						</tr>   
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

