package com.sclk.scwms.service;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.sclk.scwms.common.ConfigUtil;
import com.sclk.scwms.common.DateUtil;
import com.sclk.scwms.dao.StockRecordDAO;


public class StockManager {
	private StockRecordDAO dao;

	public void setDao(StockRecordDAO dao) {
		this.dao = dao;
	}
	
	private SyscodeManager syscodeManager;
	
	public void setSyscodeManager(SyscodeManager syscodeManager) {
		this.syscodeManager = syscodeManager;
	}

	private CargoManager cargoManager;
	

	public void setCargoManager(CargoManager cargoManager) {
		this.cargoManager = cargoManager;
	}
	public List getReportUserDefined(String locationId,
									 String customerId,
									 Integer[] cargoIdArray,
									 Date bDate,
									 Date eDate){
		List l = new ArrayList();
		l = dao.getStockList(locationId,customerId,cargoIdArray,bDate,eDate);
		Double equal = dao.getStockTotal(locationId, customerId, cargoIdArray, ConfigUtil.dDate, bDate);
		
		if(l == null || l.size() <= 0){
			return null;
		}
		Object obj[] = ((Object[])l.get(0));
		Double accumulate = (Double)obj[5] - (Double)obj[3] - (Double)obj[4];
		
		
		
		List<Date> dateList = DateUtil.getDateList(bDate,eDate);
		
		for(int i = 0;i < dateList.size();i++){
			
			if( i >= l.size() || !DateUtil.dayToString(dateList.get(i)).equals(DateUtil.dayToString((Date) ((Object[])l.get(i))[0]))){
				
				Object o[] = new Object[6];
				o[0] = dateList.get(i);
				o[5] = accumulate;
				l.add(i,o);	
			}
			accumulate = (Double)((Object[])l.get(i))[5];
		}
		
		if(equal != null && equal != 0){
			
			Iterator it = l.iterator();
			
			while(it.hasNext()){
				Object[] row = (Object[])it.next();
				
				BigDecimal b1 = new BigDecimal(row[5].toString());   
		        BigDecimal b2 = new BigDecimal(Double.toString(equal));   
		        row[5] = b1.add(b2).doubleValue();   

				
				//Double i = (Double)row[5] + equal;
				
				//row[5] = i;
				
			}
		
		}
		
		
		return l;
		
	}
	
	public void buildStockRecordChartDate(StringBuffer balanceWeight,StringBuffer inWeight,StringBuffer outWeight,StringBuffer date,List stockRecordList,int days){
		
		//StringBuffer stockRecordChart = new StringBuffer();
		//StringBuffer inWeight = new StringBuffer();
		//StringBuffer outWeight = new StringBuffer();
		//StringBuffer date = new StringBuffer();
		
		
		Iterator it = stockRecordList.iterator();
		
		//-------------------------------
		if(days > 180){
			Date d = new Date();
			date.setLength(0);
			int i = 0;
			int j = 1;
			Double stockRecordChart1 = 0.0;
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
					stockRecordChart1 = (Double)obj[5]/1000;
					if(obj[4] != null){
						inWeight1 =  (Double)obj[4]/1000;
					}
					if(obj[3] != null){
						outWeight1 =  -1 * (Double)obj[3]/1000;
					}
					
					
				}else{
				
					i++;
					stockRecordChart1 = stockRecordChart1 + (Double)obj[5]/1000;
					
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
					balanceWeight.append(stockRecordChart1/i);
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
		}else if(days > 62){
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
				
				
				
			
			}else if(days <= 62){
			
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
		
	}
	
	public List getStockCountList(String locationId,
									 String customerId,
									 Integer[] cargoIdArray,
									 Date bDate,
									 Date eDate){
		List l = dao.getStockCountList(locationId,customerId,cargoIdArray,bDate,eDate);
		
		if(l == null || l.size() <= 0){
			return null;
		}
		
		return l;
	
	}
	
	public Double getStockEqual (String locationId,
								 String customerId,
								 Integer[] cargoIdArray,
								 Date bDate,
								 Date eDate){
	
		Double equal = dao.getStockTotal(locationId, customerId, cargoIdArray, bDate, eDate);
		
		return equal;
	
	}
	
	public StringBuffer buildChartDataForAccumulatePerCustomer(){
		List<Object[]> l = dao.getAccumulatePerCustomer();
		StringBuffer sb = new StringBuffer();
		if(l == null || l.size() <= 0){
			return sb;
		}
		
		Iterator it = l.iterator();
		int i = 0;
		
		Double otherSum = 0.0;
		
		sb.append("[");
		while(it.hasNext()){
			i++;
			Object[] o = (Object[])it.next();
			
			Double d = 0.0;
			
			if(o[2] != null){
				
				d = (Double)o[2]/1000;
			}
			
			if(i < 10){
				sb.append("['");
				sb.append(o[1]);
				sb.append(" ");
				sb.append(String.format("%.1f", d));
				sb.append("¶Ö");
				sb.append("',");
				sb.append(String.format("%.1f", d));
				sb.append("],");
			}else{
				otherSum += d;
				
			}
			
		}
		if(otherSum > 0){
			
			sb.append("['");
			sb.append("ÆäËû");
			sb.append(" ");
			sb.append(String.format("%.1f", otherSum));
			sb.append("¶Ö");
			sb.append("',");
			sb.append(String.format("%.1f", otherSum));
			sb.append("]");
		}
		
		sb.append("]");
		return sb;
		
	}
	public List<String[]> buildTableDataForStockOutInPerCustomer(){
		List<String[]> l1 = dao.getStockOutInPerCustomer(DateUtil.getDate(new Date(),-90),new Date());
		List<String[]> l2 = dao.getStockOutInPerCustomer(DateUtil.getDate(new Date(),-30),new Date());
		List<String[]> l3 = dao.getStockOutInPerCustomer(DateUtil.getDate(new Date(),-7),new Date());
		List<String[]> l4 = dao.getStockOutInPerCustomer(DateUtil.getDate(new Date(),-1),new Date());
		
		List<Object[]> l5 = dao.getAccumulatePerCustomer();
		
		List<String[]> l = new ArrayList();
		
		for(Object[] s5:l5){
			
			String[] s = new String[]{"0.0","0.0","0.0","0.0","0.0","0.0","0.0","0.0","0.0","0.0","0.0"};
			
			s[0] = s5[1].toString();
			s[9] = String.format("%.3f",(Double)s5[2]/1000);
			s[10] = s5[0].toString();
			
			for(String[] s1:l1){
				if(s5[0].toString().equals(s1[0])){
					s[5] = s1[2];        
					s[6] = s1[3];
					break;
				}
			}
			
			for(String[] s2:l2){
				if(s5[0].toString().equals(s2[0])){
					s[3] = s2[2];
					s[4] = s2[3];
					break;
				}
			}
			for(String[] s3:l3){
				if(s5[0].toString().equals(s3[0])){
					s[1] = s3[2];
					s[2] = s3[3];
					break;
				}
			}
			for(String[] s4:l4){
				if(s5[0].toString().equals(s4[0])){
					s[7] = s4[2];
					s[8] = s4[3];
				
					break;
				}
			}
			l.add(s);
		}
		
		return l;
		
	}
	public List getReportMonthly(Date bDate,Date eDate){
		
		List l = dao.getStockList("","",null,bDate,eDate);
		if(l == null || l.size() <= 0){
			return null;
		}
		Object obj[] = ((Object[])l.get(0));
		Double accumulate = (Double)obj[5] - (Double)obj[3] - (Double)obj[4];
		
		List<Date> dateList = DateUtil.getDateList(bDate,eDate);
		
		for(int i = 0;i < dateList.size();i++){
			
			if( i >= l.size() || !DateUtil.dayToString(dateList.get(i)).equals(DateUtil.dayToString((Date) ((Object[])l.get(i))[0]))){
				
				Object o[] = new Object[6];
				o[0] = dateList.get(i);
				o[5] = accumulate;
				l.add(i,o);	
			}
			accumulate = (Double)((Object[])l.get(i))[5];
			
		}
		
		
		return l;
		
	}   
	
	public List getReportCategory(Date bDate,Date eDate){
		
		List<Object[]> result = new ArrayList<Object[]>();
		
		Map<String,List<String>> m = syscodeManager.getCategoryCodeKey();
		
		Iterator it = m.entrySet().iterator();
		while(it.hasNext()){
			Entry<String,List<String>> e = (Entry<String,List<String>>) it.next();
			String s = e.getKey();
			List<String> l = e.getValue();
			
			List<String[]> list = dao.getStockCategoryList(cargoManager.getCargoesArray(l),bDate,eDate);
			if(list != null){
				double d1 = 0;
				double d2 = 0;
				double d3 = 0;
				double d4 = 0;
				for(String[] temp:list){
					d1 = d1 + Double.valueOf(temp[1]);
					d2 = d2 + Double.valueOf(temp[2]);
					d3 = d3 + Double.valueOf(temp[3]);
					d4 = d4 + Double.valueOf(temp[4]);
				}
				if(d3 < -0.0 ){
					d3 = d3*-1;
					
				}
				Object[] amount = {s,d1,d2,d3,d4};
				Object[] o = {amount,list};
				result.add(o);
				
				//result.add(amount);
			}
		}
		
		return result;

	}

	public List<String[]> getReportSummary(Date bDate,Date eDate){
		
		List<String[]> list = dao.getStockOutInTotalWeightPerCustomer(bDate,eDate);
		
		return list;

	}
}
