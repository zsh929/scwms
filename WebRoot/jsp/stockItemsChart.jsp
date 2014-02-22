<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>明细记录</title>
		<!--[if IE]><script language="javascript" type="text/javascript" src="plug-in/jqplot/excanvas.js"></script><![endif]-->
  
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
		<link rel="stylesheet" type="text/css" href="plug-in/jqplot/jquery.jqplot.css" />
		<script type="text/javascript" src="plug-in/lightTreeview/jquery-1.2.6.js"></script>
		<script type="text/javascript" language="javascript" src="plug-in/dataTables/js/jquery.dataTables.js"></script>
		
		<script type="text/javascript" src="plug-in/weebox/bgiframe.js"></script>
		<script type="text/javascript" src="plug-in/weebox/weebox.js"></script>
		
		<script type="text/javascript" src="plug-in/monthlycalendar/dropdownmenu.js"></script>
		<link type="text/css" rel="stylesheet" href="plug-in/monthlycalendar/css/default.css" />
		<script language="javascript" type="text/javascript" src="plug-in/My97DatePicker/WdatePicker.js"></script>
		
		<script language="javascript" type="text/javascript" src="plug-in/jqplot/jquery.jqplot.js"></script>
		<script language="javascript" type="text/javascript" src="plug-in/jqplot/plugins/jqplot.canvasTextRenderer.js"></script>
		<script language="javascript" type="text/javascript" src="plug-in/jqplot/plugins/jqplot.canvasAxisTickRenderer.js"></script>
		<script language="javascript" type="text/javascript" src="plug-in/jqplot/plugins/jqplot.dateAxisRenderer.js"></script>
		<script language="javascript" type="text/javascript" src="plug-in/jqplot/plugins/jqplot.barRenderer.js"></script>
		<script language="javascript" type="text/javascript" src="plug-in/jqplot/plugins/jqplot.categoryAxisRenderer.js"></script>
		<script language="javascript" type="text/javascript" src="plug-in/jqplot/plugins/jqplot.highlighter.js"></script>
 		<script language="javascript" type="text/javascript" src="plug-in/jqplot/plugins/jqplot.pieRenderer.lineLabels.js"></script>
		
		<script type="text/javascript">
		 $(document).ready(function(){
			 $.urlParam = function(name) {
		            var results = new RegExp('[\\?&]' + name + '=([^&#]*)').exec(window.location.href);
		            return results[1] || 0;
		        };
		        
		     var method = $.urlParam('method');
		     var inOut = $.urlParam('inOut'); 
			 if(method == 'chart'){
				 $("#contrast").hide();
				 $("#cancel").hide();
			 }else if(method == 'contrast'){
				 $("#contrast").show();
				 $("#cancel").show();
			 }
			 
			 $("input[name='inOut']").each(function(){
				if (inOut.indexOf($(this).val()) >= 0) {
			    	$(this).attr("checked","checked");
			    }
			 });  
			 
			var line1 = [];
			var line2 = [];
			var line3 = [];
			var line4 = [];
			var line5 = [];
			var line6 = [];
			 
			<c:if test="${fn:contains(param.inOut, '2')}"> 	  
				line1 = ${requestScope['balanceWeight']};
			</c:if>
			<c:if test="${fn:contains(param.inOut, '1')}"> 	 
				line2 = ${requestScope['inWeight']};
			</c:if>
			<c:if test="${fn:contains(param.inOut, '0')}"> 	 
				line3 = ${requestScope['outWeight']};
			</c:if>
			var date = ${requestScope['date']};
			
			 <c:if test="${param.method == 'contrast'}">
			 	<c:if test="${fn:contains(param.inOut, '2')}"> 	  
			 		var line4 = ${requestScope['balanceWeight1']};
			 	</c:if>
			 	<c:if test="${fn:contains(param.inOut, '1')}"> 	  
			 		var line5 = ${requestScope['inWeight1']};
			 	</c:if>
			 	<c:if test="${fn:contains(param.inOut, '0')}"> 	  
			 		var line6 = ${requestScope['outWeight1']};
			 	</c:if>
				
			</c:if>

			 var bDate = '${requestScope["bDate"]}';
			 var eDate = '${requestScope["eDate"]}';
			
			 plot2 = $.jqplot('chart1', 
					 
					 <c:if test="${param.method == 'chart'}">
					 	[line1,line2,line3],
					 </c:if>
					 <c:if test="${param.method == 'contrast'}">
					 	[line1,line2,line3,line4,line5,line6],
					 </c:if>
			 		 {
			        legend: {show: true, location: 'nw'},
			        title: '${requestScope['title']}',
			        series: [
							
			                 	{label: '结存(吨)',xaxis:'xaxis',yaxis:'yaxis',fill:false,color:'#000000'},
			                
			                 	{label: '入库(吨)',xaxis:'xaxis',
			                 		<c:if test="${fn:contains(param.inOut, '2') && fn:contains(param.inOut, '1')}"> 	  
			                 		yaxis:'y2axis',
			                 		</c:if>
			                 		fill:false,color:'#009966'}, 
			                 
			                 	{label: '出库(吨)',xaxis:'xaxis',
			                 		<c:if test="${fn:contains(param.inOut, '2') && fn:contains(param.inOut, '0')}"> 	  	
		                 			yaxis:'y2axis',
		                 			</c:if>
		                 			fill:false,color:'#FF6600'},		          
			               
			                 	{label: '去年同期结存(吨)',xaxis:'x2axis',fill:false,color:'#626262'},
			                
			                 	{label: '去年同期入库(吨)',xaxis:'x2axis',
			                 		<c:if test="${fn:contains(param.inOut, '2') && fn:contains(param.inOut, '1')}"> 	
			                 		yaxis:'y2axis', 
			                 		</c:if>
			                 		fill:false,color:'#3B997A'},
			                 
			                 	{label: '去年同期出库(吨)',xaxis:'x2axis',
			                 		<c:if test="${fn:contains(param.inOut, '2') && fn:contains(param.inOut, '0')}"> 	
			                 		yaxis:'y2axis',
			                 		</c:if>
			                 		fill:false,color:'#FF7E28'}
			                
			        ],
			       highlighter: { 
					     lineWidthAdjust: 50, //当鼠标移动到放大的数据点上时，设置增大的数据点的宽度,目前仅适用于非实心数据点 
					     sizeAdjust: 10, // 当鼠标移动到数据点上时，数据点扩大的增量增量 
					     showTooltip: true, // 是否显示提示信息栏 
					     tooltipLocation: 'nw', // 提示信息显示位置（英文方向的首写字母）: n, ne, e, se, s, sw, w, nw. 
					     tooltipAxes: 'y', // 提示信息框显示数据点那个坐标轴上的值，目前有横/纵/横纵三种方式,值分别为 x, y or xy. 
					     tooltipSeparator: '' // 提示信息栏不同值之间的间隔符号 
				    } ,
			        axes: {
			        	 <c:if test="${requestScope['date'] != '[]'}">
			        	xaxis:{
			            	ticks:date,
			                renderer:$.jqplot.CategoryAxisRenderer
			            },
			            x2axis: {
			            	ticks:date,
			                renderer:$.jqplot.CategoryAxisRenderer
				          },
			           </c:if>
			           <c:if test="${requestScope['date'] == '[]'}">
			            xaxis:{
				            renderer:$.jqplot.DateAxisRenderer, 		              
				            //min:bDate, 
				            //max:eDate,
		                    tickOptions:{formatString:'%m-%d'},
		                    tickInterval:'1 week'
				        },  
				        x2axis: {
				        	 renderer:$.jqplot.DateAxisRenderer, 		              
					            
			                    tickOptions:{formatString:'%m-%d'},
			                    tickInterval:'1 week'
				          },
				        </c:if>
				       
			            yaxis:{min:0,numberTicks:11,renderer: $.jqplot.LogAxisRenderer},
			            y2axis: {min:0,numberTicks:11}
			        }
			        
			         
			        
			      });
			    	
			

			  });
			
			 function query(type){   
				
				var bDate = $('input[name="bDate"]').val();
				var eDate = $('input[name="eDate"]').val();	
				var customerId = $('select[name="customerId"]').val();
				var inOut = "";
				//var inOut = $('input[@name=inOut][@checked]').val();
				$("input[name='inOut'][checked]").each(function(){
				    if (true == $(this).attr("checked")) {
				    	inOut = inOut + $(this).attr('value') + ",";
				    	
				    }
				}); 
				
				if(type == 'businessQuantityChart'){
				
            		window.showModalDialog("stockItems.do?method="+type+"&bDate="+bDate+"&eDate="+eDate+"&customerId="+customerId+"&inOut="+inOut,"","dialogWidth=950px;dialogHeight=450px;");
				}else if(type == 'chart'){
					 $("#contrast").hide();
					 $("#cancel").hide();
					 
					location.href="stockItems.do?method=chart&bDate="+bDate+"&eDate="+eDate+"&customerId="+customerId+"&inOut="+inOut;  
				
				}else if(type == 'contrast'){
					 $("#contrast").show();
					 $("#cancel").show();
					location.href="stockItems.do?method=contrast&bDate="+bDate+"&eDate="+eDate+"&customerId="+customerId+"&inOut="+inOut;  
				
				}
				else{
				
					location.href="stockItems.do?method=all&bDate="+bDate+"&eDate="+eDate+"&customerId="+customerId+"&inOut="+inOut;   
            	
				}
            };
			
			
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
			    	
				    	<label>起止日期</label>
				    						<div style="float: left">
					    						<input value="${bDate}" name="bDate" class="Wdate" onclick="WdatePicker()" style="width: 100px"/>
					    						 - <input value="${eDate}" name="eDate" class="Wdate" onclick="WdatePicker()" style="width: 100px;margin-left:0px"/>
				    						</div>		
			    							<div id="contrast" style="float: left;width: 260px;display: block;">
				    							&nbsp;对比
				    							<input value="${bDate1}" name="bDate1" class="Wdate" onclick="WdatePicker()" style="width: 100px;margin-left:0px"/>
												- <input value="${eDate1}" name="eDate1" class="Wdate" onclick="WdatePicker()" style="width: 100px;margin-left:0px"/>
											</div> 
												<input style="width:50px;background-color: D4D0C8;border: 1px solid #666;padding-top: 4px;font-size: 12px;width:80px" type="button" onclick="query('contrast')" value="按时间对比"/>
												<input id="cancel" style="width:50px;background-color: D4D0C8;border: 1px solid #666;padding-top: 4px;font-size: 12px;width:80px" type="button" onclick="query('chart')" value="取消对比"/>
			    						
				    							<br />
				    	
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
				    	
				    	<input style="width: 15px;border: 0px;float: left" name="inOut" id="1" type="checkbox"  value="1" />
						<label style="width: 35px;border: 0px;text-align: left" for="1">入库</label>
						
						<input style="width: 15px;border: 0px;float: left" name="inOut" id="0" type="checkbox"  value="0" />
						<label style="width: 35px;border: 0px;text-align: left" for="0">出库</label>	
						
						<input style="width: 15px;border: 0px;float: left" name="inOut" id="2" type="checkbox"  value="2" />
						<label style="width: 35px;border: 0px;text-align: left" for="2">结存</label><br />		
				   
					<div style="padding-left: 385px;">
						<input style="width:50px;background-color: D4D0C8;border: 1px solid #666;padding-top: 4px;font-size: 12px" type="button" onclick="query('chart')" value="查询"/>
						
					</div>			  					
			    </div> 
			</div>
			
			<div style="height: 37px;">
				
				<a href="#" onclick="query('all')" style="border:1px solid #bbbbbb;border-bottom:0px;width:100px;height:36px;line-height: 36px;float:left;text-align: center;background-image:url('images/bg.gif');background-repeat:repeat-x;text-decoration:none;">数据列表</a>
				<a style="border: 1px solid #bbbbbb;border-bottom:0px;border-left:1px solid #F5F5F5;width:100px;height:37px;line-height: 36px;float:left;text-align: center;background-image:url('images/bg_1.gif');background-repeat:repeat-x;text-decoration:none;">图形</a>
				
			
			</div>
			<div style="border: 1px solid #aaaaaa;padding:10px;">
				<div id="chart1" style="margin-top:10px; margin-left:10px;  height:380px;"></div>
				
			</div>
			
			
		</div>
			
		</html:form>
			
		</div>
	</body>
</html>

