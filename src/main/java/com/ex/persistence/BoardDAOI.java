package com.ex.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ex.domain.BoardVO;

@Repository
public class BoardDAOI implements BoardDAO {
	
	@Inject
	SqlSession session;
	String namespace="BoardMapper";

	@Override
	public List<BoardVO> list() {
		return session.selectList(namespace + ".list");
	}

	@Override
	public void writer(BoardVO vo) {
		session.insert(namespace+".writer",vo);
		
	}

}
