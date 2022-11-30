package egovframework.example.sample.service;

import java.util.List;
import java.util.Map;



public interface BoardService {
	
	/*	리스트 목록		*/
	public List<BoardVO> SelectBoardList(Map<String, Object> commandMap) throws Exception;
	
	// 게시물 총 갯수
	public int countBoard();
	
	/*	리스트 등록		*/
	public String insertBoard(BoardVO vo) throws Exception;
	
	/*	상세 페이지		*/
	public BoardVO detailBoard(BoardVO vo) throws Exception;
	
	/*	게시물 삭제		*/
	public int deleteBoard(int bno) throws Exception;
	
	/*	게시물 수정 페이지	*/
	public BoardVO boardUpdate(BoardVO vo) throws Exception;
	
	/*	게시물 수정하기	*/
	public int updateList(BoardVO vo) throws Exception;


}