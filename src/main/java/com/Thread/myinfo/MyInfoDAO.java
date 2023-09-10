package com.Thread.myinfo;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Thread.index.ThreadDTO;
import com.Thread.login.LoginDTO;

@Repository
public class MyInfoDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public LoginDTO myInfo(String id) {
		return sqlSession.selectOne("myinfo", id);

	}

	public int changeinfo(Map<String, Object> map) {
		return sqlSession.update("changeinfo", map);
	}

	public List<ThreadDTO> myBoardList(String id) {
		return sqlSession.selectList("myboardlist", id);
	}

	public int checkPW(String memberPw) {
		return sqlSession.selectOne("checkpw", memberPw);
	}

	public void pwUpdate(Map<String, Object> map) {
		sqlSession.update("pwupdate", map);
	}



	
	
	
}