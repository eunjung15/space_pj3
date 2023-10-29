package com.sc.spaceCollection.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sc.spaceCollection.common.ConstUtil;
import com.sc.spaceCollection.common.PaginationInfo;
import com.sc.spaceCollection.common.SearchVO;
import com.sc.spaceCollection.guest.model.GuestService;
import com.sc.spaceCollection.qna.model.QnaService;
import com.sc.spaceCollection.qna.model.QnaVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class QnaController {
	private final QnaService qnaService;
	private final GuestService guestService;
	private static final Logger logger = 
			LoggerFactory.getLogger(QnaController.class);
	
	
	
	@PostMapping("/writeQnA")
	@ResponseBody
	public int writeQna(HttpSession session,@RequestParam String qnaContent,
							@RequestParam int spaceNum ) {
		
		int cnt = 0;
		String userId = (String)session.getAttribute("userId");
		if(userId == null || userId.isEmpty()) {
			return cnt;
		}else {
			logger.info("qnaContent = {}, userId = {}, spaceNum = {}",qnaContent,userId,spaceNum);
			int userNum = guestService.selectUserInfo(userId).getUserNum();
			
			QnaVO vo = new QnaVO();
			
			qnaContent = qnaContent.replace("\n","<br>");
			
			vo.setQnaContent(qnaContent);
			vo.setUserNum(userNum);
			vo.setSpaceNum(spaceNum);
			logger.info("vo세팅 결과 vo = {}", vo);
			
			cnt = qnaService.insertQna(vo);
			logger.info("리뷰 입력 결과 결과 cnt = {}", cnt);
			
			return cnt;
		}
		
	}
	@GetMapping("/deleteQnA")
	public String deleteQna(@RequestParam int qnaNum,int spaceNum) {
		logger.info("qna삭제, 파라미터 qnaNum = {}, spaceNum = {}", qnaNum, spaceNum);
		
		int cnt = qnaService.deleteQna(qnaNum);
		logger.info("qna삭제 결과, cnt = {}", cnt);
		
		return "redirect:/detail?spaceNum="+spaceNum;
	}
	
	@RequestMapping("/myQnA")
	public String selectMyQnA(@RequestParam(name="currentPage", defaultValue = "1") int currentPage
			,@RequestParam(name="searchCondition", defaultValue = "") String searchCondition,HttpSession session,Model model) {
		//1.
		String userId=(String)session.getAttribute("userId");
		logger.info("QnA 목록 조회, 파라미터 currentPage={},userId={},searchCondition={}",currentPage,userId,searchCondition);
		//2.
		//페이징처리
		SearchVO searchVo = new SearchVO();
		searchVo.setCurrentPage(currentPage);
		searchVo.setSearchCondition(searchCondition);
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.QNA_RECORD_COUNT);
		//pagingInfo.setTotalRecord();
				
		//
		searchVo.setUserId(userId);
		searchVo.setRecordCountPerPage(ConstUtil.QNA_RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("SearchVO 세팅결과 searchVo={}",searchVo);
		List<Map<String,Object>> qnaList=qnaService.selectQnaByUserId(searchVo);
		logger.info("QnA 조회 결과 qnaList={}",qnaList.size());
		int totalRecord = qnaService.totalQnaByUserId(searchVo);
		logger.info("Qna 총 레코드 수 ={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("qnaList",qnaList);
		model.addAttribute("pagingInfo",pagingInfo);

		return "qna/myQnA";
	}
	
	@RequestMapping("/deleteMyQna")
	public String deleteMyQna(@RequestParam(name="qnaNum") List<Integer> qnaNum,Model model) {
		logger.info("나의 QnA 삭제처리 qnaNum={}",qnaNum);
		int cnt = qnaService.deleteMultiQna(qnaNum);
		logger.info("QnA Multi삭제 결과 cnt={}",cnt);
		
		String url="/qna/myQna", msg="QnA삭제의 실패하였습니다.";
		if(cnt>0) {
			msg=qnaNum.size()+"건의 QnA삭제 성공!";
		}
		
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		return "common/message";
	}
	@GetMapping("qnaAnswer")
	@ResponseBody
	public void qnaAnswer(@RequestParam int qnaNum) {
		logger.info("qna 답변, 파라미터 qnaNum = {}", qnaNum);
		
		
	}
	@ResponseBody
	@RequestMapping("/editQna")
	public boolean editQna(@RequestParam(defaultValue = "") String qnaContent, @RequestParam(defaultValue = "1") int qnaNum) {
		logger.info("Ajax-qna수정, 파라미터,qnaNum={}, qnaContent={}",qnaNum,qnaContent);
		boolean bool=false;
		QnaVO vo = new QnaVO();
		vo.setQnaNum(qnaNum);
		vo.setQnaContent(qnaContent);
		int cnt = qnaService.editQna(vo);
		if(cnt>0) {
			bool=true;
		}
		return bool;
	}
	
	@PostMapping("/qnaAnswer")
	@ResponseBody
	public int qnaAnswer(@ModelAttribute QnaVO vo) {
		logger.info("qna 답변, 파라미터 vo = {}", vo);
		
		int cnt = qnaService.qnaAnswer(vo);
		
		logger.info("qna 결과, cnt = {}", cnt);
		
		
		return cnt;
	}
}



