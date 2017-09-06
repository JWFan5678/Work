package com.websystique.springmvc.controller;

import java.text.SimpleDateFormat;
import java.util.*;

import javax.validation.Valid;

import com.websystique.springmvc.dao.LocateDao;
import com.websystique.springmvc.dao.LocateDaoImpl;
import com.websystique.springmvc.model.Locate;
import com.websystique.springmvc.service.LocateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.websystique.springmvc.model.Employee;
import com.websystique.springmvc.service.EmployeeService;

import com.websystique.springmvc.dao.LocateDao;
@Controller
@RequestMapping("/")
public class AppController {

	@Autowired
	EmployeeService service;

	@Autowired
	LocateService locateService;


	@Autowired
	MessageSource messageSource;

	private LocateDaoImpl locateDao;


	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String homePage(ModelMap model) {
		return "homePage";
	}

	/*
	 * This method will list all existing employees.
	 */
	@RequestMapping(value = {  "/list" }, method = RequestMethod.GET)
	public String listEmployees(ModelMap model) {

		List<Employee> employees = service.findAllEmployees();
		model.addAttribute("employees", employees);
		return "allemployees";
	}

	@RequestMapping(value = {  "/listLocation" }, method = RequestMethod.GET)
	public String listLocation(ModelMap model) {
		List<Locate> locations = locateService.findAllLocate();
		model.addAttribute("locations", locations);
		return "listLocation";
	}


	/*
	 * This method will provide the medium to add a new employee.
	 */
	@RequestMapping(value = { "/new" }, method = RequestMethod.GET)
	public String newEmployee(ModelMap model) {
		Employee employee = new Employee();

		model.addAttribute("edit", false);
		List<Locate> locations = locateService.findAllLocate();
		List<String> courses = new ArrayList<String>();
		for(int i=0 ; i < locations.size() ; i++){
			courses.add(locations.get(i).getName());
		}

		model.addAttribute("employee", employee);
		model.addAttribute("courses", courses);
		return "registration";
	}

	@RequestMapping(value = { "/newLocate" }, method = RequestMethod.GET)
	public String newNurse(ModelMap model) {
		Locate locate = new Locate();
		model.addAttribute("Newlocate", locate);
		return "addLocate";
	}

	@RequestMapping(value = { "/saveLocate" }, method = RequestMethod.POST)
	public String saveNurse( String locateName ,ModelMap model) {
		Locate NewLocate=new Locate();
		NewLocate.setName(locateName);
		NewLocate.setNurse("");
		NewLocate.setLastDate( new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date()));
		locateService.saveLocate(NewLocate);
		model.addAttribute("success", "Location: " + NewLocate.getName() + " Add successfully!!");
		return "success";
	}

	@RequestMapping(value = { "/view-{ssn}-location" }, method = RequestMethod.GET)
	public String viewLocation(@PathVariable int ssn, ModelMap model) {
		Locate locate = locateService.findById(ssn);
		model.addAttribute("locations", locate);

		List<Employee> employee = service.findEmployeesByLocate(locate.getName());
		model.addAttribute("employees", employee);
		return "viewLocation";
	}



	/*
	 * This method will be called on form submission, handling POST request for
	 * saving employee in database. It also validates the user input
	 */
	@RequestMapping(value = { "/new" }, method = RequestMethod.POST)
	public String saveEmployee(String[] locateGroup,String name,String ssn,
			ModelMap model) {
		Employee employee = new Employee();
		employee.setName(name);
		employee.setSsn(ssn);
		String locate="";
		for (int i= 0 ; i < locateGroup.length; i++){
			locate=locate +  locateGroup[i]+";" ;
		}
		if(locate.length()>1){
			locate=locate.substring(0,locate.length()-1);
		}
		employee.setSalary(locate);
		service.saveEmployee(employee);

		model.addAttribute("success", "Nurce:  " + employee.getName() + " Add successfully!!");
		return "success";
	}


	/*
	 * This method will provide the medium to update an existing employee.
	 */
	@RequestMapping(value = { "/edit-{ssn}-employee" }, method = RequestMethod.GET)
	public String editEmployee(@PathVariable String ssn, ModelMap model) {
		Employee employee = service.findEmployeeBySsn(ssn);

		model.addAttribute("edit", true);
		List<Locate> locations = locateService.findAllLocate();
		List<String> courses = new ArrayList<String>();
		for(int i=0 ; i < locations.size() ; i++){
			courses.add(locations.get(i).getName());
		}

		model.addAttribute("employee", employee);
		model.addAttribute("courses", courses);
		return "registration";
	}
	
	/*
	 * This method will be called on form submission, handling POST request for
	 * updating employee in database. It also validates the user input


	
	/*
	 * This method will delete an employee by it's SSN value.
	 */
	@RequestMapping(value = { "/delete-{ssn}-employee" }, method = RequestMethod.GET)
	public String deleteEmployee(@PathVariable String ssn) {
		service.deleteEmployeeBySsn(ssn);
		return "redirect:/list";
	}

}
