package com.Thread.myinfo;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Thread.index.ThreadDTO;
import com.Thread.login.LoginDTO;

@Service
public class MyInfoService {	

	@Autowired
private MyInfoDAO myInfoDAO;
	
	
	public LoginDTO myInfo(String id) {
		return myInfoDAO.myInfo(id);
	}


	public int changeinfo(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return  myInfoDAO.changeinfo(map);
	}


	public List<ThreadDTO> myBoardList(String id) {
		return  myInfoDAO.myBoardList(id);
	}


	public int checkPW(String memberPw) {
		return myInfoDAO.checkPW(memberPw);
	}


	public void pwUpdate(Map<String, Object> map) {
		myInfoDAO.pwUpdate(map);
	}








}
