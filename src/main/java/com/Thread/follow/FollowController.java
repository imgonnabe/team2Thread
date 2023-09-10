package com.Thread.follow;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.Thread.index.ThreadDTO;

@Controller
public class FollowController {
	@Autowired
	private FollowService followService;
	 //다른 사람 정보 보기
		//2023-08-20
		 @GetMapping("/info@{id}")
		 public String info(@PathVariable("id") String id, HttpServletRequest request) {
			 HttpSession session = request.getSession();
			 //System.out.println(id);
			 Map<String, Object> map = followService.info(id);
			 map.put("id", id);
			 //System.out.println(map);
			 map.put("mid", session.getAttribute("mid"));
			 int result = followService.following(map);
			 request.setAttribute("result", result);
			 request.setAttribute("info", map);
			 List<ThreadDTO> list = followService.infoBoardList(id);
			 request.setAttribute("mylist", list);
			// System.out.println(session.getAttribute("mid"));
			 String id2 = String.valueOf(session.getAttribute("mid")); 
			// System.out.println("그냥 아이디의 값은 : "+id);
			// System.out.println("mid의 값은 : " + mid);
			 System.out.println("result의 값은 : " + result);
			 System.out.println("mid의 값은 :" + session.getAttribute("mid"));
			 System.out.println("id의 값은 :" + map.get("id"));
			 if(id2.equals(id)) {
				 //System.out.println("값이 일치합니다");
				 return "redirect:/myinfo";
			 }else {
				 //System.out.println("값이 왜 안같지;;");
			 return "info";
			 }
		 }
}
