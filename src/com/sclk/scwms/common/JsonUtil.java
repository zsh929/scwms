package com.sclk.scwms.common;

import java.util.List;

import com.sclk.scwms.model.Cargo;
import com.sclk.scwms.model.Customer;
import com.sclk.scwms.model.Syscode;
import com.sclk.scwms.vo.CargoVO;
import com.sclk.scwms.vo.ChargeVO;
import com.sclk.scwms.vo.StockRecordVO;
 
 
public class JsonUtil {  
   
/*  private static org.apache.commons.logging.Log log = org.apache.commons.logging.LogFactory  
      .getLog(JsonUtil.class);  
 
   
  public static String object2json(Object obj) {  
    StringBuilder json = new StringBuilder();  
    if (obj == null) {  
      json.append("\"\"");  
    } else if (obj instanceof String ||
         obj instanceof Integer ||
         obj instanceof Float  ||
         obj instanceof Boolean ||
         obj instanceof Short ||
         obj instanceof Double || 
         obj instanceof Long ||
         obj instanceof BigDecimal ||
         obj instanceof BigInteger || 
         obj instanceof Byte) {  
      json.append("\"").append(string2json(obj.toString())).append("\"");  
    } else if (obj instanceof Object[]) {  
      json.append(array2json((Object[]) obj));  
    } else if (obj instanceof List) {  
      json.append(list2json((List<?>) obj));  
    } else if (obj instanceof Map) {  
      json.append(map2json((Map<?, ?>) obj));  
    } else if (obj instanceof Set) {  
      json.append(set2json((Set<?>) obj));  
    } else {  
      json.append(bean2json(obj));  
    }  
    return json.toString();  
  }  
 
   
  public static String bean2json(Object bean) {  
    StringBuilder json = new StringBuilder();  
    json.append("{");  
    PropertyDescriptor[] props = null;  
    try {  
      props = Introspector.getBeanInfo(bean.getClass(), Object.class).getPropertyDescriptors();  
    } catch (IntrospectionException e) {}  
    if (props != null) {  
      for (int i = 0; i < props.length; i++) {  
        try {  
          String name = object2json(props[i].getName());  
          String value = object2json(props[i].getReadMethod().invoke(bean));  
          json.append(name);  
          json.append(":");  
          json.append(value);  
          json.append(",");  
        } catch (Exception e) {}  
      }  
      json.setCharAt(json.length() - 1, '}');  
    } else {  
      json.append("}");  
    }  
    return json.toString();  
  }  
 
   
  public static String list2json(List<?> list) {  
    StringBuilder json = new StringBuilder();  
    json.append("[");  
    if (list != null && list.size() > 0) {  
      for (Object obj : list) {  
        json.append(object2json(obj));  
        json.append(",");  
      }  
      json.setCharAt(json.length() - 1, ']');  
    } else {  
      json.append("]");  
    }  
    return json.toString();  
  }  
 
   
  public static String array2json(Object[] array) {  
    StringBuilder json = new StringBuilder();  
    json.append("[");  
    if (array != null && array.length > 0) {  
      for (Object obj : array) {  
        json.append(object2json(obj));  
        json.append(",");  
      }  
      json.setCharAt(json.length() - 1, ']');  
    } else {  
      json.append("]");  
    }  
    return json.toString();  
  }  
 
   
  public static String map2json(Map<?, ?> map) {  
    StringBuilder json = new StringBuilder();  
    json.append("{");  
    if (map != null && map.size() > 0) {  
      for (Object key : map.keySet()) {  
        json.append(object2json(key));  
        json.append(":");  
        json.append(object2json(map.get(key)));  
        json.append(",");  
      }  
      json.setCharAt(json.length() - 1, '}');  
    } else {  
      json.append("}");  
    }  
    return json.toString();  
  }  
 
   
  public static String set2json(Set<?> set) {  
    StringBuilder json = new StringBuilder();  
    json.append("[");  
    if (set != null && set.size() > 0) {  
      for (Object obj : set) {  
        json.append(object2json(obj));  
        json.append(",");  
      }  
      json.setCharAt(json.length() - 1, ']');  
    } else {  
      json.append("]");  
    }  
    return json.toString();  
  }  
 
   
  public static String string2json(String s) {  
    if (s == null)  
      return "";  
    StringBuilder sb = new StringBuilder();  
    for (int i = 0; i < s.length(); i++) {  
      char ch = s.charAt(i);  
      switch (ch) {  
      case '"':  
        sb.append("\\\"");  
        break;  
      case '\\':  
        sb.append("\\\\");  
        break;  
      case '\b':  
        sb.append("\\b");  
        break;  
      case '\f':  
        sb.append("\\f");  
        break;  
      case '\n':  
        sb.append("\\n");  
        break;  
      case '\r':  
        sb.append("\\r");  
        break;  
      case '\t':  
        sb.append("\\t");  
        break;  
      case '/':  
        sb.append("\\/");  
        break;  
      default:  
        if (ch >= '\u0000' && ch <= '\u001F') {  
          String ss = Integer.toHexString(ch);  
          sb.append("\\u");  
          for (int k = 0; k < 4 - ss.length(); k++) {  
            sb.append('0');  
          }  
          sb.append(ss.toUpperCase());  
        } else {  
          sb.append(ch);  
        }  
      }  
    }  
    return sb.toString();  
  }  */
  
  public static String list2json(List list) {
	  StringBuilder sb = new StringBuilder();    
	  
	  if (list != null && list.size() > 0) { 
		  sb.append("[");
	      for (Object obj : list) {  
	    	  if(obj instanceof Customer){
	    		  Customer c = (Customer) obj;
	    		  sb.append(customer2json(c));
	    	  }else if(obj instanceof Cargo){
	    		  Cargo c = (Cargo) obj;
	    		  sb.append(cargo2json(c));
	    	  }else if(obj instanceof StockRecordVO){
	    		  StockRecordVO c = (StockRecordVO) obj;
	    		  sb.append(stockRecord2json(c));
	    	  }else if(obj instanceof ChargeVO){
	    		  ChargeVO c = (ChargeVO) obj;
	    		  sb.append(charge2json(c));
	    	  }else if(obj instanceof Syscode){
	    		  Syscode c = (Syscode) obj;
	    		  sb.append(syscode2json(c));
	    	  }else if(obj instanceof CargoVO){
		    	  CargoVO c = (CargoVO) obj;
	    		  sb.append(cargoVO2json(c));
	    	  }
			  sb.append(",");
	      }
	      sb.deleteCharAt(sb.lastIndexOf(","));
		  sb.append("]");
	  }
	  
	return sb.toString();
	  
  }
  public static String customer2json(Customer customer) {
	  StringBuilder sb = new StringBuilder();  
	  sb.append("{");
	  sb.append("name:");
	  sb.append("\"");
	  sb.append(customer.getName());
	  sb.append("\",");
	  
	  sb.append("symbol:");
	  sb.append("\"");
	  sb.append(customer.getSymbol());
	  sb.append("\",");
	  
	  sb.append("shortName:");
	  sb.append("\"");
	  sb.append(customer.getShortName());
	  sb.append("\",");
	  
	  sb.append("id:");
	  sb.append("\"");
	  sb.append(customer.getId());
	  sb.append("\"");
	  sb.append("}");
	  return sb.toString();  
  }
  
  public static String cargo2json(Cargo cargo) {
	  StringBuilder sb = new StringBuilder();  
	  sb.append("{");
	  
	  sb.append("id:");
	  sb.append("\"");
	  sb.append(cargo.getId());
	  sb.append("\",");
	  
	  sb.append("name:");
	  sb.append("\"");
	  sb.append(cargo.getName());
	  sb.append("\",");
	  
	  sb.append("category:");
	  sb.append("\"");
	  sb.append(cargo.getCategory());
	  sb.append("\",");
	  
	  sb.append("size:");
	  sb.append("\"");
	  sb.append(cargo.getSize());
	  sb.append("\",");
	  
	  sb.append("unit:");
	  sb.append("\"");
	  sb.append(cargo.getUnit());
	  sb.append("\",");
	  
	  sb.append("weight:");
	  sb.append("\"");
	  sb.append(cargo.getWeight());
	  sb.append("\",");
	  
	  sb.append("number:");
	  sb.append("\"");
	  sb.append(cargo.getNumber());
	  sb.append("\",");
	  
	  sb.append("grossWeight:");
	  sb.append("\"");
	  sb.append(cargo.getGrossWeight());
	  sb.append("\"");
	  
	  sb.append("}");
	  return sb.toString();  
  }
  
  public static String stockRecord2json(StockRecordVO stockRecordVO) {
	  StringBuilder sb = new StringBuilder();  
	  sb.append("{");
	  sb.append("id:");
	  sb.append("\"");
	  sb.append(stockRecordVO.getId());
	  sb.append("\",");
	  
	  sb.append("inOut:");
	  sb.append("\"");
	  sb.append(stockRecordVO.getInOut());
	  sb.append("\",");
	  
	  sb.append("time:");
	  sb.append("\"");
	  sb.append(stockRecordVO.getTime());
	  sb.append("\",");
	  
	  sb.append("cargoId:");
	  sb.append("\"");
	  sb.append(stockRecordVO.getCargoId());
	  sb.append("\",");
	  
	  sb.append("quantity:");
	  sb.append("\"");
	  sb.append(stockRecordVO.getQuantity());
	  sb.append("\",");
	  
	  sb.append("totalWeight:");
	  sb.append("\"");
	  sb.append(stockRecordVO.getTotalWeight());
	  sb.append("\"");
	  
	  sb.append("}");
	  return sb.toString();  
  }
  
  public static String charge2json(ChargeVO chargeVO) {
	  StringBuilder sb = new StringBuilder();  
	  sb.append("{");
	  sb.append("id:");
	  sb.append("\"");
	  sb.append(chargeVO.getId());
	  sb.append("\",");
	  
	  sb.append("type:");
	  sb.append("\"");
	  sb.append(chargeVO.getType());
	  sb.append("\",");
	  
	  sb.append("typeName:");
	  sb.append("\"");
	  sb.append(chargeVO.getTypeName());
	  sb.append("\",");
	  
	  sb.append("unit:");
	  sb.append("\"");
	  sb.append(chargeVO.getUnit());
	  sb.append("\",");
	  
	  sb.append("unitName:");
	  sb.append("\"");
	  sb.append(chargeVO.getUnitName());
	  sb.append("\",");
	  
	  sb.append("unitPrice:");
	  sb.append("\"");
	  sb.append(chargeVO.getUnitPrice());
	  sb.append("\"");
	  
	  sb.append("}");
	  return sb.toString();  
  }
  
  public static String syscode2json(Syscode syscode) {
	  StringBuilder sb = new StringBuilder();  
	  sb.append("{");
	  sb.append("codeKey:");
	  sb.append("\"");
	  sb.append(syscode.getCodeKey());
	  sb.append("\",");
	  
	  sb.append("codeValue:");
	  sb.append("\"");
	  sb.append(syscode.getCodeValue());
	  sb.append("\"");
	  
	  sb.append("}");
	  return sb.toString();  
  }
  
  public static String cargoVO2json(CargoVO cargoVO) {
	  StringBuilder sb = new StringBuilder();  
	  sb.append("{");
	  
	  sb.append("id:");
	  sb.append("\"");
	  sb.append(cargoVO.getId());
	  sb.append("\",");
	  
	  sb.append("name:");
	  sb.append("\"");
	  sb.append(cargoVO.getName());
	  sb.append("\",");
	  
	  sb.append("category:");
	  sb.append("\"");
	  sb.append(cargoVO.getCategory());
	  sb.append("\",");
	  
	  sb.append("size:");
	  sb.append("\"");
	  sb.append(cargoVO.getSize());
	  sb.append("\",");
	  
	  sb.append("unit:");
	  sb.append("\"");
	  sb.append(cargoVO.getUnit());
	  sb.append("\",");
	  
	  sb.append("weight:");
	  sb.append("\"");
	  sb.append(cargoVO.getWeight());
	  sb.append("\",");
	  
	  sb.append("quantity:");
	  sb.append("\"");
	  sb.append(cargoVO.getQuantity());
	  sb.append("\",");
	  
	  sb.append("number:");
	  sb.append("\"");
	  sb.append(cargoVO.getNumber());
	  sb.append("\",");
	  
	  sb.append("totalWeight:");
	  sb.append("\"");
	  sb.append(cargoVO.getTotalWeight());
	  sb.append("\",");
	  
	  sb.append("grossWeight:");
	  sb.append("\"");
	  sb.append(cargoVO.getGrossWeight());
	  sb.append("\",");
	  
	  sb.append("locationName:");
	  sb.append("\"");
	  sb.append(cargoVO.getLocationName());
	  sb.append("\",");
	  
	  sb.append("locationId:");
	  sb.append("\"");
	  sb.append(cargoVO.getLocationId());
	  sb.append("\"");
	  
	  sb.append("}");
	  return sb.toString();  
  }
} 

