package com.sc.spaceCollection.visitor.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class VisitorServiceImpl implements VisitorService{
	private final VisitorDAO visitorDao;

	@Override
	public int intsertVisitor(VisitorVO vo) {
		return visitorDao.intsertVisitor(vo);
	}
}
