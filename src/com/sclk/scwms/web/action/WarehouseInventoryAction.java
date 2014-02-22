/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.sclk.scwms.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.sclk.scwms.service.CargoManager;
import com.sclk.scwms.service.StockRecordManager;
import com.sclk.scwms.web.form.WarehouseInventoryForm;

/** 
 * MyEclipse Struts
 * Creation date: 03-24-2010
 * 
 * XDoclet definition:
 * @struts.action path="/customer" name="customerForm" input="/jsp/customer.jsp" scope="request" validate="true"
 */
public class WarehouseInventoryAction extends BaseAction {
	
	private CargoManager manager;

    public void setManager(CargoManager manager) {
    	this.manager = manager;
    }
    
    private StockRecordManager stockRecordManager;
    
    public void setStockRecordManager(StockRecordManager stockRecordManager) {
		this.stockRecordManager = stockRecordManager;
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
	public ActionForward view(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		WarehouseInventoryForm warehouseInventoryForm = (WarehouseInventoryForm) form;// TODO Auto-generated method stub
		String warehouseId = request.getParameter("warehouseId");
		
		List list = stockRecordManager.getWarehouseInventoryList(warehouseId);
		
		request.setAttribute("cargo.list", list);
		
		return mapping.findForward("view");
		
	}
}