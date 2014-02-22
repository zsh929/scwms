<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html> 
	<head>
		<title></title>
		<link type="text/css" rel="stylesheet" href="css/common.css" />
		<script language="javascript" type="text/javascript" src="plug-in/My97Datepicker/WdatePicker.js"></script>
		<script language="javascript" type="text/javascript" src="plug-in/My97DatePicker/WdatePicker.js"></script>
		<script type='text/javascript' src='plug-in/autocomplete/jquery.autocomplete.js'></script>
		<link rel="stylesheet" type="text/css" href="plug-in/autocomplete/jquery.autocomplete.css" />
	
	<script type="text/javascript">
	
		var months = ${cargoEditForm.jsonList};
		$().ready(function() {
			
			
		 	$('input[name="serialNumber"]').val(stockInForm.serialNumber.value);
			$('input[name="customerName"]').val(stockInForm.customerName.value);
			$('input[name="personHandling"]').val(stockInForm.personHandling.value);
			$('input[name="time"]').val(stockInForm.time.value);
			
			$('input[name="name"]').focus().autocomplete(months, {
		
				formatItem: function(row, i, max) {
					return i + "/" + max + ": \"" + row.name + "\" [" + row.weight + "]";
				},
				formatMatch: function(row, i, max) {
					return row.name + " " + row.weight;
				},
				formatResult: function(row) {
					
		
					return row.name;
				}
		
			});
			
			$('input[name="name"]').change(function(){fNameChange();}); 
			$('input[name="name"]').keyup(function(){fNameChange();}); 
			 
			 function fNameChange(){
			 
				var name = $('input[name="name"]').val();
				
				for(var i=0; i<months.length; i++)
				  {
				 	//alert();
				    if(name == months[i].name){
				    	var id= months[i].id;
					    $('input[name="id"]').val(id);
					    var number= months[i].number;
					    $('input[name="number"]').val(number);
					    var category= months[i].category;
					    $('select[name="category"]').attr("value",category);
					   // $('select[name="category"]').val(category);
					    var size= months[i].size;
					    $('input[name="size"]').val(size);
					    var unit= months[i].unit;
					    $('select[name="unit"]').val(unit);
					    var weight= months[i].weight;
					    $('input[name="weight"]').val(weight);
					    
					    break;

				    }
				    
				  }
				
			}
		});
		
		
		</script>
	</head>
	<body>
		
		<html:form action="/addStockInCargo.do?method=add">
		<div id="form_stylized" class="myform">
			<html:hidden property="id"/><html:errors property="id"/><br/>
			<label>编号 </label><html:text property="number"/><html:errors property="number"/><br/>
			<label>货物名称 </label><html:text property="name"/><html:errors property="name"/><br/>
			<label>货物类型 </label>
			<select id="category" name="category" >
				<c:forEach var="sys" items="${cargoEditForm.categoryList}" >
					<option  value="${sys.codeKey }">${sys.codeValue }</option>
				</c:forEach>
			</select>
			
			<html:errors property="category"/><br/>
			<label>规格 </label><html:text property="size" /><html:errors property="size"/><br/>
			<label>单位 </label>
			<select id="unit" name="unit" >
				<c:forEach var="sys" items="${cargoEditForm.unitList}" >
					<option  value="${sys.codeKey }">${sys.codeValue }</option>
				</c:forEach>
			</select>

			<html:errors property="unit"/><br/>		
			<label>重量 </label><html:text property="weight" /><html:errors property="weight"/><br/>
			<html:hidden property="serialNumber"/>
			<html:hidden property="customerName"/>
			<html:hidden property="personHandling"/>
			<html:hidden property="time"/>
			
			<html:submit/><html:cancel/>
		</div>
		</html:form>
	</body>
</html>

