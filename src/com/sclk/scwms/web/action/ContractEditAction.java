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
import com.sclk.scwms.web.form.ContractEditForm;

/** 
 * MyEclipse Struts
 * Creation date: 03-24-2010
 * 
 * XDoclet definition:
 * @struts.action path="/contractEdit" name="contractEditForm" input="/jsp/contractEdit.jsp" scope="request" validate="true"
 */
public class ContractEditAction extends BaseAction {
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
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ContractEditForm contractEditForm = (ContractEditForm) form;// TODO Auto-generated method stub
		return mapping.findForward("init");
	}
}