package com.Thread.join;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.Thread.follow.FollowService;
import com.Thread.login.LoginDTO;
import com.Thread.login.LoginService;

@RestController
public class ResttController {
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private FollowService followService;
	
	@PostMapping(value = "/findID", produces = "application/json; charset=UTF-8")
	public String findID(HttpServletRequest request) {
		//System.out.println(request.getParameter("em"));
		LoginDTO dto = new LoginDTO();
		dto.setM_em(request.getParameter("em"));
		JSONObject json = new JSONObject();
		String result = "";
		String rname = "";
		dto = loginService.findID(dto);
		if(dto.getM_id() != null) {
			rname = dto.getM_name();
			result = dto.getM_id();
			json.put("mid", result);
			json.put("mname", rname);
		}
			
			//System.out.println(dto.getM_id());
			//System.out.println(result);

			 if(dto.getM_id()==null) {
				 result = "";
				 rname = "";
				 json.put("mid", result);
				 json.put("mname", rname);
			 }
			 System.out.println(dto.getM_name());
			 return json.toString();
	}
	
	
	@PostMapping("/checkLogin")
	public String checkLogin(HttpServletRequest request) {
		int result;
		JSONObject json = new JSONObject();
		System.out.println("제이슨 아이디 값" + request.getParameter("id"));
		LoginDTO dto = new LoginDTO();
		dto.setM_id(request.getParameter("id"));
		dto.setM_pw(request.getParameter("pw"));
		result = loginService.checkLogin(dto);
		System.out.println(result);
		json.put("result", result);
		System.out.println(json);
		return json.toString();
	}
	
	
	@Autowired
	private JoinService joinService;
	
	
	@PostMapping("/checkID")
	public String checkID(@RequestParam("id") String id) {
		System.out.println(id);
		int result = joinService.checkID(id);
		System.out.println(result);
		JSONObject json = new JSONObject();
		json.put("result", result);
		return json.toString();
	}
	
	@PostMapping("/checkEm")
	public String checkEm(@RequestParam("em") String em) {
		int result = joinService.checkEm(em);
		JSONObject json = new JSONObject();
		json.put("result", result);
		return json.toString();
	}
	
	@PostMapping("/checkPh")
	public String checkPh(@RequestParam("ph") String ph) {
		int result = joinService.checkPh(ph);
		JSONObject json = new JSONObject();
		json.put("result", result);
		return json.toString();
	}
	@PostMapping("/follow")
	public String follow(HttpServletRequest request) {
		JSONObject json = new JSONObject();
		String tof = request.getParameter("tof");
		String fromf = request.getParameter("fromf");
		Map<String, String> map = new HashMap<String, String>();
		map.put("tof", tof);
		map.put("fromf", fromf);
		int checkFollow = 0;
		//if안의 select문으로 팔로우가 이미 되어있는지 확인하기
		//select count(*) from Follow Where fromuser = #{fromf} and touser = #{tof}
		checkFollow = followService.checkFollow(map);
		System.out.println("팔로우 체크의 값은" + checkFollow);
		
		if(checkFollow == 0) {
		int result = followService.follow(map);
		int result2 = followService.fUpdate(tof);
		int result3 = followService.f2Update(fromf);
		//System.out.println("첫 번째 결과값 : " + result);
		//System.out.println("두 번째 결과값 : " + result2);
		//System.out.println("세 번째 결과값 : " + result3);
		json.put("result", result);
		json.put("result2", result2);
		json.put("result3", result3);
		}else {
		int result = 0;
		int result2 = 0;
		int result3 = 0;
		json.put("result", result);
		json.put("result2", result2);
		json.put("result3", result3);
		}
		return json.toString();
		
	}
	@PostMapping(value = "/followList", produces = "application/json; charset=UTF-8")
	public String followList(HttpServletRequest request) {
		JSONObject json = new JSONObject();
		String id = request.getParameter("id");
		//System.out.println("리퀘스트에서 잡아오는 id의 값은 : "+id);
		
		//★★ selectList를 썼기 때문에 값이 1이거나 0이면 잡아오지 못합니다. ★★
		//select count를 써서 먼저 확인 후 잡아올 것(2 이상인 것만 List, 0인건 그냥 0, 1인건 SelectOne으로)

		
		List<Map<String, Object>> getMid2 = followService.getMid2(id);
		//m_id2값을 가져옵니다.
		//System.out.println("리스트를 잡아오는 값은 : " + getMid2);
		json.put("follower", getMid2);
		//List<Map<String, Object>> map = followService.followList(idd);
		//System.out.println(map);
		return json.toString();
	}
	@PostMapping("/unFollow")
	public String unFollow(HttpServletRequest request) {
		JSONObject json = new JSONObject();
		String tof = request.getParameter("tof");
		String fromf = request.getParameter("fromf");
		System.out.println("tof의 값은 : " + tof);
		System.out.println("fromf의 값은 : " + fromf);
		Map<String, String> map = new HashMap<String, String>();
		map.put("tof", tof);
		map.put("fromf", fromf);
		int checkFollow = 0;
		System.out.println(map);
		checkFollow = followService.checkFollow(map);
		if(checkFollow == 1) {
			int result = followService.unFollow(map);
			int result2 = followService.unUpdate(tof);
			int result3 = followService.unUpdate2(fromf);
			System.out.println("첫 번째 결과값 : " + result);
			System.out.println("두 번째 결과값 : " + result2);
			System.out.println("세 번째 결과값 : " + result3);
			//json.put("result", result);
			json.put("result2", result2);
			json.put("result3", result3);
		}
		System.out.println(checkFollow);
		
		
		return json.toString();
	}


}
