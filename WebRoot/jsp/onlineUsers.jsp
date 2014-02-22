<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>在线用户</title>
		
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
			function query(){   
				var userName = $("#userName").val();
				var startDate = $("#startDate").val();
				var endDate = $("#endDate").val();
				
				location.href="systemLog.do?method=query&startDate="+startDate+"&endDate="+endDate;   
	        
	        }
				
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
		            	<li style="text-align: left;font-size: 14px;font-weight: bold;padding-top: 3px">在线用户</li> 
		               
		            </ul> 
		            
			    </div>
			    <%-- 
			    <div id="form_stylized"  class="myform" style="width: 100%;background-color: #F9F9F9;border-bottom: 1px solid #CCCCCC;margin-bottom: 5px">
			    	
			    	<div style="font-size: 14px;font-weight: bold;margin: 10px 5px 5px 65px">查询</div>
			    	<label>起止日期</label><input value="${startDate}" id="startDate" name="startDate" class="Wdate" onclick="WdatePicker()" style="width: 100px"/>
				    							-<input value="${endDate}" id="endDate" name="endDate" class="Wdate" onclick="WdatePicker()" style="width: 100px"/><br />
				    <label>用户名</label>
			    	<input id="userName" name="userName" value="${requestScope['userName']}"/><br/>	
			    	<div style="padding-left: 155px;">
						<input style="width:50px;background-color: D4D0C8;border: 1px solid #666;padding-top: 4px;font-size: 12px" type="button" onclick="query()" value="查询"/>
						
					</div>	
							  					
			    </div>
				--%>
				</div>
			
			<div >
				
				<table cellpadding="0" cellspacing="0" border="0" class="stockItems">
				
					<thead>
						<tr>
							
							<th width="50px">序号</th>
							<th width="80px">用户名</th>
							<th width="80px">登录地址</th>
							<th width="80px">登录时间</th>
							
						</tr>
					</thead>
				
					<c:forEach items="${requestScope['onlineUser.list']}" var="user" varStatus="status"  begin="0">
					
						<tr>	
							
							<td align="center">
								<c:out value="${status.count}" />
							</td>					
							
							<td align="center">
								<c:out value="${user.userName}" />
							</td>	
							
							<td align="center">
								
								<c:out value="${user.loginAddress}" />
								
							</td>
							<td align="center">
								<fmt:formatDate value="${user.loginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
								
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

