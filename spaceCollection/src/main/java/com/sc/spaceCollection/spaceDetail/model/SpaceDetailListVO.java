package com.sc.spaceCollection.spaceDetail.model;

import java.util.List;

import com.sc.spaceCollection.space.model.SpaceVO;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;


@Data
public class SpaceDetailListVO extends SpaceVO{
	private List<SpaceDetailVO> spaceDetailList; 
}

