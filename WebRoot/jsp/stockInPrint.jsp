<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<!--打印控件 --> 
<object id="factory" style="display:none" classid="clsid:1663ed61-23eb-11d2-b92f-008048fdd814" codebase="/jsp/smsx.cab" viewastext></object> 
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib prefix="logic" uri="/WEB-INF/tlds/struts-logic.tld" %>
<%@ taglib prefix="html"  uri="/WEB-INF/tlds/struts-html.tld"  %>

<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>入库打印</title>
		
		<style type="text/css" title="currentStyle">
			table.tableHead{font-size: 14px;margin:0px}
			table.tableMain{border-collapse:collapse;margin:0px}
			table.tableMain th{border-bottom: 2px solid #000;font-size: 14px;padding:5px 0px}
			table.tableMain td{border-bottom: 1px solid #000;font-size: 14px;padding:2px;text-align: center;}
			
			table.tableFoot{font-size: 14px;}
			table.tableFoot td{padding: 5px 0px}
			
			
			
		</style>
		<style media="print">
			.noprint{display: none }
		</style>
		
		<link type="text/css" rel="stylesheet" href="plug-in/weebox/weebox.css" />
		<script type="text/javascript" src="plug-in/lightTreeview/jquery-1.2.6.js"></script>
		<script type="text/javascript" src="plug-in/dynamicorderform/js/order.js"></script>
		<script type="text/javascript" language="javascript" src="plug-in/dataTables/js/jquery.dataTables.js"></script>
		<script type="text/javascript" src="plug-in/weebox/bgiframe.js"></script>
		<script type="text/javascript" src="plug-in/weebox/weebox.js"></script>
		<script type='text/javascript' src='plug-in/autocomplete/jquery.autocomplete.js'></script>
		<link rel="stylesheet" type="text/css" href="plug-in/autocomplete/jquery.autocomplete.css" />
	
	<script type="text/javascript">
		
	
		$().ready(function() {
			
			
			
			var wholeWeight = 0;

		    $('input[name="totalWeight"]').each(function(){
		    
		        var valString = $(this).val() || 0;
		        
		        wholeWeight += parseFloat(valString);
		                    
		    });
       
       		var wholeQuantity = 0;

		    $('input[name="quantity"]').each(function(){
		    
		        var valString = $(this).val() || 0;
		        
		        wholeQuantity += parseInt(valString);
		                    
		    });
       
    		$("#wholeWeight").text(wholeWeight);
			$("#wholeQuantity").text(wholeQuantity);
			
			
			
		});
		
		
		
//横向打印设置 
function pageprint() { 
   document.all("print").style.display="none"; 
   factory.printing.header = ""; 
   factory.printing.footer = ""; 
   factory.printing.portrait = false; //portrait是指打印方向，设置为true就是纵向，false就是横向。 
   factory.DoPrint(false); //设置为false，直接打印 
   factory.printing.leftMargin =10.00;

factory.printing.topMargin =10.00;

factory.printing.rightMargin =10.00;

factory.printing.bottomMargin =10.00;

   document.all("print").style.display=""; 
} 
//打印预览 
function pagePrintView(){ 
   document.all("print").style.display="none"; 
   factory.printing.header = ""; 
   factory.printing.footer = ""; 
   factory.printing.portrait = false; //portrait是指打印方向，设置为true就是纵向，false就是横向。 
   factory.printing.leftMargin =0.00;

factory.printing.topMargin =0.00;

factory.printing.rightMargin =0.00;

factory.printing.bottomMargin =0.00;
   factory.printing.Preview();//打印预览 
   document.all("print").style.display=""; 
} 

function pagePrintSet(){ 
factory.printing.leftMargin =10.00;

factory.printing.topMargin =10.00;

factory.printing.rightMargin =10.00;

factory.printing.bottomMargin =10.00;
 // factory.printing.paperSize ="B5";  

   factory.printing.PageSetup();//打印设置 
} 

		
		
		
		</script>
		<script language="javascript" type="text/javascript" src="plug-in/My97DatePicker/WdatePicker.js"></script>

	</head>
	<body >
	
		<div id="main" style="width: 190mm; height: 93mm; border: 1px solid #333">
		
		<html:form styleId="stockIn" action="/stockIn.do?method=verify" >
			
		<div >
		 	<h1 style="font-size: 16px; text-align: center; padding:0px;margin: 0px">硕春冷库入库单</h1>
  			<table class="tableHead" width="100%">
	  			<tr>
					<td width="33%">对方：<c:out value="${stockInForm.customerName}" /></td>
					<td width="33%">入库日期：<c:out value="${stockInForm.time}"/></td>
					<td width="33%">单号：<c:out value="${stockInForm.serialNumber}" /></td>
				</tr>
			</table>
		</div>
		<div >
		<table cellpadding="0" cellspacing="0" border="0" class="tableMain"  width="100%" >
			<thead style="">
				<tr>
					<th>编码</th>
					<th>名称</th>
					<th>单位</th>
					<th>数量</th>
					<th>总重量</th>
					<th>储位</th>
					<th>备注</th>
				</tr>
			</thead>
			<c:forEach items="${sessionScope['cargoList']}" var="cargo" varStatus="status">
			
				<tr>						
					<td align="right">
						<c:out value="${cargo.number}" /> 
					</td>
					<td align="right">
						<c:out value="${cargo.name}" />
					</td>
					
					<td align="right">
						<c:out value="${cargo.weight}" />kg/<c:out value="${cargo.unit}" />
						
					</td>
					<td align="right">
						<c:out value="${cargo.quantity}" />
						
						
					</td>	
					<td align="right">
						
						
						<c:out value="${cargo.totalWeight}" />
						
						
					</td>
					<td>
						<c:out value="${cargo.locationName}" />
						
					</td>
					<td>
						
					</td>		
				</tr>      
			</c:forEach>
			<tfoot>
				
				<tr>
					<th colspan="3" align="right">合计</th>
					<th align="right" valign="top" id="wholeQuantity">
						
					</th>
					<th align="right" valign="top" id="wholeWeight">
						
					</th>
					<th colspan="2" align="right" valign="top" >
						
						
					</th>
				</tr>
				
			</tfoot>
			</table>
			
		</div>
		<div id="">
		 	
  			<table class="tableFoot" width="100%">
	  			<tr>
					<td width="25%">保管：</td>
					<td width="25%">验收：</td>
					<td width="25%">交物人：</td>
					<td width="25%">制票：</td>
				</tr>
			</table>
		</div>
		<div class="noprint">
			<input type="button"   value="打印" onclick="print();return false;"/>
		
		</div>
		
		<div	 id="print"> 
		
<!-- 打印 --> 
<span style="font-family:'Arial',sans-serif;font-size:22.964;"><input value="打 印" type="button" onClick="pageprint()"/></span> 
<span style="font-family:'Arial',sans-serif;font-size:22.964;"><input value="打印预览" type="button" onClick="pagePrintView()"/></span> 
<span style="font-family:'Arial',sans-serif;font-size:22.964;"><input value="打印设置" type="button" onClick="pagePrintSet()"/></span> 
</div> 
		
		
		
		</html:form>
			<script type="text/javascript">
			
				
			function print(){
				stockIn.action="stockIn.do?method=print";
				stockIn.submit();				
			
			}	
				
			</script>
		</div>
	</body>
</html>


