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

import com.sclk.scwms.common.DateUtil;
import com.sclk.scwms.common.StringUtil;
import com.sclk.scwms.model.Cargo;
import com.sclk.scwms.model.MonthTotal;
import com.sclk.scwms.service.CargoManager;
import com.sclk.scwms.service.CustomerManager;
import com.sclk.scwms.service.MonthTotalManager;
import com.sclk.scwms.service.SyscodeManager;
import com.sclk.scwms.vo.CargoVO;
import com.sclk.scwms.web.form.MonthTotalEditForm;

/** 
 * MyEclipse Struts
 * Creation date: 03-23-2010
 * 
 * XDoclet definition:
 * @struts.action path="/cargo" name="cargoForm" input="/jsp/cargo.jsp" parameter="method" scope="request" validate="true"
 * @struts.action-forward name="init" path="/jsp/cargo.jsp"
 */
public class MonthTotalEditAction extends BaseAction {
	
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
    
    private MonthTotalManager monthTotalManager;

    public void setMonthTotalManager(MonthTotalManager manager) {
    	this.monthTotalManager = manager;
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
		MonthTotalEditForm monthTotalEditForm = (MonthTotalEditForm) form;// TODO Auto-generated method stub
		
		String cargoId  = request.getParameter("cargoId");
		String month  = request.getParameter("month");
		String monthTotalId  = request.getParameter("monthTotalId");
		
		MonthTotal m = new MonthTotal();
		Integer mId = StringUtil.stringToInteger(monthTotalId);;
		if(mId != null){
			m = monthTotalManager.getMonthTotal(StringUtil.stringToInteger(monthTotalId));
			
		}
		
		
		monthTotalEditForm.setCargoId(cargoId);
		
		CargoVO c = manager.getCargoVO(StringUtil.stringToInteger(cargoId));
		monthTotalEditForm.setCargoName(c.getName()+"("+c.getWeight()+"kg/"+c.getUnit()+")");
		monthTotalEditForm.setCustomerId(c.getCustomerId());
		
		monthTotalEditForm.setMonth(month);
		if(mId != null && m != null){
			
			monthTotalEditForm.setId(m.getId().toString());
			monthTotalEditForm.setInQuantity(m.getInQuantity());
			monthTotalEditForm.setInWeight(m.getInWeight());
			monthTotalEditForm.setOutQuantity(m.getOutQuantity());
			monthTotalEditForm.setOutWeight(m.getOutWeight());
			monthTotalEditForm.setBalanceQuantity(m.getBalanceQuantity());
			monthTotalEditForm.setBalanceWeight(m.getBalanceWeight());
		}
		/**
		 * customerId=182&cargoId=2&month=200910
		 */
		request.setAttribute("cargoId", cargoId);
		request.setAttribute("month", month);
		
		return mapping.findForward("init");
	}
	
	public ActionForward save(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		MonthTotalEditForm monthTotalEditForm = (MonthTotalEditForm) form;// TODO Auto-generated method stub
		
		MonthTotal m = new MonthTotal();
		
		m.setId(StringUtil.stringToInteger(monthTotalEditForm.getId()));
		Cargo c = new Cargo();
		c.setId(StringUtil.stringToInteger(monthTotalEditForm.getCargoId()));
		m.setCargo(c);
		
		m.setMonth(DateUtil.stringToDate("yyyyMM", monthTotalEditForm.getMonth()));
		m.setInQuantity(monthTotalEditForm.getInQuantity());
		m.setInWeight(monthTotalEditForm.getInWeight());
		m.setOutQuantity(monthTotalEditForm.getOutQuantity());
		m.setOutWeight(monthTotalEditForm.getOutWeight());
		m.setBalanceQuantity(monthTotalEditForm.getBalanceQuantity());
		m.setBalanceWeight(monthTotalEditForm.getBalanceWeight());
		monthTotalManager.sava(m);
		
		return mapping.findForward(success);
	}
	
	
}