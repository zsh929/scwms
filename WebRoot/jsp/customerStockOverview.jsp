<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html> 
	<head>
		<title></title>
		
		 <!--[if IE]><script language="javascript" type="text/javascript" src="plug-in/jqplot/excanvas.js"></script><![endif]-->
  
 
  
  <!-- BEGIN: load jquery -->
  <!-- END: load jquery -->
  
  <!-- BEGIN: load jqplot -->
  		
  <!-- END: load jqplot -->
	
	<script type="text/javascript">
	    $(document).ready(function(){

   line1=${requestScope['balanceWeight']};
   line2=${requestScope['inWeight']};
   line3=${requestScope['outWeight']};
   date=${requestScope['date']};
   
   plot2 = $.jqplot('chart6', [line1,line2,line3], {
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
    	

  });
		
		</script>
		<style type="text/css" media="screen">
			.weedialog{width:650px; color:#444;}
		</style>
		
	</head>
	<body>
		
		<div >
			<div id="chart6" style="margin-top:10px; margin-left:10px; width:580px; height:280px;"></div>
		</div>
		
			
	</body>
</html>

