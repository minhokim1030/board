package com.ex.persistence;

import java.util.List;

import com.ex.domain.BoardVO;

public interface BoardDAO {
	
	public List<BoardVO> list(); // ������ ����� �߰��Ϸ��� Cri�� list() �ȿ� �߰�
	
	public void writer(BoardVO vo);
	
	
}
