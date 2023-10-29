package com.sc.spaceCollection.collection.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CollectionServiceImpl implements CollectionService{
	private final CollectionDAO collectionDao;

	@Override
	public List<Map<String, Object>> showCollectionList(int scCode) {
		return collectionDao.showCollectionList(scCode);
	}

	@Override
	public Map<String, String> selectCollectionName(int scNum) {
		return collectionDao.selectCollectionName(scNum);
	}

	
	
	
	

}
