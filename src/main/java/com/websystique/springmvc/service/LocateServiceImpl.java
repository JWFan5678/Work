package com.websystique.springmvc.service;

import com.websystique.springmvc.dao.EmployeeDao;
import com.websystique.springmvc.dao.LocateDao;
import com.websystique.springmvc.model.Employee;
import com.websystique.springmvc.model.Locate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("locateService")
@Transactional
public class LocateServiceImpl implements LocateService {

	@Autowired
	private LocateDao dao;
	
	public Locate findById(int id) {
		return dao.findById(id);
	}

	public void saveLocate(Locate locate) {
		dao.saveLocate(locate);
	}

	public void updateLocate(Locate locate) {
		Locate entity = dao.findById(locate.getId());
		if(entity!=null){
			entity.setName(locate.getName());
			entity.setLastDate(locate.getNurse());
			entity.setNurse(locate.getNurse());
		}
	}

	public List<Locate> findAllLocate() {
		return dao.findAllLocate();
	}

	
}
