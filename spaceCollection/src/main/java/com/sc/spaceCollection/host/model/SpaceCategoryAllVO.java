package com.sc.spaceCollection.host.model;

import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class SpaceCategoryAllVO {
	private SpaceCategoryVO spaceCategoryVo;
	
	//view 정보 담을 list
	//view는 따로 vo를 만들지 않아도 된다.
	//새로 만들게 되면 기존에 만든 테이블의 vo와 흡사하기 때문에 굳이 생성하지 않고, map으로 돌린다.
	//private List<SpaceTypeVO> spaceTypeList;
	private List<SpaceTypeVO> spaceTypeList;
}
