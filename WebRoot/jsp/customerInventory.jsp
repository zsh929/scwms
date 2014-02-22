<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>当前库存</title>
		
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
	        function query(type){   
				location.href="customerInventory.do?method=view&customerId="+ ${customer.id} +"&isDL="+type;   
            }
            $().ready(function() {
           
            	var wholeWeight = 0;
            	$(".totalWeight").each(function() {
		   	    	var valString = $(this).text() || 0;
			        
			        wholeWeight += parseFloat(valString);
            
            	});
            	$("#wholeWeight").text(wholeWeight.toFixed(1));
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
		            	<li style="text-align: left;font-size: 14px;font-weight: bold;padding-top: 3px">${customer.name}&nbsp;当前库存</li> 
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
								<a class="button" href="stockCustomer.do?method=view" >返回</a>
							</div>
		                </li> 
		            </ul> 
		            
			    </div> 
			   <div id="form_stylized"  class="myform" style="width: 100%;background-color: #F9F9F9;border-bottom: 1px solid #CCCCCC;margin-bottom: 5px">
			    	
			    	<div style="font-size: 14px;font-weight: bold;margin: 10px 5px 5px 65px">查询</div>
			    	<label>区分储位</label>
			    		<input style="width:45px;height:18px;background-color: D4D0C8;border: 1px solid #666;padding:1px;font-size: 12px" type="button" onclick="query('t')" value="是"/>
			    		<input style="width:45px;height:18px;background-color: D4D0C8;border: 1px solid #666;padding:1px;font-size: 12px" type="button" onclick="query('f')" value="否"/>
			   
			    	<br/>
			    		  					
			    </div>
			</div>
			
			<div >
		
				<table cellpadding="0" cellspacing="0" border="0" class="stockItems">
				
					<thead>
						<tr>
							<th>货物编码</th>
							<th>货物名称</th>
							<th>批号</th>
							<th>生产日期</th>
							<th>类型</th>
							<th>重量(kg)/单位</th>
							<th>库存数量</th>
							<th>库存总重量</th>
							<th>储位</th>
						</tr>
					</thead>
					<c:forEach items="${requestScope['cargoes.list']}" var="cargo">
			
						<tr>						
							<td>
								<c:out value="${cargo.number}" /> 
								<input name="id" type="hidden" value="${cargo.id}"/>
							</td>
							<td>
								<a href="#" onclick="openBox(${cargo.id},'${cargo.name}');return false;" >
									<c:out value="${cargo.name}" />
								</a>	
							</td>	
							<td>
								<c:out value="${cargo.batchNumber}" />
								<input type="hidden"  name="batchNumber" value="${cargo.batchNumber}"/>
							</td>
							<td>
								<c:out value="${cargo.dateProduce}" />
								<input type="hidden"  name="dateProduce" value="${cargo.dateProduce}"/>
							</td>
							<td align="right">
								<c:out value="${cargo.category}" />
							</td>
							<td align="right">
								<c:out value="${cargo.weight}" />kg/<c:out value="${cargo.unit}" />
								
							</td>
							<td align="right">
								<c:out value="${cargo.quantity}" />
							</td>
							<td align="right" class="totalWeight">
								<c:out value="${cargo.totalWeight}" />
							</td>
							<td align="right">
								<c:out value="${cargo.locationName}" />
							</td>
							
						</tr>      
					</c:forEach>
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

