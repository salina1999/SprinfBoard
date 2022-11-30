package egovframework.example.sample.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.service.BoardVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;


@Controller
public class BoardController {
	private static Logger Logger = LoggerFactory.getLogger(BoardController.class);
	
	
	@Resource(name="BoardService")
	private BoardService boardService;
	
	/* 게시물 목록 페이지 */
	@GetMapping(value="/boardList.do")
	public String selectDeptList(BoardVO vo, Model model, @RequestParam Map<String,Object> commandMap, HttpServletRequest request) throws Exception {
		Logger.debug("deptList......loading...........");
		
		PaginationInfo paginationInfo = new PaginationInfo();
		int pageNo = 1; //현재 페이지 번호
        int listScale = 5; // 한 페이지에 나올 글 수
        int pageScale = 5; // 페이지 개수
		
        try {
            if(commandMap.size() > 0) {
                pageNo = Integer.parseInt((String)commandMap.get("pageNo"));//현재 페이지 번호
            }
        
			paginationInfo.setCurrentPageNo(pageNo); // 현재 페이지 번호
			paginationInfo.setRecordCountPerPage(listScale); //한 페이지에 게시되는 게시물 건수
			paginationInfo.setPageSize(pageScale); //페이징 리스트의 사이즈
			
			int startPage = paginationInfo.getFirstRecordIndex(); //시작 페이지
            int lastPage = paginationInfo.getRecordCountPerPage(); //마지막 페이지
            commandMap.put("startPage", startPage);
            commandMap.put("lastPage", lastPage);
            
            int totalList = boardService.countBoard(); //전체 글 개수
            paginationInfo.setTotalRecordCount(totalList);
			
			List<BoardVO> list = boardService.SelectBoardList(commandMap);
	//		System.out.println(list);
	
			model.addAttribute("list",list);
			model.addAttribute("pageNo",pageNo);
            model.addAttribute("totalList",totalList);
            model.addAttribute("paginationInfo",paginationInfo);
        } catch (Exception e) {
        	Logger.debug(e.getMessage());
        }
		return "board/boardList";
	}
	
	/* 게시물 등록 페이지로 이동 */
	@GetMapping(value = "/boardRegister.do")
	public String Write() throws Exception {

		return "board/boardRegistration";
	}	
	
	/* 게시물 등록 */
	@PostMapping(value = "/insertBoard.do")
	@ResponseBody
	public String insertBoard(@ModelAttribute("BoardVO") BoardVO vo) throws Exception {
		
		boardService.insertBoard(vo);
		
		//System.out.println("등록 컨트롤러" + vo);   
		return "board/boardList";
	}
	
	/* 상세페이지로 이동 */
	@GetMapping(value = "/Detail.do")
	public String boardDetail(@RequestParam("bno") int bno, Model model) throws Exception {
		
		BoardVO boardVO = new BoardVO();
		boardVO.setBno(bno);

		boardVO = boardService.detailBoard(boardVO);
		
		
		model.addAttribute("DList", boardVO);
		return "board/boardDetail";
	}
	
	/*	게시글 삭제 	*/
	@PostMapping(value = "/Delete.do")
	@ResponseBody
	public String deleteBoard(@RequestParam("bno") int bno) throws Exception {
		boardService.deleteBoard(bno);
		return "board/boardList";
	}
		
	
	
	
	 /*	수정 페이지로 이동	*/
	@GetMapping(value = "/boardUpdate.do")
	public String boardUpdate(@RequestParam("bno") int bno, Model model) throws Exception {
		
		BoardVO boardVO = new BoardVO();
		boardVO.setBno(bno);

		boardVO = boardService.detailBoard(boardVO);
		
		
		model.addAttribute("list", boardVO);
		
		return "board/boardUpdate";
	}
	
	/*	수정하기	*/
	@RequestMapping(value = "/listUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public String updateList(@ModelAttribute("BoardVO") BoardVO vo, HttpServletRequest request) throws Exception {
		boardService.updateList(vo);
		return "";
	}

}