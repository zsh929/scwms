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
		<style type="text/css">
			.radio1{border:2px;width:25px}		
		
		</style>
	<script type="text/javascript">
	   
		//var months = ${cargoEditForm.jsonList};
		//$('div[name="AAA"]').hide();
		$(function(){ 
			
			$("[name='category']").each(function() {
	   	     	var categoryStr = '${chargeForm.categoryStr}';
	   	     	var categoryArray = categoryStr.split(",");
			   	for (i=0;i<categoryArray.length ;i++ ){
			   	   if(categoryArray[i] == $(this).val()){
			   		  $(this).attr("checked",true);
			   	  	}
			   	}
			});
		});
		
		
		$().ready(function() {
			
			
		
			
			
			$('input[name="name"]').result(function(event,data,formatted) {
				
			    $('input[name="id"]').val(data.id);
			    $('input[name="number"]').val(data.number);
			    $('select[name="category"]').attr("value",data.category);
			    $('input[name="size"]').val(data.size);
			    $('select[name="unit"]').val(data.unit);
			    $('input[name="weight"]').val(data.weight);
			    $('input[name="grossWeight"]').val(data.grossWeight);
			});
			
			   $('#area,#unitPrice').bind("propertychange",function(){
    
			      var area = $('#area').val();
			      var unitPrice = $('#unitPrice').val();
			     
			      
			      $('#totalPrice').val((area*unitPrice).toFixed(2));
			     
			    
			    });
			   
			    $('select[name="warehouseId"]').change(function(){ 
			    	
					var area = $(this).children('option:selected').text();
					area = area.substring(area.lastIndexOf("(")+1,area.lastIndexOf("㎡"));
					$('input[name="area"]').val(area);
				});
				
				var type = $('select[name="type"]').children('option:selected').val();
				var chargeRate = $('select[name="chargeRate"]').children('option:selected').val();
				
				setChargeLayout(type);
				setChargeRateLayout(chargeRate);
				
				function setChargeLayout(type){
					if(type == 'chargeType.1'){
						$('#warehouseIdLabel').show();
						$('#areaLabel').show();
						$('#totalPriceLabel').show();
						$('#chargeMethodLabel').hide();
						//$('#chargeDate2Label').hide();
					}else if(type == 'chargeType.2' || type == 'chargeType.3'){
						$('#warehouseIdLabel').hide();
						$('#areaLabel').hide();
						$('#totalPriceLabel').show();
						$('#chargeMethodLabel').hide();
						//$('#chargeDate2Label').show();
					}else if(type == 'chargeType.4' || type == 'chargeType.5' || type == 'chargeType.6' || type == 'chargeType.7'){
						$('#warehouseIdLabel').hide();
						$('#areaLabel').hide();
						$('#totalPriceLabel').hide();
						$('#chargeMethodLabel').show();
						
						//$('#chargeDate2Label').show();
					}else{
						$('#warehouseIdLabel').hide();
						$('#areaLabel').hide();
						$('#totalPriceLabel').show();
						$('#chargeMethodLabel').hide();
					}
				}
				
				function setChargeRateLayout(chargeRate){
					if(chargeRate == 'chargeRate.1'){
						$('#chargeDateLabel').show();
						$('#effectiveDateAndExpiryDateLabel').hide();
						$('#chargeDate1Label').hide();
						$('#chargeDate2Label').hide();
					}else if(chargeRate == 'chargeRate.2'){
						$('#chargeDateLabel').hide();
						$('#effectiveDateAndExpiryDateLabel').show();
						$('#chargeDate1Label').show();
						$('#chargeDate2Label').hide();
					}else if(chargeRate == 'chargeRate.3'){
						$('#chargeDateLabel').hide();
						$('#effectiveDateAndExpiryDateLabel').show();
						$('#chargeDate1Label').show();
						$('#chargeDate2Label').show();
					}else{
						$('#chargeDateLabel').hide();
						$('#effectiveDateAndExpiryDateLabel').hide();
						$('#chargeDate1Label').hide();
						$('#chargeDate2Label').hide();
					
					}
			
				}
				
				function setChargeRate(type){
					if(type == 'chargeType.1'){
						 $('#chargeRate').attr("value","chargeRate.2");
					}else if(type == 'chargeType.2' || type == 'chargeType.3'){
						 $('#chargeRate').attr("value","chargeRate.3");
					}else{
						 $('#chargeRate').attr("value","chargeRate.2");
						
					}
				}
				
				function setUnit(type){
					if(type == 'chargeType.1'){
						 $('#unit').attr("value","chargeUnit.5");
					}else if(type == 'chargeType.2'){
						 $('#unit').attr("value","chargeUnit.2");
					}else if(type == 'chargeType.3'){
						 $('#unit').attr("value","chargeUnit.1");
					}else{
						 $('#unit').attr("value","chargeUnit.4");
						
					}
				}
				
				$('select[name="type"]').bind("propertychange", function(){ 
			    	var type = $(this).children('option:selected').val();
					setChargeLayout(type);
					setChargeRate(type);
					setUnit(type);
				});	
				
				$('select[name="chargeRate"]').bind("propertychange",function(){ 
			    	var chargeRate = $(this).children('option:selected').val();
					setChargeRateLayout(chargeRate);
					
				});		    
			    
				//$("input[@type=radio][name=chargeMethod][@value=1]").attr("checked",true);  
		});
		
			
		
		</script>
	</head>
	<body>
		
		<html:form styleId="chargeEdit" action="/charge.do?method=editCharge">
		<div id="form_stylized" class="myform" >
			<html:hidden property="id"/><html:errors property="id"/>
			<label>客户名称</label><html:text property="customerName"/><html:errors property="customerName"/><br/>
			<html:hidden property="source"/>
			<label>计费类型</label>
				<select id="type" name="type" style="width: 120px">
					<option value="0">--请选择--</option>
					<c:forEach var="chargeType" items="${requestScope['chargeType.list']}" >
						<c:choose>
							<c:when test="${chargeForm.type==chargeType.codeKey}">
								<option selected="selected" value="${chargeType.codeKey}">${chargeType.codeValue}</option>
							</c:when>
							<c:otherwise>
								<option value="${chargeType.codeKey}">${chargeType.codeValue}</option>
							</c:otherwise>
					
						</c:choose>
				
					</c:forEach>
				</select>
				
			<label>说明</label><html:text property="description"/><html:errors property="description"/><br/>
			<div id="chargeMethodLabel">
				<label>计费方式</label>
					<div style="width:225px;float: left">
						<html:radio style="border:0px;width:25px;margin-left:2px" property="chargeMethod" value="1" >入库时计费</html:radio>
						<html:radio style="border:0px;width:25px;margin-left:2px" property="chargeMethod" value="0">出库时计费</html:radio>
						<html:radio style="border:0px;width:25px;margin-left:2px" property="chargeMethod" value="2">出入库时均计费</html:radio>
					</div> <br/>
			</div>
			<label>计费频率</label>
				<select id="chargeRate" name="chargeRate" >
					<option value="0">--请选择--</option>
					<c:forEach var="chargeRate" items="${requestScope['chargeRate.list']}" >
						<c:choose>
							<c:when test="${chargeForm.chargeRate==chargeRate.codeKey}">
								<option selected="selected"  value="${chargeRate.codeKey}">${chargeRate.codeValue}</option>
							</c:when>
							<c:otherwise>
								<option value="${chargeRate.codeKey}">${chargeRate.codeValue}</option>
							</c:otherwise>
					
						</c:choose>
						
					</c:forEach>
					
				</select>
			<div id="chargeDateLabel">
				<label>计费日期</label><html:text property="chargeDate" styleClass="Wdate"  onclick="WdatePicker()"/><br/>
			</div>
			<div id="effectiveDateAndExpiryDateLabel">
				<label>生效日期</label><html:text property="effectiveDate" styleClass="Wdate"  onclick="WdatePicker()"/><br/>
				<label>终止日期</label><html:text property="expiryDate" styleClass="Wdate"  onclick="WdatePicker()"/><br/>
			</div>
			<c:if test="${!empty requestScope['category.list']}">
			<div id="categoryLabel">
				<label>类型</label>
				<div style="width:200px;float: left">
					<c:forEach var="syscode" items="${requestScope['category.list']}" >
						
						<label style="width:80px;float:left;text-align: left;"><input type="checkbox"  name="category" value="${syscode.codeKey}" style="border:0px;width:25px;float:left"/>${syscode.codeValue}</label>
							            
					</c:forEach>     
				</div>
			</div>
			</c:if>
			
			<div id="warehouseIdLabel">
				<label>库房</label>
				<select id="warehouseId" name="warehouseId" >
					<option value="0">--请选择--</option>
					<c:forEach var="warehouse" items="${requestScope['warehouse.list']}" >
						
						<c:forEach var="subWarehouse" items="${warehouse.subWarehouseList}" >
							<c:choose>
								<c:when test="${chargeForm.warehouseId==subWarehouse.id}">
									<option selected="selected" value="${subWarehouse.id}">${warehouse.name}-${subWarehouse.name}(${subWarehouse.area}㎡)</option>
								</c:when>
								<c:otherwise>
									<option value="${subWarehouse.id}">${warehouse.name}-${subWarehouse.name}(${subWarehouse.area}㎡)</option>
								</c:otherwise>
					
							</c:choose>
							
							
						</c:forEach>
					</c:forEach>
				</select>
			</div>
			<div id="areaLabel">
				<label>库房面积</label><html:text styleId="area" property="area" />
			</div>
			<label>单价</label><html:text styleId="unitPrice" property="unitPrice" />
			<label>单位</label>
				<select id="unit" name="unit" >
					<option value="0">--请选择--</option>
					<c:forEach var="chargeUnit" items="${requestScope['chargeUnit.list']}" >
						<c:choose>
							<c:when test="${chargeForm.unit==chargeUnit.codeKey}">
								<option selected="selected"  value="${chargeUnit.codeKey}">${chargeUnit.codeValue}</option>
							</c:when>
							<c:otherwise>
								<option value="${chargeUnit.codeKey}">${chargeUnit.codeValue}</option>
							</c:otherwise>
					
						</c:choose>
						
					</c:forEach>
					
				</select>
			<div id="totalPriceLabel">	
				<label >总价</label><html:text styleId="totalPrice" property="totalPrice"/>
			</div>
			<div id="chargeDate1Label">
			<label>结算日期1</label><span style="vertical-align: middle;padding-left: 5px">每月</span>
				<select id="chargeDate1" name="chargeDate1" style="width: 45px">
					<option value="">--请选择--</option>
					<c:forEach var="day" begin="1" end="31" step="1" >
						<c:choose>
							<c:when test="${chargeForm.chargeDate1==day}">
								<option selected="selected" value="${day}">${day}</option>
							</c:when>
							<c:otherwise>
								<option value="${day}">${day}</option>
							</c:otherwise>
						</c:choose>	
					</c:forEach>
				</select><span style="vertical-align: middle;padding-left: 5px">日</span>
			</div>	
			<div id="chargeDate2Label">
				<label >结算日期2</label><span style="vertical-align: middle;padding-left: 5px">每月</span>
				<select id="chargeDate2" name="chargeDate2" style="width: 45px">
					<option value="">--请选择--</option>
					<c:forEach var="day" begin="1" end="31" step="1" >
						<c:choose>
							<c:when test="${chargeForm.chargeDate2==day}">
								<option selected="selected" value="${day}">${day}</option>
							</c:when>
							<c:otherwise>
								<option value="${day}">${day}</option>
							</c:otherwise>
					
						</c:choose>
					</c:forEach>
				</select><span style="vertical-align: middle;padding-left: 5px">日</span>
			
			</div>
			
			
				
				<html:hidden property="customerId"/>
				
		</div>
		
		</html:form>
			
	</body>
</html>

