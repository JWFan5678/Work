package com.websystique.springmvc.dao;

import com.websystique.springmvc.model.Employee;
import com.websystique.springmvc.model.Locate;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("LocateDao")
public class LocateDaoImpl extends AbstractDao<Integer, Locate> implements LocateDao {

	public Locate findById(int id) {
		return getByKey(id);
	}

	public void saveLocate(Locate locate) {
		persist(locate);
	}

	public void deleteLocateById(int id) {
		Query query = getSession().createSQLQuery("delete from Locate where id = :id");
		query.setInteger("id", id);
		query.executeUpdate();
	}

	public List<Locate> findAllLocate() {
		Criteria criteria = createEntityCriteria();
		return (List<Locate>) criteria.list();
	}

	public Locate findLocateById(int id) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("id", id));
		return (Locate) criteria.uniqueResult();
	}

}
