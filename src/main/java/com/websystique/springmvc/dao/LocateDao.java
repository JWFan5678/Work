package com.websystique.springmvc.dao;

import com.websystique.springmvc.model.Locate;

import java.util.List;

public interface LocateDao {

	Locate findById(int id);

	void saveLocate(Locate locate);
	
	void deleteLocateById(int id);
	
	List<Locate> findAllLocate();

	Locate findLocateById(int id);

}
