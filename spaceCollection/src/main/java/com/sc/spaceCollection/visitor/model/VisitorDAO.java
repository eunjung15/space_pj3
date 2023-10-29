package com.sc.spaceCollection.visitor.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface VisitorDAO {
	int intsertVisitor(VisitorVO vo);
}
