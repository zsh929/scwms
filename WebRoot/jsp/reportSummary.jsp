<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>汇总表</title>
		
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
			tr.highlight{background-color:#eeeeee; }
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
			 
			 $('tr[class="item"]').hover(
		        function(){
		            $(this).addClass('highlight');;
		        },
		        function(){
		            $(this).removeClass('highlight');;
		        }
		    );
			 
			
			}) 
			
			 function query(){   
				
				var bDate = $('input[name="bDate"]').val();
				var eDate = $('input[name="eDate"]').val();	
				
				location.href="stockAnalyze.do?method=summary&bDate="+bDate+"&eDate="+eDate;   
            
            
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
		            	<li style="width:180px;text-align: left;font-size: 14px;font-weight: bold">汇总表</li> 
		         	</ul> 
			    </div>
			    <div id="form_stylized"  class="myform" style="width: 100%;background-color: #F9F9F9;border-bottom: 1px solid #CCCCCC;margin-bottom: 5px">
			    	
			    	<div style="font-size: 14px;font-weight: bold;margin: 10px 5px 5px 65px">查询</div>
			    	<label>起止日期</label><input name="bDate" class="Wdate" onclick="WdatePicker()" style="width: 100px" value="${requestScope['bDate']}"/>
			    							<font style="vertical-align: middle;padding-left: 7px">至</font><input name="eDate" class="Wdate" onclick="WdatePicker()" style="width: 100px"  value="${requestScope['eDate']}"/><br />

					<div style="padding-left: 155px;">
						<input style="width:50px;background-color: D4D0C8;border: 1px solid #666;padding-top: 4px;font-size: 12px" type="button" onclick="query()" value="查询"/>
					</div>	
			    </div>
			</div>
			<div >
				<table cellpadding="0" cellspacing="0" border="1" class="stockItems">
				
					<thead>
						<tr>
							<th>客户名称</th>
							<th><c:out value="${bDate}"/>结存(kg)</th> 
							<th>入库量(kg)</th>
							<th>出库量(kg)</th>
							<th><c:out value="${eDate}"/>结存(kg)</th>
							
						</tr>
					</thead>
						
					<c:forEach items="${requestScope['list']}" var="item">
						
							<tr class="item">						
				
								<td align="center">
									<c:out value="${item[1]}" />
								</td>	
								
								<td align="right">
									
									<c:out value="${item[4]}" />
										
								</td>
								<td align="right">
									<a href="stockItems.do?method=all&bDate=${requestScope['bDate']}&eDate=${requestScope['eDate']}&customerId=${item[0]}&inOut=1" target="_blank"><c:out value="${item[3]}" /></a>
								</td>
								<td align="right">
									<a href="stockItems.do?method=all&bDate=${requestScope['bDate']}&eDate=${requestScope['eDate']}&customerId=${item[0]}&inOut=0" target="_blank"><c:out value="${item[2]}" /></a>
								</td>	
								<td align="right">
									<c:out value="${item[5]}" />
								</td>		
							</tr>   
						
						
						
					</c:forEach>
						 
				</table>
			</div>
			</div>
			
		</html:form>
			
		</div>
	</body>
</html>

