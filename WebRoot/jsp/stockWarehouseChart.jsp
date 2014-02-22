<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>仓库库存</title>
		
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
			 
	    	.warehouse {font-size: 12px;} 
	    	div.warehouse span{margin:2px;display: block}
    
   
		</style>
		<link type="text/css" rel="stylesheet" href="plug-in/weebox/weebox.css" />
		<script type="text/javascript" src="plug-in/lightTreeview/jquery-1.2.6.js"></script>
		<script type="text/javascript" language="javascript" src="plug-in/dataTables/js/jquery.dataTables.js"></script>
		
		<script type="text/javascript" src="plug-in/weebox/bgiframe.js"></script>
		<script type="text/javascript" src="plug-in/weebox/weebox.js"></script>
		<script type="text/javascript" src="plug-in/monthlycalendar/dropdownmenu.js"></script>
		<link type="text/css" rel="stylesheet" href="plug-in/monthlycalendar/css/default.css" />
		<script type="text/javascript">
			$(function(){ 
			 $('tr.parent').click(function(){ // 获取所谓的父行 
			
			 $('tbody.child_'+this.id).toggle(); // 隐藏/显示所谓的子行 
			 }).click(); 
			 
			  $(".warehouse").each(function() {
    	        var id = $(this).attr("id");
    	       
		       $(this).find("span").html($('span[id='+id+']').html());
		     });
			}) 
		</script>

	</head>
	<body >
		<div id="main">
		<jsp:include page="common/top.jsp" flush="true" />
		<html:form action="/stockWarehouse">
		<div >
			<div class="w936" > 
			    <div id="tb_" class="tb_"> 
		            <ul id="nav"> 
		            	<li style="width:100px;text-align: left;font-size: 14px;font-weight: bold">仓库库存</li> 
		                <li style="margin-right: 50px">
		                <div id="sddm">
							<a class="function" target="page" href="stockWarehouse.do?method=view" >表格</a>
						</div>
		               	</li>
		            </ul> 
			    </div> 
			</div>
			
			<div style="position:absolute; ">
				 <div id="Layer1" style="position:absolute; left:408px; top:8px; width:575px; height:222px; z-index:1;border:1px solid #333">
<div class="warehouse" id="03_101" style="position:absolute; left:1px; top:1px; width:120px; height:60px; z-index:3;border:1px solid #333">
	<span ></span>
</div>
<div class="warehouse" id="03_102" style="position:absolute; left:1px; top:62px; width:120px; height:60px; z-index:3;border:1px solid #333">
  <span ></span>
  </div>
   <div class="warehouse" id="03_103" style="position:absolute; left:1px; top:123px; width:120px; height:60px; z-index:3; border:1px solid #333;">
 <span ></span>
  </div>
  <div class="warehouse" id="03_104" style="position:absolute; left:1px; top:184px; width:120px; height:35px; z-index:3;border:1px solid #333">
  <span ></span>
  </div>
  <div class="warehouse" id="03_105" style="position:absolute; left:146px; top:1px; width:120px; height:60px; z-index:3;border:1px solid #333">
  <span ></span>
  </div>
  <div class="warehouse" id="03_108" style="position:absolute; left:269px; top:1px;width:120px; height:60px; z-index:3;border:1px solid #333">
  <span ></span>
  </div>
  <div class="warehouse" id="03_109" style="position:absolute; left:269px; top: 62px;bottom:0px; width:120px; height:60px; z-index:3; border:1px solid #333; ">
  <span ></span>
  </div>
   <div class="warehouse" id="03_110" style="position:absolute; left:269px; top: 123px; width:120px; height:60px;z-index:3; border:1px solid #333; ">
  <span ></span>
  </div>
  <div class="warehouse" id="03_112" style="position:absolute; left: 415px; top: 62px; width:157px; height:60px; z-index:3; border:1px solid #333; ">
  <span ></span>
  </div>
  <div class="warehouse" id="03_115" style="position:absolute; left:524px; width:48px; height:59px; z-index:3; border:1px solid #333; top: 123px;">
  <span ></span>
  </div>
  <div class="warehouse" id="03_114" style="position:absolute; left:474px; width:49px; height:59px; z-index:3; border:1px solid #333; top: 123px;">
  <span ></span>
  </div>
  <div class="warehouse" id="03_113" style="position:absolute; left:415px;  width:58px; height:59px; z-index:3; border:1px solid #333; top: 123px;">
  <span ></span>
  </div>
  <div class="warehouse" id="03_111" style="position:absolute; top: 1px; width:157px; height:60px; z-index:3; border:1px solid #333; left: 415px;">
  <span ></span>
  </div>
  <div class="warehouse" id="03_107" style="position:absolute; left:146px; bottom:0px; width:120px; height:60px; z-index:3; border:1px solid #333; top: 123px;">
  <span ></span>
  </div>
  <div class="warehouse" id="03_106" style="position:absolute; left:146px; top: 62px; width:120px; height:60px; z-index:3; border:1px solid #333; ">
  <span ></span>
  </div>
</div>
<div id="Layer2" style="position:absolute; left:577px; top:396px; width:419px; height:216px; z-index:2;border:1px solid #333">
 <div class="warehouse" id="01_01" style="position:absolute; left:1px; top:1px; width:68px; height:94px; z-index:3;border:1px solid #333">
  <span ></span>
  </div>
  <div class="warehouse" id="01_02" style="position:absolute; left:70px; top:1px; width:68px; height:94px; z-index:3;border:1px solid #333">
  <span ></span>
  </div>
  <div class="warehouse" id="01_03" style="position:absolute; left:139px; top:1px; width:68px; height:94px; z-index:3;border:1px solid #333">
  <span ></span>
  </div>
  <div class="warehouse" id="01_04" style="position:absolute; left:208px; top:1px; width:68px; height:94px; z-index:3;border:1px solid #333">
  <span ></span>
  </div>
  <div class="warehouse" id="01_05" style="position:absolute; left:277px; top:1px; width:68px; height:94px; z-index:3;border:1px solid #333">
  <span ></span>
  </div>
  <div class="warehouse" id="01_06" style="position:absolute; left:348px; top:1px; width:68px; height:94px; z-index:3;border:1px solid #333">
  <span ></span>
  </div>
  <div class="warehouse" id="01_07" style="position:absolute; left:352px; top:123px; width:66px; height:90px; z-index:3;border:1px solid #333">
  <span ></span>
  </div>
  <div class="warehouse" id="01_08" style="position:absolute; left:290px; top:123px; width:61px; height:90px; z-index:3;border:1px solid #333">
  <span ></span>
  </div>
  <div class="warehouse" id="01_09" style="position:absolute; left:233px; top:123px; width:56px; height:90px; z-index:3;border:1px solid #333">
  <span ></span>
  </div>
  <div class="warehouse" id="01_10" style="position:absolute; left:176px; top:123px; width:56px; height:90px; z-index:3;border:1px solid #333">
  <span ></span>
  </div>
  <div class="warehouse" id="01_11" style="position:absolute; left:117px; top:123px; width:58px; height:90px; z-index:3;border:1px solid #333">
  <span ></span>
  </div>
  <div class="warehouse" id="01_12" style="position:absolute; left:59px; top:123px; width:57px; height:90px; z-index:3;border:1px solid #333">
  <span ></span>
  </div>
  <div class="warehouse" id="01_13" style="position:absolute; left:1px; top:123px; width:57px; height:90px; z-index:3;border:1px solid #333">
  <span ></span>
  </div>
</div>
<div id="Layer3" style="position:absolute; left:8px; top:251px; width:326px; height:181px; z-index:3;border:1px solid #333">
  <div class="warehouse" id="02_01" style="position:absolute; left:1px; top:1px; width:46px; height:65px; z-index:3;border:1px solid #333">
  <span ></span>
  </div>
	<div class="warehouse" id="02_02" style="position:absolute; left:48px; top:1px; width:46px; height:65px; z-index:3;border:1px solid #333">
  <span ></span>
  </div>
  <div class="warehouse" id="02_03" style="position:absolute; left:95px; top:1px; width:53px; height:65px; z-index:3;border:1px solid #333">
  <span ></span>
  </div>
  <div class="warehouse" id="02_04" style="position:absolute; left:149px; top:1px; width:56px; height:65px; z-index:3;border:1px solid #333">
  <span ></span>
  </div>
  <div class="warehouse" id="02_05" style="position:absolute; left:206px; top:1px; width:61px; height:65px; z-index:3;border:1px solid #333">
  <span ></span>
  </div>
  
  <div class="warehouse" id="02_06" style="position:absolute; left:268px;top: 31px;width:55px; height:72px; z-index:3; border:1px solid #333; ">
  <span ></span>
  </div>
  <div class="warehouse" id="02_07" style="position:absolute; left:214px; bottom:0px; width:55px; height:72px; z-index:3; border:1px solid #333; ">
  <span ></span>
  </div>
  <div class="warehouse" id="02_08" style="position:absolute; left:143px; bottom:0px; width:70px; height:72px; z-index:3;border:1px solid #333">
  <span ></span>
  	
  </div>
  
  <div class="warehouse" id="02_09" style="position:absolute; left:72px; bottom:0px; width:70px; height:72px; z-index:3;border:1px solid #333">
  <span ></span>
  </div>
  <div class="warehouse" id="02_10" style="position:absolute; left:1px; bottom:0px; width:70px; height:72px; z-index:3;border:1px solid #333">
  	<span ></span>
  </div>
</div>
 
<c:forEach items="${requestScope['stockWarehouse.list']}" var="stockWarehouse">
<c:forEach items="${stockWarehouse.subWarehouseList}" var="subWarehouse">
	<span  id="${subWarehouse.serialKey}" style="display: none; " >
	${subWarehouse.name}<br/>
	<fmt:formatNumber value="${subWarehouse.totalWeight/1000/subWarehouse.volume}" type="number" pattern="0.0%"/>
	</span>
	
</c:forEach>
</c:forEach>		
				
			</div>
			
		</html:form>
			
		</div>
	</body>
</html>

