package egovframework.example.sample.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.service.BoardVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("BoardService")
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService{

	@Resource(name="BoardDAO")
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> SelectBoardList(Map<String, Object> commandMap) throws Exception {
		return boardDAO.SelectBoardList(commandMap);
	}
	
	@Override
	public int countBoard() {
		return boardDAO.countBoard();
	}
	
	@Override
	public String insertBoard(BoardVO vo) throws Exception {
		return boardDAO.insertBoard(vo);
	}

	@Override
	public BoardVO detailBoard(BoardVO vo) throws Exception {
		return boardDAO.detailBoard(vo);
	}

	@Override
	public int deleteBoard(int bno) throws Exception {
		return boardDAO.deleteBoard(bno);
	}

	@Override
	public BoardVO boardUpdate(BoardVO vo) throws Exception {
		return boardDAO.boardUpdate(vo);
	}
	
	@Override
	public int updateList(BoardVO vo) throws Exception {
		return boardDAO.updateList(vo);
	}
	


		
}