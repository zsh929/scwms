<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>收费标准设置</title>
		
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
		
			#float{height: 25px;position: relative;top:0px;}
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
		<script type="text/javascript" src="plug-in/cookie/jquery.cookie.js"></script>
		<link rel="stylesheet" type="text/css" href="plug-in/autocomplete/jquery.autocomplete.css" />
		
		<script type="text/javascript">
	
			
            
            //var customers = ${requestScope['customer.list']};
			
			$(function(){
			 
			 	
				 
			 	
				//var checkedTags = "${requestScope['checkedTags']}";
				//checkedTags = checkedTags.split("-");
				
				//$("input[name='tags']").each(function() {
				//	for(i = 0;i <checkedTags.length;i++){
				//		if($(this).attr("id")==checkedTags[i]){
				//	    	$(this).attr("checked",true);
				//	   	};
				//	}
				//});
			   
			   // $("input[@type=isAll]").attr("checked",${requestScope['isAll']});
				
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
				//$("#checkall").click(function(){ 
				//	if(this.checked){ 
				//		$("input[name='checkname']").each(function(){
				//			if($(this).parent().parent().css('display') != 'none'){
				//				this.checked=true;
				//			}
				//		}); 
				//	}else{ 
				//		$("input[name='checkname']").each(function(){this.checked=false;}); 
				//	} 
				//});
			//$(".checkBox").click(function(){
			//	var	totalInQuantity = 0;
			//	var	totalInWeight = 0;
			//	var	totalOutQuantity = 0;
			//	var	totalOutWeight = 0;
			//	var	totalBalanceQuantity = 0;
			//	var	totalBalanceWeight = 0;
			
			//	 $(".inQuantity").each(function() {
		   	//        var thisValue = $(this).text();
		   	//        if (thisValue != '' && $(this).parent().parent().find(".checkBox").attr("checked")) {
			//            totalInQuantity += parseFloat(thisValue);
			            
			//        };
			//     });
			    
		    //     $(".inWeight").each(function() {
		   	//        var thisValue = $(this).text();
			//	 	if (thisValue != '' && $(this).parent().parent().find(".checkBox").attr("checked")) {
			//	    	totalInWeight += parseFloat(thisValue);
				        
			//	    };
			//	 });
			//	 $(".outQuantity").each(function() {
		   	//        var thisValue = $(this).text();
			//	 	if (thisValue != '' && $(this).parent().parent().find(".checkBox").attr("checked")) {
			//	    	totalOutQuantity += parseFloat(thisValue);
				        
			//	    };
			//	 });
			//	 $(".outWeight").each(function() {
		   	//        var thisValue = $(this).text();
			//	 	if (thisValue != '' && $(this).parent().parent().find(".checkBox").attr("checked")) {
			//	    	totalOutWeight += parseFloat(thisValue);
				        
			//	    };
			//	 });
			//	  $(".balanceQuantity").each(function() {
		   	//        var thisValue = $(this).text();
			//	 	if (thisValue != '' && $(this).parent().parent().find(".checkBox").attr("checked")) {
			//	    	totalBalanceQuantity += parseFloat(thisValue);
				        
			//	    };
			//	 });
			//	  $(".balanceWeight").each(function() {
		   	//        var thisValue = $(this).text();
			//	 	if (thisValue != '' && $(this).parent().parent().find(".checkBox").attr("checked")) {
			//	    	totalBalanceWeight += parseFloat(thisValue);
				        
			//	    };
			//	 });
			 
			 	 
			//	 $(".totalInQuantity").text(totalInQuantity.toFixed(1));
			//	 $(".totalInWeight").text(totalInWeight.toFixed(1));
			//	 $(".totalOutQuantity").text(totalOutQuantity.toFixed(1));
			//	 $(".totalOutWeight").text(totalOutWeight.toFixed(1));
			//	 $(".totalBalanceQuantity").text(totalBalanceQuantity.toFixed(1));
			//	 $(".totalBalanceWeight").text(totalBalanceWeight.toFixed(1));
			//	});
			
			//	$('a[name="filter"]').click(function(){
			//		$(this).attr("class","filter1").siblings().attr("class","filter");
			
			
			//	});
				
			//	balanceWeightIsNotNull();
				$("#checkboxAll").click(function(){ 
					if(this.checked){ 
						$("input[name='checkboxCustomerId']").each(function(){
							this.checked=true;
							
						}); 
					}else{ 
						$("input[name='checkboxCustomerId']").each(function(){
							this.checked=false;
						}); 
					} 
				});
			
			
			
				$(window).scroll(function (){
					var offsetTop = $(window).scrollTop();
					if(offsetTop > 215){
						
						offsetTop = (offsetTop - 215) + "px";
					
					}else{
					
						offsetTop = 0 + "px";
					}
					$("#float").animate({top:offsetTop },{duration:500,queue:false});
				}); 
				 
				
			
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
				
				var customerName = $("#customerName").val();
				
				location.href="charge.do?method=query&customerName="+customerName;   
            
            }
            
            function batchSetup(){
            	
            	var customerId = "";
            	
            	$('input[name="checkboxCustomerId"]').each(function(){
   					if($(this).attr("checked")==true){
  						customerId = customerId + $(this).val() + ",";
            		}                
  				});
            	
            	openBox("",customerId,"batch");
            }
            
            var position = $.cookie('position');
            $("html,body").animate({ scrollTop : position }, 1);
		</script>

	</head>
	<body >
		<div id="main">
		<jsp:include page="common/top.jsp" flush="true" />
		<html:form action="/charge">
		<div >
			<div class="w936" > 
			    <div id="tb_" class="tb_"> 
		            <ul id="nav"> 
		            	<li style="text-align: left;font-size: 14px;font-weight: bold;padding-top: 3px">收费标准设置</li> 
		               
		            </ul> 
		            
			    </div> 
			    <div id="form_stylized"  class="myform" style="width: 100%;background-color: #F9F9F9;border-bottom: 1px solid #CCCCCC;margin-bottom: 5px">
			    	
			    	<div style="font-size: 14px;font-weight: bold;margin: 10px 5px 5px 65px">查询</div>
			    	
			    	<label>客户</label>
						<input id="customerName" name="customerName" value="${requestScope['customerName']}"/>
											
					<div style="padding-left: 155px;">
						<input style="width:50px;background-color: D4D0C8;border: 1px solid #666;padding-top: 4px;font-size: 12px" type="button" onclick="query()" value="查询"/>
						
					</div>	
							  					
			    </div>
			</div>
			
			<div >
				<table cellpadding="0" cellspacing="0" border="0" class="stockItems" style="margin:0px 0px 5px 0px">				
					<thead>
						<tr>			
							<th align="left" width="50px"><label><input type="checkbox" id="checkboxAll" style="vertical-align: text-bottom;margin-bottom:-2px"/>全选</label></th>
							<th align="left"><a href="" onclick="batchSetup();return false;">批量设置</a></th>
							
						</tr>
					</thead>
				</table>	
				
				<table cellpadding="0" cellspacing="0" border="0" class="stockItems" id="float">
				
					<thead>
						<tr>
							
							<th width="200px">收费类型</th>
							<th width="120px">收费标准</th>
							<th width="120px">总额</th>
							<th width="150px">计费日期</th>
							<th width="80px">生效日期</th>
							<th width="80px">终止日期</th>
							<th width="150px">操作</th>
						</tr>
					</thead>
				</table>	
				
				<c:set var="customerId" scope="request"/> 
				
				<c:forEach items="${requestScope['charge.list']}" var="charge" varStatus="status">
					
					
					<c:if test="${customerId != charge.customerId && status.first}">
					<table cellpadding="0" cellspacing="0" border="0" class="stockItems" style="margin:5px 0px 5px 0px">
						
						
						<tr>
							<td width="180px" align="left" colspan="6" style="background-color:#F3F3F3;border-top: 1px solid #D2D2D2;font-weight:bolder">
								<input type="checkbox" name="checkboxCustomerId" value="${charge.customerId}" style="margin:0px 2px 0px 0px"/><c:out value="${charge.customerName}" />
								
							</td>
							<td width="150px" align="right" style="background-color:#F3F3F3;border-top: 1px solid #D2D2D2">
								<a target="blank" href="chargeDetail.do?method=query&customerId=${charge.customerId}" >收费</a>
								<a href="" onclick="openBox('',${charge.customerId},'');return false;">新增收费项目</a>
							</td>
						</tr>
						
						<c:set var="customerId" value="${charge.customerId}" scope="request"/>
					
					</c:if>
					<c:if test="${customerId != charge.customerId && !status.first}">
					</table>
					<table cellpadding="0" cellspacing="0" border="0" class="stockItems" style="margin:5px 0px 5px 0px">
						
						
						<tr>
							<td width="180px" align="left" colspan="6" style="background-color:#F3F3F3;border-top: 1px solid #D2D2D2;font-weight:bolder">
								<input type="checkbox" name="checkboxCustomerId" value="${charge.customerId}" style="margin:0px 2px 0px 0px"/><c:out value="${charge.customerName}" />
							</td>
							<td width="150px" align="right" style="background-color:#F3F3F3;border-top: 1px solid #D2D2D2">
								<a target="blank" href="chargeDetail.do?method=query&customerId=${charge.customerId}" >收费</a>
								<a href="" onclick="openBox('',${charge.customerId},'');return false;">新增收费项目</a>
							</td>
						</tr>
						
						<c:set var="customerId" value="${charge.customerId}" scope="request"/>
					
					</c:if>
					<c:if test="${!empty charge.typeName || !empty charge.warehouseName || !empty charge.area || !empty charge.description || !empty charge.categoryName}">
						<tr>	
							
							<td width="200px" align="center">
								<c:out value="${charge.typeName}" />
								<c:if test="${!empty charge.warehouseName}">
									
									<c:out value="${charge.warehouseName}" />
									(<c:out value="${charge.area}" />㎡)
									
								</c:if>
								<c:out value="${charge.description}" />
								<c:out value="${charge.categoryName}" />
								
							</td>					
							
							<td width="120px" align="right">
								<c:out value="${charge.unitPrice}" />
								<c:out value="${charge.unitName}" />
							</td>	
							<td width="120px" align="right">
								<c:if test="${!empty charge.totalPrice}">
									<c:out value="${charge.totalPrice}" />
									元
								</c:if>
							</td>	
							<td width="150px" align="right">
								<c:if test="${!empty charge.chargeDate1}">
								每月
								<c:out value="${charge.chargeDate1}" />
								日
								</c:if>
								<c:if test="${!empty charge.chargeDate2}">
								、每月
									<c:out value="${charge.chargeDate2}" />
								日	
								</c:if>
								<c:if test="${empty charge.chargeDate1 && empty charge.chargeDate2}">
									<fmt:formatDate value="${charge.effectiveDate}" pattern="yyyy-MM-dd"/>
								</c:if>
							</td>
							<td width="80px" align="right">
								<c:if test="${!empty charge.chargeDate1}">
									<fmt:formatDate value="${charge.effectiveDate}" pattern="yyyy-MM-dd"/>
								</c:if>
							</td>
							<td width="80px" align="right">
								<c:if test="${!empty charge.chargeDate1}">
									<fmt:formatDate value="${charge.expiryDate}" pattern="yyyy-MM-dd"/>
								</c:if>
							</td>
							
							<td width="150px" align="right">
							 	<a href="#" onclick="openBox(${charge.id},${charge.customerId},'');return false;" >
									编辑
								</a>&nbsp;
								<a href="#" id="${charge.customerId}_${charge.id}"  onclick="del(${charge.customerId},${charge.id});return false;">
									删除
				 				</a>
							</td>
							
							
							
						</tr>
					 </c:if>
				<c:if test="${status.last}">
					</table>
				</c:if>			    
				
				</c:forEach>
					
				
			</div>
			</div>
			
		</html:form>
			<script type="text/javascript">
				function openBox(id,customerId,type){
					
					var position = $("html,body").scrollTop();
					$.cookie('position', position);
					$.weeboxs.open('charge.do?method=initChargeEdit&id='+id+'&customerId='+customerId+'&type='+type+'&source=charge&position='+position, {title:'新建收费项目', 
																					 contentType:'ajax',
																					 onok:function(){
																						chargeEdit.submit();														
																				
																					 	}
																					});
					
				};
				
				function del(customerId,chargeId){
					
					if(confirm("确认删除?")){
	          		    var jsonStr="({"; 
					    jsonStr=jsonStr + "\"customerId\":\"" + customerId + "\","; 
						jsonStr=jsonStr + "\"chargeId\":\"" + chargeId; 
						
	    				jsonStr= jsonStr + "\"})"; 
	    				$.ajax({  
						   type: "post",  
						   url: "charge.do?method=delete",  
						   data:eval(jsonStr), 
						   dataType:'text',
						   contentType: "application/x-www-form-urlencoded;charset=utf-8", 
						   cache: false,  
						   success: function(msg){ 
						   	 
						     alert("删除成功！");
						     
						     var id = "#" + customerId + "_" + chargeId;
						     
						     $(id).parent().parent().remove();
						     
						   }  
						   
					   });  
				   
				   } 

				
			
				}
				
			</script>
			
		</div>
	</body>
</html>

