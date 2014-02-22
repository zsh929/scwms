package com.sclk.scwms.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.sclk.scwms.dao.SyscodeDAO;
import com.sclk.scwms.model.Syscode;



public class SyscodeManager {
	private SyscodeDAO dao;

	public void setDao(SyscodeDAO dao) {
		this.dao = dao;
	}
	
	public boolean sava(Syscode d){
		System.out.println(d.getId());
		if(d.getId() == null){
			dao.save(d);
			
		}else{
			
			dao.attachDirty(d);
		}
		return false;
	}
	
	public List get(){
		return dao.findAll();
		
	}
	
	public Syscode get(Integer id){
		
		return dao.findById(Integer.valueOf(id));
		
	}
	
	public Syscode get(String key){
		Syscode syscode = new Syscode();
		List list = dao.findByCodeKey(key);
		if(list != null && list.size() >0){
			syscode = (Syscode)list.get(0);
			
		}
		
		List children = this.getChildren(syscode.getCodeKey());
		syscode.setChildren(children);
		
		return syscode;
		
	}
	
	
	public List getChildren(String parentKey){
		
		List list = dao.findByParentKey(parentKey);
		return list;
		
	}
	
	public List<Syscode> getItemForSelect(String parentKey){
		
		List<Syscode> list = dao.findByCodeKey(parentKey);
		List<Syscode> l = new ArrayList();
		if(list != null && list.size()>0){
			
			Syscode s = list.get(0);
			this.buildSyscode(s);
			s.setCodeValue("");
			buildSelectItem(s,l,"");
		}
		return l;
	}
	
	public List<Syscode> getItem(String parentKey){
		
		List<Syscode> list = dao.findByCodeKey(parentKey);
		List<Syscode> l = new ArrayList();
		if(list != null && list.size()>0){
			
			Syscode s = list.get(0);
			this.buildSyscode(s);
			s.setCodeValue("");
			buildItem(s,l);
		}
		return l;
	}
	
	public String getValue(String key,String parentKey){
		
		if(parentKey != null && parentKey.equals("category")){
			List<Syscode> categoryList = getItemForSelect("category");
			Map syscodeMap = new HashMap();
			for(Syscode syscode:categoryList){
				syscodeMap.put(syscode.getCodeKey(), syscode.getCodeValue());
			}
			return (String) syscodeMap.get(key);
			
		}
		Syscode s = new Syscode();
		
		s.setCodeKey(key);
		s.setParentKey(parentKey);
		List<Syscode> l = dao.findByExample(s);
		if(l != null && l.size() > 0){
			s = l.get(0);
		}
		
		return s.getCodeValue();
		
	}
	
	public List<Syscode> buildSelectItem(Syscode d,List<Syscode> list,String m){
		
		//d.setCodeValue(m+d.getCodeValue());
		//list.add(d);
		List<Syscode> l = d.getChildren();
		if(l != null && l.size()>0){
			for(Syscode s:l){
				s.setCodeValue(m+s.getCodeValue());
				list.add(s);
				buildSelectItem(s,list,s.getCodeValue()+" / ");
			}
			
		}
		return list;
	}
	
	public List<Syscode> buildItem(Syscode d,List<Syscode> list){
		
		//d.setCodeValue(m+d.getCodeValue());
		//list.add(d);
		List<Syscode> l = d.getChildren();
		if(l != null && l.size()>0){
			for(Syscode s:l){
				list.add(s);
				buildItem(s,list);
			}
			
		}
		return list;
	}
	
	public void buildSyscode(Syscode d){
		
		String indexId = d.getCodeKey();
		List l = dao.findByParentKey(indexId);
		if(l != null && l.size()>0){
			
			d.setChildren(l);
			Iterator it = l.iterator();
			while(it.hasNext()){
				Syscode dict = (Syscode) it.next();
				this.buildSyscode(dict);
			}
		}
		
	}
	
	public Map<String,List<String>> getCategoryCodeKey(){
		
		List l = dao.findByParentKey("category");
		Map m = new HashMap();
		if(l != null && l.size()>0){
			
			Iterator it = l.iterator();
			while(it.hasNext()){
				Syscode s = (Syscode) it.next();
				List list = getAllChildrenCodeKey(s);
				m.put(s.getCodeValue(),list);
			}
		}
		
		return m;
		
	}
	public List getAllChildrenCodeKey(Syscode d){
		
		List l = new ArrayList();
		
		l = getAllChildrenCodeKey(l,d);
		
		l.add(d.getCodeKey());
		return l;
		
	}
	
	
	
	
	
	public List getAllChildrenCodeKey(List<String> l,Syscode d){
		
		String indexId = d.getCodeKey();
		List list = dao.findByParentKey(indexId);
		if(list != null && list.size()>0){
			
			Iterator it = list.iterator();
			while(it.hasNext()){
				Syscode s = (Syscode) it.next();
				l.add(s.getCodeKey());
				this.getAllChildrenCodeKey(l,s);
			}
		}
		
		return l;
		
	}
	
	public String buildTreeview(Syscode d){
		StringBuffer sb = new StringBuffer("<ul id=\"demo1\" class=\"lightTreeview\">");
		
		sb.append(d.getTreeView());
		sb.append("</ul>");
		return sb.toString();
		
	}
}
