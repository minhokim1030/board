package com.ex.persistence;

import java.util.List;

import com.ex.domain.BoardVO;

public interface BoardDAO {
	
	public List<BoardVO> list(); // 페이지 기능을 추가하려먼 Cri를 list() 안에 추가
	
	public void writer(BoardVO vo);
	
	
}
