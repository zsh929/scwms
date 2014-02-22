/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.sclk.scwms.web.action;

import java.text.Collator;
import java.text.RuleBasedCollator;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.sclk.scwms.common.ConfigUtil;
import com.sclk.scwms.common.DateUtil;
import com.sclk.scwms.common.JsonUtil;
import com.sclk.scwms.common.StringUtil;
import com.sclk.scwms.common.comparator.NormalComparator;
import com.sclk.scwms.model.Customer;
import com.sclk.scwms.service.CargoManager;
import com.sclk.scwms.service.CustomerManager;
import com.sclk.scwms.service.StockManager;
import com.sclk.scwms.service.StockRecordManager;
import com.sclk.scwms.service.SyscodeManager;
import com.sclk.scwms.service.TagsCargoManager;
import com.sclk.scwms.service.WarehouseManager;
import com.sclk.scwms.vo.MonthTotalVO;
import com.sclk.scwms.web.form.StockAnalyzeForm;

/** 
 * MyEclipse Struts
 * Creation date: 03-24-2010
 * 
 * XDoclet definition:
 * @struts.action path="/customer" name="customerForm" input="/jsp/customer.jsp" scope="request" validate="true"
 */
public class StockAnalyzeAction extends BaseAction {
	
	private StockManager manager;

    public void setManager(StockManager manager) {
    	this.manager = manager;
    }
    
    private StockRecordManager stockRecordManager;

    public void setStockRecordManager(StockRecordManager stockRecordManager) {
    	this.stockRecordManager = stockRecordManager;
    }
    
    private SyscodeManager syscodeManager;

	public void setSyscodeManager(SyscodeManager syscodeManager) {
		this.syscodeManager = syscodeManager;
	}

	private WarehouseManager warehouseManager;

	public void setWarehouseManager(WarehouseManager manager) {
	   	this.warehouseManager = manager;
	}
	
	private CustomerManager customerManager;

    public void setCustomerManager(CustomerManager manager) {
    	this.customerManager = manager;
    }
    private CargoManager cargoManager;

    public void setCargoManager(CargoManager manager) {
    	this.cargoManager = manager;
    }
    private TagsCargoManager tagsCargoManager;

    public void setTagsCargoManager(TagsCargoManager tagsCargoManager) {
    	this.tagsCargoManager = tagsCargoManager;
    }
    
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
		StockAnalyzeForm stockAnalyzeForm = (StockAnalyzeForm) form;// TODO Auto-generated method stub
		
		Date bDate = new Date();
		Date eDate = new Date();
		
		bDate = DateUtil.getDayOfMonth(bDate, 0, -1);
		
		List list = manager.getReportMonthly(bDate,eDate);
		
		
		String type = request.getParameter("type");
		
		String[] s = {};
		Map m = warehouseManager.getLocation(s);
		List categoryList = syscodeManager.getItemForSelect("category");
		List customerList = customerManager.getCustomers();
		List cargoList = cargoManager.getCargoes();
		
		//String cl = JsonUtil.list2json(customerList);
		String cargolist = JsonUtil.list2json(cargoList);
		request.setAttribute("category.list", categoryList);
		request.setAttribute("location.list", m);
		request.setAttribute("customer.list", customerList);
		request.setAttribute("cargo.list", cargolist);
		request.setAttribute("list", list);
		
		request.setAttribute("bDate",DateUtil.dayToString(bDate));
		request.setAttribute("monthList", ConfigUtil.getMonthList());
		
		return mapping.findForward("view");
		
	}
	  
	public ActionForward query(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		StockAnalyzeForm stockAnalyzeForm = (StockAnalyzeForm) form;// TODO Auto-generated method stub
		
		String bd = request.getParameter("bDate");
		String ed = request.getParameter("eDate");
		String locationId = request.getParameter("locationId");
		String categoryId = request.getParameter("categoryId");
		String customerId = request.getParameter("customerId");
		String cargoId = request.getParameter("cargoId");
		
		Date bDate = new Date();
		Date eDate = new Date();
		
		if(bd != null && !bd.equals("")){
			bDate = DateUtil.stringToDate("yyyy-MM-dd", bd);
		}else{
			bDate = DateUtil.stringToDate("yyyy-MM-dd", ConfigUtil.sDate);
		}
		if(ed != null && !ed.equals("")){
			eDate = DateUtil.stringToDate("yyyy-MM-dd", ed);
			Calendar c = Calendar.getInstance();
			c.setTime(eDate);
			c.add(Calendar.DAY_OF_MONTH, 1);
			eDate = c.getTime();
		}
		Integer[] cargoIdArray = null;
		if(cargoId == null || cargoId.equals("")){
			
			if(categoryId != null && !categoryId.equals("")){
				cargoIdArray = cargoManager.getCargoesArray(categoryId);
			}
		}else{
			Integer i = StringUtil.stringToInteger(cargoId);
			cargoIdArray = new Integer[] {i};
		} 
		
		
		String type = request.getParameter("type");
		List list = null;
		Double equal = null;
		if(( type.equals("chart") ||  type.equals("sumChart") || type.equals("table")) && type != null){
			list = manager.getReportUserDefined(locationId,
			        							customerId,
												cargoIdArray,
												bDate,
												eDate);
			
			equal = manager.getStockEqual(locationId, customerId,cargoIdArray,bDate,eDate);
		}else if(type != null && type.equals("countChart")){
			
			list = manager.getStockCountList(locationId,
											 customerId,
											 cargoIdArray,
											 bDate,
											 eDate);
			
		}
		
		
		if(type != null && type.equals("chart") ){
			StringBuffer balanceWeight = new StringBuffer();
			StringBuffer inWeight = new StringBuffer();
			StringBuffer outWeight = new StringBuffer();
			if(list == null){
				request.setAttribute("list", balanceWeight);
				return mapping.findForward("chart");
			}
			Iterator it = list.iterator();
			balanceWeight.append("[");
			inWeight.append("[");
			outWeight.append("[");
			while(it.hasNext()){
				Object[] obj = (Object[])it.next();
				balanceWeight.append("['");
				balanceWeight.append(DateUtil.dayToString((Date)obj[0]));
				balanceWeight.append("',");
				balanceWeight.append((Double)obj[5]/1000);
				balanceWeight.append("],");
				
				inWeight.append("['");
				inWeight.append(DateUtil.dayToString((Date)obj[0]));
				inWeight.append("',");
				if(obj[4] == null){
					inWeight.append(0);
				}else{
					inWeight.append((Double)obj[4]/1000);
				}
				inWeight.append("],");
				
				outWeight.append("['");
				outWeight.append(DateUtil.dayToString((Date)obj[0]));
				outWeight.append("',");
				if(obj[3] == null){
					outWeight.append(0);
				}else{
					outWeight.append(-1 * (Double)obj[3]/1000);
				}
				
				outWeight.append("],");
			}
			balanceWeight.append("]");
			inWeight.append("]");
			outWeight.append("]");
			
			request.setAttribute("balanceWeight", balanceWeight);
			request.setAttribute("inWeight", inWeight);
			request.setAttribute("outWeight", outWeight);
			request.setAttribute("width", list.size()*15);
			return mapping.findForward("chart");
		}
		
		if(type != null && type.equals("sumChart") ){
			StringBuffer balanceWeight = new StringBuffer();
			StringBuffer inWeight = new StringBuffer();
			StringBuffer outWeight = new StringBuffer();
			if(list == null){
				request.setAttribute("list", balanceWeight);
				return mapping.findForward("chart");
			}
			Iterator it = list.iterator();
			balanceWeight.append("[");
			inWeight.append("[");
			outWeight.append("[");
			
			Double inWeightSum = new Double(0);
			Double outWeightSum = new Double(0);
			
			while(it.hasNext()){
				Object[] obj = (Object[])it.next();
				balanceWeight.append("['");
				balanceWeight.append(DateUtil.dayToString((Date)obj[0]));
				balanceWeight.append("',");
				balanceWeight.append((Double)obj[5]/1000);
				balanceWeight.append("],");
				
				inWeight.append("['");
				inWeight.append(DateUtil.dayToString((Date)obj[0]));
				inWeight.append("',");
				if(obj[4] == null){
					inWeight.append(inWeightSum += 0);
				}else{
					
					inWeight.append(inWeightSum += (Double)obj[4]/1000);
				}
				inWeight.append("],");
				
				outWeight.append("['");
				outWeight.append(DateUtil.dayToString((Date)obj[0]));
				outWeight.append("',");
				if(obj[3] == null){
					outWeight.append(outWeightSum += 0);
				}else{
					
					outWeight.append(outWeightSum += -1 * (Double)obj[3]/1000);
				}
				
				outWeight.append("],");
			}
			balanceWeight.append("]");
			inWeight.append("]");
			outWeight.append("]");
			
			request.setAttribute("balanceWeight", balanceWeight);
			request.setAttribute("inWeight", inWeight);
			request.setAttribute("outWeight", outWeight);
			return mapping.findForward("sumChart");
		}
		
		if(type != null && type.equals("countChart") ){
			StringBuffer count = new StringBuffer();
			StringBuffer inCount = new StringBuffer();
			StringBuffer outCount = new StringBuffer();
			StringBuffer avgCount = new StringBuffer();
			
			if(list == null){
				request.setAttribute("list", count);
				return mapping.findForward("countChart");
			}
			Iterator it = list.iterator();
			count.append("[");
			inCount.append("[");
			outCount.append("[");
			avgCount.append("[");
			
			Double inWeightSum = new Double(0);
			Double outWeightSum = new Double(0);
			
			int i = 0;
			int a = 0;
			while(it.hasNext()){
				Object[] obj = (Object[])it.next();
				count.append("['");
				count.append(DateUtil.dayToString((Date)obj[0]));
				count.append("',");
				count.append(obj[3]);
				count.append("],");
				
				inCount.append("['");
				inCount.append(DateUtil.dayToString((Date)obj[0]));
				inCount.append("',");
				inCount.append(obj[1]);
				inCount.append("],");
				
				outCount.append("['");
				outCount.append(DateUtil.dayToString((Date)obj[0]));
				outCount.append("',");
				outCount.append(obj[2]);
				outCount.append("],");
				
				if(i <= 7){
					
					a = a + (Integer)obj[3];
					i++;
					
				}else{
					int avg = a/7;
					
					avgCount.append("['");
					avgCount.append(DateUtil.dayToString((Date)obj[0]));
					avgCount.append("',");
					avgCount.append(avg);
					avgCount.append("],");
					i = 0;
					a = 0;
					
				}
				
			}
			count.append("]");
			inCount.append("]");
			outCount.append("]");
			avgCount.append("]");
			
			request.setAttribute("count", count);
			request.setAttribute("inCount", inCount);
			request.setAttribute("outCount", outCount);
			request.setAttribute("avgCount", avgCount);
			return mapping.findForward("countChart");
		}
		
		String[] s = {};
		Map m = warehouseManager.getLocation(s);
		List categoryList = syscodeManager.getItemForSelect("category");
		List customerList = customerManager.getCustomers();
		String cl = JsonUtil.list2json(customerList);
		List cargoList = cargoManager.getCargoes();
		String cargolist = JsonUtil.list2json(cargoList);
		
		request.setAttribute("category.list", categoryList);
		request.setAttribute("location.list", m);
		request.setAttribute("customer.list", customerList);
		request.setAttribute("cargo.list", cargolist);
		request.setAttribute("list", list);
		Date d = new Date();
		request.setAttribute("month", d);
		request.setAttribute("monthList", ConfigUtil.getMonthList());
		request.setAttribute("bDate",DateUtil.dayToString(bDate));
		request.setAttribute("eDate",DateUtil.dayToString(eDate));
		
		request.setAttribute("equal",equal);
		
		//Customer customer = customerManager.getCustomer(StringUtil.stringToInteger(customerId));
		//request.setAttribute("customerName",customer.getName());
		request.setAttribute("customerId",customerId);
		return mapping.findForward("view");
		
	}
	
	
	public ActionForward category(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		StockAnalyzeForm stockAnalyzeForm = (StockAnalyzeForm) form;// TODO Auto-generated method stub
		
		Date bDate = new Date();
		Date eDate = new Date();
		
		Date d = new Date();
		
		String month = request.getParameter("month");
		if(month != null){
			d = DateUtil.stringToDate("yyyyMM", month);
		}
		Calendar b = Calendar.getInstance();
		b.setTime(d);
		if(b.get(Calendar.DAY_OF_MONTH) > 20){
			
			b.set(Calendar.DAY_OF_MONTH,21);
			bDate = b.getTime();
			b.add(Calendar.MONTH, 1);
			eDate = b.getTime();
		}else{
			b.add(Calendar.MONTH, -1);
			b.set(Calendar.DAY_OF_MONTH,21);
			bDate = b.getTime();
			b.add(Calendar.MONTH, 1);
			eDate = b.getTime();
		}
		Date now = new Date();
		if(eDate.after(now)){
			eDate = now;
		}
		
		List list = manager.getReportCategory(bDate,eDate);
		String type = request.getParameter("type");
		if(type != null && type.equals("categoryChart") ){
			request.setAttribute("list", list);
			return mapping.findForward("categoryChart");
		}
		
		request.setAttribute("list", list);
		request.setAttribute("month", d);
		request.setAttribute("monthList", ConfigUtil.getMonthList());
		
		return mapping.findForward("category");
		
	}
	
	public ActionForward  multiCargo(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		StockAnalyzeForm stockAnalyzeForm = (StockAnalyzeForm) form;// TODO Auto-generated method stub
		
		String customerId = request.getParameter("customerId");
		String bd = request.getParameter("bDate");
		String ed = request.getParameter("eDate");
		String tagsId = request.getParameter("tagsId");
		String isAll = request.getParameter("isAll");
		Date bDate = DateUtil.stringToDate(ConfigUtil.sDate);
		Date eDate = new Date();
		
		if(bd != null && !bd.equals("")){
			
			bDate = DateUtil.stringToDate(bd);
			
		}
		if(ed != null && !ed.equals("")){
			
			eDate = DateUtil.stringToDate(ed);
			
		}
	
		List customerList = customerManager.getCustomers();
		String cl = JsonUtil.list2json(customerList);
		request.setAttribute("customer.list", cl);
		if(customerId == null || customerId.equals("")){
			request.setAttribute("checkedTags","0");
			return mapping.findForward("multiCargo");
			
		}
		String[][] tags = null;
		if(customerId != null && !customerId.equals("")){
			tags = tagsCargoManager.getTagsByCustomerId(customerId);
		}
		List<MonthTotalVO> list = stockRecordManager.getCargoRecordTotalList(customerId,bDate,eDate,tagsId,isAll);
		request.setAttribute("list", list);
		request.setAttribute("bDate",DateUtil.dayToString(bDate));
		request.setAttribute("eDate",DateUtil.dayToString(eDate));
		request.setAttribute("customerName",customerManager.getCustomer(StringUtil.stringToInteger(customerId)).getName());
		request.setAttribute("customerId",customerId);
		request.setAttribute("tags",tags);
		
		if(tagsId != null && !tagsId.equals("")){
			request.setAttribute("checkedTags",tagsId);
		}
			 
		return mapping.findForward("multiCargo");
	}
	
	public ActionForward stockOverview(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		StockAnalyzeForm stockAnalyzeForm = (StockAnalyzeForm) form;// TODO Auto-generated method stub
		
		int days = 30;
		Date d1 = DateUtil.stringToDate("2012-2-20"); 
		
		String numberOfDays = request.getParameter("numberOfDays");
		if(numberOfDays != null && !numberOfDays.equals("")){
			
			days = StringUtil.stringToInteger(numberOfDays);
			
		}else{
			numberOfDays = Integer.toString(days);
			
		}
		
		Date bDate = new Date();
		Date eDate = new Date();
		
		bDate = DateUtil.getDate(bDate,-1 * days);
		
		if(bDate.before(d1) ){
			
			bDate = d1;
			
		}
		
		List list = manager.getReportUserDefined(null,
												 null,
												 null,
												 bDate,
												 eDate);
		
		StringBuffer balanceWeight = new StringBuffer();
		StringBuffer inWeight = new StringBuffer();
		StringBuffer outWeight = new StringBuffer();
		StringBuffer date = new StringBuffer("[]");
		
		if(list == null){
			request.setAttribute("list", balanceWeight);
			return mapping.findForward("stockOverview");
		}
		
		Iterator it = list.iterator();
		
		//-------------------------------
		if(days > 180){
			date.setLength(0);
			Date d = new Date();
			int i = 0;
			int j = 1;
			Double balanceWeight1 = 0.0;
			Double inWeight1 = 0.0;
			Double outWeight1 = 0.0;
			
			balanceWeight.append("[");
			inWeight.append("[");
			outWeight.append("[");
			date.append("[");
			while(it.hasNext()){
				Object[] obj = (Object[])it.next();
				d = (Date)obj[0];
				Calendar b = Calendar.getInstance();
				b.setTime(d);
				if(b.get(b.DAY_OF_MONTH) == 21){
					i = 1;
					balanceWeight1 = (Double)obj[5]/1000;
					if(obj[4] != null){
						inWeight1 =  (Double)obj[4]/1000;
					}
					if(obj[3] != null){
						outWeight1 =  -1 * (Double)obj[3]/1000;
					}
					
					
				}else{
				
					i++;
					balanceWeight1 = balanceWeight1 + (Double)obj[5]/1000;
					
					if(obj[4] != null){
						inWeight1 = inWeight1 + (Double)obj[4]/1000;
					}
					if(obj[3] != null){
						outWeight1 = outWeight1 +  (-1 * (Double)obj[3]/1000);
					}
					
				}	
				if(b.get(b.DAY_OF_MONTH) == 20){
					SimpleDateFormat f = new SimpleDateFormat("yyyy-MM");
					balanceWeight.append("[");
					balanceWeight.append(j);
					balanceWeight.append(",");
					balanceWeight.append(balanceWeight1/i);
					balanceWeight.append("],");
					
					inWeight.append("[");
					inWeight.append(j);
					inWeight.append(",");
					inWeight.append(inWeight1);
					inWeight.append("],");
					
					outWeight.append("[");
					outWeight.append(j);
					outWeight.append(",");
					outWeight.append(outWeight1);
					outWeight.append("],");
					
					j++;
					
		           
					date.append("'");
					
					date.append(f.format(d));
					date.append("',");
					
				}
				
			}
			balanceWeight.append("]");
			inWeight.append("]");
			outWeight.append("]");
			date.append("]");
			
			
			
		
		}else if(days > 90){
			Date d = new Date();
			int i = 0;
			Double balanceWeight1 = 0.0;
			Double inWeight1 = 0.0;
			Double outWeight1 = 0.0;
			
			balanceWeight.append("[");
			inWeight.append("[");
			outWeight.append("[");
			
			
				while(it.hasNext()){
					Object[] obj = (Object[])it.next();
					d = (Date)obj[0];
					Calendar b = Calendar.getInstance();
					b.setTime(d);
					if(b.get(b.DAY_OF_WEEK) == b.MONDAY){
						i = 1;
						balanceWeight1 = (Double)obj[5]/1000;
						if(obj[4] != null){
							inWeight1 =  (Double)obj[4]/1000;
						}
						if(obj[3] != null){
							outWeight1 =  -1 * (Double)obj[3]/1000;
						}
						
						
					}else{
					
						i++;
						balanceWeight1 = balanceWeight1 + (Double)obj[5]/1000;
						
						if(obj[4] != null){
							inWeight1 = inWeight1 + (Double)obj[4]/1000;
						}
						if(obj[3] != null){
							outWeight1 = outWeight1 +  (-1 * (Double)obj[3]/1000);
						}
						
					}	
					
					if(b.get(b.DAY_OF_WEEK) == b.SUNDAY){
						balanceWeight.append("['");
						balanceWeight.append(DateUtil.dayToString(d));
						balanceWeight.append("',");
						balanceWeight.append(balanceWeight1/i);
						balanceWeight.append("],");
						
						inWeight.append("['");
						inWeight.append(DateUtil.dayToString(d));
						inWeight.append("',");
						inWeight.append(inWeight1);
						inWeight.append("],");
						
						outWeight.append("['");
						outWeight.append(DateUtil.dayToString(d));
						outWeight.append("',");
						outWeight.append(outWeight1);
						outWeight.append("],");
						
					}
					
				}
				balanceWeight.append("]");
				inWeight.append("]");
				outWeight.append("]");
				
				
				
			
			}
		
		
		else{
		
		
			balanceWeight.append("[");
			inWeight.append("[");
			outWeight.append("[");
			while(it.hasNext()){
				Object[] obj = (Object[])it.next();
				balanceWeight.append("['");
				balanceWeight.append(DateUtil.dayToString((Date)obj[0]));
				balanceWeight.append("',");
				balanceWeight.append((Double)obj[5]/1000);
				balanceWeight.append("],");
				
				inWeight.append("['");
				inWeight.append(DateUtil.dayToString((Date)obj[0]));
				inWeight.append("',");
				if(obj[4] == null){
					inWeight.append(0);
				}else{
					inWeight.append((Double)obj[4]/1000);
				}
				inWeight.append("],");
				
				outWeight.append("['");
				outWeight.append(DateUtil.dayToString((Date)obj[0]));
				outWeight.append("',");
				if(obj[3] == null){
					outWeight.append(0);
				}else{
					outWeight.append(-1 * (Double)obj[3]/1000);
				}
				
				outWeight.append("],");
			}
			balanceWeight.append("]");
			inWeight.append("]");
			outWeight.append("]");
		}
		
		StringBuffer pieChartData = manager.buildChartDataForAccumulatePerCustomer();
		List<String[]> stockOutInData = manager.buildTableDataForStockOutInPerCustomer();
		
		request.setAttribute("balanceWeight", balanceWeight);
		request.setAttribute("inWeight", inWeight);
		request.setAttribute("outWeight", outWeight);
		request.setAttribute("pieChartData", pieChartData);
		request.setAttribute("stockOutInData", stockOutInData);
		request.setAttribute("numberOfDays", numberOfDays);
		request.setAttribute("date", date);
		return mapping.findForward("stockOverview");
	
	
	}
	
	public ActionForward customerStockOverview(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		
		int days = 360;
		Date d1 = DateUtil.stringToDate("2012-2-20"); 
		
		String customerId = request.getParameter("customerId");
		
		//if(numberOfDays != null && !numberOfDays.equals("")){
			
		//	days = StringUtil.stringToInteger(numberOfDays);
			
		//}else{
		//	numberOfDays = Integer.toString(days);
			
		//}
		
		Date bDate = new Date();
		Date eDate = new Date();
		
		bDate = DateUtil.getDate(bDate,-1 * days);
		
		if(bDate.before(d1) ){
			
			bDate = d1;
			
		}
		
		List list = manager.getReportUserDefined(null,
												 customerId,
												 null,
												 bDate,
												 eDate);
		
		StringBuffer balanceWeight = new StringBuffer();
		StringBuffer inWeight = new StringBuffer();
		StringBuffer outWeight = new StringBuffer();
		StringBuffer date = new StringBuffer();
		if(list == null){
			request.setAttribute("list", balanceWeight);
			return mapping.findForward("stockOverview");
		}
		
		Iterator it = list.iterator();
		
		//-------------------------------
		if(days > 180){
			Date d = new Date();
			int i = 0;
			int j = 1;
			Double balanceWeight1 = 0.0;
			Double inWeight1 = 0.0;
			Double outWeight1 = 0.0;
			
			balanceWeight.append("[");
			inWeight.append("[");
			outWeight.append("[");
			date.append("[");
			while(it.hasNext()){
				Object[] obj = (Object[])it.next();
				d = (Date)obj[0];
				Calendar b = Calendar.getInstance();
				b.setTime(d);
				if(b.get(b.DAY_OF_MONTH) == 21){
					i = 1;
					balanceWeight1 = (Double)obj[5]/1000;
					if(obj[4] != null){
						inWeight1 =  (Double)obj[4]/1000;
					}
					if(obj[3] != null){
						outWeight1 =  -1 * (Double)obj[3]/1000;
					}
					
					
				}else{
				
					i++;
					balanceWeight1 = balanceWeight1 + (Double)obj[5]/1000;
					
					if(obj[4] != null){
						inWeight1 = inWeight1 + (Double)obj[4]/1000;
					}
					if(obj[3] != null){
						outWeight1 = outWeight1 +  (-1 * (Double)obj[3]/1000);
					}
					
				}	
				if(b.get(b.DAY_OF_MONTH) == 20){
					SimpleDateFormat f = new SimpleDateFormat("yyyy-MM");
					balanceWeight.append("[");
					balanceWeight.append(j);
					balanceWeight.append(",");
					balanceWeight.append(balanceWeight1/i);
					balanceWeight.append("],");
					
					inWeight.append("[");
					inWeight.append(j);
					inWeight.append(",");
					inWeight.append(inWeight1);
					inWeight.append("],");
					
					outWeight.append("[");
					outWeight.append(j);
					outWeight.append(",");
					outWeight.append(outWeight1);
					outWeight.append("],");
					
					j++;
					
		           
					date.append("'");
					
					date.append(f.format(d));
					date.append("',");
					
				}
				
			}
			balanceWeight.append("]");
			inWeight.append("]");
			outWeight.append("]");
			date.append("]");
	}
		
		request.setAttribute("balanceWeight", balanceWeight);
		request.setAttribute("inWeight", inWeight);
		request.setAttribute("outWeight", outWeight);
		request.setAttribute("date", date);
		
		//request.setAttribute("numberOfDays", numberOfDays);
		return mapping.findForward("customerStockOverview");
	
	
	}
	
	public ActionForward summary(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		StockAnalyzeForm stockAnalyzeForm = (StockAnalyzeForm) form;// TODO Auto-generated method stub
		
		String bd = request.getParameter("bDate");
		String ed = request.getParameter("eDate");
		
		Date bDate = new Date();
		Date eDate = new Date();
		
		if(bd != null && !bd.equals("")){
		
			bDate = DateUtil.stringToDate(bd);
		
		}else{
			
			bDate = DateUtil.getDate(new Date(), Calendar.MONTH, -1);
			
		}
		if(ed != null && !ed.equals("")){
			
			eDate = DateUtil.stringToDate(ed);
			
		}
		
		List<String[]> list = manager.getReportSummary(bDate,eDate);
		
		Comparator cmp = new NormalComparator();

		Collections.sort(list,cmp);
		
		request.setAttribute("bDate",DateUtil.dayToString(bDate));
		request.setAttribute("eDate",DateUtil.dayToString(eDate));
		request.setAttribute("list", list);
		
		return mapping.findForward("summary");
		
	}
	
}