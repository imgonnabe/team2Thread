package com.Thread.comment;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {

	@Autowired
	private CommentDAO commentDAO;

	public int commentsInsert(Map<String, Object> map) {
		return commentDAO.commentsInsert(map);
	}

	
	

}
