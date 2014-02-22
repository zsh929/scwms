package com.sclk.scwms.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.sclk.scwms.common.ConfigUtil;
import com.sclk.scwms.common.DateUtil;
import com.sclk.scwms.common.StringUtil;
import com.sclk.scwms.common.comparator.NormalComparator;
import com.sclk.scwms.dao.ChargeDAO;
import com.sclk.scwms.dao.ChargeDetailDAO;
import com.sclk.scwms.dao.ChargeRecordDAO;
import com.sclk.scwms.dao.StockRecordDAO;
import com.sclk.scwms.dao.UsersDAO;
import com.sclk.scwms.model.Charge;
import com.sclk.scwms.model.ChargeDetail;
import com.sclk.scwms.model.ChargeRecord;
import com.sclk.scwms.model.Customer;
import com.sclk.scwms.model.Location;
import com.sclk.scwms.model.StockRecord;
import com.sclk.scwms.model.Syscode;
import com.sclk.scwms.model.Users;
import com.sclk.scwms.model.Warehouse;
import com.sclk.scwms.vo.CargoVO;
import com.sclk.scwms.vo.ChargeDetailVO;
import com.sclk.scwms.vo.ChargeVO;
import com.sclk.scwms.vo.WarehouseVO;

public class ChargeManager {
	
	private SyscodeManager syscodeManager;

	public void setSyscodeManager(SyscodeManager manager) {
		this.syscodeManager = manager;
	}
	
	private WarehouseManager warehouseManager;

    public void setWarehouseManager(WarehouseManager manager) {
    	this.warehouseManager = manager;
    }
    
    private StockRecordDAO stockRecordDAO;

    public void setStockRecordDAO(StockRecordDAO stockRecordDAO) {
		this.stockRecordDAO = stockRecordDAO;
	}
    
    private ChargeRecordDAO chargeRecordDAO;

    public void setChargeRecordDAO(ChargeRecordDAO chargeRecordDAO) {
		this.chargeRecordDAO = chargeRecordDAO;
	}
	private ChargeDAO dao;

	public void setDao(ChargeDAO dao) {
		this.dao = dao;
	}
	
	private ChargeDetailDAO chargeDetailDAO;

	public void setChargeDetailDAO(ChargeDetailDAO chargeDetailDAO) {
		this.chargeDetailDAO = chargeDetailDAO;
	}
	
	private StockRecordManager stockRecordManager;

    public void setStockRecordManager(StockRecordManager stockRecordManager) {
    	this.stockRecordManager = stockRecordManager;
    }
	public List<Charge> getCharges(Charge charge){
	
		return dao.findByExample(charge);
		
	}
	
	public List<ChargeVO> getChargeVOList(String customerId,String customerName){
		
		List<Syscode> chargeTypeList = syscodeManager.getItemForSelect("chargeType");
		List<Syscode> chargeUnitList = syscodeManager.getItemForSelect("chargeUnit");
		List<Syscode> categoryList = syscodeManager.getItem("category");
		
		List<WarehouseVO> warehouseList = warehouseManager.getWarehouseList();
		
		Map syscodeMap = new HashMap();
		Map<String,String> customerMap = new HashMap();
		Map<Integer,String> warehouseMap = new HashMap();
		
		for(Syscode syscode:chargeTypeList){
			syscodeMap.put(syscode.getCodeKey(), syscode.getCodeValue());
		}
		for(Syscode syscode:chargeUnitList){
			syscodeMap.put(syscode.getCodeKey(), syscode.getCodeValue());
		}
		for(Syscode syscode:categoryList){
			syscodeMap.put(syscode.getCodeKey(), syscode.getCodeValue());
		}
		for(WarehouseVO warehouseVO:warehouseList){
			for(WarehouseVO w:warehouseVO.getSubWarehouseList()){
				warehouseMap.put(w.getId(),warehouseVO.getName() + "-" + w.getName());
			}
		} 
		
		List<ChargeVO> list = dao.findCharges(customerId,customerName);
		
		for(ChargeVO vo:list){
			vo.setTypeName((String) syscodeMap.get(vo.getType()));
			vo.setUnitName((String) syscodeMap.get(vo.getUnit()));
			if(vo.getCategory() != null && !vo.getCategory().equals("")){
				String[] categoryArray = vo.getCategory().split(",");
				String category = "";
				for(int i = 0;categoryArray.length > i;i++){
					category = category + (String) syscodeMap.get(categoryArray[i]) + ",";
					
				}
				category = category.substring(0,category.length()-1);
				vo.setCategoryName(category);
			}
			
			
			vo.setWarehouseName((String) warehouseMap.get(vo.getWarehouseId()));
			
		}
		
		Comparator<ChargeVO> cmp = new NormalComparator();
		Collections.sort(list,cmp);
		
		return list;
		
	}

	public Charge getCharge(Integer id){
		
		return dao.findById(id);
		
	}
 
	public boolean sava(Charge c){
		
		if(c.getId() == null){
			dao.save(c);
			
		}else{
			
			dao.attachDirty(c);
		}
		return false;
	}
	
	public boolean sava(ChargeDetail chargeDetail){
		
		if(chargeDetail.getId() == null){                
			chargeDetailDAO.save(chargeDetail);
			
		}else{
			
			chargeDetailDAO.attachDirty(chargeDetail);
		}
		return false;
	}
	
   public boolean sava(ChargeRecord chargeRecord){
		
		if(chargeRecord.getId() == null){                
			chargeRecordDAO.save(chargeRecord);
			
		}else{
			
			chargeRecordDAO.attachDirty(chargeRecord);
		}
		return false;
	}
	
	public List getChargeDetailList(Integer customerId){
	
		long startMili=System.currentTimeMillis();// 当前时间对应的毫秒数
				
		Date sDate = ConfigUtil.stringToDate("yyyy-MM-dd","2012-02-01");
		Date eDate = new Date();
		List<Date> monthList = new ArrayList<Date>();
		
		Calendar sMonth = Calendar.getInstance();
		sMonth.setTime(sDate);
		Calendar eMonth = Calendar.getInstance();
		eMonth.setTime(eDate);
		
		for(;eMonth.after(sMonth);eMonth.add(Calendar.MONTH,-1)){
			
			monthList.add(eMonth.getTime());
			
		}
		
		List<ChargeDetail> chargeDetailList1 = chargeDetailDAO.findByProperty(customerId,sDate,eDate);
		
		Charge charge = new Charge();
		charge.setCustomerId(customerId);
		List<ChargeVO> chargeVOList = this.getChargeVOList(customerId.toString(),"");
		
		List<StockRecord> stockRecordList = stockRecordDAO.getStockRecordList(customerId);
		
		List<ChargeRecord> chargeRecordList = chargeRecordDAO.findByCustomerId(customerId);
		
		List<ChargeDetailVO> chargeDetailVOList = new ArrayList();
		ChargeDetailVO chargeDetailVO;
		for(Date date:monthList){
			chargeDetailVO = new ChargeDetailVO();
			chargeDetailVO.setStartDate(date);
			chargeDetailVO.setPayable(true);
			boolean sign = true;
				
			List list1 = new ArrayList();
			for(ChargeDetail c:chargeDetailList1){
				
				if((DateUtil.dateToString("yyyy-MM",c.getDate()).equals(DateUtil.dateToString("yyyy-MM",date))) && (c.getType() == 0)){
					chargeDetailVO.setConfirm(true);
					double payable = Double.parseDouble(c.getPayable());
					double totalPrice = Double.parseDouble(c.getTotalPrice());
					
					if(payable != totalPrice){
						chargeDetailVO.setPayable(false);
						
					}
					
					list1.add(c);
					sign = false;
					
				}
									
			}
			
			if(!sign){
				chargeDetailVO.setChargeDetailList(list1);
			}else{
				List list2 = new ArrayList();
				
				List<Integer> warehouseIdList = new ArrayList<Integer>();
				for(ChargeVO c:chargeVOList){
					if(c.getType().equals("chargeType.1")){
						Integer warehouseId = c.getWarehouseId();
						warehouseIdList.add(warehouseId);
					}
					
				}
				
				if(warehouseIdList != null){
					for(ChargeVO c:chargeVOList){
						if(c.getType().equals("chargeType.3")){
							c.setExceptWarehouseIdList(warehouseIdList);
						}
					}
				}
				for(ChargeVO c:chargeVOList){
					
					List<String> exceptCategoryList = new ArrayList<String>();
					
					if(c.getType().equals("chargeType.3") && (c.getEffectiveDate() == null || date.after(c.getEffectiveDate())) && (c.getExpiryDate() == null || date.before(c.getExpiryDate()))){
						for(ChargeVO c1:chargeVOList){
							if(c.getId() != c1.getId() && c1.getType().equals("chargeType.3")){
								String category = c1.getCategory();
								if(category != null){ 
									String[] categoryArray = category.split(",");
									int a = categoryArray.length;
									for(int i = 0;categoryArray.length > i;i++){
										exceptCategoryList.add(categoryArray[i]);
									}
								}
							}
						}
					}
					c.setExceptCategoryList(exceptCategoryList);
			
				}
				
				for(ChargeVO c:chargeVOList){
					List chargeDetailList = new ArrayList();
					
					chargeDetailList = this.getChargeDetailList(c,date,chargeVOList,stockRecordList,chargeRecordList);
					list2.addAll(chargeDetailList);
					
				}
				chargeDetailVO.setConfirm(false);
				chargeDetailVO.setChargeDetailList(list2);
			}
			
			chargeDetailVOList.add(chargeDetailVO);
		}
		long endMili=System.currentTimeMillis();
		
		System.out.println("总耗时为："+(endMili-startMili)+"毫秒");
		return chargeDetailVOList;
			
	}
	
	public List getChargeDetailList(ChargeVO chargeVO,Date date){
		
		List chargeDetailList = new ArrayList();
		
		String type = chargeVO.getType();
		
		Date effectiveDate = chargeVO.getEffectiveDate();
		Date expiryDate = chargeVO.getExpiryDate();
		
		Date theFirstDayOfTheMonth = new Date();
		Date theLastDayOfTheMonth = new Date();
		
		Calendar calendar1 = Calendar.getInstance();
		calendar1.setTime(date);
		calendar1.set(Calendar.DATE,1);
		theFirstDayOfTheMonth = calendar1.getTime();
		
		Calendar calendar2 = Calendar.getInstance();
		calendar2.setTime(date);
		
		calendar2.set(Calendar.DATE,calendar2.getActualMaximum(calendar2.DAY_OF_MONTH));
		theLastDayOfTheMonth = calendar2.getTime();
		
		if((effectiveDate != null && effectiveDate.after(theLastDayOfTheMonth)) || (expiryDate != null && expiryDate.before(theFirstDayOfTheMonth))){
			
			return chargeDetailList;
			
		}
		Date startDate = new Date();
		Date startDate2 = new Date();
		Date endDate = new Date();
		Date startDate1 = new Date();
		Date startDate3 = new Date();
		Date endDate1 = new Date();
		
		if(chargeVO.getChargeDate1() != null &&  chargeVO.getChargeDate2() == null){
			startDate = DateUtil.getDayOfMonth(date,chargeVO.getChargeDate1()+1,-1);
			endDate = DateUtil.getDayOfMonth(date,chargeVO.getChargeDate1(),0);
		}else if(chargeVO.getChargeDate1() != null &&  chargeVO.getChargeDate2() != null){
			startDate = DateUtil.getDayOfMonth(date,chargeVO.getChargeDate2()+1,-1);
			startDate2 = DateUtil.getDayOfMonth(date,chargeVO.getChargeDate2(),-1);
			endDate = DateUtil.getDayOfMonth(date,chargeVO.getChargeDate1(),0);
			
			startDate1 = DateUtil.getDayOfMonth(date,chargeVO.getChargeDate1()+1,0);
			startDate3 = DateUtil.getDayOfMonth(date,chargeVO.getChargeDate1(),0);
			endDate1 = DateUtil.getDayOfMonth(date,chargeVO.getChargeDate2(),0);
			
		}else if(chargeVO.getChargeDate1() == null && chargeVO.getChargeDate2() == null){
			startDate = chargeVO.getEffectiveDate();
			endDate = null;
		}
		
		
		
		
		ChargeDetail chargeDetail = new ChargeDetail();
		chargeDetail.setCustomerId(chargeVO.getCustomerId());
		chargeDetail.setChargeId(chargeVO.getId());
		
		chargeDetail.setStartDate(startDate);
		chargeDetail.setEndDate(endDate);
		
		chargeDetail.setArea(chargeVO.getArea());
		chargeDetail.setUnitPrice(chargeVO.getUnitPrice());
		chargeDetail.setUnitName(chargeVO.getUnitName());
		chargeDetail.setTotalPrice(chargeVO.getTotalPrice());
		chargeDetail.setChargeType(chargeVO.getType());
		if(chargeVO.getChargeDate1() == null && chargeVO.getChargeDate2() == null){
			chargeDetail.setChargeRate("chargeRate.1");
		}
		String description = ((chargeVO.getDescription() == null)?"":chargeVO.getDescription());
		
		if(type.equals("chargeType.1")){
		
			chargeDetail.setDescription(chargeVO.getWarehouseName()+" "+chargeVO.getTypeName()+ " " + description);
			
			chargeDetailList.add(chargeDetail);
		}else if(type.equals("chargeType.2")){
					
				chargeDetail.setDescription(chargeVO.getTypeName()+ " " + description);
				
				int days = DateUtil.getDays(startDate, endDate) + 1;
				chargeDetail.setDays(String.valueOf(days));
				
				chargeDetailList.add(chargeDetail);
		
				if(chargeVO.getChargeDate1() != null &&  chargeVO.getChargeDate2() != null){
					ChargeDetail chargeDetail1 = new ChargeDetail();

					chargeDetail1 = chargeDetail.clone();
					
					chargeDetail1.setStartDate(startDate1);
					chargeDetail1.setEndDate(endDate1);
					
					chargeDetail1.setDescription(chargeVO.getTypeName()+ " " + description);
					
					int days1 = DateUtil.getDays(startDate1, endDate1) + 1;
					chargeDetail1.setDays(String.valueOf(days1));
					
					
					
					chargeDetailList.add(chargeDetail1);
				}
				
		
			
		}else if(type.equals("chargeType.3")){
			
				
				Short[] inOut = {StockRecord.stockIn,StockRecord.stockOut,StockRecord.stockEqual}; 
				Short[] in = {StockRecord.stockIn};
				String stockRecordWeight = stockRecordDAO.getStockRecordWeight(chargeVO.getCustomerId(),ConfigUtil.dDate,startDate2,inOut,chargeVO.getExceptWarehouseIdList(),chargeVO.getCategory(),chargeVO.getExceptCategoryList());
				String stockRecordInWeight = stockRecordDAO.getStockRecordWeight(chargeVO.getCustomerId(),startDate,endDate,in,chargeVO.getExceptWarehouseIdList(),chargeVO.getCategory(),chargeVO.getExceptCategoryList());
				BigDecimal bStockRecordWeight = new BigDecimal(stockRecordWeight);
				BigDecimal bStockRecordInWeight = new BigDecimal(stockRecordInWeight);
				bStockRecordWeight = bStockRecordWeight.add(bStockRecordInWeight);
				
				chargeDetail.setWeight(String.valueOf(bStockRecordWeight.divide(new BigDecimal("1000"))));
				
				chargeDetail.setDescription(chargeVO.getTypeName()+ " " + (chargeVO.getCategoryName() == null?"":chargeVO.getCategoryName()) + " " + description);
				
				int days = DateUtil.getDays(startDate, endDate) + 1;
				chargeDetail.setDays(String.valueOf(days));
				
				BigDecimal b1 = bStockRecordWeight;
				b1 = b1.divide(new BigDecimal("1000"));
				BigDecimal b2 = new BigDecimal(days);
				BigDecimal b3 = new BigDecimal(chargeVO.getUnitPrice());
				BigDecimal totalPrice = b1.multiply(b2).multiply(b3);
				totalPrice = totalPrice.setScale(2,BigDecimal.ROUND_HALF_UP);
				chargeDetail.setTotalPrice(totalPrice.toString());
				
				chargeDetailList.add(chargeDetail);
				if(chargeVO.getChargeDate1() != null &&  chargeVO.getChargeDate2() != null){
					ChargeDetail chargeDetail1 = new ChargeDetail();

					chargeDetail1 = chargeDetail.clone();
					
					Short[] inOut1 = {StockRecord.stockIn,StockRecord.stockOut,StockRecord.stockEqual}; 
					Short[] in1 = {StockRecord.stockIn}; 
					
					String stockRecordWeight1 = stockRecordDAO.getStockRecordWeight(chargeVO.getCustomerId(),ConfigUtil.dDate,startDate3,inOut1,chargeVO.getExceptWarehouseIdList(),chargeVO.getCategory(),chargeVO.getExceptCategoryList());
					String stockRecordInWeight1 = stockRecordDAO.getStockRecordWeight(chargeVO.getCustomerId(),startDate1,endDate1,in1,chargeVO.getExceptWarehouseIdList(),chargeVO.getCategory(),chargeVO.getExceptCategoryList());
					BigDecimal bStockRecordWeight1 = new BigDecimal(stockRecordWeight1);
					BigDecimal bStockRecordInWeight1 = new BigDecimal(stockRecordInWeight1);
					bStockRecordWeight1 = bStockRecordWeight1.add(bStockRecordInWeight1);
					
					chargeDetail1.setWeight(String.valueOf(bStockRecordWeight1.divide(new BigDecimal("1000"))));
					chargeDetail1.setStartDate(startDate1);
					chargeDetail1.setEndDate(endDate1);
					chargeDetail1.setDescription(chargeVO.getTypeName()+" " +  (chargeVO.getCategoryName() == null?"":chargeVO.getCategoryName()) + " " + description);
					
					int days1 = DateUtil.getDays(startDate1, endDate1) + 1;
					chargeDetail1.setDays(String.valueOf(days1));
					
					BigDecimal b4 = bStockRecordWeight1;
					b4 = b4.divide(new BigDecimal("1000"));
					BigDecimal b5 = new BigDecimal(days1);
					BigDecimal b6 = new BigDecimal(chargeVO.getUnitPrice());
					BigDecimal totalPrice1 = b4.multiply(b5).multiply(b6);
					
					totalPrice1 = totalPrice1.setScale(2,BigDecimal.ROUND_HALF_UP);
					chargeDetail1.setTotalPrice(totalPrice1.toString());
					
					
					chargeDetailList.add(chargeDetail1);  
				}
		}else if(type.equals("chargeType.4") || type.equals("chargeType.5") || type.equals("chargeType.6") || type.equals("chargeType.7")){
			
			chargeDetail.setDescription(chargeVO.getTypeName()+ " " + description);
			int days = 1;
			chargeDetail.setDays(String.valueOf(days));
			chargeDetail = chargeRecordDAO.getChargeRecord(chargeDetail);
			
			chargeDetailList.add(chargeDetail);
			if(chargeVO.getChargeDate1() != null &&  chargeVO.getChargeDate2() != null){
				ChargeDetail chargeDetail1 = new ChargeDetail();

				chargeDetail1 = chargeDetail.clone();
				
				chargeDetail1.setStartDate(startDate1);
				chargeDetail1.setEndDate(endDate1);
				
				chargeDetail1.setDescription(chargeVO.getTypeName()+ " " + description);
				
				int days1 = 1;
				chargeDetail1.setDays(String.valueOf(days1));
				chargeDetail1 = chargeRecordDAO.getChargeRecord(chargeDetail1);
				chargeDetailList.add(chargeDetail1);
			}
		}else if(type.equals("chargeType.8")){

			chargeDetail.setDescription(chargeVO.getTypeName()+ " " + description);
			chargeDetailList.add(chargeDetail);
			
		}else{

			chargeDetail.setDescription(description);
			chargeDetailList.add(chargeDetail);
			
		}
		
		return chargeDetailList;
		
	}
	
	public List getChargeDetailList(ChargeVO chargeVO,Date date,List<ChargeVO> chargeVOList,List<StockRecord> stockRecordList,List<ChargeRecord> chargeRecordList){
		
		List chargeDetailList = new ArrayList();
		
		String type = chargeVO.getType();
		
		Date effectiveDate = chargeVO.getEffectiveDate();
		Date expiryDate = chargeVO.getExpiryDate();
		
		Date theFirstDayOfTheMonth = new Date();
		Date theLastDayOfTheMonth = new Date();
		
		Calendar calendar1 = Calendar.getInstance();
		calendar1.setTime(date);
		calendar1.set(Calendar.DATE,1);
		theFirstDayOfTheMonth = calendar1.getTime();
		
		Calendar calendar2 = Calendar.getInstance();
		calendar2.setTime(date);
		
		calendar2.set(Calendar.DATE,calendar2.getActualMaximum(calendar2.DAY_OF_MONTH));
		theLastDayOfTheMonth = calendar2.getTime();
		
		if((effectiveDate != null && effectiveDate.after(theLastDayOfTheMonth)) || (expiryDate != null && expiryDate.before(theFirstDayOfTheMonth))){
			
			return chargeDetailList;
			
		}
		Date startDate = new Date();
		Date startDate2 = new Date();
		Date endDate = new Date();
		Date startDate1 = new Date();
		Date startDate3 = new Date();
		Date endDate1 = new Date();
		
		if(chargeVO.getChargeDate1() != null &&  chargeVO.getChargeDate2() == null){
			startDate = DateUtil.getDayOfMonth(date,chargeVO.getChargeDate1()+1,-1);
			endDate = DateUtil.getDayOfMonth(date,chargeVO.getChargeDate1(),0);
			
			
			if(effectiveDate != null && effectiveDate.after(startDate) && effectiveDate.before(endDate)){
				startDate = effectiveDate;	
			}else if(effectiveDate != null && effectiveDate.after(endDate)){
				return chargeDetailList;
			}
			
			if(expiryDate != null && expiryDate.before(endDate) && expiryDate.after(startDate)){
				endDate = expiryDate;	
			}else if(expiryDate != null && expiryDate.before(startDate)){
				return chargeDetailList;
			}
		}else if(chargeVO.getChargeDate1() != null &&  chargeVO.getChargeDate2() != null){
			startDate = DateUtil.getDayOfMonth(date,chargeVO.getChargeDate2()+1,-1);
			endDate = DateUtil.getDayOfMonth(date,chargeVO.getChargeDate1(),0);
			
			if(effectiveDate != null && effectiveDate.after(startDate) && effectiveDate.before(endDate)){
				startDate = effectiveDate;	
			}else if(effectiveDate != null && effectiveDate.after(endDate)){
				startDate = null;
				endDate = null;
			}
			
			if(expiryDate != null && expiryDate.before(endDate) && expiryDate.after(startDate)){
				endDate = expiryDate;	
			}else if(expiryDate != null && expiryDate.before(startDate)){
				startDate = null;
				endDate = null;
			}
			startDate2 = DateUtil.getDate(startDate, -1);
			
			
			startDate1 = DateUtil.getDayOfMonth(date,chargeVO.getChargeDate1()+1,0);
			endDate1 = DateUtil.getDayOfMonth(date,chargeVO.getChargeDate2(),0);
			
			if(effectiveDate != null && effectiveDate.after(startDate1) && effectiveDate.before(endDate1)){
				startDate1 = effectiveDate;	
			}else if(effectiveDate != null && effectiveDate.after(endDate1)){
				startDate1 = null;
				endDate1 = null;
			}
			
			if(expiryDate != null && expiryDate.before(endDate1) && expiryDate.after(startDate1)){
				endDate1 = expiryDate;	
			}else if(expiryDate != null && expiryDate.before(startDate1)){
				startDate1 = null;
				endDate1 = null;
			}
			
			startDate3 = DateUtil.getDate(startDate1,-1);
		
		
		}else if(chargeVO.getChargeDate1() == null && chargeVO.getChargeDate2() == null){
			startDate = chargeVO.getEffectiveDate();
			endDate = null;
		}
		
		
		
		
		ChargeDetail chargeDetail = new ChargeDetail();
		chargeDetail.setCustomerId(chargeVO.getCustomerId());
		chargeDetail.setChargeId(chargeVO.getId());
		
		chargeDetail.setStartDate(startDate);
		chargeDetail.setEndDate(endDate);
		
		chargeDetail.setArea(chargeVO.getArea());
		chargeDetail.setUnitPrice(chargeVO.getUnitPrice());
		chargeDetail.setUnitName(chargeVO.getUnitName());
		chargeDetail.setTotalPrice(chargeVO.getTotalPrice());
		chargeDetail.setChargeType(chargeVO.getType());
		if(chargeVO.getChargeDate1() == null && chargeVO.getChargeDate2() == null){
			chargeDetail.setChargeRate("chargeRate.1");
		}
		String description = ((chargeVO.getDescription() == null)?"":chargeVO.getDescription());
		
		if(type.equals("chargeType.1")){
		
			chargeDetail.setDescription(chargeVO.getWarehouseName()+" "+chargeVO.getTypeName()+ " " + description);
			
			chargeDetailList.add(chargeDetail);
		}else if(type.equals("chargeType.2")){
					
				chargeDetail.setDescription(chargeVO.getTypeName()+ " " + description);
				
				int days = DateUtil.getDays(startDate, endDate) + 1;
				chargeDetail.setDays(String.valueOf(days));
				
				chargeDetailList.add(chargeDetail);
		
				if(chargeVO.getChargeDate1() != null &&  chargeVO.getChargeDate2() != null){
					ChargeDetail chargeDetail1 = new ChargeDetail();

					chargeDetail1 = chargeDetail.clone();
					
					chargeDetail1.setStartDate(startDate1);
					chargeDetail1.setEndDate(endDate1);
					
					chargeDetail1.setDescription(chargeVO.getTypeName()+ " " + description);
					
					int days1 = DateUtil.getDays(startDate1, endDate1) + 1;
					chargeDetail1.setDays(String.valueOf(days1));
					
					
					
					chargeDetailList.add(chargeDetail1);
				}
				
		
			
		}else if(type.equals("chargeType.3")){
			
				
				Short[] inOut = {StockRecord.stockIn,StockRecord.stockOut,StockRecord.stockEqual}; 
				Short[] in = {StockRecord.stockIn};
				String stockRecordWeight = this.getStockRecordWeight(ConfigUtil.dDate,startDate2,inOut,chargeVO.getExceptWarehouseIdList(),chargeVO.getCategory(),chargeVO.getExceptCategoryList(),stockRecordList);
				String stockRecordInWeight = this.getStockRecordWeight(startDate,endDate,in,chargeVO.getExceptWarehouseIdList(),chargeVO.getCategory(),chargeVO.getExceptCategoryList(),stockRecordList);
				BigDecimal bStockRecordWeight = new BigDecimal(stockRecordWeight);
				BigDecimal bStockRecordInWeight = new BigDecimal(stockRecordInWeight);
				bStockRecordWeight = bStockRecordWeight.add(bStockRecordInWeight);
				
				chargeDetail.setWeight(String.valueOf(bStockRecordWeight.divide(new BigDecimal("1000"))));
				
				chargeDetail.setDescription(chargeVO.getTypeName()+ " " + (chargeVO.getCategoryName() == null?"":chargeVO.getCategoryName()) + " " + description);
				
				int days = DateUtil.getDays(startDate, endDate) + 1;
				chargeDetail.setDays(String.valueOf(days));
				
				BigDecimal b1 = bStockRecordWeight;
				b1 = b1.divide(new BigDecimal("1000"));
				BigDecimal b2 = new BigDecimal(days);
				BigDecimal b3 = new BigDecimal(chargeVO.getUnitPrice());
				BigDecimal totalPrice = b1.multiply(b2).multiply(b3);
				totalPrice = totalPrice.setScale(2,BigDecimal.ROUND_HALF_UP);
				chargeDetail.setTotalPrice(totalPrice.toString());
				
				chargeDetailList.add(chargeDetail);
				if(chargeVO.getChargeDate1() != null &&  chargeVO.getChargeDate2() != null){
					ChargeDetail chargeDetail1 = new ChargeDetail();

					chargeDetail1 = chargeDetail.clone();
					
					Short[] inOut1 = {StockRecord.stockIn,StockRecord.stockOut,StockRecord.stockEqual}; 
					Short[] in1 = {StockRecord.stockIn}; 
					
					String stockRecordWeight1 = this.getStockRecordWeight(ConfigUtil.dDate,startDate3,inOut1,chargeVO.getExceptWarehouseIdList(),chargeVO.getCategory(),chargeVO.getExceptCategoryList(),stockRecordList);
					String stockRecordInWeight1 = this.getStockRecordWeight(startDate1,endDate1,in1,chargeVO.getExceptWarehouseIdList(),chargeVO.getCategory(),chargeVO.getExceptCategoryList(),stockRecordList);
					BigDecimal bStockRecordWeight1 = new BigDecimal(stockRecordWeight1);
					BigDecimal bStockRecordInWeight1 = new BigDecimal(stockRecordInWeight1);
					bStockRecordWeight1 = bStockRecordWeight1.add(bStockRecordInWeight1);
					
					chargeDetail1.setWeight(String.valueOf(bStockRecordWeight1.divide(new BigDecimal("1000"))));
					chargeDetail1.setStartDate(startDate1);
					chargeDetail1.setEndDate(endDate1);
					chargeDetail1.setDescription(chargeVO.getTypeName()+" " +  (chargeVO.getCategoryName() == null?"":chargeVO.getCategoryName()) + " " + description);
					
					int days1 = DateUtil.getDays(startDate1, endDate1) + 1;
					chargeDetail1.setDays(String.valueOf(days1));
					
					BigDecimal b4 = bStockRecordWeight1;
					b4 = b4.divide(new BigDecimal("1000"));
					BigDecimal b5 = new BigDecimal(days1);
					BigDecimal b6 = new BigDecimal(chargeVO.getUnitPrice());
					BigDecimal totalPrice1 = b4.multiply(b5).multiply(b6);
					
					totalPrice1 = totalPrice1.setScale(2,BigDecimal.ROUND_HALF_UP);
					chargeDetail1.setTotalPrice(totalPrice1.toString());
					
					
					chargeDetailList.add(chargeDetail1);  
				}
		}else if(type.equals("chargeType.4") || type.equals("chargeType.5") || type.equals("chargeType.6") || type.equals("chargeType.7")){
			
			chargeDetail.setDescription(chargeVO.getTypeName()+ " " + description);
			int days = 1;
			chargeDetail.setDays(String.valueOf(days));
			chargeDetail = this.getChargeDetail(chargeDetail,chargeRecordList);
			BigDecimal weight = new BigDecimal(chargeDetail.getWeight());
			weight = weight.divide(new BigDecimal("1000"));
			chargeDetail.setWeight(weight.toString());
			chargeDetailList.add(chargeDetail);
			if(chargeVO.getChargeDate1() != null &&  chargeVO.getChargeDate2() != null){
				ChargeDetail chargeDetail1 = new ChargeDetail();

				chargeDetail1 = chargeDetail.clone();
				
				chargeDetail1.setStartDate(startDate1);
				chargeDetail1.setEndDate(endDate1);
				
				chargeDetail1.setDescription(chargeVO.getTypeName()+ " " + description);
				
				int days1 = 1;
				chargeDetail1.setDays(String.valueOf(days1));
				chargeDetail1 = this.getChargeDetail(chargeDetail1,chargeRecordList);
				//chargeDetail1 = chargeRecordDAO.getChargeRecord(chargeDetail1);
				BigDecimal weight1 = new BigDecimal(chargeDetail1.getWeight());
				weight1 = weight1.divide(new BigDecimal("1000"));
				chargeDetail1.setWeight(weight1.toString());
				chargeDetailList.add(chargeDetail1);
			}
		}else if(type.equals("chargeType.8")){

			chargeDetail.setDescription(chargeVO.getTypeName()+ " " + description);
			chargeDetailList.add(chargeDetail);
			
		}else{

			chargeDetail.setDescription(description);
			chargeDetailList.add(chargeDetail);
			
		}
		
		return chargeDetailList;
		
	}

	private String getStockRecordWeight(Date bDate,Date eDate,Short[] inOutArray,List<Integer> exceptWarehouseIdArray,String categoryStr,List<String> exceptCategoryList,List<StockRecord> stockRecordList){
		
		
		Iterator<StockRecord> it = stockRecordList.iterator();
		
	    Arrays.sort(inOutArray); //首先对数组排序
	    
	    BigDecimal totalWeight = new BigDecimal("0");
	    
		while(it.hasNext()){
			
			StockRecord stockRecord = (StockRecord) it.next();
			
			Date date = stockRecord.getTime();
			Short inOut = stockRecord.getInOut();
			Integer warehouseId = stockRecord.getWarehouseId();
			String category = stockRecord.getCategory();
						
			if(date.after(bDate) && date.before(eDate) && Arrays.binarySearch(inOutArray,inOut) >= 0 && !exceptWarehouseIdArray.contains(warehouseId)){
				
				String weight = stockRecord.getTotalWeight();
				if(weight != null && !weight.equals("")){
					BigDecimal bigDecimalWeight = new BigDecimal(weight);
					 
					totalWeight = totalWeight.add(bigDecimalWeight);
				}
			}
			
			
		}
		return totalWeight.toString();

	}
	
	private ChargeDetail getChargeDetail(ChargeDetail chargeDetail,List<ChargeRecord> chargeRecordList){
		
		Integer customerId = chargeDetail.getCustomerId();
		String chargeType = chargeDetail.getChargeType();
		Date bDate = chargeDetail.getStartDate();
		Date eDate = chargeDetail.getEndDate();
		
		Iterator<ChargeRecord> it = chargeRecordList.iterator();
			   
	    BigDecimal totalWeight = new BigDecimal("0");
	    BigDecimal totalPrice = new BigDecimal("0");
	    
		while(it.hasNext()){
			
			ChargeRecord chargeRecord = (ChargeRecord) it.next();
			
			Integer chargeRecordCustomerId = chargeRecord.getCustomerId();
			Date chargeRecordDate = chargeRecord.getDate();
			String chargeRecordChargeType = chargeRecord.getChargeType();
			
			if(chargeRecordDate.after(bDate) && chargeRecordDate.before(eDate) && chargeRecordCustomerId.equals(customerId) && chargeRecordChargeType.equals(chargeType)){
				
				String chargeRecordWeight = chargeRecord.getWeight();
				String chargeRecordTotalPrice = chargeRecord.getTotalPrice();
				if(chargeRecordWeight != null && !chargeRecordWeight.equals("")){
					BigDecimal bigDecimalChargeRecordWeight = new BigDecimal(chargeRecordWeight);
					 
					totalWeight = totalWeight.add(bigDecimalChargeRecordWeight);
				}
				if(chargeRecordTotalPrice != null && !chargeRecordTotalPrice.equals("")){
					BigDecimal bigDecimalChargeRecordTotalPrice = new BigDecimal(chargeRecordTotalPrice);
					 
					totalPrice = totalPrice.add(bigDecimalChargeRecordTotalPrice);
				}
			}
			
			
		}
		
		chargeDetail.setWeight(totalWeight.toString());
		chargeDetail.setTotalPrice(totalPrice.toString());
		
		return chargeDetail;

	}
	public ChargeDetail getChargeDetail(Charge charge,Date startDate,Date endDate){
		
		ChargeDetail chargeDetail = new ChargeDetail();
		int chargeDate1 = charge.getChargeDate1();  
		//Date startDate = DateUtil.getDayOfMonth(date,chargeDate1,-1);
		//Date endDate = DateUtil.getDayOfMonth(date,chargeDate1,0);
		Short[] inOut = {StockRecord.stockIn,StockRecord.stockOut,StockRecord.stockEqual}; 
		Double stockRecordWeight = stockRecordDAO.getStockRecordWeight(charge.getCustomerId(),ConfigUtil.dDate,endDate,inOut);
		chargeDetail.setWeight(stockRecordWeight.toString());
		
		return chargeDetail;
		
	}
	
	public String getPayable(Integer customerId){
		
		String payable = "";
		
		payable = String.valueOf(chargeDetailDAO.getPayable(customerId));
		
		return payable;
		
	}
	
	public boolean confirm(ChargeDetail chargeDetail){
		Integer customerId = chargeDetail.getCustomerId();
		String totalPrice = chargeDetail.getTotalPrice();
		BigDecimal totalPrice1 = new BigDecimal(totalPrice);
		List<ChargeDetail> chargeDetailList = new ArrayList();
		chargeDetailList = chargeDetailDAO.findByProperty(customerId,null,null);
		
		BigDecimal payable = new BigDecimal("0");
		BigDecimal totalPrice2 = new BigDecimal("0");
		
		for(ChargeDetail c : chargeDetailList){
			if(c.getType().equals(0)){
				
				payable = payable.add(new BigDecimal(c.getPayable()));
			
			}else if(c.getType().equals(1)){
				
				totalPrice2 = totalPrice2.add(new BigDecimal(c.getTotalPrice()));
				
			}
		}
		
		if(totalPrice2.multiply(new BigDecimal("-1")).compareTo(payable) == 1){  
			
			totalPrice2 = totalPrice2.multiply(new BigDecimal("-1")).subtract(payable);
			
			if(totalPrice2.compareTo(totalPrice1) != -1){		
				chargeDetail.setPayable(totalPrice1.toString());
				this.sava(chargeDetail);
								
			}else if(totalPrice2.compareTo(totalPrice1) == -1){
				chargeDetail.setPayable(String.valueOf(totalPrice2.toString()));
				this.sava(chargeDetail);
				
			}
			
		}else{
			
			this.sava(chargeDetail);
		}
		
		return false;
		
		
	}
	
	public boolean delete(ChargeDetail chargeDetail){
		List<ChargeDetail> chargeDetailList = new ArrayList();
		chargeDetailList = chargeDetailDAO.findByExample(chargeDetail);
		ChargeDetail c = new ChargeDetail();
		c = chargeDetailList.get(0);
		
		chargeDetailDAO.delete(c);	
	
		return false;
		
		
	}
	
	
	public boolean payment(ChargeDetail chargeDetail){
		
		Integer customerId = chargeDetail.getCustomerId();
		String totalPrice = chargeDetail.getTotalPrice();
		double totalPrice1 = Double.parseDouble(totalPrice);
		List<ChargeDetail> chargeDetailList = new ArrayList();
		chargeDetailList = chargeDetailDAO.findByProperty(customerId,null,null);
	
		for(ChargeDetail c : chargeDetailList){
			 //c.getPayable().equals("0") && Double.parseDouble(c.getTotalPrice()) <= totalPrice1*-1
			if(c.getType().equals(0)){
				
				double payable = Double.parseDouble(c.getPayable());
				double totalPrice2 = Double.parseDouble(c.getTotalPrice());
				
				if(totalPrice2 > payable && totalPrice1*-1 > 0){
					
					if(totalPrice1*-1 >= (totalPrice2 - payable)){
						
						c.setPayable(String.valueOf(totalPrice2));
						chargeDetailDAO.attachDirty(c);
						totalPrice1 = totalPrice1 + (totalPrice2 - payable);
						
					}else if(totalPrice1*-1 < (totalPrice2 - payable)){
						c.setPayable(String.valueOf(payable + totalPrice1*-1));
						chargeDetailDAO.attachDirty(c);
						totalPrice1 = 0;
					}
			
				}
				
				
				
			}
			
		}
	
		sava(chargeDetail);
		
		return false;
	}
	
	public boolean deleteCharge(String customerId,String chargeId){
		
		Charge charge = new Charge();
		
		charge.setCustomerId(Integer.valueOf(customerId));
		charge.setId(Integer.valueOf(chargeId));
		dao.delete(charge);
		
		return true;
		
	}
	
}
