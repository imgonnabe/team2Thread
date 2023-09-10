package com.Thread.follow;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Thread.index.ThreadDTO;

@Repository
public class FollowDAO {
	@Autowired
	private SqlSession sqlSession;
	
	public Map<String, Object> info(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("info", id);
	}
	
	public List<ThreadDTO> infoBoardList(String id) {
		return sqlSession.selectList("infoboardlist", id);
	}

	public int follow(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("follow", map);
	}

	public int fUpdate(String tof) {
		// TODO Auto-generated method stub
		return sqlSession.update("fUpdate", tof);
	}

	public int f2Update(String fromf) {
		// TODO Auto-generated method stub
		return sqlSession.update("f2Update", fromf);
	}

	public int checkFollow(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("checkFollow", map);
	}

	public int following(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("following", map);
	}

	public List<Map<String, Object>> followList(List<Map<String, Object>> idd) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("followList",idd);
	}



	public List<Map<String, Object>> getMid2(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("getMid2", id);
	}

	public int unFollow(Map<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.delete("unFollow", map);
	}

	public int unUpdate(String tof) {
		// TODO Auto-generated method stub
		return sqlSession.update("unUpdate", tof);
	}

	public int unUpdate2(String fromf) {
		// TODO Auto-generated method stub
		return sqlSession.update("unUpdate2", fromf);
	}
}
