<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>储存费</title>
		
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
		<script type="text/javascript" src="plug-in/dynamicorderform/js/charge.js"></script>
		<script type="text/javascript" src="plug-in/weebox/bgiframe.js"></script>
		<script type="text/javascript" src="plug-in/weebox/weebox.js"></script>
		
		<script type="text/javascript" src="plug-in/monthlycalendar/dropdownmenu.js"></script>
		<link type="text/css" rel="stylesheet" href="plug-in/monthlycalendar/css/default.css" />
	
		<script type="text/javascript">
		
			$().ready(function() {
				var stockRecordList = ${requestScope['stockRecordListJson']};	
					
				
				
				for(var p in stockRecordList){ 
					var stockRecord = stockRecordList[p];
					var ida = stockRecord.id+"_"+stockRecord.cargoId;
					var v =stockRecord.totalWeight;
					//$("[id^=id]").text(v);
					$("td[id^="+ida+"]").text(v);
				//	$('#'+id).text(v);
				} 
				
		       
		        $(".inWeight").each(function(){
			        var b = $(this).parent().find(".weight");
			        var inWeight = 0;
			        b.each(function(){
			        	var valString = $(this).text() || 0;
        
       					 inWeight += parseInt(valString);
			        
			        });
					$(this).text(inWeight);
					
		        });  
		       
    			$(".outWeight").each(function(){
			        var b = $(this).parent().find(".weight");
			        var outWeight = 0;
			        b.each(function(){
			        	var valString = $(this).text() || 0;
        
       					 outWeight += parseInt(valString);
			        
			        });
					$(this).text(outWeight);
					
		        }); 
		        
		        
		        $(".totalInWeight").each(function(){
			        var b = $(this).parent().parent().parent().parent().find(".inWeight");
			        var totalInWeight = 0;
			        b.each(function(){
			        	var valString = $(this).text() || 0;
        
       					 totalInWeight += parseInt(valString);
			        
			        });
					$(this).text(totalInWeight/1000);
					
		        }); 
		        
		        
		        $(".c1_0").each(function(){
			        var b = $(this).parent().parent().parent().parent().parent().find("td[id$=0_1]");
			        var totalWeight = 0;
			        b.each(function(){
			       
			        	var valString = $(this).text() || 0;
        
       					 totalWeight += parseInt(valString);
			        
			        });
					$(this).text(totalWeight/1000);
					
		        }); 
		        <c:forEach var="map" items="${requestScope['monthTotalMap']}"> 
					$(".c${map.key}_1").each(function(){
				        var b = $(this).parent().parent().parent().parent().parent().parent().parent().find("td[id$=1_${map.key}]");
				        var totalWeight = 0;
				        b.each(function(){
				       
				        	var valString = $(this).text() || 0;
	        
	       					 totalWeight += parseInt(valString);
				        
				        });
						$(this).text(totalWeight/1000);
						
			        }); 
				
				</c:forEach>	        			
		        
				
		        $(".c2_0").each(function(){
			        var b = $(this).parent().parent().parent().parent().find("td[id$=0_2]");
			        var totalWeight = 0;
			        b.each(function(){
			       
			        	var valString = $(this).text() || 0;
        
       					 totalWeight += parseInt(valString);
			        
			        });
					$(this).text(totalWeight/1000);
					
		        }); 
		        
		        
		        
		        
		       $(".sum").each(function(){
			    	var a = $(this).parent().find("td[class$=_1]").text();  
					var b = $(this).parent().find(".last_month").text();  
					
	       			var c = a*1 + b*1;
	       			$(this).text(c);
					
		        });
		        $(".unit").change( 
	              function() { 
	              
	              	var sum = $(this).parent().parent().find(".sum").text();
	              	var unitPrice = $(this).parent().parent().find(".unitPrice").val();
	              	var day = $(this).parent().find(".day_1").
	              	sum*unitPrice/$(this).val()*day;
	                 $(this).parent().parent().find(".total").text(sum*unitPrice);
	              } 
	            ) 
		        
		         
			});
		
			$(function(){
			 $('tr.parent').click(function(){ // 获取所谓的父行 
			
			 $('tbody.child_'+this.id).toggle(); // 隐藏/显示所谓的子行 
			 }).click(); 
			}) 
		</script>

	</head>
	<body >
		<div id="main">
		<jsp:include page="common/top.jsp" flush="true" />
		<html:form action="/dailyBalance">
		<div >
			<div class="w936" > 
			    <div id="tb_" class="tb_"> 
		            <ul id="nav" > 
		            	<li style="text-align: left;font-size: 14px;font-weight: bold;padding-top: 3px">${customer.name}</li> 
		                <li style="margin-right: 50px" >
		               	<div id="sddm">
							<a class="month" href="#" onmouseover="mopen('m1')" onmouseout="mclosetime()"><fmt:formatDate value="${month}" pattern="yyyy年MM月"/></a>
								<div id="m1" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
									<a href="detailCharge.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=200908">2009年8月</a>
									<a href="detailCharge.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=200909">2009年9月</a>
									<a href="detailCharge.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=200910">2009年10月</a>
									<a href="detailCharge.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=200911">2009年11月</a>
									<a href="detailCharge.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=200912">2009年12月</a>
									<a href="detailCharge.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=201001">2010年1月</a>
									<a href="detailCharge.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=201002">2010年2月</a>
									<a href="detailCharge.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=201003">2010年3月</a>
									<a href="detailCharge.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=201004">2010年4月</a>
								</div>
						</div>
						<div id="sddm">
							<a class="function" href="#" onmouseover="mopen('m2')" onmouseout="mclosetime()" >储存费</a>
							<div id="m2" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
							
								<a href="stockItems.do?method=view&customerId=${customer.id}&month=<fmt:formatDate value="${month}" pattern="yyyyMM"/>" >明细</a>
								<a href="dailyBalance.do?method=view&customerId=${customer.id}&month=<fmt:formatDate value="${month}" pattern="yyyyMM"/>" >库存</a>
								<a href="stockCustomer.do?method=view">返回</a>
							</div>	
								
						</div>
		               
		                </li> 
		                
		            </ul> 
			    </div> 
			</div>
			
			<div >
				
				<table cellpadding="0" cellspacing="0" border="0" class="stockItems">
				
					<thead>
						
						<tr>
							<th width="24px">日期</th>
							<th width="25px">出/入</th>
							<th  align="center" >总入</th>
							<th  align="center" >总出</th>
							<th  align="center" >余量</th>
							<c:forEach items="${requestScope['cargoes.list']}" var="cargo">
			        		
			        			<th><span>${cargo.name}</span></th> 
			        		</c:forEach>
							
						</tr>
					</thead>
					<tbody id="helf_1">	
					<c:forEach items="${requestScope['stockRecord.list']}" var="stockRecord">
						
						<c:choose> 
							<c:when test="${stockRecord.inOut == 2}"> 
							
			        			<tr>
			        				<td colspan="${fn:length(requestScope['cargoes.list'])+5}">
			        				<fieldset style="padding: 8px">
										<legend style="font-size: 14px;padding: 2px">上半月</legend>
										<label >
											入库费：
					        			</label>
					        				
					        			<span class="totalInWeight"></span>(吨) ×
					     				<input />   			
					     				=
					     				<input />   			
					     				
					        			<br/>
					        			<label >储存费：</label><br/>
					        			<table cellpadding="0" cellspacing="0" border="0">
					        				<tr>
												<td>
													类型
												</td>
												<td>
													上期结存(吨)
												</td>
												<td>&nbsp;
												</td>
												<td>
													本期入库(吨)
												</td>
												<td>&nbsp;
												</td>
												<td>和
												</td>
												<td>
												&nbsp;
												</td>
												<td>
												单价
												</td>
												<td>
												单位
												</td>
												<td>
												金额
												</td>
											</tr>	
						        			<c:forEach var="map" items="${requestScope['monthTotalMap']}"> 
						        			<tr>
						        	
												<td >${map.key} </td >
												<td class="last_month">${map.value/1000}</td >
												<td>
												+
												</td>
												<td  class="c${map.key}_1"></td>
												<td>
												=
												</td>
												<td class="sum">
												
												</td>
												<td>
												×
												</td>
												<td>
													<input class="unitPrice" type="text"/>
													<input class="day_1" type="text" value="${requestScope['day_1']}"/>
												</td>
												<td>
												<select class="unit">
													<option value="1">天</option>
													<option value="15">半月</option>
													<option></option>
												</select>
												</td>
												<td class="total">
												
												</td>
											</tr>				 
											</c:forEach> 
					        			</table>
					        				<label >肉:</label><span class="c1_0"></span>
					        				<label >羯子:</label><span class="c2_0"></span>
					        				
										
									</fieldset>
			        				
			        					
			        				</td>
			        			</tr>
			        		</tbody>
			        		<tbody id="helf_1">		
			        		</c:when> 
						    <c:otherwise>
								<tr class="inOut_${stockRecord.inOut}" >						
									<td>
										<fmt:formatDate value="${stockRecord.time}" pattern="MM-dd" />
									</td>
									<td>
										<c:out value="${stockRecord.inOut}" />
									</td>	
							        <c:choose> 
										<c:when test="${stockRecord.inOut==1}"> 
					        				<td style="text-align: right;color: #339966;font-weight: bold;" class="inWeight">
							        	
											</td>
											<td >
													
											</td>
									
					        		 	</c:when> 
								     	<c:otherwise>
											<td>
							        	
											</td>
											<td style="text-align: right;color: #FF6600;font-weight: bold;" class="outWeight">
													
											</td>
									 	</c:otherwise>
										  
					        		</c:choose>
									
									
									
									
									
									<td>
									
									</td>
		
		
		
									<c:forEach items="${requestScope['cargoes.list']}" var="cargo">
					        		
					        			<td class="weight" id=${stockRecord.id}_${cargo.id}_${stockRecord.inOut}_${cargo.chargeType}></td> 
					        		</c:forEach>
								
								</tr>
							</c:otherwise>
								  
			        	</c:choose>
					</c:forEach>
					<tr>
        				<td height="50px"  colspan="${fn:length(requestScope['cargoes.list'])+3}">
        					储存费：
        				</td>
	    				<td class="totalInWeight"></td>
        				<td class="totalOutWeight"></td>
        			</tr>
        			</tbody>
				</table>
			</div>
			</div>
			
		</html:form>
			
		</div>
	</body>
</html>

