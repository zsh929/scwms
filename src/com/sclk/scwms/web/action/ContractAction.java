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

import com.sclk.scwms.service.ContractManager;
import com.sclk.scwms.web.form.ContractForm;

/** 
 * MyEclipse Struts
 * Creation date: 03-24-2010
 * 
 * XDoclet definition:
 * @struts.action path="/contract" name="contractForm" input="/jsp/contract.jsp" scope="request" validate="true"
 */
public class ContractAction extends BaseAction {
	
	private ContractManager manager;

    public void setManager(ContractManager manager) {
    	this.manager = manager;
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
		ContractForm contractForm = (ContractForm) form;// TODO Auto-generated method stub
		List list = manager.getALLContract();
		
		request.setAttribute("contract.list", list);
		
		return mapping.findForward("view");
	}
}