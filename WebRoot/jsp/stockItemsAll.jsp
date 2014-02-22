<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>明细记录</title>
		
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
			 $('tr.parent').click(function(){ // 获取所谓的父行 
			
			 $('tbody.child_'+this.id).toggle(); // 隐藏/显示所谓的子行 
			 }).click(); 
			 //$("input[@type=radio]").attr("checked",'${requestScope['inOut']}');
			 //$('input[@name=inOut][@value=1]').checked = true;
			 $("input[name='inOut'][value=${requestScope['inOut']}]").attr("checked",true);  
			}) 
			
			 function query(type){   
				
				var bDate = $('input[name="bDate"]').val();
				var eDate = $('input[name="eDate"]').val();	
				var customerId = $('select[name="customerId"]').val();
				//var inOut = $('input[name="inOut"]').val();
				var inOut = $('input[@name=inOut][@checked]').val();
				
				if(inOut == "" || inOut == null){
					inOut = "0,1,2";
				}
				
				if(type == 'businessQuantityChart'){
				
            		window.showModalDialog("stockItems.do?method="+type+"&bDate="+bDate+"&eDate="+eDate+"&customerId="+customerId+"&inOut="+inOut,"","dialogWidth=950px;dialogHeight=450px;");
				}else if(type == 'chart'){
					
					location.href="stockItems.do?method=chart&bDate="+bDate+"&eDate="+eDate+"&customerId="+customerId+"&inOut="+inOut;  
				
				}
				else{
				
					location.href="stockItems.do?method=all&bDate="+bDate+"&eDate="+eDate+"&customerId="+customerId+"&inOut="+inOut;   
            	
				}
            }
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
		            	<li style="text-align: left;font-size: 14px;font-weight: bold;padding-top: 3px">明细记录</li> 
		                 
		               <!-- 
		                <li id="tb_1" class="hovertab" onmouseover="xgz:HoverLi(1);">近一个月记录</li> 
		                <li id="tb_2" class="normaltab" onmouseover="xgz:HoverLi(2);">近三个月记录</li> 
		                 -->
		            </ul> 
			    </div>
			    
			    <div id="form_stylized"  class="myform" style="width: 100%;background-color: #F9F9F9;border-bottom: 1px solid #CCCCCC;margin-bottom: 5px">
			    	<div style="font-size: 14px;font-weight: bold;margin: 10px 5px 5px 65px">查询</div>
			    	
				    	<label>起止日期</label><input value="${bDate}" name="bDate" class="Wdate" onclick="WdatePicker()" style="width: 100px"/>
				    							-<input value="${eDate}" name="eDate" class="Wdate" onclick="WdatePicker()" style="width: 100px"/><br />
				    	
				    	<label>客户</label>
							
							<select name="customerId" >
				    		<option value="">--全部--</option>
							<c:forEach var="customer" items="${requestScope['customer.list']}" >
							
							<c:choose>
								<c:when test="${customerId==customer.id}">
									<option selected="selected"  value="${customer.id }">${customer.name }</option>
							
								</c:when>
								<c:otherwise>
										<option value="${customer.id }">${customer.name }</option>
							
								</c:otherwise>
							</c:choose>
							
							</c:forEach>
						</select><br />
				    	<label>出入库</label>
				    	
				    	<input style="width: 15px;border: 0px;float: left" name="inOut" id="all" type="radio" checked="checked"  value="" />
						<label style="width: 50px;border: 0px;text-align: left" for="all">所有</label>
						
				    	
				    	<input style="width: 15px;border: 0px;float: left" name="inOut" id="1" type="radio"  value="1" />
						<label style="width: 50px;border: 0px;text-align: left" for="1">入库</label>
						
						<input style="width: 15px;border: 0px;float: left" name="inOut" id="0" type="radio"  value="0" />
						<label style="width: 50px;border: 0px;text-align: left" for="0">出库</label><br />		
				   
					<div style="padding-left: 385px;">
						<input style="width:50px;background-color: D4D0C8;border: 1px solid #666;padding-top: 4px;font-size: 12px" type="button" onclick="query('')" value="查询"/>
					
					</div>			  					
			    </div> 
			</div>
			
			<div style="height: 37px;">
				
				<a style="border:1px solid #bbbbbb;border-bottom:0px;width:100px;height:37px;line-height: 36px;float:left;text-align: center;background-image:url('images/bg_1.gif');background-repeat:repeat-x;">数据列表</a>
				<a href="#" onclick="query('chart')" style="border: 1px solid #bbbbbb;border-left:1px solid #F5F5F5;width:100px;height:36px;line-height: 36px;float:left;text-align: center;background-image:url('images/bg.gif');background-repeat:repeat-x;text-decoration:none; ;">图形</a>
				
			
			</div>
			<div style="border: 1px solid #aaaaaa;padding:10px;">
		
				<table cellpadding="0" cellspacing="0" border="0" class="stockItems" >
				
					<thead>
						<tr>
							<th width="120px">日期</th>
							<th>客户名称</th>
							<th>单号</th>
							<th width="52px" align="center" >出库/入库</th>
							<th width="80px">总重量(kg)</th>
							<th>操作</th>
						</tr>
					</thead>
					<c:forEach items="${requestScope['stockRecord.list']}" var="stockRecord">
					
						<tr class="parent" id="row_${stockRecord.id}">						
							<td align="center">
								<fmt:formatDate value="${stockRecord.time}" pattern="yyyy-MM-dd"/>
							</td>
							<td align="center">
								<c:out value="${stockRecord.customerName}" />
							</td>	
							<td align="center">
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
								  <c:when test="${stockRecord.inOut==2}"> 
								        <font style="color: #000000;">移库</font>
								  </c:when> 
								   <c:when test="${stockRecord.inOut==3}"> 
								        <font style="color: #000000;">平账</font>
								  </c:when> 
								   <c:when test="${stockRecord.inOut==-1}"> 
								        <font style="color:#ff0000;">作废</font>
								  </c:when> 
								</c:choose> 
								
							</td>
							<td align="right">
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
							<td align="center">
								<a href="#" onclick="openBox(${stockRecord.id});return false;" >
									详细
								</a>&nbsp;
								<a href="#" onclick="del(${stockRecord.id});return false;">
									作废
				 				</a>
							</td>		
						
						</tr>      
					
					</c:forEach>
				</table>
			</div>
			
			
		</div>
			
		</html:form>
			<script type="text/javascript">
			function openBox(id){
				window.showModalDialog("stockItems.do?method=cargoRecord&stockRecordId="+id,"","dialogWidth=950px;dialogHeight=600px;");
				//$.weeboxs.open('stockItems.do?method=cargoRecord&stockRecordId='+id, {title:name+'  仓库库存', type:'alert', contentType:'ajax',width:880});
				
			};
			
			
			function del(id){
          		
				url = window.location.href;
				url = escape(url);
				//alert(url);
				$.weeboxs.open('stockItems.do?method=deleteConfirm&stockItemsId='+id+'&url='+url, {title:'删除', 
																					 contentType:'ajax',
																					 onok:function(){
																						stockItems.submit();														
																				
																					 	}
																					});
			
			};
		
			
			
			</script>
		</div>
	</body>
</html>

