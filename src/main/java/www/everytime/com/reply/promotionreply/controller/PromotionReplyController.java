package www.everytime.com.reply.promotionreply.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import www.everytime.com.board.promotionboard.model.PromotionBoard;
import www.everytime.com.board.promotionboard.service.PromotionBoardService;
import www.everytime.com.member.model.Member;
import www.everytime.com.member.service.MemberService;
import www.everytime.com.reply.promotionreply.model.PromotionReply;
import www.everytime.com.reply.promotionreply.model.PromotionReplyRec;
import www.everytime.com.reply.promotionreply.service.PromotionReplyService;

@Controller
@RequestMapping("/reply/*")
public class PromotionReplyController {
	@Autowired
	private PromotionReplyService prs;
	@Autowired
	private PromotionBoardService pbs;
	@Autowired
	private MemberService ms;

	@RequestMapping("/promotionReplyList/pbno/{pbno}/pageNum/{pageNum}")
	public String promotionReplyList(@PathVariable int pbno,@PathVariable String pageNum, Model model, PromotionReply promotionreply,
			HttpSession session) {
		String id = (String) session.getAttribute("id");
		Member member = ms.select(id);
		// 페이지가 지정되지 않으면 1페이지를 보여줘라
		if (pageNum==null || pageNum.equals(""))
			pageNum="1";
		PromotionBoard promotionboard = pbs.select(pbno);
		promotionreply.setPrbno(pbno);
		List<PromotionReply> prList = prs.list(promotionreply);

		model.addAttribute("member", member);
		model.addAttribute("promotionboard", promotionboard);
		model.addAttribute("prList", prList);
		model.addAttribute("pageNum", pageNum);
		return "/reply/promotionReplyList";
	}

	@RequestMapping("prInsert")
	public String prInsert(PromotionReply promotionreply, String pageNum) {
		prs.insert(promotionreply);
		return "redirect:/reply/promotionReplyList/pbno/" + promotionreply.getPrbno() + "/pageNum/" + pageNum;
	}

	@RequestMapping("/promotionReplyDelete/prbno/{prbno}/prrno/{prrno}/pageNum/{pageNum}")
	public String promotionReplyDelete(@PathVariable int prrno, @PathVariable int prbno, @PathVariable String pageNum,
			Model model) {
		int result = prs.delete(prrno);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "/reply/promotionReplyDelete";
	}

	@RequestMapping("prDelete")
	public String rDelete(PromotionReply promotionreply, String pageNum) {
		prs.delete(promotionreply.getPrrno());
		return "redirect:/reply/promotionReplyList/pbno/" + promotionreply.getPrbno() + "/pageNum/" + pageNum;
	}
	
	// 추천
	@RequestMapping("/prrRec/pbno/{pbno}/pageNum/{pageNum}")
	public String prrRec(@PathVariable int pbno,@PathVariable String pageNum, PromotionReplyRec promotionreplyrec, HttpSession session,Model model) {
		int result;
		String id= (String)session.getAttribute("id");
		
		promotionreplyrec.setPrrcid(id);
		if(prs.rRecSelect(promotionreplyrec)== null) {
			prs.rRecInsert(promotionreplyrec);
			result=1;
		}else {
			prs.rRecDelete(promotionreplyrec);
			result=0;
		}
		model.addAttribute("result",result);
		model.addAttribute("pbno",pbno);
		model.addAttribute("pageNum",pageNum);
		
		 return "/reply/promotionBoardRecommend"; 
	}
}
