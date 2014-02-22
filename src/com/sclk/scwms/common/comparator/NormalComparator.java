package com.sclk.scwms.common.comparator;

import java.text.Collator;
import java.text.RuleBasedCollator;
import java.util.Comparator;
import java.util.Locale;

import com.sclk.scwms.model.Customer;
import com.sclk.scwms.vo.ChargeVO;

public class NormalComparator implements Comparator {

	 

    RuleBasedCollator collator = (RuleBasedCollator)Collator.getInstance(Locale.CHINA);

 

    public int compare(Customer o1, Customer o2) {

        // TODO Auto-generated method stub

        return collator.compare(o1.getName(), o2.getName());

    }
    public int compare(ChargeVO o1, ChargeVO o2) {

        // TODO Auto-generated method stub

        return collator.compare(o1.getCustomerName(), o2.getCustomerName());

    }
    public int compare(Object o1, Object o2) {
		
    	if(o1 instanceof Customer){
    		Customer c1 = (Customer)o1;
    		Customer c2 = (Customer)o2;
    		return collator.compare(c1.getName(), c2.getName());
    		
    	}else if(o1 instanceof String[]){
    		
    		String[] s1 = (String[])o1;
    		String[] s2 = (String[])o2;
    		
    		return collator.compare(s1[1], s2[1]);
    	}else if(o1 instanceof ChargeVO){
    		ChargeVO c1 = (ChargeVO)o1;
    		ChargeVO c2 = (ChargeVO)o2;
    		return collator.compare(c1.getCustomerName(), c2.getCustomerName());
    		
    	}
		return 0;
    	
	}
    
    

}

