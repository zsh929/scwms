package com.sclk.scwms.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.sclk.scwms.common.ConfigUtil;
import com.sclk.scwms.common.DateUtil;
import com.sclk.scwms.dao.CargoDAO;
import com.sclk.scwms.dao.MonthTotalDAO;
import com.sclk.scwms.dao.StockRecordDAO;
import com.sclk.scwms.model.Cargo;
import com.sclk.scwms.model.Customer;
import com.sclk.scwms.model.MonthTotal;
import com.sclk.scwms.model.Syscode;
import com.sclk.scwms.vo.CargoRecordItemsVO;
import com.sclk.scwms.vo.CargoVO;
import com.sclk.scwms.vo.MonthTotalVO;

public class CargoManager {
	private CargoDAO dao;

	public void setDao(CargoDAO dao) {
		this.dao = dao;
	}
	private MonthTotalDAO monthTotalDAO;

	public void setMonthTotalDAO(MonthTotalDAO dao) {
		this.monthTotalDAO = dao;
	}
	
	private StockRecordDAO stockRecordDAO;

	public void setStockRecordDAO(StockRecordDAO dao) {
		this.stockRecordDAO = dao;
	}
	
	private SyscodeManager syscodeManager;

	public void setSyscodeManager(SyscodeManager manager) {
		this.syscodeManager = manager;
	}
	
	private CustomerManager customerManager;

    public void setCustomerManager(CustomerManager manager) {
    	this.customerManager = manager;
    }
    
    private MonthWarehouseManager monthWarehouseManager;
	
	public void setMonthWarehouseManager(MonthWarehouseManager monthWarehouseManager) {
		this.monthWarehouseManager = monthWarehouseManager;
	}
	
	private WarehouseManager warehouseManager;
	
	public void setWarehouseManager(WarehouseManager warehouseManager) {
		this.warehouseManager = warehouseManager;
	}
	
	public boolean sava(Cargo d){
		
		if(d.getId() == null){
			dao.save(d);
			
		}else{
			
			dao.attachDirty(d);
		}
		return false;
	}
	public List getCargoes(){
		
		return dao.findAll();
		
	}
	public Integer[] getCargoesArray(String categoryId){
		List<String> categoryCodeKey = new ArrayList();
		categoryCodeKey.add(categoryId);
		if(categoryCodeKey != null && categoryCodeKey.size() > 0){
			return dao.findByCategory(categoryCodeKey);
			
		}
		
		return null;
	
	}
	public Integer[] getCargoesArray(List<String> categoryCodeKey){
		
		if(categoryCodeKey != null && categoryCodeKey.size() > 0 ){
			return dao.findByCategory(categoryCodeKey);
			
		}
		
		return null;
	
	}
	public List getCargoesVOList(){
		
		List<Syscode> categoryList = syscodeManager.getItemForSelect("category");
		List<Syscode> unityList = syscodeManager.getItemForSelect("unit");
		List<Customer> customerList = customerManager.getCustomers();
		List<CargoVO> cargoesVOList = new ArrayList<CargoVO>();
		
		Map syscodeMap = new HashMap();
		Map customerMap = new HashMap();
		
		for(Syscode syscode:categoryList){
			syscodeMap.put(syscode.getCodeKey(), syscode.getCodeValue());
			
		}
		for(Syscode syscode:unityList){
			syscodeMap.put(syscode.getCodeKey(), syscode.getCodeValue());
			
		}
		for(Customer customer:customerList){
			customerMap.put(customer.getId().toString(), customer.getName());
			
		}
		List<Cargo> l = dao.findAll();
		
		for(Cargo cargo:l){
			CargoVO c = new CargoVO();
			c.setId(cargo.getId());
			c.setName(cargo.getName());
			c.setNumber(cargo.getNumber());
			c.setSize(cargo.getSize());
			c.setUnit((String)syscodeMap.get(cargo.getUnit()));
			c.setWeight(cargo.getWeight());
			c.setCategory((String)syscodeMap.get(cargo.getCategory()));
			c.setCustomerName((String)customerMap.get(cargo.getCustomerId()));
			c.setCustomerId(cargo.getCustomerId());
			cargoesVOList.add(c);
		}
		
		return cargoesVOList;
		
	}
	
	public CargoVO getCargoVO(Integer id){
		Cargo c = dao.findById(id);
		return getCargoVO(c);
	}
	
	public CargoVO getCargoVO(Cargo cargo){
	
		if(cargo == null){
			return new CargoVO();
		}
		
		List<Syscode> categoryList = syscodeManager.getItemForSelect("category");
		List<Syscode> unityList = syscodeManager.getItemForSelect("unit");
		List<Customer> customerList = customerManager.getCustomers();
		
		Map syscodeMap = new HashMap();
		Map customerMap = new HashMap();
		
		for(Syscode syscode:categoryList){
			syscodeMap.put(syscode.getCodeKey(), syscode.getCodeValue());
			
		}
		for(Syscode syscode:unityList){
			syscodeMap.put(syscode.getCodeKey(), syscode.getCodeValue());
			
		}
		for(Customer customer:customerList){
			customerMap.put(customer.getId().toString(), customer.getName());
			
		}
		
		CargoVO cv = new CargoVO();
		cv.setId(cargo.getId());
		cv.setName(cargo.getName());
		cv.setNumber(cargo.getNumber());
		cv.setSize(cargo.getSize());
		cv.setUnit((String)syscodeMap.get(cargo.getUnit()));
		cv.setWeight(cargo.getWeight());
		cv.setCategory((String)syscodeMap.get(cargo.getCategory()));
		cv.setCustomerId(cargo.getCustomerId());
		cv.setCustomerName((String)customerMap.get(cargo.getCustomerId()));
		return cv;
	}
	public List<CargoVO> getCargoVOByCustomer(String customerId){
		
		List<Cargo> list = dao.findByCustomerId(customerId);
		
		
		return getCargoesVOList(list);
		
	}
	public List<Cargo> getCargoByCustomer(String customerId){
		
		List<Cargo> list = dao.findByCustomerId(customerId);
		
		
		return list;
		
	}
	private List<CargoVO> getCargoesVOList(List<Cargo> cargoesList){
		List<Syscode> categoryList = syscodeManager.getItemForSelect("category");
		List<Syscode> unityList = syscodeManager.getItemForSelect("unit");
		List<Customer> customerList = customerManager.getCustomers();
		
		Map syscodeMap = new HashMap();
		Map customerMap = new HashMap();
		
		for(Syscode syscode:categoryList){
			syscodeMap.put(syscode.getCodeKey(), syscode.getCodeValue());
			
		}
		for(Syscode syscode:unityList){
			syscodeMap.put(syscode.getCodeKey(), syscode.getCodeValue());
			
		}
		for(Customer customer:customerList){
			customerMap.put(customer.getId().toString(), customer.getName());
			
		}
		
		List<CargoVO> cargoesVOList = new ArrayList<CargoVO>();
		
		for(Cargo cargo:cargoesList){
			CargoVO c = new CargoVO();
			c.setId(cargo.getId());
			c.setName(cargo.getName());
			c.setNumber(cargo.getNumber());
			c.setSize(cargo.getSize());
			c.setUnit((String)syscodeMap.get(cargo.getUnit()));
			c.setWeight(cargo.getWeight());
			c.setCategory((String)syscodeMap.get(cargo.getCategory()));
			c.setChargeType(cargo.getChargeType());
			c.setCustomerId(cargo.getCustomerId());
			c.setCustomerName((String)customerMap.get(cargo.getCustomerId()));
			cargoesVOList.add(c);
		}
		
		return cargoesVOList;
		
		
	}
	
	public List<MonthTotalVO> getMonthTotalVOList(Customer customer,Date date) {
		
		List<Syscode> unityList = syscodeManager.getItemForSelect("unit");
		Map syscodeMap = new HashMap();
		
		for(Syscode syscode:unityList){
			syscodeMap.put(syscode.getCodeKey(), syscode.getCodeValue());
			
		}
		
		List<Cargo> l = monthTotalDAO.findByC_M(customer.getId().toString(),date);
	
		List<MonthTotalVO> voList = new ArrayList();
		for(Cargo c:l){
			MonthTotalVO v = new MonthTotalVO();
			v.setCargoId(c.getId());
			v.setCargoName(c.getName());
			v.setWeight(c.getWeight());
			v.setUnit((String)syscodeMap.get(c.getUnit()));
			if(!c.getMonthTotals().isEmpty()){
				Iterator it = c.getMonthTotals().iterator();
				while(it.hasNext()){
					MonthTotal m = (MonthTotal)it.next();
					List monthWarehouseVOList = monthWarehouseManager.getMonthWarehouseVOList(m.getId());
					v.setMonthWarehouseList(monthWarehouseVOList);
					v.setId(m.getId());
					v.setInQuantity(m.getInQuantity());
					v.setInWeight(m.getInWeight());
					v.setOutQuantity(m.getOutQuantity());
					v.setOutWeight(m.getOutWeight());
					v.setBalanceQuantity(m.getBalanceQuantity());
					v.setBalanceWeight(m.getBalanceWeight());
					v.setChargeType(c.getChargeType());
				}
			
			}
			voList.add(v);
		}
	
		return voList;
		
	}
	
	public List<CargoVO> findBykeyword(String keyword){
		
		String[] keywordArr;
		if(keyword != null && !keyword.equals("")){
			keywordArr = keyword.split(" ");
			
		}else{
			keywordArr = new String[0];
		}
		
		List<Cargo> list = dao.find(keywordArr);
		
		
		return getCargoesVOList(list);
		
		
	}
	/*public MonthTotal getMonthTotal(Customer customer,Date date,Integer cargoId) {
		
		Cargo c= monthTotalDAO.findByCId_M_cargoId(customer.getId().toString(),date,cargoId);
	
		
		MonthTotal m = new MonthTotal();
		
		if(!c.getMonthTotals().isEmpty()){
			Iterator it = c.getMonthTotals().iterator();
			while(it.hasNext()){
				MonthTotal i = (MonthTotal)it.next();
				m.setId(i.getId());
				m.setInQuantity(i.getInQuantity());
				m.setInWeight(i.getInWeight());
				m.setOutQuantity(i.getOutQuantity());
				m.setOutWeight(i.getOutWeight());
				m.setBalanceQuantity(i.getBalanceQuantity());
				m.setBalanceWeight(i.getBalanceWeight());
			}
		
		}
	

		return m;
		
	}
	*/
	public MonthTotal getMonthTotal(Customer customer,Date date,Integer cargoId) {
		
		//Cargo c= monthTotalDAO.findByCId_M_cargoId(customer.getId().toString(),date,cargoId);
	
		String[] s = stockRecordDAO.getCargoRecordTotal(cargoId.toString(),DateUtil.stringToDate(ConfigUtil.sDate),date);
		
		MonthTotal m = new MonthTotal();
		if(s != null){
			m.setBalanceQuantity(s[0]);
			m.setBalanceWeight(s[1]);
		}
		return m;
		
	}
	
	public Cargo getCargo(Integer id){
		
		return dao.findById(id);
	}
	
	public Cargo getCargo(Cargo cargo){
		
		List<Cargo> l = dao.findByExample(cargo);
		if(l != null && l.size() > 0){
			
			return l.get(0);
		}
		return null;  
	}
	
	public List<CargoRecordItemsVO> getCargoItemsList(String cargoId,String locationId){
		String[] str = {};
		Map<Integer,String> locationMap = warehouseManager.getLocationMap(str);
		
		List<CargoRecordItemsVO> l = stockRecordDAO.getCargoRecordList(cargoId,locationId);
		
		for(CargoRecordItemsVO vo:l){
			
			vo.setLocationName((String)locationMap.get(vo.getLocationId()));
			
		}
		
		return l;
		
	}
	
	public List<Syscode> getCategoryListByCustomerId(String customerId){
		
		return dao.getCategoryListByCustomerId(customerId);
		
	}
}
