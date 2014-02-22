<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>货物信息</title>
		
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
			.tb_ li{float:left;height: 24px;padding-top: 6px;width: 127px;cursor:pointer;margin-left: 4px;text-align: center;} 
			.normaltab   { background-image:url(images/tab_2.gif); background-repeat: no-repeat; } 
			.hovertab    { background-image: url(images/tab_1.gif); background-repeat: no-repeat;  font-weight:bold } 
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
		<script type="text/javascript">
			$(function(){
				$("#keyword").keyup(function(){
			        if(event.keyCode == 13){
			        	query();
			        }
			    });
			});	
			function query(){   
				var keyword = $("#keyword").val();
			   	location.href="cargo.do?method=query&keyword="+keyword;   
	        }
			
	
		</script>
	
	
	</head>
	<body >
		<div id="main">
		<jsp:include page="common/top.jsp" flush="true" />
		<html:form action="/cargo">
		<div>
			
			<div class="w936" >
				<div id="tb_" class="tb_"> 
		            <ul id="nav"> 
		            	<li style="text-align: left;font-size: 14px;font-weight: bold;padding-top: 3px">货物信息</li> 
		               
		            </ul> 
		            
			    </div> 
			    
			    <div id="form_stylized"  class="myform" style="width: 100%;background-color: #F9F9F9;border-bottom: 1px solid #CCCCCC;margin-bottom: 5px">
			    	
			    	<div style="font-size: 14px;font-weight: bold;margin: 10px 5px 5px 65px">查询</div>
			    	<label></label>
			    	<input id="keyword" name="keyword" value="${requestScope['keyword']}"/>
					<input style="width:50px;background-color: D4D0C8;border: 1px solid #666;padding-top: 4px;font-size: 12px" type="button" onclick="query()" value="查询"/>
						
				</div>
			</div>
			<div >
				<table  cellpadding="0" cellspacing="0" border="0" class="stockItems" id="example">
				
					<thead>
						<tr>
							<th>客户</th>
							<th>编号</th>
							<th>货物名称</th>
							<th>类型</th>
							<th>尺寸规格</th>
							<th>重量(kg)/单位</th>
							
						</tr>
					</thead>
					<c:forEach items="${requestScope['cargo.list']}" var="cargo">
					
						<tr class="parent" >		
							<td align="center" >
								<c:out value="${cargo.customerName}" />
							</td>				
							<td align="center">
								<c:out value="${cargo.number}" /> 
							</td>
							<td align="center">
								<a href="#" onclick="openBox(${cargo.id},'${cargo.name}');return false;" >
									<c:out value="${cargo.name}" />
								</a>
							</td>	
							<td  align="center">
								<c:out value="${cargo.category}" />
							</td>
							<td  align="center">
								<c:out value="${cargo.size}" />
							</td>
							<td  align="center">
								<c:out value="${cargo.weight}" />kg/<c:out value="${cargo.unit}" />
								
							</td>	
							
								
						</tr>      
					</c:forEach>
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

