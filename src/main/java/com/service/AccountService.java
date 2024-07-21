package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.model.Account;

import com.repo.AccountRepo;

@Service
public class AccountService {
	@Autowired
	AccountRepo accountRepo;

	@Transactional
	public void saveData(Account student) {
		// System.out.println("Service............");
		// System.out.println(student);
		this.accountRepo.saveDataRepo(student);

	}

	public Account getData(int id) {

		Account student = this.accountRepo.getStudentData(id);
		return student;
	}

	public List<Account> getAll() {
		List<Account> allData = this.accountRepo.getAllData();
		return allData;
	}

	public void deleteData(int id) {
		this.accountRepo.deletedata(id);
	}

	public List<Account> updatedata(Account s) {
		List<Account> student=this.accountRepo.updatedata(s);
		return student;
	}

}
