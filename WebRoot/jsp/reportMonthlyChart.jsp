<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html> 
	<head>
  <title>出入库情况表</title>
  <!--[if IE]><script language="javascript" type="text/javascript" src="plug-in/jqplot/excanvas.js"></script><![endif]-->
  
  <link rel="stylesheet" type="text/css" href="plug-in/jqplot/jquery.jqplot.css" />
  
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
		<script language="javascript" type="text/javascript" src="plug-in/jqplot/plugins/jqplot.pieRenderer.js"></script>
		<script language="javascript" type="text/javascript" src="plug-in/jqplot/plugins/jqplot.highlighter.js"></script>

  <!-- END: load jqplot -->
  <style type="text/css" media="screen">
    .jqplot-axis {
      font-size: 0.85em;
    }
    .jqplot-title {
      font-size: 1.1em;
    }
  </style>
  <script type="text/javascript" language="javascript">
  
  $(document).ready(function(){

   line1=${requestScope['balanceWeight']};
   line2=${requestScope['inWeight']};
   line3=${requestScope['outWeight']};
   
   plot2 = $.jqplot('chart2', [line1,line2,line3], {
        title:'出入库情况表',
        legend: {show: true, location: 'nw'},
        series: [
          {label: '结存(吨)', fill:false,color:'#000000'},
          {label: '入库(吨)',yaxis:'y2axis', fill:false,color:'#009966'}, 
          {label: '出库(吨)',yaxis:'y2axis', fill:false,color:'#FF6600'}
        ],
       
        axes: {
             xaxis:{
                renderer:$.jqplot.DateAxisRenderer, 
                
                tickInterval:'5 day',
                rendererOptions:{
                    tickRenderer:$.jqplot.CanvasAxisTickRenderer},
                    tickOptions:{formatString:'%Y-%m-%d', fontSize:'10pt', fontFamily:'Tahoma', angle:-40, fontWeight:'normal', fontStretch:1}
            },
            // yaxis: {min: -5, max: 25, numberTicks:7}
            yaxis:{min:0,numberTicks:16,  renderer: $.jqplot.LogAxisRenderer},
            y2axis: {min:0,numberTicks:16}
        }
         
        
        });
    
     

  });
  </script>
  </head>
  <body>

    <div id="chart2" style="margin-top:20px; margin-left:50px; width:${requestScope['width']}px; height:500px;"></div>
    
  </body>
</html>