package www.everytime.com.board.promotionboard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import www.everytime.com.board.freeboard.service.PagingBean;
import www.everytime.com.board.promotionboard.model.PromotionBoard;
import www.everytime.com.board.promotionboard.model.PromotionBoardReadCount;
import www.everytime.com.board.promotionboard.model.PromotionBoardRec;
import www.everytime.com.board.promotionboard.service.PromotionBoardService;
import www.everytime.com.member.model.Member;
import www.everytime.com.member.service.MemberService;
import www.everytime.com.reply.promotionreply.model.PromotionReply;

@Controller
@RequestMapping("/board/promotionboard/*")
public class PromotionBoardController {
	@Autowired
	private PromotionBoardService pbs;
	@Autowired
	private MemberService ms;
	
	@RequestMapping("/promotionBoardList")
	public String init() {		
		return "redirect:/board/promotionboard/promotionBoardList/pageNum/1";				
	}
	
	// 게시글 목록
	@RequestMapping("/promotionBoardList/pageNum/{pageNum}")
	public String promotionBoardList(@PathVariable String pageNum, PromotionBoard promotionboard, Model model,HttpSession session) {
		String id = (String)session.getAttribute("id");
		Member member =ms.select(id);
		
		int rowPerPage = 20;
		// 페이지가 지정되지 않으면 1페이지를 보여줌
		if(pageNum ==null || pageNum.equals("")) {
			pageNum ="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int total = pbs.getTotal(promotionboard);
		int startRow = (currentPage - 1) * rowPerPage;  
		int endRow = rowPerPage ;      
		promotionboard.setStartRow(startRow);
		promotionboard.setEndRow(endRow);
		List<PromotionBoard> promotionBoardList = pbs.promotionBoardList(promotionboard);
		PagingBean pb = new PagingBean(currentPage,rowPerPage,total);
		String[] tit = {"전체", "작성자", "제목", "내용"};
		model.addAttribute("tit",tit);
		
		model.addAttribute("member", member);
		model.addAttribute("promotionBoardList", promotionBoardList);
		model.addAttribute("promotionboard", promotionboard);
		model.addAttribute("pb", pb);
		return "/board/promotionboard/promotionBoardList";
	}
	
	// 게시글 입력
	@RequestMapping("/pbinsert")
	public String pbinsert(PromotionBoard promotionboard, String pageNum, HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");		
		Member member = ms.select(id);		
		
		model.addAttribute("member", member);
		model.addAttribute("pageNum", pageNum);
		
		pbs.pbinsert(promotionboard);
		return "redirect:/board/promotionboard/promotionBoardList/pageNum/1";
	}
	// 게시글 상세 내역
	@RequestMapping("/promotionBoardListView/pbno/{pbno}/pageNum/{pageNum}")
	public String promotionBoardListView(@PathVariable int pbno, @PathVariable String pageNum,PromotionReply promotionreply,PromotionBoardReadCount promotionboardreadcount, Model model,HttpSession session) {
		String id=(String)session.getAttribute("id");
		Member member = ms.select(id);
		promotionboardreadcount.setPrcid(id);
		promotionboardreadcount.setPrbno(pbno);
		
		if( pbs.readCountSelect(promotionboardreadcount) == null) {
			pbs.readCountInsert(promotionboardreadcount);
		}
		PromotionBoard promotionboard= pbs.select(pbno);

		model.addAttribute("member", member);
		model.addAttribute("promotionboard", promotionboard);
		model.addAttribute("pageNum", pageNum);
		return "/board/promotionboard/promotionBoardListView";
	}
	
	//게시글 수정
	@RequestMapping("/promotionBoardUpdateForm/pbno/{pbno}/pageNum/{pageNum}")
	public String promotionBoardUpdateForm(@PathVariable int pbno, @PathVariable String pageNum, Model model) {
		PromotionBoard promotionboard = pbs.select(pbno);
		model.addAttribute("promotionboard", promotionboard);
		model.addAttribute("pageNum", pageNum);
		return "/board/promotionboard/promotionBoardUpdateForm";
	}
	
	//게시글 수정 성공여부 alert
	@RequestMapping("/promotionBoardUpdate")
	public String promotionBoardUpdate(PromotionBoard promotionboard, String pageNum, Model model) {
		int result = pbs.update(promotionboard);
		model.addAttribute("result", result);
		model.addAttribute("promotionboard", promotionboard);
		model.addAttribute("pageNum", pageNum);
		return "/board/promotionboard/promotionBoardUpdate";
	}
	
	//게시글 삭제 및 성공 여부
	@RequestMapping("/promotionBoardDelete/pbno/{pbno}/pageNum/{pageNum}")
	public String promotionBoardDelete(@PathVariable int pbno, @PathVariable String pageNum, Model model) {
		int result = pbs.delete(pbno);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "/board/promotionboard/promotionBoardDelete";
	}
	
	// 게시글 추천
	@RequestMapping("/prRec/pbno/{pbno}/pageNum/{pageNum}")
	public String prRec(@PathVariable int pbno,@PathVariable String pageNum, PromotionBoardRec promotionboardrec,HttpSession session ,Model model) {
		int result=0;
		String id=(String)session.getAttribute("id");
		
		promotionboardrec.setPrecid(id);
		
		if(pbs.recSelect(promotionboardrec)== null) {
			pbs.recInsert(promotionboardrec);
			result=1;
		}else{
			pbs.recDelete(promotionboardrec);
			result=0;
		}
		
		model.addAttribute("result", result);
		model.addAttribute("pbno",pbno);
		model.addAttribute("pageNum", pageNum);
		
		return "/board/promotionboard/promotionBoardRecommend";
		
	}
}
