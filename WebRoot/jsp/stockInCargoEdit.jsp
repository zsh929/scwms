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
			
	      	  
	</style>
	<script type="text/javascript">
	   
		var months = ${cargoEditForm.jsonList};
		$('div[name="AAA"]').hide();
		
		cancelErrorMessage(["name"],"");
		cancelErrorMessage(["qty","totalWht"],"qty");
		
		function addStockInCargo(box){
			   var validateList1 = ['name'];
			   var validateList2 = ['qty','totalWht'];
			   var validateResult1 = validateNotEmpty(validateList1);
			   var validateResult2 = validateIsNotAllEmpty(validateList2);
			
			   if(validateResult1 == false || validateResult2 == false){
					 return;
				 }
			   var id = $('input[name="id"]').val();
			   var number =  $("#number").val();
			   var category =  $("#category").val();
			   var size =  $("#size").val();
			   var unit =  $("#unit").val();
			   var weight =  $("#wht").val();
			   var grossWeight =  $("#grossWeight").val();
			   
			   var name = $("#name").val();
			   var customerId =  $("#customerId").val();
			   var batchNumber =  $("#batchNumber").val();
			   var dateProduce =  $("#dateProduce").val();
			   var quantity =  $("#qty").val();
			   var totalWeight =  $("#totalWht").val();
			   var unitPrice =  $("#unitPrice").val(); 
			   var countUnit =  $("#countUnit").val();
			   var totalPrice =  $("#totalPrice").val();
			   var locationId =  $("#locationId").val();
			  
			   var jsonStr="({" + 
				           "id:" + 11 + "," + 
				           "number:" + "\"" +number + "\"," + 
				           "category:" + "\"" + category + "\"," + 
				           "size:" + "\"" + size + "\"," + 
				           "unit:" + "\"" + unit + "\"," + 
				           "weight:" + "\"" + weight + "\"," + 
				           "grossWeight:" + "\"" + grossWeight + "\"," + 
				           "name:" + "\"" + name + "\"," + 
				           "customerId:" + "\"" + customerId + "\"," + 
				           "batchNumber:" + "\"" + batchNumber + "\"," + 
				           "dateProduce:" + "\"" + dateProduce + "\"," + 
				           "quantity:" + "\"" + quantity + "\"," + 
				           "totalWeight:" + "\"" + totalWeight + "\"," + 
				           "unitPrice:" + "\"" + unitPrice + "\"," + 
				           "countUnit:" + "\"" + countUnit + "\"," + 
				           "totalPrice:" + "\"" + totalPrice + "\"," + 
				           "locationId:" + "\"" + locationId + "\"" + 
				           "})"; 
			   
			 
			    //alert(jsonStr);
				$.ajax({  
					   type: "post",  
					   url: "addStockInCargo.do?method=add",  
					   data:eval(jsonStr),
					   dataType:'text',
					   contentType: "application/x-www-form-urlencoded;charset=utf-8", 
					   cache: false,  
					   success: function(msg){ 
					   
					   //alert(msg);
					   var obj = eval("("+msg+")"); 
					   //alert(obj);
					   	$("#cargoList").append( 
					    
					   	"<tr>"+						
						"<td align='right'>"+
						obj.number +
						"</td>"+
						"<td align='right'>"+
						obj.name+
						"</td>"+
						
						"<td align='right'>"+
						obj.batchNumber +
						"	<input name=\"" + "batchNumber"+"\" type='hidden' value='"+obj.batchNumber+"'/>"+
						"</td>"+
						
						"<td align='right'>"+
						obj.dateProduce +
						"	<input name=\"" + "dateProduce" + "\" type='hidden' value='"+obj.dateProduce+"'/>"+
							
						"</td>	"+
						"<td align='center'>"+
						obj.category +
						"</td>"+
						"<td align='right'>"+
						obj.weight + "kg/" + obj.unit +
						"	<input name='weight' type='hidden' value='"+obj.weight+"'/>"+
						"</td>"+
						"<td align='right'>"+
						obj.quantity +
						"	<input name='quantity' type='hidden' value='"+obj.quantity+"'/>"+
							
						"</td>	"+
						"<td align='right'>"+
						obj.totalWeight +	
						"	<input  name='totalWeight' type='hidden' value='"+obj.totalWeight+"'/>"+
						"</td>"+
						"<td>"+
						"<a href='#' onclick='position(${status.index});return false;'>"+obj.locationName +"</a>"+	
						
						"	<input name='locationId' type='hidden' value='"+obj.locationId+"'/>"+
						"	<input name='id' type='hidden' value='"+obj.id+"'/>"+
						"	<input name='postionQuantity'  type='hidden'/>"+
						"</td>"+
						"<td>"+
							
						"	<a href='#' onclick='del(this);return false;'>删除</a>"+
						
						"</td>"+		
					"</tr>  ");
				    
					   	jQuery(".display tr:odd td").addClass("color1");
					   	cancelTbodyErrorMessage("cargoList");
					   }
					   
				   });  
				
				box.close();
				
		 };
		$().ready(function() {
			
			//$('select[name="locationId"]').change(function(){
		    //    if($(this).children('option:selected').val() == '33_三号库-2-'){
		    //    	$('div[name="AAA"]').show();
		    //    }else{
		    //    	$('div[name="AAA"]').hide();
		    //    };  
		    //});
			
			$('input[name="name"]').focus().autocomplete(months, {
		
				formatItem: function(row, i, max) {
					return "\"" + row.name + "\" [" + row.weight + " kg]";
				},
				formatMatch: function(row, i, max) {
					return row.name + " " + row.weight;
				},
				formatResult: function(row) {
					return row.name;
				}
			});
			
			$('input[name="name"]').result(function(event,data,formatted) {
				
			    $('input[name="id"]').val(data.id);
			    $('input[name="number"]').val(data.number);
			    $('select[name="category"]').attr("value",data.category);
			    $('input[name="size"]').val(data.size);
			    $('select[name="unit"]').val(data.unit);
			    $('input[name="weight"]').val(data.weight);
			    $('input[name="grossWeight"]').val(data.grossWeight == "null" ? "":data.grossWeight);
			});
			
			   $('input[id="qty"],input[id="wht"],input[id="unitPrice"],select[id="countUnit"],input[id="freight"],input[id="otherCost"],input[id="grossWeight"]').blur(function(){
    
			      var quantity = $('input[id="qty"]').val();
			      var weight = $('input[id="wht"]').val();
			      var grossWeight = $('input[id="grossWeight"]').val();
			      
			      $('input[id="totalWht"]').val(quantity*weight);
			      $('input[id="totalGrossWeight"]').val(quantity*grossWeight);
			    
			      var unitPrice = parseFloat($('input[id="unitPrice"]').val());
			      var countUnit = $('select[id="countUnit"]').val();
			      
			      var count = 0;
			      if(countUnit == '1'){
			          count = unitPrice*quantity;
			      }else if (countUnit == '2'){
			      	  count = unitPrice*weight/1000;
			      };
			      $('input[id="totalPrice"]').val((count).toFixed(2));
			    
			    });
			     
			   function bbb(){
				   
				   
				   
				}
			   
			    
		});
		
		</script>
	</head>
	<body>
		
		<html:form styleId="addStockInCargo" action="/addStockInCargo.do?method=add">
		<div id="form_stylized" class="myform" >
			<html:hidden property="id"/><html:errors property="id"/>
			<label>编号 </label><html:text styleId="number" property="number"/><html:errors property="number"/><br/>
			<div style="padding-left:185px"><span id="nameErrorMessage" class="errorMessage" >请输入货物名称！</span></div>
			<label>货物名称 </label><html:text styleId="name" property="name"/><br/>
			<label>货物类型 </label>
			<select id="category" name="category" >
				<c:forEach var="sys" items="${cargoEditForm.categoryList}" >
					<option  value="${sys.codeKey }">${sys.codeValue }</option>
				</c:forEach>
			</select>
			
			<html:errors property="category"/><br/>
			<label>规格 </label><html:text styleId="size" property="size" /><html:errors property="size"/><br/>
			<label>单位 </label>
			<select id="unit" name="unit" >
				<c:forEach var="sys" items="${cargoEditForm.unitList}" >
					<option  value="${sys.codeKey }">${sys.codeValue }</option>
				</c:forEach>
			</select>

			<html:errors property="unit"/><br/>		
			<label>重量/毛重 </label><html:text styleId="wht" property="weight" style="width:60px"/><span style="vertical-align: middle;padding-left: 5px">公斤</span>
								    <html:text styleId="grossWeight" property="grossWeight" style="width:60px"/><span style="vertical-align: middle;padding-left: 5px">公斤</span><br/>
			
			<label>批号</label><html:text styleId="batchNumber" property="batchNumber" /><br/>
			<label>生产日期</label><html:text styleId="dateProduce" property="dateProduce" styleClass="Wdate"  onclick="WdatePicker()"/><br/>
			<div style="padding-left:185px"><span id="qtyErrorMessage" class="errorMessage" >请输入货物数量或总重量！</span></div>
			<label>数量</label><html:text styleId="qty" styleClass="quantity" property="quantity" /><br/>
			<label>总重量/总毛重</label><html:text styleId="totalWht" styleClass="totalWeight"  property="totalWeight" style="width:60px"/><span style="vertical-align: middle;padding-left: 5px">公斤</span>
									  <html:text styleId="totalGrossWeight" styleClass="totalWeight"  property="totalGrossWeight" style="width:60px"/><span style="vertical-align: middle;padding-left: 5px">公斤</span><br/>
			<label>储位</label>
				<select id="locationId" name="locationId" >
					<option value="0">--请选择--</option>
					<c:forEach var="entry" items="${requestScope['location.list']}" >
						<!-- 
						<option value="${entry.key}_${entry.value.name}" disabled="disabled">${entry.value.name}</option>
						 -->
						<c:forEach var="location" items="${entry.value.locationList}" >
							<option value="${location.id}_${location.warehouseName}-${location.zoneId}${location.rackId}${location.storeyId}${location.positionId}">
								<c:if test="${location.zoneId!=''}">
									${location.warehouseName}-${location.zoneId}${location.rackId}${location.storeyId}${location.positionId}
								</c:if>
								${location.warehouseName}
							</option>
						</c:forEach>
					</c:forEach>
				</select>
			
			<br/>
				
			<!--    
			<div id="costPart">
				<html:hidden property="isCost" value="0"/>
				<label>单价</label><html:text styleId="unitPrice" property="unitPrice" style="width:120px" value="0"/><span style="vertical-align: middle;padding-left: 5px">元/</span>
				<select id="countUnit" name="countUnit" style="width: 55px">
					<option value="1">件</option>
					<option value="2">吨</option>
				</select>
				<br/>
				<label>总价</label><html:text styleId="totalPrice" property="totalPrice" style="width:120px" value="0"/><span style="vertical-align: middle;padding-left: 5px">元</span><br/>
			</div>
			-->
		</div>
		
		</html:form>
			
	</body>
</html>

