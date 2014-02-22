		<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <link rel="stylesheet" href="plug-in/megamenu/stylesheets/jquery.megamenu.css" type="text/css" media="screen" />
        
        <script src="plug-in/megamenu/libs/jquery-event-hover/jquery.event.hover.js" type="text/javascript"></script>
        <script src="plug-in/megamenu/javascripts/jquery.megamenu.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function(){
              
	            $(".MegaMenuLink").megamenu(".MegaMenuContent", {
	                justify: "right"
	            });
	            $('.MegaMenu').css("text-align", "right");
              
            });
        </script>
   		<div style="background-image:url(images/title.gif);width: 239px; height: 23px;margin:9px 5px 8px 5px;"></div>
   		
   		<div style="background-image:url(images/icon.jpg);width:71px; height:74px;position:absolute;margin-left:255px;top:0px;margin-top:2px;"></div>
        <table id="Container" >
            <tr>
                <td valign="top">
                    <div id="Header">
                    </div>
                    <div class="MegaMenu">
                        <a class="MegaMenuLinkOff" href="workBench.do?method=view">工作台</a>
                        <a class="MegaMenuLink" href="javascript:void(0)">业务管理</a>
                        <div class="MegaMenuContent">
                            <table class="MegaMenuTable" border="0">
                                <tr>
                                	<c:if test="${sessionScope.user.role >= 2}">
		                                <th>
	                                        <div class="MegaMenuHead">
	                                           	
	                                        </div>
	                                    </th>
                                    </c:if>
                                    <th>
                                        <div class="MegaMenuHead">
                                           	 	
                                        </div>
                                    </th>
                                    
                                </tr>
                                <tr>
                                	<c:if test="${sessionScope.user.role >= 2}">
	                                    <td>
	                                    	
	                                    	
		                                        <ul class="MegaMenuLists">
		                                        
		                                            <li>
		                                                <a href="stockOut.do?method=init">出库登记</a>
		                                            </li>
		                                            <li>
		                                                <a href="stockIn.do?method=init">入库登记</a>
		                                            </li>
		                                            <li>
		                                                <a href="stockTransfer.do?method=init">移库登记</a>
		                                            </li>
		                                            <li>
		                                                <a href="stockEqual.do?method=init">平账登记</a>
		                                            </li>
		                                            <!-- 
		                                            <li>
		                                                <a href="stockCustomer.do?method=view">入出库明细</a>
		                                            </li>
		                                            -->
		                                        </ul>
	                                       
	                                    </td>
                                    </c:if>
                                    
                                     <td>
	                                    	
	                                    	
		                                        <ul class="MegaMenuLists">
		                                        
		                                            <li>
		                                                <a href="purchase.do?method=init">进货登记</a>
		                                            </li>
		                                            <li>
		                                                <a href="sales.do?method=init">销售登记</a>
		                                            </li>
		                                            
		                                            <!-- 
		                                            <li>
		                                                <a href="stockCustomer.do?method=view">入出库明细</a>
		                                            </li>
		                                            -->
		                                        </ul>
	                                       
	                                    </td>
                                    
                                    <td class="LastCell">
                                        <ul class="MegaMenuLists">
                                            <li>
                                                <a href="stockCustomer.do?method=view">客户信息</a>
                                            </li>
                                            <li>
                                                <a href="charge.do?method=init">收费管理</a>
                                            </li>
                                            <li>
                                                <a href="stockWarehouse.do?method=view">库房信息</a>
                                            </li>
                                           <li>
                                                <a href="cargo.do?method=view&type=readOnly">货品信息</a>
                                            </li>
                                            <li>
                                                <a href="user.do?method=item">员工信息</a>
                                            </li>
                                        </ul>
                                    </td>
                                    
                                </tr>
                            </table>
                        </div>
                        
                        
                        <a class="MegaMenuLink" href="javascript:void(0)">统计分析</a>
                        <div class="MegaMenuContent">
                            <table class="MegaMenuTable" border="0">
                                <tr>
                                    <th>
                                        <div class="MegaMenuHead">
                                                  
                                        </div>
                                    </th>
                                    <th>
                                        <div class="MegaMenuHead">
                                           	
                                        </div>
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        <ul class="MegaMenuLists">
                                         	<li>
                                                <a href="stockAnalyze.do?method=stockOverview">概况</a>
                                            </li>
                                            <li>
                                                <a href="stockItems.do?method=all">明细记录</a>
                                            </li>
                                          
                                        </ul>
                                    </td>
                                    <td class="LastCell">
                                        <ul class="MegaMenuLists">
                                              <li>
                                                <a href="stockAnalyze.do?method=view">每日出入库及结存量</a>
                                            </li>
                                            <li>
                                                <a href="stockAnalyze.do?method=multiCargo">出入库及结存量</a>
                                            </li>
                                            <li>
                                                <a href="stockAnalyze.do?method=summary">汇总</a>
                                            </li>
                                            <li>
                                                <a href="stockAnalyze.do?method=category">分类汇总</a>
                                            </li>
                                             <li>
                                                <a href="customerInventory.do?method=inventory">盘点</a>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                                
                            </table>
                        </div>
                        <c:if test="${sessionScope.user.role >= 3}">
                        <a class="MegaMenuLink" href="javascript:void(0)">信息维护</a>
                        <div class="MegaMenuContent">
                            <table class="MegaMenuTable" border="0">
                                <tr>
                                    <th>
                                        <div class="MegaMenuHead">
                                        	客户信息      
                                        </div>
                                    </th>
                                     <th>
                                        <div class="MegaMenuHead">
                                           	货品信息
                                        </div>
                                    </th>
                                    <th>
                                        <div class="MegaMenuHead">
                                           	仓库信息
                                        </div>
                                    </th>
                                </tr>
                                <tr>
                                    <td>
                                        <ul class="MegaMenuLists">
                                            <li>
                                                <a href="customer.do?method=view">客户信息维护</a>
                                            </li>
                                            <li>
                                                <a href="contract.do?method=view">存储协议维护</a>
                                            </li>
                                           
                                        </ul>
                                    </td>
                                    <td>
                                        <ul class="MegaMenuLists">
                                            <li>
                                                <a href="cargo.do?method=view">货品信息维护</a>
                                            </li>
                                           <li>
                                                <a href="cargo.do?method=view">货品月盘存</a>
                                            </li>
                                           
                                        </ul>
                                    </td>
                                    <td class="LastCell">
                                        <ul class="MegaMenuLists">
                                            <li>
                                                <a href="warehouse.do?method=view">库房维护</a>
                                            </li>
                                            <li>
                                                <a href="#">储位维护</a>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                                
                            </table>
                        </div>
                        </c:if>
                        <a class="MegaMenuLink" href="javascript:void(0)">设置</a>
                        <div class="MegaMenuContent">
                            <table class="MegaMenuTable" border="0">
                                <tr>
                                 <c:if test="${sessionScope.user.role >= 3}">
                                    <th>
                                        <div class="MegaMenuHead">
                                                  权限管理
                                        </div>
                                    </th>
                                    <th>
                                        <div class="MegaMenuHead">
                                           	参数设置
                                        </div>
                                    </th>
                                  </c:if>  
                                    <th>
                                        <div class="MegaMenuHead">
                                           	
                                        </div>
                                    </th>
                                    <th>
                                        <div class="MegaMenuHead">
                                           	
                                        </div>
                                    </th>
                                </tr>
                                <tr>
                                	<c:if test="${sessionScope.user.role >= 3}">
                                    <td>
                                        <ul class="MegaMenuLists">
                                            <li>
                                                <a href="user.do?method=view">用户管理</a>
                                            </li>
                                            <li>
                                                <a href="#">角色、部门管理</a>
                                            </li>
                                            <li>
                                                <a href="#">权限设置</a>
                                            </li>
                                        </ul>
                                    </td>
                                    <td>
                                        <ul class="MegaMenuLists">
                                            <li>
                                                <a href="syscode.do?method=view&key=root">系统参数</a>
                                            </li>
                                            <li>
                                                <a href="#">费用设置</a>
                                            </li>
                                        </ul>
                                    </td>
                                   </c:if>
                                    <td>
                                        <ul class="MegaMenuLists">
                                            <li>
                                                <a href="userEdit.do?method=userSetup">用户设置</a>
                                            </li>
                                           
                                        </ul>
                                    </td>
                                    <td class="LastCell">
                                        <ul class="MegaMenuLists">
                                            <li>
                                                <a href="systemLog.do?method=query">系统日志</a>
                                            </li>
                                            <li>
                                                <a href="systemLog.do?method=onlineUsers">在线用户</a>
                                            </li>
                                        </ul>
                                    </td>
                                </tr>
                                
                            </table>
                        </div>   
                    </div>
                    
                </td>
            </tr>
        </table>
       
       

