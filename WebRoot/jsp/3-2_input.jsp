<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib prefix="logic" uri="/WEB-INF/tlds/struts-logic.tld" %>
<%@ taglib prefix="html"  uri="/WEB-INF/tlds/struts-html.tld"  %>

<html>
<head>

<title></title>
	<script type="text/javascript" src="plug-in/lightTreeview/jquery-1.2.6.js"></script>
	<style type="text/css" title="currentStyle">
		
		table.area{
			clear: both;border-collapse:collapse; border:1px solid #000; padding:0px 1px 0px 1px;
		}
		table.area td{ border:0px solid #000}
		.row{width:25px }
		.head{width:25px; font-size:16px; text-align:center; font-weight:bolder}
		.left{height:69px; font-size:16px; font-weight:bolder; text-align: center;}
		input{ border:1px solid #999; width:25px}
    </style>

</head>

<body>

<html:form action="/stockPostion.do?method=save">
<input  name="index" type="hidden" value="${index}"/>
<div style="float:left; width: 25px;">
	<div style="height:52px ">&nbsp;</div>
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
<table width="650px" >
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

<table id="wearhouse" width="650px" cellpadding="0" cellspacing="1"  style="border:2px solid #000 ">
 
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="A1-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A1-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A1-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="B1-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B1-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B1-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="C1-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C1-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C1-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="D1-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D1-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D1-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="E1-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E1-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E1-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="F1-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F1-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F1-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="G1-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G1-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G1-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="H1-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H1-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H1-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="I1-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I1-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I1-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="J1-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J1-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J1-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="K1-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K1-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K1-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
     
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="L1-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L1-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L2-1" type="hidden"/><input name="quantity" type="text"/>
			</td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="M1-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M1-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M1-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="N1-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N1-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N1-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="O1-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O1-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O1-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row" ><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="P1-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P1-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P1-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
  </tr>
 
 
  
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="A2-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A2-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A2-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="B2-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B2-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B2-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="C2-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C2-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C2-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="D2-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D2-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D2-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="E2-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E2-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E2-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="F2-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F2-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F2-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="G2-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G2-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G2-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="H2-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H2-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H2-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="I2-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I2-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I2-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="J2-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J2-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J2-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="K2-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K2-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K2-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="L1-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L2-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L2-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="M2-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M2-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M2-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="N2-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N2-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N2-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="O2-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O2-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O2-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row" ><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="P2-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P2-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P2-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
  </tr>
  
  
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="A3-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A3-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A3-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="B3-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B3-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B3-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="C3-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C3-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C3-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="D3-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D3-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D3-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="E3-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E3-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E3-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="F3-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F3-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F3-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="G3-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G3-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G3-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="H3-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H3-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H3-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="I3-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I3-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I3-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="J3-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J3-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J3-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="K3-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K3-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K3-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="L3-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L3-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L3-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="M3-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M3-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M3-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="N3-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N3-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N3-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="O3-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O3-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O3-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row" ><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="P3-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P3-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P3-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
  </tr>
  
  
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="A4-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A4-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A4-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="B4-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B4-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B4-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="C4-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C4-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C4-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="D4-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D4-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D4-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="E4-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E4-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E4-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="F4-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F4-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F4-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="G4-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G4-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G4-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="H4-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H4-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H4-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="I4-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I4-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I4-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="J4-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J4-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J4-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="K4-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K4-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K4-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="L4-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L4-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L4-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="M4-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M4-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M4-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="N4-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N4-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N4-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="O4-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O4-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O4-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row" ><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="P4-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P4-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P4-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
  </tr>
  
  
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="A5-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A5-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A5-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="B5-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B5-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B5-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="C5-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C5-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C5-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="D5-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D5-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D5-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="E5-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E5-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E5-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="F5-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F5-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F5-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="G5-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G5-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G5-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="H5-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H5-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H5-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="I5-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I5-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I5-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="J5-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J5-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J5-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="K5-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K5-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K5-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="L5-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L5-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L5-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="M5-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M5-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M5-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="N5-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N5-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N5-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="O5-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O5-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O5-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row" ><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="P5-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P5-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P5-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
  </tr>
  
  
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="A6-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A6-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A6-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="B6-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B6-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B6-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="C6-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C6-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C6-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="D6-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D6-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D6-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="E6-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E6-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E6-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="F6-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F6-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F6-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="G6-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G6-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G6-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="H6-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H6-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H6-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="I6-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I6-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I6-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="J6-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J6-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J6-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="K6-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K6-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K6-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="L6-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L6-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L6-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="M6-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M6-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M6-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="N6-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N6-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N6-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="O6-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O6-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O6-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row" ><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="P6-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P6-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P6-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
  </tr>
  
  
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="A7-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A7-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A7-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="B7-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B7-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B7-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="C7-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C7-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C7-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="D7-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D7-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D7-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="E7-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E7-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E7-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="F7-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F7-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F7-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="G7-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G7-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G7-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="H7-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H7-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H7-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="I7-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I7-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I7-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="J7-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J7-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J7-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="K7-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K7-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K7-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="L7-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L7-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L7-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="M7-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M7-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M7-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="N7-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N7-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N7-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="O7-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O7-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O7-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row" ><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="P7-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P7-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P7-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
  </tr>
  
  
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="A8-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A8-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A8-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="B8-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B8-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B8-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="C8-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C8-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C8-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="D8-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D8-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D8-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="E8-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E8-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E8-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="F8-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F8-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F8-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="G8-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G8-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G8-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="H8-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H8-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H8-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="I8-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I8-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I8-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="J8-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J8-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J8-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="K8-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K8-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K8-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="L8-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L8-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L8-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="M8-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M8-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M8-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="N8-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N8-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N8-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="O8-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O8-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O8-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row" ><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="P8-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P8-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P8-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
  </tr>
  
  
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="A9-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A9-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A9-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="B9-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B9-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B9-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="C9-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C9-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C9-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="D9-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D9-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D9-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="E9-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E9-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E9-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="F9-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F9-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F9-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="G9-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G9-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G9-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="H9-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H9-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H9-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="I9-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I9-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I9-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="J9-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J9-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J9-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="K9-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K9-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K9-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="L9-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L9-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L9-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="M9-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M9-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M9-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="N9-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N9-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N9-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="O9-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O9-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O9-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row" ><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="P9-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P9-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P9-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
  </tr>
  
  
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="A10-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A10-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A10-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="B10-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B10-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B10-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="C10-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C10-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C10-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="D10-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D10-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D10-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="E10-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E10-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E10-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="F10-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F10-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F10-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="G10-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G10-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G10-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="H10-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H10-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H10-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="I10-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I10-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I10-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="J10-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J10-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J10-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="K10-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K10-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K10-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="L10-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L10-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L10-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="M10-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M10-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M10-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="N10-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N10-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N10-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="O10-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O10-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O10-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row" ><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="P10-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P10-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P10-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
  </tr>
  
  
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="A11-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A11-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A11-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="B11-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B11-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B11-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="C11-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C11-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C11-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="D11-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D11-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D11-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="E11-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E11-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E11-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="F11-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F11-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F11-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="G11-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G11-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G11-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="H11-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H11-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H11-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="I11-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I11-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I11-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="J11-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J11-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J11-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="K11-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K11-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K11-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="L11-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L11-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L11-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="M11-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M11-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M11-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="N11-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N11-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N11-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="O11-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O11-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O11-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row" ><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="P11-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P11-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P11-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
  </tr>
  
  
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="A12-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A12-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A12-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="B12-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B12-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B12-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="C12-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C12-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C12-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="D12-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D12-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D12-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="E12-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E12-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E12-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="F12-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F12-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F12-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="G12-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G12-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G12-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="H12-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H12-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H12-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="I12-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I12-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I12-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="J12-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J12-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J12-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="K12-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K12-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K12-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="L12-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L12-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L12-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="M12-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M12-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M12-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="N12-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N12-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N12-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="O12-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O12-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O12-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row" ><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="P12-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P12-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P12-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
  </tr>
  
  
  <tr>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="A13-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A13-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="A13-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>

	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="B13-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B13-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="B13-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="C13-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C13-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="C13-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="D13-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D13-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="D13-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="E13-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E13-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="E13-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="F13-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F13-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="F13-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="G13-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G13-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="G13-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td >&nbsp;</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="H13-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H13-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="H13-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td class="row">
		<table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="I13-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I13-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="I13-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table>
	</td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="J13-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J13-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="J13-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="K13-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K13-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="K13-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="L13-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L13-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="L13-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="M13-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M13-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="M13-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="N13-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N13-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="N13-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td class="row"><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="O13-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O13-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="O13-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
    <td>&nbsp;</td>
    <td class="row" ><table width="100%"  cellpadding="0" cellspacing="0" class="area">
		  <tr>
			<td><input name="postionNumber" value="P13-1" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P13-2" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
		  <tr>
			<td><input name="postionNumber" value="P13-3" type="hidden"/><input name="quantity" type="text"/></td>
		  </tr>
	  </table></td>
  </tr>
 
</table>
</div>
	<div style="width: 100px;margin: 15px auto"> 
		<input type="button"  onclick="closeWindow();return false;" value="保存" style=" width:60px;"/>
	</div>
</html:form>

			<script type="text/javascript">
				
	           // function closeWindow(){ 
	           // 	document.stockPostionForm.action = "stockPostion.do?method=save";   
	        	//	document.stockPostionForm.submit();
	        	//	window.close(); 
				//	window.returnValue = "refresh";
				//} 
 				function closeWindow(){ 
 				 	var returnValue = "";
	            	$('input[name="quantity"]').each(function(){
				        var quantity = $(this).val();
				       
				        if(quantity != ""){
				        	var postion = $(this).prev().val();
				        	returnValue = returnValue + postion + ":" + quantity+ ",";
				        }
				        
				    });
	        		window.close(); 
					window.returnValue = returnValue;
				} 
			
			</script>
</body>
</html>
