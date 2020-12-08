package www.everytime.com.board.freeboard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import www.everytime.com.board.freeboard.model.FreeBoard;
import www.everytime.com.board.freeboard.model.FreeBoardReadCount;
import www.everytime.com.board.freeboard.model.FreeBoardRec;
import www.everytime.com.board.freeboard.service.FreeBoardService;
import www.everytime.com.board.freeboard.service.PagingBean;
import www.everytime.com.member.model.Member;
import www.everytime.com.member.service.MemberService;
import www.everytime.com.reply.freereply.model.FreeReply;

@Controller
@RequestMapping("/board/freeboard/*")
public class FreeBoardController {
	
	@Autowired
	private FreeBoardService fbs;
	@Autowired
	private MemberService ms;
	
	
	@RequestMapping("/freeBoardList")
	public String init() {		
		return "redirect:/board/freeboard/freeBoardList/pageNum/1";				
	}
	
	// 게시글 목록
	@RequestMapping("/freeBoardList/pageNum/{pageNum}")
	public String freeBoardList(@PathVariable String pageNum, FreeBoard freeboard, Model model,HttpSession session) {
		String id = (String)session.getAttribute("id");
		Member member =ms.select(id);
		
		int rowPerPage = 20;
		// 페이지가 지정되지 않으면 1페이지를 보여줌
		if(pageNum ==null || pageNum.equals("")) {
			pageNum ="1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int total = fbs.getTotal(freeboard);
		int startRow = (currentPage - 1) * rowPerPage;  
		int endRow = rowPerPage ;      
		freeboard.setStartRow(startRow);
		freeboard.setEndRow(endRow);
		List<FreeBoard> freeBoardList = fbs.freeBoardList(freeboard);
		PagingBean pb = new PagingBean(currentPage,rowPerPage,total);
		String[] tit = {"전체", "작성자", "제목", "내용"};
		model.addAttribute("tit",tit);
		
		model.addAttribute("member", member);
		model.addAttribute("freeBoardList", freeBoardList);
		model.addAttribute("freeboard", freeboard);
		model.addAttribute("pb", pb);
		return "/board/freeboard/freeBoardList";
	}
	 
	// 게시글 입력
	@RequestMapping("/insert")
	public String insert(FreeBoard freeboard, String pageNum, HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");		
		Member member = ms.select(id);		
		model.addAttribute("member", member);
		model.addAttribute("pageNum", pageNum);
		
		fbs.insert(freeboard);
		return "redirect:/board/freeboard/freeBoardList/pageNum/1";
	}
	// 게시글 상세 내역
	@RequestMapping("/freeBoardListView/fbno/{fbno}/pageNum/{pageNum}")
	public String freeBoardListView(@PathVariable int fbno, @PathVariable String pageNum,FreeReply freereply,FreeBoardReadCount freeboardreadcount, Model model,HttpSession session) {
		String id=(String)session.getAttribute("id");
		Member member = ms.select(id);
		freeboardreadcount.setFrcid(id);
		freeboardreadcount.setFrbno(fbno);
		if(fbs.readCountSelect(freeboardreadcount) == null) {
			fbs.readCountInsert(freeboardreadcount);
		}
		FreeBoard freeboard = fbs.select(fbno);

		model.addAttribute("member", member);
		model.addAttribute("freeboard", freeboard);
		model.addAttribute("pageNum", pageNum);
		return "/board/freeboard/freeBoardListView";
	}
	
	//게시글 수정
	@RequestMapping("/freeBoardUpdateForm/fbno/{fbno}/pageNum/{pageNum}")
	public String freeBoardUpdateForm(@PathVariable int fbno, @PathVariable String pageNum, Model model) {
		FreeBoard freeboard = fbs.select(fbno);
		model.addAttribute("freeboard", freeboard);
		model.addAttribute("pageNum", pageNum);
		return "/board/freeboard/freeBoardUpdateForm";
	}
	
	//게시글 수정 성공여부 alert
	@RequestMapping("/freeBoardUpdate")
	public String freeBoardUpdate(FreeBoard freeboard, String pageNum, Model model) {
		int result = fbs.update(freeboard);
		model.addAttribute("result", result);
		model.addAttribute("freeboard", freeboard);
		model.addAttribute("pageNum", pageNum);
		return "/board/freeboard/freeBoardUpdate";
	}
	
	//게시글 삭제 및 성공 여부
	@RequestMapping("/freeBoardDelete/fbno/{fbno}/pageNum/{pageNum}")
	public String freeBoardDelete(@PathVariable int fbno, @PathVariable String pageNum, Model model) {
		int result = fbs.delete(fbno);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "/board/freeboard/freeBoardDelete";
	}
	
	// 게시글 추천
	@RequestMapping("/frRec/fbno/{fbno}/pageNum/{pageNum}")
	public String frRec(@PathVariable int fbno,@PathVariable String pageNum, FreeBoardRec freeboardrec,HttpSession session ,Model model) {
		int result=0;
		String id=(String)session.getAttribute("id");
		
		freeboardrec.setFrecid(id);
		
		if(fbs.recSelect(freeboardrec)== null) {
			fbs.recInsert(freeboardrec);
			result=1;
		}else{
			fbs.recDelete(freeboardrec);
			result=0;
		}
		
		model.addAttribute("result", result);
		model.addAttribute("fbno",fbno);
		model.addAttribute("pageNum", pageNum);
		
		return "/board/freeboard/freeBoardRecommend";
		
	}
	
}
