<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
  <title>出入库情况表</title>
  <!--[if IE]><script language="javascript" type="text/javascript" src="plug-in/jqplot/excanvas.js"></script><![endif]-->
  
  <link rel="stylesheet" type="text/css" href="plug-in/jqplot/jquery.jqplot.css" />
  <link type="text/css" rel="stylesheet" href="plug-in/weebox/weebox.css" />
  <!-- BEGIN: load jquery -->
  <script language="javascript" type="text/javascript" src="plug-in/jqplot/jquery-1.3.2.min.js"></script>
  <!-- END: load jquery -->
  
  <!-- BEGIN: load jqplot -->
  		<script language="javascript" type="text/javascript" src="plug-in/jqplot/jquery.jqplot.js"></script>
		<script language="javascript" type="text/javascript" src="plug-in/jqplot/plugins/jqplot.canvasTextRenderer.js"></script>
		<script language="javascript" type="text/javascript" src="plug-in/jqplot/plugins/jqplot.canvasAxisTickRenderer.js"></script>
		<script language="javascript" type="text/javascript" src="plug-in/jqplot/plugins/jqplot.dateAxisRenderer.js"></script>
		<script language="javascript" type="text/javascript" src="plug-in/jqplot/plugins/jqplot.barRenderer.js"></script>
		<script language="javascript" type="text/javascript" src="plug-in/jqplot/plugins/jqplot.categoryAxisRenderer.js"></script>
		<script language="javascript" type="text/javascript" src="plug-in/jqplot/plugins/jqplot.highlighter.js"></script>
 		<script language="javascript" type="text/javascript" src="plug-in/jqplot/plugins/jqplot.pieRenderer.lineLabels.js"></script>
 		<script type="text/javascript" src="plug-in/weebox/bgiframe.js"></script>
		<script type="text/javascript" src="plug-in/weebox/weebox.js"></script>
  <!-- END: load jqplot -->
  <style type="text/css" media="screen">
    .jqplot-axis {
      font-size: 0.85em;
    }
    .jqplot-title {
      font-size: 1.1em;
    }
    a.filter{border:1px solid #0188CC;padding:5px 5px 2px 5px;text-decoration:none;font-size: 12px}
	a.filter:hover{border:1px solid #0188CC;padding:5px 5px 2px 5px;text-decoration:underline;background-color: #CBE9F1;font-size: 12px}
	a.filter1{border:1px solid #0188CC;padding:5px 5px 2px 5px;text-decoration:none;background-color: #0188CC;color:#ffffff;font-size: 12px}
  
  	a.customerName{text-decoration:none;}
    a.customerName:hover{text-decoration:underline;}
    
  </style>
  <script type="text/javascript" language="javascript">
  
  	function openBox(customerId,customerName){
		
		$.weeboxs.open('stockAnalyze.do?method=customerStockOverview&customerId='+customerId, {title:customerName, 
																			 contentType:'ajax'
																			});
	
	}
  
  
  $(document).ready(function(){

   line1=${requestScope['balanceWeight']};
   line2=${requestScope['inWeight']};
   line3=${requestScope['outWeight']};
   pie1=${requestScope['pieChartData']};
   date=${requestScope['date']};
  
   var numberOfDays=${requestScope['numberOfDays']};
   
   var i = 2;
  
   if(numberOfDays != null){
     i = parseInt(numberOfDays/8);
   } 
  if(numberOfDays == 30){
  	$('a[name="filter1"]').addClass("filter1");
  }else if(numberOfDays == 90){
  	$('a[name="filter2"]').addClass("filter1");
  }else if(numberOfDays == 180){
  	$('a[name="filter3"]').addClass("filter1");
  }else if(numberOfDays == 365){
  	$('a[name="filter4"]').addClass("filter1");
  }
  
  if(numberOfDays == 365){
   		plot2 = $.jqplot('chart2', [line1,line2,line3], {
        legend: {show: true, location: 'nw'},
        series: [
          {label: '结存(吨)', fill:false,color:'#000000'},
          {label: '入库(吨)',yaxis:'y2axis', fill:false,color:'#009966'}, 
          {label: '出库(吨)',yaxis:'y2axis', fill:false,color:'#FF6600'}
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
             xaxis:{
             ticks:date,
                renderer:$.jqplot.CategoryAxisRenderer
            },
            // yaxis: {min: -5, max: 25, numberTicks:7}
            yaxis:{min:0,numberTicks:11,  renderer: $.jqplot.LogAxisRenderer},
            y2axis: {min:0,numberTicks:11}
        }
        
         
        
      });
   
     }else {
     
     	plot2 = $.jqplot('chart2', [line1,line2,line3], {
        legend: {show: true, location: 'nw'},
        series: [
          {label: '结存(吨)', fill:false,color:'#000000'},
          {label: '入库(吨)',yaxis:'y2axis', fill:false,color:'#009966'}, 
          {label: '出库(吨)',yaxis:'y2axis', fill:false,color:'#FF6600'}
        ],
       
        axes: {
             xaxis:{
                renderer:$.jqplot.DateAxisRenderer, 
               
                
                
                tickInterval:i+' day',
                rendererOptions:{
                    tickRenderer:$.jqplot.CanvasAxisTickRenderer},
                    tickOptions:{formatString:'%Y-%m-%d', fontSize:'10px',fontStretch:1}
            },
            // yaxis: {min: -5, max: 25, numberTicks:7}
            yaxis:{min:0,numberTicks:11,  renderer: $.jqplot.LogAxisRenderer},
            y2axis: {min:0,numberTicks:11}
        }
         
        
        });
    	
    }
    	plot5 = $.jqplot('chart5', [pie1], {
	
	  	seriesDefaults:{renderer:$.jqplot.PieRenderer, rendererOptions:{padding:22,sliceMargin:8,lineLabels: true,shadow: false}}, 
	  	legend:{show:true,location: 'e'},
	  	grid: {
			 background: '#ffffff', 
			 borderWidth: 0.0, 
			 shadow: false}
		});
    

  });
  </script>
  </head>
  <body>
	<div id="main">
		<jsp:include page="common/top.jsp" flush="true" />
			<div style="border: 1px solid #999">
				<div style="background-color: #eee;padding: 5px;border-bottom: 1px solid #999">出入库及结存量概况</div>
				<div style="margin: 5px">
					<div>
						<font style="font-size:12px;margin: 0px 5px 0px 0px">最近</font>
						<a name="filter1" class="filter" href="stockAnalyze.do?method=stockOverview&numberOfDays=30">一个月</a>
						<a name="filter2" class="filter" href="stockAnalyze.do?method=stockOverview&numberOfDays=90">三个月</a>
						<a name="filter3" class="filter" href="stockAnalyze.do?method=stockOverview&numberOfDays=180">半年</a>
						<a name="filter4" class="filter" href="stockAnalyze.do?method=stockOverview&numberOfDays=365">一年</a>
					</div>
				
					<div id="chart2" style="margin-top:20px; margin-left:50px; width:920px; height:280px;"></div>
				</div>
			</div>
			<div style="border: 1px solid #999;margin-top: 15px">
				<div style="background-color: #eee;padding: 5px;border-bottom: 1px solid #999">当前储量</div>
				<div style="margin: 5px">
					<div id="chart5" style="margin-top:20px; margin-left:20px; width:920px; height:310px;"></div>
				</div>
			</div>
			<div style="border: 1px solid #999;margin-top: 15px">
				<div style="background-color: #eee;padding: 5px;border-bottom: 1px solid #999">当前储量</div>
				<div >
					<table cellpadding="0" cellspacing="0" border="0" class="style1" style="border: 1px solid #fff">
						<thead>
							<tr>
								<th rowspan="2">序号</th>
								<th rowspan="2">客户名称</th>
								<th rowspan="2"  align="center">结存</th>
								
								<th colspan="2" align="center">昨日</th>
								<th colspan="2" align="center">7日内</th>
								<th colspan="2" align="center">30日内</th>
								<th colspan="2" align="center">90日内</th>
								
							</tr>
							<tr>
								<th>出库</th>
								<th>入库</th>
							
								<th>出库</th>
								<th>入库</th>
								<th>出库</th>
								<th>入库</th>
								<th>出库</th>
								<th>入库</th>
								
							</tr>
						</thead>
					
						<c:forEach items="${requestScope['stockOutInData']}" var="data" varStatus="index">
			
							<tr>	
								<td align="center">
									 ${index.count}
									
								</td>					
								<td>
									<a class="customerName" onclick="openBox(${data[10]},'${data[0]}');" href=javascript:void(0)>
										<c:out value="${data[0]}" /> 
									</a>
								</td>
								<td align="right" style="color: #FF6600;font-weight:bold">
									<c:out value="${data[9]}" /> 
									
								</td>
								<td align="right" style="color: #FF6600;font-weight:bold">
									<c:out value="${data[7]}" /> 
									
								</td>
								<td align="right" style="color: #009966;font-weight:bold">
									<c:out value="${data[8]}" /> 
									
								</td>
							
								<td align="right" style="color: #FF6600;font-weight:bold">
									<c:out value="${data[1]}" /> 
									
								</td>
								<td align="right" style="color: #009966;font-weight:bold">
									<c:out value="${data[2]}" /> 
									
								</td>
								<td align="right" style="color: #FF6600;font-weight:bold">
									<c:out value="${data[3]}" /> 
									
								</td>
								<td align="right" style="color: #009966;font-weight:bold">
									<c:out value="${data[4]}" /> 
									
								</td>
								<td align="right" style="color: #FF6600;font-weight:bold">
									<c:out value="${data[5]}" /> 
									
								</td>
								<td align="right" style="color: #009966;font-weight:bold">
									<c:out value="${data[6]}" /> 
									
								</td>
								
							</tr>      
						</c:forEach>
					</table>
				</div>
			</div>
			
		
				
		
		
	</div>
    
  </body>
 
  
  
</html>
		

