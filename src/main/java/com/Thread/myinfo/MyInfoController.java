package com.Thread.myinfo;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Thread.index.ThreadDTO;
import com.Thread.login.LoginDTO;

@Controller
public class MyInfoController {

	@Autowired
	private MyInfoService myInfoService;

	@GetMapping("/myinfo")
	public ModelAndView myinfo(HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView();

		session.setAttribute("mid", session.getAttribute("mid"));

		if (session.getAttribute("mid") != null) {

			String id = (String) session.getAttribute("mid");

			LoginDTO result = myInfoService.myInfo(id);
			List<ThreadDTO> list = myInfoService.myBoardList(id);

			if (result != null) {

				mv.addObject("result", result);
				mv.addObject("mylist", list);

				mv.setViewName("myinfo");

			} else {

				mv.addObject("redirect:/login");
			}

		} else {
			mv.addObject("redirect:/login");
		}
		return mv;

	}

	@GetMapping("/profile")
	public ModelAndView profile(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("mid", session.getAttribute("mid"));
		ModelAndView mv = new ModelAndView();

		if (session.getAttribute("mid") != null) {
			// 로그인했으면?
			String id = (String) session.getAttribute("mid");

			LoginDTO dto = myInfoService.myInfo(id);

			System.out.println(dto.getM_id());

			mv.addObject("dto", dto);

			mv.setViewName("profile");

		} else {
			// 로그인 안다면?
			mv.addObject("redirect:/login");
		}

		return mv;

	}

	@GetMapping("/changeinfo")
	public String join() {
		return "changeinfo";
	}

	@PostMapping("/changeinfo")
	public String changeinfo(@RequestParam Map<String, Object> map) {
		myInfoService.changeinfo(map);

		return "redirect:/myinfo";

	}

	@GetMapping("/checkPW")
	public String findPW() {
		return "checkPW";
	}

	@PostMapping("/checkPW")
	@ResponseBody
	public String checkPW(@RequestParam("memberPw") String memberPw) {
		System.out.println(memberPw);

		int result = 0; // 초기값으로 0을 설정합니다 (비밀번호가 일치하지 않음)

		int count = myInfoService.checkPW(memberPw);

		if (count > 0) {
			result = 1; 
		}

		// JSON 형태의 응답을 생성합니다
		JSONObject json = new JSONObject();
		json.put("result", result);

		return json.toString();

	}
	
	@GetMapping("/pwUpdate")
	public String pwUpdate() {
		return "pwUpdate";
	}
	
	@PostMapping("/pwUpdate")
	public String pwUpdate(@RequestParam Map<String, Object> map, HttpSession session) {

		myInfoService.pwUpdate(map);
		session.invalidate();

		return "login";
	}
	
	
	
	
	

}
