<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib prefix="logic" uri="/WEB-INF/tlds/struts-logic.tld" %>
<%@ taglib prefix="html"  uri="/WEB-INF/tlds/struts-html.tld"  %>

<jsp:include page="common/tags.jsp" flush="true" />
<html> 
	<head>
		<title>工作台</title>
		
		<style type="text/css" title="currentStyle">
			
			.toolbar {
				float: left;
			}
			
			.button{ text-decoration: none;
					 display: block;
					 float: left;
					 margin: 8px;
					 height: 55px
			
			}
			.button span{padding: 12px}
			.frame{width: 600px;display: block;padding: 15px;
			}
			.frame legend{padding: 8px;
							
			}
		</style>
		<link type="text/css" rel="stylesheet" href="plug-in/weebox/weebox.css" />
		<script type="text/javascript" src="plug-in/lightTreeview/jquery-1.2.6.js"></script>
		<script type="text/javascript" language="javascript" src="plug-in/dataTables/js/jquery.dataTables.js"></script>
		<script type="text/javascript" src="plug-in/weebox/bgiframe.js"></script>
		<script type="text/javascript" src="plug-in/weebox/weebox.js"></script>
		
	</head>
	<body >
	
		<div id="main">
		<jsp:include page="common/top.jsp" flush="true" />
		<html:form action="/stockIn.do?method=save">
			<div style="width: 605px;margin: 0px auto 0px auto">
				<c:if test="${sessionScope.user.role >= 2}">
					<fieldset class="frame">
					<legend>业务办理</legend>
					<a class="button"  href="stockIn.do?method=init"> 
						<img border="0" src="images/stockIn.gif" /><span >入库登记</span>
					</a>
					<a class="button" href="stockOut.do?method=init"> 
						<img border="0" src="images/stockOut.gif" /><span >出库登记</span>
					</a>
					</fieldset>
				</c:if>
				<fieldset class="frame" style="margin-top: 25px">
				<legend>信息查询</legend>
				<a class="button" href="stockWarehouse.do?method=view"> 
					<img border="0"  src="images/warehouseInfo.gif"></img><span >库房信息</span>
				</a>
				<a class="button" href="stockCustomer.do?method=view"> 
					<img border="0" src="images/customerInfo.gif"></img><span >客户信息</span>
				</a>
				<a class="button" href="cargo.do?method=view&type=readOnly"> 
					<img border="0" src="images/cargoInfo.gif"></img><span >货品信息</span>
				</a>
				<a class="button" href="user.do?method=item"> 
					<img border="0" src="images/user.gif"></img><span >员工信息</span>
				</a>
				</fieldset>
				<fieldset class="frame" style="margin-top: 25px">
				<legend>统计分析</legend>
				<a class="button" href="stockItems.do?method=all"> 
					<img border="0" src="images/item.gif"></img><span >明细记录</span>
				</a>
				<a class="button" href="stockAnalyze.do?method=view"> 
					<img border="0" src="images/inOut.gif"></img><span >每日出入库及结存量</span>
				</a>
				<a class="button" href="stockAnalyze.do?method=category"> 
					<img border="0" src="images/analyse.gif"></img><span >分类汇总</span>
				</a>
				
				</fieldset>
			</div>
		</html:form>
			
		</div>
	</body>
</html>


