package com.websystique.springmvc.dao;

import java.util.List;

import com.websystique.springmvc.model.Employee;

public interface EmployeeDao {

	Employee findById(int id);

	void saveEmployee(Employee employee);
	
	void deleteEmployeeBySsn(String ssn);
	
	List<Employee> findAllEmployees();

	List<Employee> findEmployeesByLocate(String locate);

	Employee findEmployeeBySsn(String ssn);

}
