package com.repo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.model.Account;

@Repository
public class AccountRepo {
	@Autowired
	HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	// --------------------------------------------------------------------------------

	@Transactional
	public void saveDataRepo(Account student) {
		// System.out.println("repo......................");
		this.hibernateTemplate.save(student);

	}

	// get single data
	public Account getStudentData(int id) {
		Account student = this.hibernateTemplate.get(Account.class, id);
		return student;
	}

	// get All DAta
	public List<Account> getAllData() {
		List<Account> allStudents = this.hibernateTemplate.loadAll(Account.class);
		return allStudents;
	}

	// delete
	@Transactional
	public void deletedata(int id) {
		// get
		Account student = this.hibernateTemplate.get(Account.class, id);
		this.hibernateTemplate.delete(student);
	}

	// update
	@Transactional
	public List<Account> updatedata(Account s) {
		
		this.hibernateTemplate.update(s);
		List<Account> students=this.hibernateTemplate.loadAll(Account.class);
		return students;
	}

}
