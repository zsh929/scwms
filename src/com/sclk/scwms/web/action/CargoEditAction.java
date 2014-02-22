/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.sclk.scwms.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.sclk.scwms.common.JsonUtil;
import com.sclk.scwms.common.StringUtil;
import com.sclk.scwms.model.Cargo;
import com.sclk.scwms.service.CargoManager;
import com.sclk.scwms.service.CustomerManager;
import com.sclk.scwms.service.SyscodeManager;
import com.sclk.scwms.service.WarehouseManager;
import com.sclk.scwms.vo.CargoVO;
import com.sclk.scwms.web.form.CargoEditForm;

/** 
 * MyEclipse Struts
 * Creation date: 03-23-2010
 * 
 * XDoclet definition:
 * @struts.action path="/cargo" name="cargoForm" input="/jsp/cargo.jsp" parameter="method" scope="request" validate="true"
 * @struts.action-forward name="init" path="/jsp/cargo.jsp"
 */
public class CargoEditAction extends BaseAction {
	
	private CargoManager manager;

    public void setManager(CargoManager manager) {
    	this.manager = manager;
    }
    private SyscodeManager scmanager;

    public void setScmanager(SyscodeManager manager) {
    	this.scmanager = manager;
    }
    private CustomerManager customerManager;

    public void setCustomerManager(CustomerManager manager) {
    	this.customerManager = manager;
    }
    private WarehouseManager warehouseManager;

    public void setWarehouseManager(WarehouseManager manager) {
    	this.warehouseManager = manager;
    }
	/*
	 * Generated Methods
	 */

	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward init(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		CargoEditForm cargoEditForm = (CargoEditForm) form;// TODO Auto-generated method stub
		
		String cargoId  = request.getParameter("cargoId");
		
		Integer id = StringUtil.stringToInteger(cargoId);
		Cargo c = null;
		if(id != null){
			c = manager.getCargo(id);
		}
		
		
		if(c != null){	
			cargoEditForm.setId(c.getId().toString());
			cargoEditForm.setName(c.getName());
			cargoEditForm.setCategory(c.getCategory());
			cargoEditForm.setSize(c.getSize());
			cargoEditForm.setUnit(c.getUnit());
			cargoEditForm.setWeight(c.getWeight());
			cargoEditForm.setNumber(c.getNumber());
			cargoEditForm.setCustomerId(c.getCustomerId());
		}	
		
		
		List customerList = customerManager.getCustomers();
		cargoEditForm.setCustomerList(customerList);
		
		List unitList = scmanager.getChildren("unit");
		cargoEditForm.setUnitList(unitList);
		List categoryList = scmanager.getItemForSelect("category");
		cargoEditForm.setCategoryList(categoryList);
		
		return mapping.findForward("init");
	}
	
	public ActionForward initStockInCargo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		CargoEditForm cargoEditForm = (CargoEditForm) form;// TODO Auto-generated method stub
		
		List unitList = scmanager.getChildren("unit");
		cargoEditForm.setUnitList(unitList);
		List categoryList = scmanager.getItemForSelect("category");
		cargoEditForm.setCategoryList(categoryList);
		
		String customerId  = request.getParameter("customerId");
		
		
		
		List list = manager.getCargoByCustomer(customerId);
		String cl = JsonUtil.list2json(list);
		if(cl == null || cl.equals("")){
			cl = "''";
		}
		cargoEditForm.setJsonList(cl);
		
		
		String[] s = {};
		Map m = warehouseManager.getLocation(s);  
		
		request.setAttribute("location.list", m);
		return mapping.findForward("init");
	}
	public ActionForward add(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		CargoEditForm cargoEditForm = (CargoEditForm) form;// TODO Auto-generated method stub
		String name = request.getParameter("name");
		Cargo c = new Cargo();
		Integer cargoId = null; 
		c.setName(request.getParameter("name"));
		c.setCategory(request.getParameter("category"));
		c.setSize(request.getParameter("size"));
		c.setUnit(request.getParameter("unit"));
		c.setWeight(request.getParameter("weight"));
		c.setNumber(request.getParameter("number"));
		c.setCustomerId(request.getParameter("customerId"));
		c.setGrossWeight(request.getParameter("grossWeight"));
		
		Cargo temp = manager.getCargo(c);
		
		if(temp == null){
			manager.sava(c);
			cargoId = c.getId();
		}else{
			
			cargoId = temp.getId();
		}
		
		/*CargoVO vo = new CargoVO();
		
		vo.setId(cargoId);
		vo.setName(request.getParameter("name"));
		vo.setCategory(scmanager.getValue(request.getParameter("category"), "category"));
		vo.setSize(request.getParameter("size"));
		vo.setUnit(scmanager.getValue(request.getParameter("unit"), "unit"));
		vo.setWeight(request.getParameter("weight"));
		vo.setNumber(request.getParameter("number"));
		
		
		
		vo.setBatchNumber(request.getParameter("batchNumber"));
		vo.setDateProduce(request.getParameter("dateProduce"));
		vo.setQuantity(request.getParameter("quantity"));
		vo.setTotalWeight(request.getParameter("totalWeight"));
		
		
		vo.setUnitPrice(request.getParameter("unitPrice"));
		vo.setCountUnit(request.getParameter("countUnit"));
		vo.setTotalPrice(request.getParameter("totalPrice"));
		String locationId = request.getParameter("locationId");
		if(!locationId.equals("0")){
			vo.setLocationId(locationId.split("_")[0]);
			vo.setLocationName(locationId.split("_")[1]);
		}
		
		List<CargoVO> l = (List<CargoVO>) request.getSession().getAttribute("cargoList");
		if(l == null){
			l = new ArrayList();
		}
		l.add(vo);
		request.getSession().setAttribute("cargoList", l);*/
		String isCost = (String) request.getParameter("isCost");
		
		 StringBuilder sb = new StringBuilder();  
		  sb.append("{");
		  sb.append("id:");
		  sb.append("\"");
		  sb.append(cargoId);
		  sb.append("\",");
		  
		  sb.append("name:");
		  sb.append("\"");
		  sb.append(request.getParameter("name"));
		  sb.append("\",");
		  
		  sb.append("category:");
		  sb.append("\"");
		  sb.append(scmanager.getValue(request.getParameter("category"), "category"));
		  sb.append("\",");
		  
		  sb.append("size:");
		  sb.append("\"");
		  sb.append(request.getParameter("size"));
		  sb.append("\",");
		  
		  sb.append("unit:");
		  sb.append("\"");
		  sb.append(scmanager.getValue(request.getParameter("unit"), "unit"));
		  sb.append("\",");
		  
		  sb.append("weight:");
		  sb.append("\"");
		  sb.append(request.getParameter("weight"));
		  sb.append("\",");
		  
		  sb.append("number:");
		  sb.append("\"");
		  sb.append(request.getParameter("number"));
		  sb.append("\",");
		  
		  sb.append("batchNumber:");
		  sb.append("\"");
		  sb.append(request.getParameter("batchNumber"));
		  sb.append("\",");
		  
		  sb.append("dateProduce:");
		  sb.append("\"");
		  sb.append(request.getParameter("dateProduce"));
		  sb.append("\",");
		  
		  sb.append("quantity:");
		  sb.append("\"");
		  sb.append(request.getParameter("quantity"));
		  sb.append("\",");
		  
		  sb.append("totalWeight:");
		  sb.append("\"");
		  sb.append(request.getParameter("totalWeight"));
		  sb.append("\",");
		  
		  sb.append("unitPrice:");
		  sb.append("\"");
		  sb.append(request.getParameter("unitPrice"));
		  sb.append("\",");
		  
		  sb.append("countUnit:");
		  sb.append("\"");
		  sb.append(request.getParameter("countUnit"));
		  sb.append("\",");
		  
		  sb.append("totalPrice:");
		  sb.append("\"");
		  sb.append(request.getParameter("totalPrice"));
		  sb.append("\",");
		  
		  String locationId = request.getParameter("locationId");
		  if(!locationId.equals("0")){
				
			  sb.append("locationId:");
			  sb.append("\"");
			  sb.append(locationId.split("_")[0]);
			  sb.append("\",");
			  
		      sb.append("locationName:");
			  sb.append("\"");
			  sb.append(locationId.split("_")[1]);
			  sb.append("\",");
				
		  }else{
			  sb.append("locationId:");
			  sb.append("\"");
			  sb.append("0");
			  sb.append("\",");
			  
		      sb.append("locationName:");
			  sb.append("\"");
			  sb.append("");
			  sb.append("\",");
		  }
			  
		 sb.append("}");
		
		 PrintWriter out = null;
		 try {
			out = response.getWriter();
			out.print(sb.toString());
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//if(isCost.equals("1")){
		//	return mapping.findForward("addPurchase");
			  
		//}  
		//return mapping.findForward("add");
		return null;
	}
	
	
	public ActionForward save(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		CargoEditForm cargoEditForm = (CargoEditForm) form;// TODO Auto-generated method stub
		
		Cargo c = new Cargo();
		
		c.setId(StringUtil.stringToInteger(cargoEditForm.getId()));
		c.setName(cargoEditForm.getName());
		c.setCategory(cargoEditForm.getCategory());
		c.setSize(cargoEditForm.getSize());
		c.setUnit(cargoEditForm.getUnit());
		c.setWeight(cargoEditForm.getWeight());
		c.setNumber(cargoEditForm.getNumber());
		c.setCustomerId(cargoEditForm.getCustomerId());
		manager.sava(c);
		
		return mapping.findForward(success);
	}
	
	
}