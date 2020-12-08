package www.everytime.com;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import www.everytime.com.member.model.Member;
import www.everytime.com.member.service.MemberService;

@Controller
public class MainController {
	@Autowired
	private MemberService ms;
	@RequestMapping("main")
	public String main(Model model, HttpSession session) {
		String id=(String)session.getAttribute("id");
		Member member = ms.select(id);
		model.addAttribute("member", member);
		return "main";
	}
	
}
