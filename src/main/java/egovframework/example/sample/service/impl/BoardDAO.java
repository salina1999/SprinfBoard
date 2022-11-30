package egovframework.example.sample.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.BoardVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("BoardDAO")
public class BoardDAO extends EgovAbstractDAO{
	
	public List<BoardVO> SelectBoardList(Map<String, Object> commandMap) {
		return (List<BoardVO>) list("boardDAO.SelectBoardList", commandMap);
	}
	
	// 게시물 총 갯수
	public int countBoard() {
		return (int) select("boardDAO.countBoard");
	}
	
	public String insertBoard(BoardVO vo) {
		return (String) insert("boardDAO.insertBoard", vo);
	}

	public BoardVO detailBoard(BoardVO vo) {
		return (BoardVO) select("boardDAO.detail", vo);
	}
	
	public int deleteBoard(int bno) {
		return (int) delete("boardDAO.deleteBoardList", bno);
	}
	
	public BoardVO boardUpdate(BoardVO vo) {
		return (BoardVO) select("boardDAO.detail", vo);
	}
	
	public int updateList(BoardVO vo) {
		return (int) update("boardDAO.updateBoardList", vo);
	}
	
}