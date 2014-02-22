<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>每日结存</title>
		
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
		<script type="text/javascript" src="plug-in/dynamicorderform/js/balance.js"></script>
		<script type="text/javascript" src="plug-in/weebox/bgiframe.js"></script>
		<script type="text/javascript" src="plug-in/weebox/weebox.js"></script>
		
		<script type="text/javascript" src="plug-in/monthlycalendar/dropdownmenu.js"></script>
		<link type="text/css" rel="stylesheet" href="plug-in/monthlycalendar/css/default.css" />
	
		<script type="text/javascript">
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
									<c:forEach items="${monthList}" var="month">
										<a href="dailyBalance.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=${month[0]}">${month[1]}</a>
									
									</c:forEach>
									<!-- 
									<a href="dailyBalance.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=200908">2009年8月</a>
									<a href="dailyBalance.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=200909">2009年9月</a>
									<a href="dailyBalance.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=200910">2009年10月</a>
									<a href="dailyBalance.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=200911">2009年11月</a>
									<a href="dailyBalance.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=200912">2009年12月</a>
									<a href="dailyBalance.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=201001">2010年1月</a>
									<a href="dailyBalance.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=201002">2010年2月</a>
									<a href="dailyBalance.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=201003">2010年3月</a>
									<a href="dailyBalance.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=201004">2010年4月</a>
									-->
								</div>
						</div>
						<div id="sddm">
							<a class="function" href="#" onmouseover="mopen('m2')" onmouseout="mclosetime()" >每日结存</a>
								<div id="m2" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
									<a href="customerInventory.do?method=view&customerId=${customer.id}&month=<fmt:formatDate value="${month}" pattern="yyyyMM"/>">当前库存</a>
									<a href="stockItems.do?method=view&customerId=${customer.id}&month=<fmt:formatDate value="${month}" pattern="yyyyMM"/>">出入库明细</a>
									<a href="stockCustomer.do?method=view">返回</a>
									
								</div>	
								
						</div>
		                
		                
		                
		                </li> 
		               	
		               	<c:forEach items="${requestScope['cargoes.list']}" var="cargo">
			        		<c:choose> 
								<c:when test="${cargo.id==currentCargo.id}"> 
			        				<li ><a href="#" class="hovertab"><span>${cargo.name}(${cargo.weight}kg/${cargo.unit})</span></a></li> 
			        		 	</c:when> 
						     	 <c:otherwise>

									<li ><a title="${cargo.weight}kg/${cargo.unit}"  href="dailyBalance.do?method=view&customerId=${customer.id}&cargoId=${cargo.id}&month=<fmt:formatDate value="${month}" pattern="yyyyMM"/>" class="normaltab"><span>${cargo.name}</span></a></li> 
							 	</c:otherwise>
								  
			        		</c:choose>
		             	</c:forEach>
		                
		            </ul> 
			    </div> 
			</div>
			
			<div >
				
				<table cellpadding="0" cellspacing="0" border="0" class="stockItems">
				
					<thead>
						
						<tr>
							<th>日期</th>
							<th>单号</th>
							<th  align="center" >入库数量</th>
							<th  align="center" >入库重量(kg)</th>
							<th  align="center" >出库数量</th>
							<th  align="center" >出库重量(kg)</th>
							<th  align="center" >结存数量</th>
							<th  align="center" >结存重量(kg)</th>
							<th>操作</th>
						</tr>
					</thead>
						<tr>
							<td colspan="2" align="right" style="font-weight: bold;border-bottom: 1px solid #000">
								上月合计

							</td>
							
							 <td style="text-align: right;color: #339966;font-weight: bold;border-bottom: 1px solid #000;padding-right: 35px" id="lastMonthInQuantity"  >
								${monthTotal.inQuantity}	
							</td>
							<td style="text-align: right;color: #339966;font-weight: bold;border-bottom: 1px solid #000;padding-right: 35px" id="lastMonthInWeight"  >
								${monthTotal.inWeight}
							</td>
							
							<td style="text-align: right;color: #FF6600;font-weight: bold;border-bottom: 1px solid #000;padding-right: 35px" id="lastMonthOutQuantity" >
								${monthTotal.outQuantity}
							</td>
							<td style="text-align: right;color: #FF6600;font-weight: bold;border-bottom: 1px solid #000;padding-right: 35px" id="lastMonthOutWeight" >
								${monthTotal.outWeight}
							</td>
							<td align="right" style="font-weight: bold;border-bottom: 1px solid #000;padding-right: 35px" id="lastMonthBalanceQuantity" class="balanceQuantity">
								${monthTotal.balanceQuantity}
							</td>
							<td align="right" style="font-weight: bold;border-bottom: 1px solid #000;padding-right: 35px" id="lastMonthBalanceWeight" class="balanceWeight">
								${monthTotal.balanceWeight}
							</td>
							<td style="font-weight: bold;border-bottom: 1px solid #000">
								
							</td>
						</tr>
					<c:forEach items="${requestScope['stockRecord.list']}" var="stockRecord">
					
						<tr class="parent" id="row_${stockRecord.id}">						
							<td>
								<fmt:formatDate value="${stockRecord.time}" pattern="yyyy-MM-dd"/>
							</td>
							<td>
								<c:out value="${stockRecord.serialNumber}" />
							</td>	
							
							
								<c:choose> 
								  <c:when test="${stockRecord.inOut==1}"> 
								        <td style="text-align: right;color: #339966;font-weight: bold;padding-right: 35px" class="inQuantity">
								        	<c:forEach items="${stockRecord.cargoRecords}" var="cargoRecord">
								        		<c:out  value="${cargoRecord.quantity}" />
								        	</c:forEach>
										</td>
										<td style="text-align: right;color: #339966;font-weight: bold;padding-right: 35px" class="inWeight">
											<c:forEach items="${stockRecord.cargoRecords}" var="cargoRecord">
								        		<c:out  value="${cargoRecord.totalWeight}" />
								        	</c:forEach>
											
										</td>
										<td>
										</td>
										<td>
											
											
										</td>

								  </c:when> 
								  <c:when test="${stockRecord.inOut==0}"> 
								        <td>
										</td>
										<td>
											
											
										</td>
										<td style="text-align: right;color: #FF6600;font-weight: bold;padding-right: 35px" class="outQuantity">
								        	<c:forEach items="${stockRecord.cargoRecords}" var="cargoRecord">
								        		<c:out  value="${cargoRecord.quantity*-1}" />
								        	</c:forEach>
										</td>
										<td style="text-align: right;color: #FF6600;font-weight: bold;padding-right: 35px" class="outWeight">
											<c:forEach items="${stockRecord.cargoRecords}" var="cargoRecord">
								        		<c:out  value="${cargoRecord.totalWeight*-1}" />
								        	</c:forEach>
											
										</td>
								  </c:when> 
								</c:choose> 
								<td align="right" style="font-weight: bold;padding-right: 35px" class="balanceQuantity"></td>
								<td align="right" style="font-weight: bold;padding-right: 35px" class="balanceWeight"></td>
								
							
							<td>
								<a href="#" onclick="openBox(${stockRecord.id});return false;">详细</a>  
							</td>		
						
						</tr>      
					</c:forEach>
					
					<tr>
						<td colspan="2" align="right" style="font-weight: bold;border-top: 2px solid #000">
								本月合计

							</td>
							
							 <td style="text-align: right;color: #339966;font-weight: bold;border-top: 2px solid #000;padding-right: 35px" id="thisMonthInQuantity" >
								       
							</td>
							<td style="text-align: right;color: #339966;font-weight: bold;border-top: 2px solid #000;padding-right: 35px" id="thisMonthInWeight" >
								
							</td>
							
							<td style="text-align: right;color: #FF6600;font-weight: bold;border-top: 2px solid #000;padding-right: 35px" id="thisMonthOutQuantity" >
								     	
							</td>
							<td style="text-align: right;color: #FF6600;font-weight: bold;border-top: 2px solid #000;padding-right: 35px" id="thisMonthOutWeight" >
								
							</td>
							<td align="right" style="font-weight: bold;border-top: 2px solid #000;padding-right: 35px" id="thisMonthBalanceQuantity" class="balanceQuantity">
								
							</td>
							<td align="right" style="font-weight: bold;border-top: 2px solid #000;padding-right: 35px" id="thisMonthBalanceWeight" class="balanceWeight">
								
							</td>
							<td style="font-weight: bold;border-top: 2px solid #000">
								
							</td>

					</tr>
				</table>
			</div>
			</div>
			
		</html:form>
			
		</div>
	</body>
</html>

