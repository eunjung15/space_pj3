package com.sc.spaceCollection.qna.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.sc.spaceCollection.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QnaServiceImpl implements QnaService {
	private final QnaDAO qnaDao;
	
	public int insertQna(QnaVO vo) {
		return qnaDao.insertQna(vo);
	}

	@Override
	public List<Map<String, Object>> selectQnaBySpaceNum(int spaceNum,int page) {
		
		int startRow = (page - 1) * 5 + 1; 
		int endRow = page*5;
		return qnaDao.selectQnaBySpaceNum(spaceNum,startRow, endRow);
	}

	@Override
	public int deleteQna(int qnaNum) {
		return qnaDao.deleteQna(qnaNum);
	}

	@Override
	public List<Map<String, Object>> selectQnaByUserId(SearchVO searchVo) {
		return qnaDao.selectQnaByUserId(searchVo);
	}

	@Override
	public int totalQnaByUserId(SearchVO searchVo) {
		return qnaDao.totalQnaByUserId(searchVo);
	}

	@Override
	@Transactional
	public int deleteMultiQna(List<Integer> qnaNum) {
		int cnt=0;
		
		try {
			for(int i=0; i<qnaNum.size(); i++) {
					cnt=qnaDao.deleteQna(qnaNum.get(i));
			}
			
		}catch (RuntimeException e) {
			//선언적 트랜잭션에서는 런타임 예외가 발생하면 롤백한다.
			e.printStackTrace();
			cnt=-1;
			//현재 트랜잭션 상태에서 롤백해라
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}
	
	public int getTotalRecordBySpaceNum(int spaceNum) {
		return qnaDao.getTotalRecordBySpaceNum(spaceNum);
	}

	@Override
	public int editQna(QnaVO qnaVo) {
		return qnaDao.editQna(qnaVo);
	}
	
	@Override
	public int qnaAnswer(QnaVO vo) {
		return qnaDao.qnaAnswer(vo);
	}

}
