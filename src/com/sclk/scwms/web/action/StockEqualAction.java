/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.sclk.scwms.web.action;

import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.sclk.scwms.common.ConfigUtil;
import com.sclk.scwms.common.DateUtil;
import com.sclk.scwms.common.JsonUtil;
import com.sclk.scwms.common.StringUtil;
import com.sclk.scwms.model.CargoRecord;
import com.sclk.scwms.model.StockRecord;
import com.sclk.scwms.service.CargoManager;
import com.sclk.scwms.service.CustomerManager;
import com.sclk.scwms.service.StockRecordManager;
import com.sclk.scwms.service.UserManager;
import com.sclk.scwms.vo.CargoVO;
import com.sclk.scwms.web.form.StockEqualForm;


/** 
 * MyEclipse Struts
 * Creation date: 03-25-2010
 * 
 * XDoclet definition:
 * @struts.action path="/stockIn" name="stockInForm" input="/jsp/stockIn.jsp" scope="request" validate="true"
 * @struts.action-forward name="init" path="/jsp/stockIn.jsp"  
 */
public class StockEqualAction extends BaseAction {
	
	private CustomerManager customerManager;

    public void setCustomerManager(CustomerManager manager) {
    	this.customerManager = manager;
    }
    private UserManager userManager;

    public void setUserManager(UserManager manager) {
    	this.userManager = manager;
    }
    
    private StockRecordManager stockRecordManager;
    
    public void setStockRecordManager(StockRecordManager stockRecordManager) {
		this.stockRecordManager = stockRecordManager;
	}
    
    private CargoManager cargoManager;

    public void setCargoManager(CargoManager manager) {
    	this.cargoManager = manager;
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
		StockEqualForm stockEqualForm = (StockEqualForm) form;// TODO Auto-generated method stub
		String customerId = request.getParameter("customerId");
		
		String eDate = new String();
		Date d = new Date();
		
		eDate = DateUtil.datetimeToStr("yyyy-MM-dd",d);
		
		List<CargoVO> cargoesList = null;
		
		if(customerId != null && !customerId.equals("")){
			cargoesList = stockRecordManager.getStockOutList(customerId,ConfigUtil.sDate,eDate);
		}
		List list = customerManager.getCustomers();
		List ulist = userManager.getUsers();
		String cl = JsonUtil.list2json(list);
		//�ÿ�cargoList
		request.getSession().removeAttribute("cargoList");
		
		request.setAttribute("cargoes.list", cargoesList);
		request.setAttribute("date", new Date());
		
		stockEqualForm.setCustomerJsonList(cl);
		stockEqualForm.setUserList(ulist);
		return mapping.findForward("init");
	}
	public ActionForward remain(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		StockEqualForm stockEqualForm = (StockEqualForm) form;// TODO Auto-generated method stub
		
		List list = customerManager.getCustomers();
		List ulist = userManager.getUsers();
		String cl = JsonUtil.list2json(list);
		
		stockEqualForm.setCustomerJsonList(cl);
		stockEqualForm.setUserList(ulist);
		return mapping.findForward("remain");
	}
	public ActionForward get(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		StockEqualForm stockEqualForm = (StockEqualForm) form;// TODO Auto-generated method stub
		
		List list = customerManager.getCustomers();
		
		String cl = JsonUtil.list2json(list);
		stockEqualForm.setCustomerJsonList(cl );
		return mapping.getInputForward();
	}
	public ActionForward save(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		StockEqualForm stockEqualForm = (StockEqualForm) form;// TODO Auto-generated method stub
		
		String[] totalWeightArr = request.getParameterValues("totalWeight");
		String[] idArr = request.getParameterValues("id");
		String[] quantityArr = request.getParameterValues("quantity");
		
		String[] batchNumberArr = request.getParameterValues("batchNumber");
		String[] dateProduceArr = request.getParameterValues("dateProduce");
		String[] locationIdArr = request.getParameterValues("locationId");
		
		
		StockRecord stockRecord = new StockRecord();
		
		stockRecord.setInOut(StockRecord.stockEqual);
		stockRecord.setPersonHandling(stockEqualForm.getPersonHandling());
		stockRecord.setSerialNumber(stockEqualForm.getSerialNumber());
		stockRecord.setCustomerId(StringUtil.stringToInteger(stockEqualForm.getCustomerId()));
		stockRecord.setType(stockEqualForm.getType());
		stockRecord.setTime(DateUtil.stringToDate(stockEqualForm.getTime()));
		stockRecord.setWholeWeight(stockEqualForm.getWholeWeight());
		Set cargoRecords = new HashSet(0);
		
		if(totalWeightArr != null && idArr != null && quantityArr != null){
			for(int i = 0;i<idArr.length;i++){
				String id = idArr[i];
				String totalWeight = totalWeightArr[i];
				String quantity = quantityArr[i];
				
				String batchNumber = batchNumberArr[i];
				String dateProduce = dateProduceArr[i];
				String warehouseId = locationIdArr[i];
				
				if((totalWeight != null && !totalWeight.equals("")) || (quantity != null && !quantity.equals(""))){
					CargoRecord cargoRecord = new CargoRecord();
					cargoRecord.setCargoId(Integer.valueOf(id));
					cargoRecord.setQuantity(quantity);
					cargoRecord.setTotalWeight(totalWeight);
					cargoRecord.setBatchNumber(batchNumber);
					cargoRecord.setDateProduce(DateUtil.stringToDate(dateProduce));
					cargoRecord.setWarehouseId(StringUtil.stringToInteger(warehouseId));
					
					cargoRecord.setStockRecord(stockRecord);
					cargoRecords.add(cargoRecord);
				}
			}
			stockRecord.setCargoRecords(cargoRecords);
			
			stockRecordManager.sava(stockRecord);
		}
		
		
		return mapping.findForward("success");
	}

	
}