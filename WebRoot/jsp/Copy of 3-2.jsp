<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib prefix="logic" uri="/WEB-INF/tlds/struts-logic.tld" %>
<%@ taglib prefix="html"  uri="/WEB-INF/tlds/struts-html.tld"  %>

<html>
<head>

<title></title>
	<style type="text/css" title="currentStyle">
		
		table.area{
			clear: both;border-collapse:collapse; border:1px solid #000; padding:0px 1px 0px 1px;
		}
		table.area td{ border:0px solid #000}
		.row{width:25px }
		.head{width:65px; font-size:16px; text-align:center; font-weight:bolder}
		.left{height:66px; font-size:16px; font-weight:bolder}
		input{ border:1px solid #999; width:67px; font-size:12px}
    </style>
    <script type="text/javascript" src="plug-in/lightTreeview/jquery-1.2.6.js"></script>
		<script type="text/javascript">
		 	$().ready(function() {
           		$(".cc").each(function() {
    	      	var id = $(this).attr("id");
    	      
    	       	$('td[id='+ id +']').html($(this).html());
		       //$(this).find('input[id='+ id +']').html($('span[id='+id+']').html());
		     	});
            	
            });
			
		</script>
</head>

<body>

<html:form action="/stockPostion.do?method=save">
		
<div style="float:left; height: 800px; width: 5px">
	<div style="height:50px ">&nbsp;</div>
	<div class="left">1</div>
	<div class="left">2</div>
	<div class="left">3</div>
	<div class="left">4</div>
	<div class="left">5</div>
	<div class="left">6</div>
	<div class="left">7</div>
	<div class="left">8</div>
	<div class="left">9</div>
	<div class="left">10</div>
	<div class="left">11</div>
	<div class="left">12</div>
	<div class="left">13</div>
</div>
<div style="float:left;" >
<table width="1270px" >
<tr>
 	<td  class="head">A</td>
	<td >&nbsp; </td>
	<td class="head">B</td>
	<td class="head">C</td>
	<td>&nbsp;  </td>
	<td class="head">D</td>
	<td class="head">E</td>
	<td >&nbsp; </td>
	<td  class="head">F</td>
	<td  class="head">G</td>
	<td >&nbsp; </td>
	<td class="head">H</td>
	<td  class="head">I</td>
	<td >&nbsp; </td>
	<td class="head">J</td>
	<td class="head">K</td>
	<td >&nbsp; </td>
	<td class="head">L</td>
	<td  class="head">M</td>
	<td >&nbsp; </td>
	<td  class="head">N</td>
	<td  class="head">O</td>
	<td >&nbsp; </td>
	<td  class="head">P</td>
	
 </tr>	
</table>

<table id="wearhouse" width="1270px" cellpadding="0" cellspacing="1"  style="border:2px solid #000 ">
 
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td  id="A1-1" style=" border: 1px solid #000; font-size:12px; height: 25px"></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A1-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A1-3" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="B1-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="B1-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="B1-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="C1-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="C1-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="C1-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="D1-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="D1-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="D1-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="E1-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="E1-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="E1-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="F1-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="F1-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="F1-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="G1-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="G1-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="G1-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="H1-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="H1-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="H1-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="I1-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="I1-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="I1-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="J1-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="J1-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="J1-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="K1-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="K1-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="K1-3" type="text"/></td>
		  </tr>
	  </table>
     
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="L1-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="L1-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="L2-1" type="text"/>
			</td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="M1-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="M1-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="M1-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="N1-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="N1-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="N1-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="O1-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="O1-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="O1-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row" ><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="P1-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="P1-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="P1-3" type="text"/></td>
		  </tr>
	  </table></td>
  </tr>
 
 
  
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="A2-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A2-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A2-3" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="B2-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="B2-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="B2-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="C2-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="C2-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="C2-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="D2-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="D2-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="D2-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="E2-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="E2-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="E2-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="F2-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="F2-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="F2-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="G2-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="G2-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="G2-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="H2-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="H2-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="H2-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="I2-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="I2-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="I2-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="J2-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="J2-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="J2-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="K2-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="K2-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="K2-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="L1-3" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="L2-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="L2-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="M2-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="M2-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="M2-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="N2-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="N2-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="N2-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="O2-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="O2-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="O2-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row" ><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="P2-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="P2-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="P2-3" type="text"/></td>
		  </tr>
	  </table></td>
  </tr>
  
  
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="A3-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A3-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A3-3" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="B3-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="B3-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="B3-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="C3-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="C3-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="C3-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="D3-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="D3-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="D3-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="E3-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="E3-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="E3-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="F3-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="F3-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="F3-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="G3-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="G3-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="G3-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="H3-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="H3-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="H3-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="I3-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="I3-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="I3-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="J3-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="J3-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="J3-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="K3-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="K3-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="K3-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="L3-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="L3-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="L3-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="M3-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="M3-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="M3-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="N3-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="N3-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="N3-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="O3-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="O3-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="O3-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row" ><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="P3-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="P3-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="P3-3" type="text"/></td>
		  </tr>
	  </table></td>
  </tr>
  
  
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="A4-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A4-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A4-3" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="B4-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="B4-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="B4-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="C4-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="C4-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="C4-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="D4-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="D4-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="D4-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="E4-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="E4-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="E4-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="F4-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="F4-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="F4-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="G4-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="G4-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="G4-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="H4-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="H4-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="H4-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="I4-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="I4-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="I4-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="J4-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="J4-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="J4-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="K4-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="K4-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="K4-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="L4-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="L4-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="L4-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="M4-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="M4-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="M4-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="N4-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="N4-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="N4-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="O4-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="O4-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="O4-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row" ><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="P4-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="P4-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="P4-3" type="text"/></td>
		  </tr>
	  </table></td>
  </tr>
  
  
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="A5-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A5-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A5-3" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="B5-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="B5-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="B5-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="C5-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="C5-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="C5-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="D5-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="D5-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="D5-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="E5-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="E5-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="E5-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="F5-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="F5-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="F5-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="G5-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="G5-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="G5-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="H5-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="H5-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="H5-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="I5-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="I5-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="I5-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="J5-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="J5-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="J5-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="K5-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="K5-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="K5-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="L5-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="L5-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="L5-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="M5-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="M5-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="M5-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="N5-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="N5-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="N5-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="O5-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="O5-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="O5-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row" ><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="P5-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="P5-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="P5-3" type="text"/></td>
		  </tr>
	  </table></td>
  </tr>
  
  
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="A6-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A6-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A6-3" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="B6-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="B6-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="B6-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="C6-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="C6-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="C6-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="D6-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="D6-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="D6-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="E6-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="E6-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="E6-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="F6-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="F6-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="F6-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="G6-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="G6-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="G6-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="H6-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="H6-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="H6-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="I6-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="I6-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="I6-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="J6-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="J6-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="J6-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="K6-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="K6-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="K6-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="L6-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="L6-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="L6-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="M6-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="M6-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="M6-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="N6-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="N6-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="N6-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="O6-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="O6-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="O6-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row" ><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="P6-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="P6-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="P6-3" type="text"/></td>
		  </tr>
	  </table></td>
  </tr>
  
  
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="A7-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A7-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A7-3" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="B7-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="B7-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="B7-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="C7-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="C7-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="C7-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="D7-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="D7-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="D7-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="E7-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="E7-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="E7-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="F7-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="F7-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="F7-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="G7-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="G7-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="G7-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="H7-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="H7-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="H7-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="I7-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="I7-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="I7-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="J7-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="J7-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="J7-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="K7-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="K7-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="K7-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="L7-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="L7-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="L7-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="M7-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="M7-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="M7-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="N7-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="N7-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="N7-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="O7-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="O7-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="O7-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row" ><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="P7-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="P7-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="P7-3" type="text"/></td>
		  </tr>
	  </table></td>
  </tr>
  
  
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="A8-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A8-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A8-3" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="B8-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="B8-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="B8-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="C8-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="C8-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="C8-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="D8-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="D8-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="D8-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="E8-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="E8-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="E8-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="F8-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="F8-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="F8-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="G8-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="G8-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="G8-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="H8-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="H8-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="H8-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="I8-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="I8-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="I8-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="J8-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="J8-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="J8-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="K8-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="K8-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="K8-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="L8-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="L8-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="L8-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="M8-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="M8-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="M8-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="N8-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="N8-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="N8-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="O8-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="O8-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="O8-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row" ><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="P8-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="P8-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="P8-3" type="text"/></td>
		  </tr>
	  </table></td>
  </tr>
  
  
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="A9-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A9-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A9-3" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="B9-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="B9-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="B9-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="C9-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="C9-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="C9-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="D9-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="D9-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="D9-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="E9-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="E9-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="E9-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="F9-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="F9-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="F9-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="G9-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="G9-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="G9-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="H9-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="H9-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="H9-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="I9-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="I9-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="I9-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="J9-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="J9-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="J9-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="K9-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="K9-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="K9-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="L9-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="L9-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="L9-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="M9-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="M9-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="M9-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="N9-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="N9-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="N9-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="O9-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="O9-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="O9-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row" ><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="P9-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="P9-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="P9-3" type="text"/></td>
		  </tr>
	  </table></td>
  </tr>
  
  
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="A10-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A10-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A10-3" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="B10-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="B10-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="B10-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="C10-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="C10-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="C10-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="D10-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="D10-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="D10-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="E10-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="E10-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="E10-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="F10-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="F10-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="F10-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="G10-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="G10-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="G10-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="H10-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="H10-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="H10-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="I10-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="I10-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="I10-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="J10-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="J10-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="J10-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="K10-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="K10-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="K10-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="L10-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="L10-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="L10-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="M10-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="M10-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="M10-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="N10-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="N10-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="N10-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="O10-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="O10-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="O10-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row" ><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="P10-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="P10-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="P10-3" type="text"/></td>
		  </tr>
	  </table></td>
  </tr>
  
  
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="A11-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A11-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A11-3" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="B11-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="B11-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="B11-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="C11-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="C11-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="C11-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="E11-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="E11-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="E11-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="F11-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="F11-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="F11-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="G11-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="G11-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="G11-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		
	</td>
    <td class="row">
		
	</td>
    <td>&nbsp;</td>
    <td class="row"></td>
    <td class="row"></td>
    <td>&nbsp;</td>
    <td class="row"></td>
    <td class="row"></td>
    <td>&nbsp;</td>
    <td class="row"></td>
    <td class="row"></td>
    <td>&nbsp;</td>
    <td class="row" ></td>
  </tr>
  
  
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="A12-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A12-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A12-3" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		
	</td>
    <td class="row">
		
	</td>
    <td >&nbsp;</td>
    <td class="row">
		
	</td>
    <td class="row">
		
	</td>
    <td >&nbsp;</td>
    <td class="row">
		
	</td>
    <td class="row">
		
	</td>
    <td >&nbsp;</td>
    <td class="row">
		
	</td>
    <td class="row">
		
	</td>
    <td>&nbsp;</td>
    <td class="row"></td>
    <td class="row"></td>
    <td>&nbsp;</td>
    <td class="row"></td>
    <td class="row"></td>
    <td>&nbsp;</td>
    <td class="row"></td>
    <td class="row"></td>
    <td>&nbsp;</td>
    <td class="row" ></td>
  </tr>
  
  
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="A13-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A13-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="A13-3" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="B13-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="B13-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="B13-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="C13-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="C13-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="C13-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="D13-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="D13-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="D13-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="E13-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="E13-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="E13-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="F13-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="F13-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="F13-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="G13-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="G13-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="G13-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="H13-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="H13-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="H13-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="I13-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="I13-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="I13-3" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="J13-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="J13-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="J13-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="K13-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="K13-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="K13-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="L13-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="L13-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="L13-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="M13-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="M13-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="M13-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="N13-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="N13-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="N13-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="O13-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="O13-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="O13-3" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row" ><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="rack" id="P13-1" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="P13-2" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="rack" id="P13-3" type="text"/></td>
		  </tr>
	  </table></td>
  </tr>
 
</table>
</div>
<c:forEach var="l" items="${requestScope['list']}" >
	<div style="display: none" class="cc" id="<c:out value="${l[3]}" />" >
		<c:out value="${l[0]}" />
	</div>
</c:forEach>
</html:form>
</body>
</html>
