<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html> 
	<head>
  <title>分类汇总表</title>
  <!--[if IE]><script language="javascript" type="text/javascript" src="plug-in/jqplot/excanvas.js"></script><![endif]-->
  
  <link rel="stylesheet" type="text/css" href="plug-in/jqplot/jquery.jqplot.css" />
  
  <!-- BEGIN: load jquery -->
  <script language="javascript" type="text/javascript" src="plug-in/jqplot/jquery-1.3.2.min.js"></script>
  <!-- END: load jquery -->
  
  <!-- BEGIN: load jqplot -->
	   <script language="javascript" type="text/javascript" src="plug-in/jqplot/jquery.jqplot.js"></script>
       <script language="javascript" type="text/javascript" src="plug-in/jqplot/plugins/jqplot.dateAxisRenderer.js"></script>
	   <script language="javascript" type="text/javascript" src="plug-in/jqplot/plugins/jqplot.barRenderer.js"></script>
	   <script language="javascript" type="text/javascript" src="plug-in/jqplot/plugins/jqplot.categoryAxisRenderer.js"></script>
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
	
	line1 = [
		<c:forEach items="${requestScope['list']}" var="object" >
		['<c:out value="${object[0][0]}"/>' ,<c:out value="${object[0][2]}" />],
									
		
	</c:forEach>
	];
	line2 = [
	<c:forEach items="${requestScope['list']}" var="object" >
		['<c:out value="${object[0][0]}"/>' ,<c:out value="${object[0][3]}" />],
									
		
	</c:forEach>
	];
	line3 = [
	<c:forEach items="${requestScope['list']}" var="object" >
		['<c:out value="${object[0][0]}"/>' ,<c:out value="${object[0][4]}" />],
									
		
	</c:forEach>
	];
	
	plot3 = $.jqplot('chart', [line1, line2, line3], {
	    seriesDefaults:{renderer:$.jqplot.BarRenderer, rendererOptions:{barPadding:10, barMargin:10}},
	    legend: {show:true, location: 'nw'},
	    series: [{label: '入库量'},{label: '出库量'},{label: '结存'}],
	    axes:{xaxis:{renderer:$.jqplot.CategoryAxisRenderer},yaxis:{min:0, numberTicks:20}}
	    });
	
	
	  });
  </script>
  </head>
  <body>

    <div id="chart" style="margin-top:20px; margin-left:50px; width:660px; height:500px;"></div>
    
  </body>
</html>