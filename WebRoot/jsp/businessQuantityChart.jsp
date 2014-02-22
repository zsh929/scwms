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
		<script language="javascript" type="text/javascript" src="plug-in/jqplot/plugins/jqplot.highlighter.js"></script>
		<script language="javascript" type="text/javascript" src="plug-in/jqplot/plugins/jqplot.pieRenderer.lineLabels.js"></script>
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
		pie1=${requestScope['stockRecord.list']};
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
		<div style="border: 1px solid #999;margin-top: 15px">
			<div style="background-color: #eee;padding: 5px;border-bottom: 1px solid #999">当前储量</div>
			<div style="margin: 5px">
				<div id="chart5" style="margin-top:20px; margin-left:20px; width:920px; height:380px;"></div>
			</div>
		</div>
  </body>
</html>