package com.sclk.scwms.common;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class ChartUtil {

	public StringBuffer getStockRecordChart(List stockRecordList){
		
		StringBuffer stockRecordChart = new StringBuffer();
		//StringBuffer inWeight = new StringBuffer();
		//StringBuffer outWeight = new StringBuffer();
		//StringBuffer date = new StringBuffer();
				
		Iterator it = stockRecordList.iterator();
		
		//-------------------------------
		
			Date d = new Date();
			int i = 0;
			int j = 1;
			Double stockRecordChart1 = 0.0;
			//Double inWeight1 = 0.0;
			//Double outWeight1 = 0.0;
			
			stockRecordChart.append("[");
			//inWeight.append("[");
			//outWeight.append("[");
			//date.append("[");
			while(it.hasNext()){
				Object[] obj = (Object[])it.next();
				d = (Date)obj[0];
				Calendar b = Calendar.getInstance();
				b.setTime(d);
				if(b.get(b.DAY_OF_MONTH) == 21){
					i = 1;
					stockRecordChart1 = (Double)obj[5]/1000;
					//if(obj[4] != null){
					//	inWeight1 =  (Double)obj[4]/1000;
					//}
					//if(obj[3] != null){
					//	outWeight1 =  -1 * (Double)obj[3]/1000;
					//}
					
					
				}else{
				
					i++;
					stockRecordChart1 = stockRecordChart1 + (Double)obj[5]/1000;
					
					//if(obj[4] != null){
					//	inWeight1 = inWeight1 + (Double)obj[4]/1000;
					//}
					//if(obj[3] != null){
					//	outWeight1 = outWeight1 +  (-1 * (Double)obj[3]/1000);
					//}
					
				}	
				if(b.get(b.DAY_OF_MONTH) == 20){
					SimpleDateFormat f = new SimpleDateFormat("yyyy-MM");
					stockRecordChart.append("[");
					stockRecordChart.append(j);
					stockRecordChart.append(",");
					stockRecordChart.append(stockRecordChart1/i);
					stockRecordChart.append("],");
					
					//inWeight.append("[");
					//inWeight.append(j);
					//inWeight.append(",");
					//inWeight.append(inWeight1);
					//inWeight.append("],");
					
					//outWeight.append("[");
					//outWeight.append(j);
					//outWeight.append(",");
					//outWeight.append(outWeight1);
					//outWeight.append("],");
					
					j++;
					
		           
					//date.append("'");
					
					//date.append(f.format(d));
					//date.append("',");
					
				}
				
			}
			stockRecordChart.append("]");
			//inWeight.append("]");
			//outWeight.append("]");
			//date.append("]");
		
		
		return stockRecordChart;
		
		
	}
	
	
}
