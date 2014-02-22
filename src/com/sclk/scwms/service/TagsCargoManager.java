package com.sclk.scwms.service;

import com.sclk.scwms.dao.TagsCargoDAO;
import com.sclk.scwms.dao.TagsDAO;

public class TagsCargoManager {
	private TagsCargoDAO tagsCargoDAO;
	
	private TagsDAO tagsDAO;
	
	public void setTagsCargoDAO(TagsCargoDAO tagsCargoDAO) {
		this.tagsCargoDAO = tagsCargoDAO;
	}

	public void setTagsDAO(TagsDAO tagsDAO) {
		this.tagsDAO = tagsDAO;
	}

	public String[][] getTagsByCustomerId(String customerId){
		
		return tagsCargoDAO.getTagsByCustomerId(customerId);
	}
	
	
}
