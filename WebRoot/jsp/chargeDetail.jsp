<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>收费记录</title>
		
		<style type="text/css" title="currentStyle">
			@import "plug-in/dataTables/css/demo_page.css";
			@import "plug-in/dataTables/css/demo_table.css";
			.toolbar {
				float: left;
			}

			UL{list-style-type:none; margin:0px;} 
			/* 标准盒模型 */ 
			.w936{margin:0;clear:both;} 
			/* TAB 切换效果 */ 
			.tb_{background-image: url('images/barbg_tab.gif'); background-repeat: repeat-x;} 
			.tb_ ul{height:24px;font-size: 12px} 
			
			#nav li{
				display: block;
				float: left;
				margin: 0px;
				padding: 0px;
				height: 24px;
			}
			
			#nav a{margin-left:2px; 
					float:left;
					background: url(images/tab_1_l.gif) no-repeat left top;
					padding-left: 3px;
					text-decoration: none}
			#nav a span{
				display:block;
				background: url(images/tab_1_r.gif) no-repeat right top;
				padding:6px 6px 2px 6px;
				font-weight:bold;
				
			}	
			
			#nav a.normaltab{margin-left:2px; 
					
					background: url(images/tab_2_l.gif) no-repeat left top;
					}
			#nav a.normaltab span{
				
				background: url(images/tab_2_r.gif) no-repeat right top;
				font-weight:normal;
				padding:8px 6px 2px 6px;
			}		
			
			a.filter{border:1px solid #0188CC;padding:5px 5px 2px 5px;text-decoration:none;font-size: 12px}
			a.filter:hover{border:1px solid #0188CC;padding:5px 5px 2px 5px;text-decoration:underline;background-color: #CBE9F1;font-size: 12px}
			a.filter1{border:1px solid #0188CC;padding:5px 5px 2px 5px;text-decoration:none;background-color: #0188CC;color:#ffffff;font-size: 12px}
		
			#float{height: 25px;position: relative;top:0px;}
			table.stockItems thead th {
	
				padding: 8px 18px 5px 10px;
				border-bottom: 1px solid #D2D2D2;
				border-top: 1px solid #D2D2D2;
				cursor: pointer;
				* cursor: hand;
				background-color: #F5F5F5;
				font-size: 12px;
				font-weight:normal;
			}
			.button1{display:block;
					width:58px;
					color:#ffffff;
					text-align:center;
					line-height:21px;
					height:21px;
					background-image:url('images/button1.gif');
					float:left;
					margin-left:5px;
					cursor:pointer; }
			.confirmStyle1{border:1px solid #666666;}
			.confirmStyle2{border:1px solid #ffffff;}
		
		</style>
		<link type="text/css" rel="stylesheet" href="plug-in/weebox/weebox.css" />
		<script type="text/javascript" src="plug-in/lightTreeview/jquery-1.2.6.js"></script>
		<script type="text/javascript" language="javascript" src="plug-in/dataTables/js/jquery.dataTables.js"></script>
		
		<script type="text/javascript" src="plug-in/weebox/bgiframe.js"></script>
		<script type="text/javascript" src="plug-in/weebox/weebox.js"></script>
		
		<script type="text/javascript" src="plug-in/monthlycalendar/dropdownmenu.js"></script>
		<link type="text/css" rel="stylesheet" href="plug-in/monthlycalendar/css/default.css" />
		<script language="javascript" type="text/javascript" src="plug-in/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="plug-in/autocomplete/jquery.autocomplete.js"></script>
		<link rel="stylesheet" type="text/css" href="plug-in/autocomplete/jquery.autocomplete.css" />
		
		<script type="text/javascript">
	
			
            
            //var customers = ${requestScope['customer.list']};
			var payable = ${requestScope['payable']};
			$(function(){ 
				
				$("#payable").val(convert(payable));
				
				$('input[name="area"]').bind("propertychange",function(){
					if(document.activeElement.name == $(this).attr('name')){
					    var area = $(this).val();
					    var unitPrice = $(this).parent().parent().find('input[name="unitPrice"]').val();
					    var days =  $(this).parent().parent().find('input[name="days"]').val();
					     
					    $(this).parent().parent().find('input[name="totalPrice"]').val(area*unitPrice*days);
					}
			    
			    });
				
				$('input[name="weight"]').bind("propertychange",function(){
					
					if(document.activeElement.name == $(this).attr('name')){
					
				     
					    var weight = $(this).val();
						var unitPrice = $(this).parent().parent().find('input[name="unitPrice"]').val();
						var days =  $(this).parent().parent().find('input[name="days"]').val();
						     
						$(this).parent().parent().find('input[name="totalPrice"]').val(roundNumber(mul(mul(weight,unitPrice),days),2));
				     
					} 
				});
				
				$('input[name="totalPrice"]').bind("propertychange",function(){
	    			
					var monthTotal = 0;
					$(this).parent().parent().parent().find('input[name="totalPrice"]').each(function(){
						
           				monthTotal = add(monthTotal,$(this).val());
           			});
            		
            		$(this).parent().parent().parent().find('input[name="monthTotal"]').val(monthTotal);
				     
				    
				});
			    
			   $(window).scroll(function (){
					var offsetTop = $(window).scrollTop();
					//alert(offsetTop);
					if(offsetTop > 345){
						
						offsetTop = (offsetTop - 345) + "px";
					
					}else{
					
						offsetTop = 0 + "px";
					}
					$("#float").animate({top:offsetTop },{duration:500,queue:false});
				}); 
				
				$('a[name="countMonthTotal"]').bind('click', function() { 
					var monthTotal = 0;
					$(this).parent().parent().parent().find('input[name="totalPrice"]').each(function(){
           				monthTotal = monthTotal + parseFloat($(this).val());
           				
           	
           			});
            		
            		$(this).parent().parent().find('input[name="monthTotal"]').val(monthTotal);
            		
				
				});
				
				


				$('a[name="save"]').bind('click', function(){
				  var aaa = $(this);  
				   var jsonStr="({"; 
				   jsonStr=jsonStr + "\"name\":\""; 
				   $(this).parent().parent().parent().find('tr[class="chargeDetailDescription"]').each(function(){
				   		
				   		var customerId = $(this).find('input[name="customerId"]').val();
						var chargeId = $(this).find('input[name="chargeId"]').val();
						var date = $(this).find('input[name="date"]').val();
				   		var description = $(this).find('input[name="description"]').val();
				   		var chargeType = $(this).find('input[name="chargeType"]').val();
           				var startDate = $(this).find('input[name="startDate"]').val();
           				var endDate = $(this).find('input[name="endDate"]').val();
           				var weight = $(this).find('input[name="weight"]').val();
						var area = $(this).find('input[name="area"]').val();
           				var unitPrice = $(this).find('input[name="unitPrice"]').val();
           				var unitName = $(this).find('input[name="unitName"]').val();
           				var totalPrice = $(this).find('input[name="totalPrice"]').val();
           		
           				jsonStr = jsonStr+ 
           						  customerId+"," + 
           						  chargeId+"," + 
           						  date+","+
           						  description+","+
           						  chargeType+","+
           						  startDate+","+
           						  endDate+","+
           						  weight+","+
           						  area+","+
           						  unitPrice+","+
           						  unitName+","+
           						  totalPrice + "|";
           	
           			});
				   jsonStr= jsonStr + "\"})"; 
				   
				   $.ajax({  
					   type: "post",  
					   url: "chargeDetail.do?method=save",  
					   data:eval(jsonStr), 
					   dataType:'text',
					   contentType: "application/x-www-form-urlencoded;charset=utf-8", 
					   cache: false,  
					   success: function(msg){ 
					   	 
					     alert("保存成功！");
					     aaa.css("display","none");
					     aaa.parent().parent().parent().find('tr[class="chargeDetailDescription"]').each(function(){
					      	$(this).find('input[type="text"]').attr("readonly","readonly").css("border","solid 1px #ffffff");
					      	$(this).find('a[name="delChargeRecord"]').css("display","none");
					      
					     });
					     aaa.parent().parent().find('input[name="monthTotal"]').attr("readonly","readonly").css("border","0px");
					     aaa.parent().parent().find('a[name="countMonthTotal"]').css("display","none");
					     aaa.parent().parent().find('a[name="edit"]').css("display","block");
					     aaa.parent().parent().parent().prev().find('font[name="confirm2"]').html("已保存").css("color","#FF6600");
					     aaa.parent().parent().parent().prev().find('a[name="createChargeRecord"]').css("display","none");
					     var monthTotal = aaa.parent().parent().find('input[name="monthTotal"]').val();
					     var payable = $('#payable').val();
					     payable = Number(payable.replace(',', ''));
					     if(parseFloat(payable)*-1 > parseFloat(monthTotal)){
					     	aaa.parent().parent().parent().prev().find('font[name="confirm2"]').html("已结清").css("color","#066601");
					    	aaa.parent().parent().find('a[name="edit"]').css("display","none");
					     }
					     
					     payable = add(payable,monthTotal);
					     
					     var payableConvert = convert(payable);
					     
					     $('#payable').val(payableConvert);
					     
					   }  
					   
				   });   

				  });
				  
				  $('a[name="edit"]').bind('click', function(){
				    var aaa = $(this);  
				    var jsonStr="({"; 
				    jsonStr=jsonStr + "\"name\":\""; 
				    $(this).parent().parent().parent().find('tr[class="chargeDetailDescription"]').each(function(){
				   		
				   		var customerId = $(this).find('input[name="customerId"]').val();
						var chargeId = $(this).find('input[name="chargeId"]').val();
						var date = $(this).find('input[name="date"]').val();
				   		var description = $(this).find('input[name="description"]').val();
           				var startDate = $(this).find('input[name="startDate"]').val();
           				var endDate = $(this).find('input[name="endDate"]').val();
           				var weight = $(this).find('input[name="weight"]').val();
						var area = $(this).find('input[name="area"]').val();
           				var unitPrice = $(this).find('input[name="unitPrice"]').val();
           				var unitName = $(this).find('input[name="unitName"]').val();
           				var totalPrice = $(this).find('input[name="totalPrice"]').val();
           		
           				jsonStr = jsonStr+ 
           						  customerId+"," + 
           						  chargeId+"," + 
           						  date+","+
           						  description+","+
           						  startDate+","+
           						  endDate+","+
           						  weight+","+
           						  area+","+
           						  unitPrice+","+
           						  unitName+","+
           						  totalPrice + "|";
           	
           			});
				   jsonStr= jsonStr + "\"})"; 
				   
				   $.ajax({  
					   type: "post",  
					   url: "chargeDetail.do?method=edit",  
					   data:eval(jsonStr), 
					   dataType:'text',
					   contentType: "application/x-www-form-urlencoded;charset=utf-8", 
					   cache: false,  
					   success: function(msg){ 
					   	 
					     location.reload();
					    
					   }  
					   
				   });   

				  });
				  
				  
			
			}) ;

           function balanceWeightIsNotNull(){
            	allItems();
	            $('font[class="balanceWeight"]').each(function(){
				   
					var balanceWeight = $(this).html();
					
				    balanceWeight = parseFloat(balanceWeight);    
				    var balanceQuantity = $(this).parent().parent().find('font[class="balanceQuantity"]').html();
				    
				    balanceQuantity = parseFloat(balanceQuantity);    
				   
				    if(balanceWeight == 0 && balanceQuantity == 0){
				    	
				    	$(this).parent().parent().hide();
				    }
					                
				 });
            };
            
            function isNull(i){
            	if(i.length == 0){
            		return 0;
            	
            	}
            	return i;
            
            }
           
             function inOutBalanceWeightIsNotNull(){
            	allItems();
	            $('font[class="balanceWeight"]').each(function(){
				   
					var balanceWeight = $(this).html();
					
					balanceWeight = isNull(balanceWeight);
				    balanceWeight = parseFloat(balanceWeight);    
				    var balanceQuantity = $(this).parent().parent().find('font[class="balanceQuantity"]').html();
				    balanceQuantity = isNull(balanceQuantity);
				    
				    var inQuantity = $(this).parent().parent().find('font[class="inQuantity"]').html();
				    inQuantity = isNull(inQuantity);
				   
				    
				    var inWeight = $(this).parent().parent().find('font[class="inWeight"]').html();
				    inWeight = isNull(inWeight);
				    
				    var outQuantity = $(this).parent().parent().find('font[class="outQuantity"]').html();
				    outQuantity = isNull(outQuantity);
				    
				    var outWeight = $(this).parent().parent().find('font[class="outWeight"]').html();
				    outWeight = isNull(outWeight);
				    
				    balanceQuantity = parseFloat(balanceQuantity);
				    inQuantity = parseFloat(inQuantity);    
				    inWeight = parseFloat(inWeight);    
				    outQuantity = parseFloat(outQuantity);    
				    outWeight = parseFloat(outWeight);        
				     
				    if(balanceWeight == 0 && balanceQuantity == 0 && inQuantity == 0 && inWeight == 0 && outQuantity == 0 && outWeight == 0){
				    	$(this).parent().parent().hide();
				    }	
				                    
				 });
            }
           
            function allItems(){
           		
           		$('font[class="balanceWeight"]').each(function(){
           			
           			$(this).parent().parent().show();
           	
           		});
           	}
           
            function convert(money) {
            	money = roundNumber(money,2);
	            var s = money; //获取小数型数据
	            s += "";
	            if (s.indexOf(".") == -1) s += ".0"; //如果没有小数点，在后面补个小数点和0
	            if (/\.\d$/.test(s)) s += "0";   //正则判断
	            while (/\d{4}(\.|,)/.test(s))  //符合条件则进行替换
	                s = s.replace(/(\d)(\d{3}(\.|,))/, "$1,$2"); //每隔3位添加一个
	            return s;
        	}
           
           
            function query(){   
				
				var bDate = $('input[name="bDate"]').val();
				var eDate = $('input[name="eDate"]').val();	
				var customerId = $('input[name="customerId"]').val();
				var tagsIdParameter = "";
				var isAllParameter = "";
				if($("input[name='tags']").length>0){
					var tagsId = "0";
					$("input[name='tags']").each(function(){
					   if($(this).attr("checked")==true){
					    tagsId += "-"+$(this).attr("value");
					   }
					})
					tagsIdParameter = "&tagsId="+tagsId;
				}
				
				isAllParameter = "&isAll="+$('input[@name=isAll][@checked]').val();
				
				location.href="stockAnalyze.do?method=multiCargo&customerId="+customerId+"&bDate="+bDate+"&eDate="+eDate+tagsIdParameter+isAllParameter;   
            
            
            }
            
            //乘法
	    	function mul(arg1,arg2) {
	
		        var m = 0, s1 = arg1.toString(), s2 = arg2.toString();
		
		        try { m += s1.split('.')[1].length } catch (e) { }
		
		        try { m += s2.split('.')[1].length } catch (e) { }
		
		        return Number(s1.replace('.', '')) * Number(s2.replace('.', '')) / Math.pow(10, m)
		
		    }
		    
		    
	    	function add(arg1,arg2){
			  	var r1,r2,m;
		    	try{r1 = arg1.toString().split(".")[1].length}catch(e){r1 = 0;}
		    	
		    	try{r2 = arg2.toString().split(".")[1].length}catch(e){r2 = 0;}
		    	
		    	m = Math.pow(10,Math.max(r1,r2));
		    	
		    	return(mul(arg1,m) + mul(arg2,m))/m;
		    }
	    	
	    	function roundNumber(num,pos){  
	    	    return Math.round(num * Math.pow(10,pos)) / Math.pow(10, pos);  
	    	}  
            
                      
		</script>
		
	</head>
	<body >
		<div id="main">
		<jsp:include page="common/top.jsp" flush="true" />
		<html:form action="/chargeDetail">
		<div >
			<div class="w936" > 
			    <div id="tb_" class="tb_"> 
		            <ul id="nav"> 
		            	<li style="text-align: left;font-size: 14px;font-weight: bold;padding-top: 3px">收费记录</li> 
		               
		            </ul> 
		            
			    </div> 
			    <div id="form_stylized"  class="myform" style="width: 100%;background-color: #F9F9F9;border-bottom: 1px solid #CCCCCC;margin-bottom: 5px">
			    	
			    	<div style="font-size: 14px;font-weight: bold;margin: 10px 5px 5px 65px">查询</div>
			    	
			    	<label>客户</label>
						<input name="customerName" onmouseover="mopen('customer')" onmouseout="mclosetime()"  value="${requestScope['customerName']}"/>
						<input type="hidden" name="customerId"  value="${requestScope['customerId']}"/><br/>
					
					
					<div style="padding-left: 155px;">
						<input style="width:50px;background-color: D4D0C8;border: 1px solid #666;padding-top: 4px;font-size: 12px" type="button" onclick="query()" value="查询"/>
						
					</div>	
					
					
					
					
					
							  					
			    </div>
			</div>
			
			<div>
				<div style="height:92px;border:1px solid #cccccc;background-color:#F7F7F7;margin:0px 0px 5px 0px;padding:15px">
					<div style="width:280px;height:100%;float:left;">
						<div style="font-size:14px;font-weight:bolder;color:#666666">
							${customer.name}
						</div>
						<div style="font-size:12px;color:#808080;margin:25px 0px 0px 0px ">
							电话:${customer.phoneNumber1}${customer.phoneNumber2}
						</div>
						<div style="font-size:12px;color:#808080;margin:10px 0px 0px 0px ">
							传真:${customer.fax}
						</div>
					</div>
					<div style="width:60px;height:100%;float:left">
						<img src="images/line.gif"></img>	
					</div>
					<div style="width:420px;height:100%;float:left;">
						<div style="font-size:14px;font-weight:bolder;color:#666666 ">
							应收费金额:
						</div>
						<div style="margin:10px 0px 10px 0px;">
							<input id="payable" style="font-size:22px;font-weight:bolder;color:#4D4D4D;width:120px;border:solid 0px #ffffff;background-color:#F3F3F3;text-align:right;"/>
							<span style="font-size:12px;color:#4D4D4D">元</span>
							
						</div>
						<div style="font-size:14px;font-weight:bolder; ">
							<a href="#" style="background-image:url('images/button.gif');width:75px;height:31px;display:block;text-align:center;line-height:31px;text-decoration:none;color:#ffffff" onclick="openBox(${customer.id});return false;" >收费</a>
						</div>
					</div>
					<div style="width:200px;height:100%;float:left">
						<div style="font-size:14px;font-weight:bolder;color:#666666 ">
							其他操作：
						</div>
						<div style="margin:10px 0px 10px 0px;width:100px">
							<a href="charge.do?method=query&customerName=${customer.name}" target="blank" style="font-size:12px;padding:5px 0px 5px 0px;display: block;">收费标准设置</a>
							<a href="charge.do?method=init" target="blank" style="font-size:12px;padding:5px 0px 5px 0px;display: block;">已收费记录</a>
							
						</div>
						
					</div>
			
				</div>
				<table cellpadding="0" cellspacing="0" border="0" class="stockItems" id="float">
				
					<thead>
						<tr>
							
							<th width="180px">收费类型</th>
							<th width="120px">计费日期</th>
							<th width="120px">数量</th>
							<th width="120px">单价</th>
							<th width="120px">总额</th>
							<th>操作</th>
						</tr>
					</thead>
				</table>	
				
				<table cellpadding="0" cellspacing="0" border="0" class="stockItems" style="margin:5px 0px 5px 0px">
					
				<c:forEach items="${requestScope['chargeDetail.list']}" var="chargeDetailVO" varStatus="status">
				
					<c:if test="${chargeDetailVO.chargeDetailList != null && fn:length(chargeDetailVO.chargeDetailList) != 0}">
					<c:set var="confirmStyle" value="confirmStyle1" scope="page"/> 
					<tr>
						<td width="120px" align="left" colspan="5" style="background-color:#F3F3F3;border-top: 1px solid #D2D2D2;font-weight:bolder;font-size:14px">
							<fmt:formatDate value="${chargeDetailVO.startDate}" pattern="yyyy年MM月"/>
							<c:choose> 
								  <c:when test="${chargeDetailVO.confirm == true && chargeDetailVO.payable == false}">
								  	<font name="confirm1" style="font-weight:bolder;color:#FF6600;padding-left:5px"> 
								  		已保存
								  	</font>
								  	<c:set var="confirmStyle" value="confirmStyle2"/> 
								  </c:when> 
								  <c:when test="${chargeDetailVO.confirm == false}"> 
									  <font name="confirm2" style="font-weight:bolder;color:#FF0000;padding-left:5px"> 
									  	未结清
									  </font>
									  <c:set var="confirmStyle" value="confirmStyle1"/> 
								  </c:when> 
								  <c:when test="${chargeDetailVO.payable == true}"> 
									  <font style="font-weight:bolder;color:#066601;padding-left:5px"> 
									  	已结清
									  </font>
									  <c:set var="confirmStyle" value="confirmStyle2"/> 
								  </c:when> 
								 
							</c:choose> 
						</td>
						<td style="background-color:#F3F3F3;border-top: 1px solid #D2D2D2" align="right">
							<c:if test="${chargeDetailVO.confirm == false}">
								<a name="createChargeRecord" href="" onclick="createChargeRecord(${customer.id},'<fmt:formatDate value="${chargeDetailVO.startDate}" pattern="yyyy-MM"/>');return false;">新增收费项目</a>
							</c:if>
						</td>
					</tr>
					<tbody>
					<c:set var="monthTotal" value="0" scope="page"/> 
					
					<c:forEach items="${chargeDetailVO.chargeDetailList}" var="chargeDetail" varStatus="status">
						<tr class="chargeDetailDescription">
							<td width="180px">
								<c:out value="${chargeDetail.description}" />
								
								<input name="chargeId" type="hidden" value="${chargeDetail.chargeId}" />
								
								<input name="description" type="hidden" value="${chargeDetail.description}" />
								<input name="customerId" type="hidden"  value="${requestScope['customerId']}" />
								<input name="date" type="hidden"  value="<fmt:formatDate value="${chargeDetailVO.startDate}" pattern="yyyy-MM"/>" />
							</td>
							<td width="120px">
								<fmt:formatDate value="${chargeDetail.startDate}" pattern="MM月dd日"/>
								<c:if test="${!empty chargeDetail.endDate}">
									-<fmt:formatDate value="${chargeDetail.endDate}" pattern="MM月dd日"/>
								</c:if>
								<input name="startDate" type="hidden" value="<fmt:formatDate value="${chargeDetail.startDate}" pattern="yyyy-MM-dd"/>" />
								<input name="endDate" type="hidden" value="<fmt:formatDate value="${chargeDetail.endDate}" pattern="yyyy-MM-dd"/>" />
								
								<input name="days" type="hidden" value="${chargeDetail.days}"/>
							</td>
							<td width="120px" align="right">
								
								<c:choose> 
								 
								  <c:when test="${chargeDetail.chargeType == 'chargeType.1'}"> 
								  	<c:out value="${chargeDetail.area}" /> ㎡
								  	<input name="area" type="hidden" value="${chargeDetail.area}"/>
								  </c:when> 
								  <c:when test="${chargeDetail.chargeType == 'chargeType.2'}"> 
								  	<input type="text" name="area" class="${confirmStyle}" style="width:65px;text-align:right;" value="${chargeDetail.area}"/> ㎡
								  </c:when> 
								  <c:otherwise> 
								  	<input type="text" name="weight" class="${confirmStyle}" style="width:65px;text-align:right;" value="${chargeDetail.weight}"/> 吨
								  </c:otherwise> 
								</c:choose> 
								<input name="chargeType" type="hidden" value="${chargeDetail.chargeType}"/>
								
								
								
							</td>
							<td width="120px" align="right">
								<c:out value="${chargeDetail.unitPrice}" />
								<c:out value="${chargeDetail.unitName}" />
								<input name="unitName" type="hidden" value="${chargeDetail.unitName}" />
								<input name="unitPrice" type="hidden" value="${chargeDetail.unitPrice}"/>
							</td>
							<td width="120px" align="right">
								
								<c:choose> 
								  <c:when test="${chargeDetail.chargeType == 'chargeType.1'}"> 
								  	<c:out value="${chargeDetail.totalPrice}" />
								  	<input name="totalPrice" type="hidden" value="${chargeDetail.totalPrice}"/>
								  </c:when> 
								  <c:otherwise> 
								  	<input type="text" name="totalPrice" class="${confirmStyle}" style="width:65px;text-align:right;" value="${chargeDetail.totalPrice}"/>
								  </c:otherwise> 
								</c:choose> 								
								<c:if test="${!empty chargeDetail.totalPrice}">
									<c:set var="monthTotal" value="${monthTotal + chargeDetail.totalPrice}" />
								</c:if>
							</td>
							<td align="right">
								<c:if test="${empty chargeDetail.chargeRate == 'chargeRate.1'}">
									<a name="delChargeRecord" href="#"  id="${customer.id}_${chargeDetail.chargeId}"  onclick="del(${customer.id},${chargeDetail.chargeId});return false;">删除</a>
								</c:if>
								<a href="stockItems.do?method=customerStockItems&customerId=${customer.id}&bDate=<fmt:formatDate value="${chargeDetail.startDate}" pattern="yyyy-MM-dd"/>&eDate=<fmt:formatDate value="${chargeDetail.endDate}" pattern="yyyy-MM-dd"/>" target="_blank">详细</a>
								
							</td>
						</tr>
				
					</c:forEach>
					<tr >
						<td colspan="4" align="right" style="font-weight:bolder;">
							本月合计
						</td>
						<td align="right">
							<c:choose> 
								<c:when test="${chargeDetailVO.confirm == false}">
									<input  readonly="readonly" name="monthTotal" value="<fmt:formatNumber value="${monthTotal}" pattern=".00" />" style="border:0px;width:80px;text-align:right" />
								</c:when> 
								<c:when test="${chargeDetailVO.confirm == true && chargeDetailVO.payable == false}"> 
									<input readonly="readonly" name="monthTotal" value="<fmt:formatNumber value="${monthTotal}" pattern=".00" />" style="border:0px;width:80px;text-align:right" />
								</c:when>
								<c:when test="${chargeDetailVO.confirm == true && chargeDetailVO.payable == true}"> 
									<fmt:formatNumber value="${monthTotal}" pattern=".00" />
								
								</c:when>
							</c:choose> 
						
						</td>
						<td>
							<c:choose> 
								<c:when test="${chargeDetailVO.confirm == false}">
									<a name="save"  class="button1" >保存</a>
									<a name="edit"  class="button1" style="display:none;">编辑</a>
								</c:when> 
								<c:when test="${chargeDetailVO.confirm == true && chargeDetailVO.payable == false}"> 
									<a name="save"  class="button1" style="display:none;" >保存</a>
									<a name="edit"  class="button1">编辑</a>
								</c:when> 
							</c:choose> 
						</td>
					</tr>
					</tbody>
					<tr >
						<td colspan="6" style="font-weight:bolder;height: 5px">
							
						</td>
						
					</tr>
				</c:if>	
				</c:forEach>
				</table>	
				
			</div>
			</div>
			
		</html:form>
			<script type="text/javascript">
				function openBox(customerId){
					$.weeboxs.open('chargeDetail.do?method=initPayment&customerId='+customerId, {title:'收费', 
																					 contentType:'ajax',
																					 onok:function(){
																						chargeEdit.submit();														
																				
																					 	}
																					});
					
				};
				
				function createChargeRecord(customerId,date){
					
					$.weeboxs.open('charge.do?method=initChargeEdit&customerId='+customerId+'&date='+date+'&source=chargeDetail', {title:'新增收费项目', 
																					 contentType:'ajax',
																					 onok:function(){
																						chargeEdit.submit();														
																				
																					 	}        
																					});
					
				};
				
				function del(customerId,chargeId){
					
					if(confirm("确认删除?")){
	          		    var jsonStr="({"; 
					    jsonStr=jsonStr + "\"customerId\":\"" + customerId + "\","; 
						jsonStr=jsonStr + "\"chargeId\":\"" + chargeId; 
						
	    				jsonStr= jsonStr + "\"})"; 
	    				$.ajax({  
						   type: "post",  
						   url: "charge.do?method=delete",  
						   data:eval(jsonStr), 
						   dataType:'text',
						   contentType: "application/x-www-form-urlencoded;charset=utf-8", 
						   cache: false,  
						   success: function(msg){ 
						   	 
						     alert("删除成功！");
						     
						     var id = "#" + customerId + "_" + chargeId;
						     
						     $(id).parent().parent().remove();
						     
						   }  
						   
					   });  
				   
				   } 

				
			
				}
			</script>
			
		</div>
	</body>
</html>

