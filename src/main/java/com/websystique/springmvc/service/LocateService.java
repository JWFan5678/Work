package com.websystique.springmvc.service;

import com.websystique.springmvc.model.Employee;
import com.websystique.springmvc.model.Locate;

import java.util.List;

public interface LocateService {

	Locate findById(int id);
	
	void saveLocate(Locate locate);
	
	void updateLocate(Locate locate);

	List<Locate> findAllLocate();
	

}
