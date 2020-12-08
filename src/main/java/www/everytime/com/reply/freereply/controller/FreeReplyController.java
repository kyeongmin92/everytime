package www.everytime.com.reply.freereply.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import www.everytime.com.board.freeboard.model.FreeBoard;
import www.everytime.com.board.freeboard.service.FreeBoardService;
import www.everytime.com.member.model.Member;
import www.everytime.com.member.service.MemberService;
import www.everytime.com.reply.freereply.model.FreeReply;
import www.everytime.com.reply.freereply.model.FreeReplyRec;
import www.everytime.com.reply.freereply.service.FreeReplyService;

@Controller
@RequestMapping("/reply/*")
public class FreeReplyController {
	@Autowired
	private FreeReplyService frs;
	@Autowired
	private FreeBoardService fbs;
	@Autowired
	private MemberService ms;

	@RequestMapping("/freeReplyList/fbno/{fbno}/pageNum/{pageNum}")
	public String freeReplyList(@PathVariable int fbno,@PathVariable String pageNum, Model model, FreeReply freereply,
			HttpSession session) {
		String id = (String) session.getAttribute("id");
		Member member = ms.select(id);
		// 페이지가 지정되지 않으면 1페이지를 보여줘라
		if (pageNum==null || pageNum.equals(""))
			pageNum="1";
		FreeBoard freeboard = fbs.select(fbno);
		freereply.setFrbno(fbno);
		List<FreeReply> frList = frs.list(freereply);
		

		model.addAttribute("member", member);
		model.addAttribute("freeboard", freeboard);
		model.addAttribute("frList", frList);
		model.addAttribute("pageNum", pageNum);
		return "/reply/freeReplyList";
	}

	@RequestMapping("frInsert")
	public String rInsert(FreeReply freereply, String pageNum) {
		frs.insert(freereply);
		return "redirect:/reply/freeReplyList/fbno/" + freereply.getFrbno() + "/pageNum/" + pageNum;
	}

	@RequestMapping("/freeReplyDelete/frbno/{frbno}/frrno/{frrno}/pageNum/{pageNum}")
	public String freeReplyDelete(@PathVariable int frrno, @PathVariable int frbno, @PathVariable String pageNum,
			Model model) {
		int result = frs.delete(frrno);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "/reply/freeReplyDelete";
	}

	@RequestMapping("frDelete")
	public String rDelete(FreeReply freereply, String pageNum) {
		frs.delete(freereply.getFrrno());
		return "redirect:/reply/freeReplyList/fbno/" + freereply.getFrbno() + "/pageNum/" + pageNum;
	}
	@RequestMapping("/frrRec/fbno/{fbno}/pageNum/{pageNum}")
	public String frrRec(@PathVariable int fbno,@PathVariable String pageNum,FreeReplyRec freereplyrec, HttpSession session,Model model) {
		int result=0;
		String id= (String)session.getAttribute("id");
		
		freereplyrec.setFrrcid(id);
		if(frs.rRecSelect(freereplyrec)== null) {
			frs.rRecInsert(freereplyrec);
			result=1;
		}else {
			frs.rRecDelete(freereplyrec);
			result=0;
		}
		model.addAttribute("result",result);
		model.addAttribute("fbno",fbno);
		model.addAttribute("pageNum",pageNum);
		
		 return "/reply/freeBoardRecommend"; 
	}

}
