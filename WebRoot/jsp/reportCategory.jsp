<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>分类汇总表</title>
		
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
	
		
		<script type="text/javascript">
			$(function(){ 
			 var totalLastMonth = 0;
			 var totalWeightIn = 0;
			 var totalWeightOut = 0;
			 var totalWeightAccumulate = 0;
			
			 var i = ${fn:length(list)};
			 $(".lastMonth").each(function() {
    	        var thisValue = $(this).text();
		        if (thisValue != '') {
		            totalLastMonth += parseFloat(thisValue);
		        };
		     });
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
			 $(".totalLastMonth").text(totalLastMonth.toFixed(1));
			 $(".totalWeightIn").text(totalWeightIn.toFixed(1));
			 $(".totalWeightOut").text(totalWeightOut.toFixed(1));
			 $(".totalWeightAccumulate").text(totalWeightAccumulate.toFixed(1));
			
			}) 
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
		            	<li style="width:180px;text-align: left;font-size: 14px;font-weight: bold">分类汇总表</li> 
		               
		                <li style="margin-right: 50px" >
		               	<div id="sddm">
							<a class="month" href="#" onmouseover="mopen('m1')" onmouseout="mclosetime()"><fmt:formatDate value="${month}" pattern="yyyy年MM月"/></a>
								<div id="m1" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
									
									<c:forEach items="${monthList}" var="month">
										<a href="stockAnalyze.do?method=category&month=${month[0]}">${month[1]}</a>
									</c:forEach>
								</div>
							
						</div>
						<div id="sddm">
							<a class="function" target="page" href="stockAnalyze.do?method=category&type=categoryChart&month=<fmt:formatDate value="${month}" pattern="yyyyMM"/>" >图表</a>
						</div>
						</li> 
						
		            </ul> 
			    </div>
			</div>
			<div >
				<table cellpadding="0" cellspacing="0" border="1" class="stockItems">
				
					<thead>
						<tr>
							<th>客户名称</th>
							<th>上月结存</th> 
							<th>入库量(kg)</th>
							<th>出库量(kg)</th>
							<th>结存</th>
							
						</tr>
					</thead>
						
					<c:forEach items="${requestScope['list']}" var="object">
						<c:forEach items="${object[1]}" var="item">
							<tr >						
				
								<td align="center">
									<c:out value="${item[0]}" />
								</td>	
								
								<td align="right">
									
									<c:out value="${item[1]}" />
										
								</td>
								<td align="right">
									
									<c:out value="${item[2]}" />
									
								</td>
								<td align="right">
									<c:set var="i" value="1"/>
									<c:if test="${item[3]<=-0.0}">
										<c:set var="i" value="-1"/>
									</c:if>	
									<c:out value="${item[3]*i}" />
								</td>	
								<td align="right">
									<c:out value="${item[4]}" />
								</td>		
							</tr>   
						
						</c:forEach>
						<tr >						
			
							<td align="center" style="font-weight: bolder;border-bottom: 1px solid #000">
								<c:out value="${object[0][0]}" />小计
							</td>	
							
							<td class="lastMonth" align="right" style="font-weight: bolder;border-bottom: 1px solid #000">
								
									<c:out value="${object[0][1]}" />
									
							</td>
							<td  class="weightIn"  align="right" style="font-weight: bolder;border-bottom: 1px solid #000">
								
									<c:out value="${object[0][2]}" />
								
							</td>
							<td  class="weightOut"  align="right" style="font-weight: bolder;border-bottom: 1px solid #000">
								<c:out value="${object[0][3]}" />
							
							
							</td>	
							<td class="weightAccumulate"  align="right" style="font-weight: bolder;border-bottom: 1px solid #000">
								<c:out value="${object[0][4]}"  />
							</td>		
						</tr>      
					</c:forEach>
						<tr>						
			
							<td align="center" style="font-weight: bolder;">
								合计
							</td>	
							
							<td class="totalLastMonth" align="right" style="font-weight: bolder;">
								
							</td>
							<td  class="totalWeightIn"  align="right" style="font-weight: bolder;">
								
							</td>
							<td  class="totalWeightOut"  align="right" style="font-weight: bolder;">
								
							</td>	
							<td class="totalWeightAccumulate"  align="right" style="font-weight: bolder;">
								
							</td>		
						</tr>   
				</table>
			</div>
			</div>
			
		</html:form>
			
		</div>
	</body>
</html>

