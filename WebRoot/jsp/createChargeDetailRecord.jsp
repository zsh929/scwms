<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%> 
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html> 
	<head>
		<title></title>
		<link type="text/css" rel="stylesheet" href="css/common.css" />
		<script language="javascript" type="text/javascript" src="plug-in/My97Datepicker/WdatePicker.js"></script>
		<script type='text/javascript' src='plug-in/autocomplete/jquery.autocomplete.js'></script>
		
		<link rel="stylesheet" type="text/css" href="plug-in/autocomplete/jquery.autocomplete.css" />
	
	<script type="text/javascript">
	   
		//var months = ${cargoEditForm.jsonList};
		//$('div[name="AAA"]').hide();
		$().ready(function() {
			
			//$('select[name="locationId"]').change(function(){
		    //    if($(this).children('option:selected').val() == '33_三号库-2-'){
		    //    	$('div[name="AAA"]').show();
		    //    }else{
		    //    	$('div[name="AAA"]').hide();
		    //    };  
		    //});

			
			
		 	//$('input[name="serialNumber"]').val(stockInForm.serialNumber.value);
			//$('input[name="customerName"]').val(stockInForm.customerName.value);
			//$('input[name="customerId"]').val(stockInForm.customerId.value);
			//$('input[name="personHandling"]').val(stockInForm.personHandling.value);
			//$('input[name="time"]').val(stockInForm.time.value);
			
			//$('input[name="name"]').focus().autocomplete(months, {
		
			//	formatItem: function(row, i, max) {
			//		return "\"" + row.name + "\" [" + row.weight + " kg]";
			//	},
			//	formatMatch: function(row, i, max) {
			//		return row.name + " " + row.weight;
			//	},
			//	formatResult: function(row) {
			//		return row.name;
			//	}
			//});
			
			
			
			
			$('input[name="name"]').result(function(event,data,formatted) {
				
			    $('input[name="id"]').val(data.id);
			    $('input[name="number"]').val(data.number);
			    $('select[name="category"]').attr("value",data.category);
			    $('input[name="size"]').val(data.size);
			    $('select[name="unit"]').val(data.unit);
			    $('input[name="weight"]').val(data.weight);
			    $('input[name="grossWeight"]').val(data.grossWeight);
			});
			
			   $('input[name="area"],input[name="unitPrice"]').change(function(){
    
			      var area = $('input[name="area"]').val();
			      var unitPrice = $('input[name="unitPrice"]').val();
			     
			      
			      $('input[name="totalPrice"]').val((area*unitPrice).toFixed(2));
			     
			    
			    });
			    
			    $('select[name="warehouseId"]').change(function(){ 
			    	
					var area = $(this).children('option:selected').text();
					area = area.substring(area.lastIndexOf("(")+1,area.lastIndexOf("㎡"));
					$('input[name="area"]').val(area);
				});
				
				var type = $('select[name="type"]').children('option:selected').val();
				setChargeLayout(type);
				function setChargeLayout(type){
					if(type == 'chargeType.1'){
						$('#warehouseIdLabel').show();
						$('#areaLabel').show();
						$('#totalPriceLabel').show();
						$('#chargeDate2Label').hide();
					}else if(type == 'chargeType.2' || type == 'chargeType.3'){
						$('#warehouseIdLabel').hide();
						$('#areaLabel').hide();
						$('#totalPriceLabel').hide();
						$('#chargeDate2Label').show();
					}else{
						$('#warehouseIdLabel').hide();
						$('#areaLabel').hide();
						$('#totalPriceLabel').hide();
						$('#chargeDate2Label').hide();
					}
				
				
				
				}
				
				
				
				$('select[name="type"]').change(function(){ 
			    	var type = $(this).children('option:selected').val();
					setChargeLayout(type);
					
				});		
				
				$('input[name="paymentAmount"]').change(function(){
    				
			      var paymentAmount = $(this).val();
			     
			      var paymentAmount = convert(paymentAmount);
			      $(this).val(paymentAmount);
			     
			    
			    });
			    	    
			     
			    
		});
		
			function convert(money) {
	            var patrn=/^(-)?(([1-9]{1}\d*)|([0]{1}))(\.(\d){1,2})?$/;

				if (!patrn.exec(money)) {
				 alert('false'); }
        	}
		
		</script>
	</head>
	<body>
		
		<html:form styleId="chargeEdit" action="/chargeDetail.do?method=createChargeDetailRecord">
		<div id="form_stylized" class="myform" >
			
			<label>收费项目名称</label><html:text property="description" style="width:120px"/><br/>
			<label>收费金额</label><html:text property="totalPrice" style="width:120px;text-align:right"/>
			<html:hidden property="customerId"/>
			<html:hidden property="date"/>
			
		</div>
		
		</html:form>
			
	</body>
</html>

