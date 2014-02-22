<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>出入库明细</title>
		
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
			 $('tr.parent').click(function(){ // 获取所谓的父行 
			
			 	$('tbody.child_'+this.id).toggle(); // 隐藏/显示所谓的子行 
			 }).click(); 
			}) 
		</script>

	</head>
	<body >
		<div id="main">
		<jsp:include page="common/top.jsp" flush="true" />
		<html:form action="/stockItems">
		<div >
			<div class="w936" > 
			    <div id="tb_" class="tb_"> 
		            <ul id="nav"> 
		            	<li style="text-align: left;font-size: 14px;font-weight: bold;padding-top: 3px">${customer.name}  </li> 
		                 <li style="margin-right: 50px" >
		               	<div id="sddm">
							<a class="month" href="#" onmouseover="mopen('m1')" onmouseout="mclosetime()"><fmt:formatDate value="${month}" pattern="yyyy年MM月"/></a>
								<div id="m1" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
									<c:forEach items="${monthList}" var="month">
										<a href="stockItems.do?method=view&customerId=${customer.id}&cargoId=${currentCargo.id}&month=${month[0]}">${month[1]}</a>
									</c:forEach>
								</div>
						</div>
						<div id="sddm">
							<a class="function" href="#" onmouseover="mopen('m2')" onmouseout="mclosetime()" >出入库明细</a>
								<div id="m2" onmouseover="mcancelclosetime()" onmouseout="mclosetime()">
									<a href="dailyBalance.do?method=view&customerId=${customer.id}&month=<fmt:formatDate value="${month}" pattern="yyyyMM"/>">每日结存</a>
									<a href="customerInventory.do?method=view&customerId=${customer.id}&month=<fmt:formatDate value="${month}" pattern="yyyyMM"/>">当前库存</a>
									<a href="stockCustomer.do?method=view">返回</a>
								</div>	
								
						</div>
		                
		                
		                
		                </li> 
		               <!-- 
		                <li id="tb_1" class="hovertab" onmouseover="xgz:HoverLi(1);">近一个月记录</li> 
		                <li id="tb_2" class="normaltab" onmouseover="xgz:HoverLi(2);">近三个月记录</li> 
		                 -->
		            </ul> 
			    </div> 
			</div>
			
			<div >
		
				<table cellpadding="0" cellspacing="0" border="0" class="stockItems">
				
					<thead>
						<tr>
							<th width="120px">日期</th>
							<th>单号</th>
							<th width="52px" align="center" >出库/入库</th>
							<th>总重量(kg)</th>
							<th>操作</th>
						</tr>
					</thead>
					<c:forEach items="${requestScope['stockRecord.list']}" var="stockRecord">
					
						<tr class="parent" id="row_${stockRecord.id}">						
							<td>
								<fmt:formatDate value="${stockRecord.time}" pattern="yyyy-MM-dd"/>
							</td>
							<td>
								<c:out value="${stockRecord.serialNumber}" />
							</td>	
							
							<td>
								<c:choose> 
								  <c:when test="${stockRecord.inOut==1}"> 
								        <font style="color: #009966">入库</font>
								  </c:when> 
								  <c:when test="${stockRecord.inOut==0}"> 
								        <font style="color: #FF6600;float:right">出库</font>
								  </c:when> 
								</c:choose> 
								
							</td>
							<td style="padding-right: 255px" align="right">
								<c:choose> 
								  <c:when test="${stockRecord.inOut==1}"> 
								        <font style="color: #009966;font-weight: bold;">
								        	<c:out value="${stockRecord.wholeWeight}" />
								        </font>
								  </c:when> 
								  <c:when test="${stockRecord.inOut==0}"> 
								        <font style="color: #FF6600;font-weight: bold;">
								        	<c:out value="${stockRecord.wholeWeight*-1}" />
								        </font>
								  </c:when> 
								</c:choose> 
								
							</td>
							<td>
								<a href="#">详细</a>  
							</td>		
						
						</tr>      
						<tbody class="child_row_${stockRecord.id}" style="background-color:#FFFFE3;border: 1px solid #FBECB3">
							
							<c:forEach items="${stockRecord.cargoRecords}" var="cargoRecord">
								<tr >
									<td colspan="5" class="child_td" style="border-left: 1px solid #FAE2B9;border-right: 1px solid #FAE2B9">   
										<span class="cargoName">
											<c:out value="${cargoRecord.cargoVO.name}" />
										</span>
										<span class="cargoUnit">	
											<c:out value="${cargoRecord.cargoVO.weight}"/> kg / 
											<c:out value="${cargoRecord.cargoVO.unit}" />
										</span>
										<span class="symbol">
											×
										</span>	
										<span class="cargoQuantity">	
											<c:out value="${cargoRecord.quantity}" />
											<c:out value="${cargoRecord.cargoVO.unit}" />
										</span >
										<span class="symbol">
											=
										</span>
											
										<span class="cargoTotalWeight">	
											<c:out value="${cargoRecord.totalWeight}" /> kg
										</span>
									</td>
								</tr>
							
							</c:forEach>
								<tr >
									<td colspan="5" class="child_td" style="border-bottom: 1px solid #FAE2B9">   
										
									</td>
								</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
			</div>
			
		</html:form>
			
		</div>
	</body>
</html>

