package com.Thread.follow;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Thread.index.ThreadDTO;

@Service
public class FollowService {
	@Autowired
	private FollowDAO followDAO;
	public Map<String, Object> info(String id) {
		// TODO Auto-generated method stub
		return followDAO.info(id);
	}
	
	public List<ThreadDTO> infoBoardList(String id) {
		return  followDAO.infoBoardList(id);
	}

	public int follow(Map<String, String> map) {
		return followDAO.follow(map);
		
	}

	public int fUpdate(String tof) {
		return followDAO.fUpdate(tof);
		
	}

	public int f2Update(String fromf) {
		// TODO Auto-generated method stub
		return followDAO.f2Update(fromf);
	}

	public int checkFollow(Map<String, String> map) {
		// TODO Auto-generated method stub
		return followDAO.checkFollow(map);
	}

	public int following(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return followDAO.following(map);
	}

	public List<Map<String, Object>> followList(List<Map<String, Object>> idd) {
		// TODO Auto-generated method stub
		return followDAO.followList(idd);
	}



	public List<Map<String, Object>> getMid2(String id) {
		// TODO Auto-generated method stub
		return followDAO.getMid2(id);
	}

	public int unFollow(Map<String, String> map) {
		// TODO Auto-generated method stub
		return followDAO.unFollow(map);
	}

	public int unUpdate(String tof) {
		// TODO Auto-generated method stub
		return followDAO.unUpdate(tof);
	}

	public int unUpdate2(String fromf) {
		// TODO Auto-generated method stub
		return followDAO.unUpdate2(fromf);
	}

	
}
