/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.sclk.scwms.web.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.sclk.scwms.common.StringUtil;
import com.sclk.scwms.model.Location;
import com.sclk.scwms.service.SyscodeManager;
import com.sclk.scwms.service.WarehouseManager;
import com.sclk.scwms.web.form.LocationEditForm;

/** 
 * MyEclipse Struts
 * Creation date: 03-23-2010
 * 
 * XDoclet definition:
 * @struts.action path="/warehouse" name="warehouseForm" input="/jsp/warehouse.jsp" parameter="method" scope="request" validate="true"
 * @struts.action-forward name="init" path="/jsp/warehouse.jsp"
 */
public class LocationEditAction extends BaseAction {
	
	private WarehouseManager manager;

    public void setManager(WarehouseManager manager) {
    	this.manager = manager;
    }
	
	private SyscodeManager scmanager;

    public void setScmanager(SyscodeManager manager) {
    	this.scmanager = manager;
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
		LocationEditForm locationEditForm = (LocationEditForm) form;// TODO Auto-generated method stub
		
		String locationId  = request.getParameter("locationId");
		
		Integer id = StringUtil.stringToInteger(locationId);
		Location w = null;
		if(id != null){
			w = manager.getLocation(id);
		}
		
		
		if(w != null){	
			locationEditForm.setId(w.getId().toString());
			locationEditForm.setZoneId(w.getZoneId());
			locationEditForm.setRackId(w.getRackId());
			locationEditForm.setStoreyId(w.getStoreyId());
			locationEditForm.setPositionId(w.getPositionId());
			locationEditForm.setType(w.getType());
			locationEditForm.setWarehouseId(w.getWarehouseId().toString());
			
		}	
		
		
		return mapping.findForward("init");
	}
	
	public ActionForward save(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		LocationEditForm locationEditForm = (LocationEditForm) form;// TODO Auto-generated method stub
		
		Location w = new Location();
		
		w.setId(StringUtil.stringToInteger(locationEditForm.getId()));
		w.setZoneId(locationEditForm.getZoneId());
		w.setRackId(locationEditForm.getRackId());
		w.setStoreyId(locationEditForm.getStoreyId());
		w.setPositionId(locationEditForm.getPositionId());
		w.setType(locationEditForm.getType());
		w.setWarehouseId(StringUtil.stringToInteger(locationEditForm.getWarehouseId()));
		
		manager.savaLocation(w);
		request.setAttribute("subWarehouseId", locationEditForm.getWarehouseId());
		
		return mapping.findForward(success);
	}
}