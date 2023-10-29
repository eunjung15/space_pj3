package com.sc.spaceCollection.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.sc.spaceCollection.admin.model.AdminService;
import com.sc.spaceCollection.board.model.BoardListVO;
import com.sc.spaceCollection.board.model.BoardService;
import com.sc.spaceCollection.board.model.BoardVO;
import com.sc.spaceCollection.boardType.model.BoardTypeService;
import com.sc.spaceCollection.boardType.model.BoardTypeVO;
import com.sc.spaceCollection.comments.model.CommentsService;
import com.sc.spaceCollection.comments.model.CommentsVO;
import com.sc.spaceCollection.common.ConstUtil;
import com.sc.spaceCollection.common.FileUploadUtil;
import com.sc.spaceCollection.common.PaginationInfo;
import com.sc.spaceCollection.common.SearchVO;
import com.sc.spaceCollection.spaceFile.model.SpaceFileListVO;
import com.sc.spaceCollection.spaceFile.model.SpaceFileService;
import com.sc.spaceCollection.spaceFile.model.SpaceFileVO;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	private final AdminService adminService;
	private final BoardTypeService boardTypeService;
	private final BoardService boardService;
	private final CommentsService commentsService;
	private final FileUploadUtil fileuploadUtil;
	private final SpaceFileService spaceFileService;
	
	
	@GetMapping("/adminLogin")
	public String adminLogin() {
		logger.info("관리자 로그인화면 출력");
		
		return "admin/adminLogin";
	}
	
	@PostMapping("/adminLogin")
	public String adminLogin(@RequestParam String adminId, @RequestParam String adminPwd, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(required = false)String chkSave, Model model) {
		logger.info("로그인 처리, 파라미터 adminId={}, adminPwd={}, chkSave={}", adminId, adminPwd, chkSave);
		
		String msg = "로그인 중 오류가 발생하였습니다. <br>관리자에게 문의해주시기 바랍니다.", url = "/admin/adminLogin";
		int loginResult = adminService.loginCheck(adminId, adminPwd);
		logger.info("로그인 처리결과, loginResult={}", loginResult);
		
		if(loginResult == AdminService.LOGIN_OK) {
			HttpSession session = request.getSession();
			session.setAttribute("adminId", adminId);
			
			Cookie ck = new Cookie("ck_adminId", adminId);
			ck.setPath("/");
			if(chkSave != null) {
				ck.setMaxAge(1000*60*60*24);
				response.addCookie(ck);
			}else {
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			
			return "redirect:/admin/adminMain";
		}else if(loginResult == AdminService.USERID_NONE) {
			msg = "아이디가 존재하지 않습니다.";
		}else if(loginResult == AdminService.PWD_DISAGREE) {
			msg = "아이디 또는 비밀번호가 일치하지 않습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
	
	@RequestMapping("/adminLogout")
	public String adminLogout(HttpSession session ,Model model) {
		session.removeAttribute("adminId");
		
		model.addAttribute("msg", "로그아웃되었습니다.");
		model.addAttribute("url", "/admin/adminLogin");
		
		return "admin/common/message";
	}
	
	@RequestMapping("/board/boardTypeList")
	public void boardSetting(Model model) {
		logger.info("게시판 종합 관리");
		
		List<BoardTypeVO> list = boardTypeService.selectBoardType();
		logger.info("게시물 타입 조회결과, list.size = {}", list.size());
		
		model.addAttribute("list", list);
	}
	
	@GetMapping("/board/boardTypeCreate")
	public void boardCreate() {
		logger.info("게시판 생성 화면");
	}
	
	@PostMapping("/board/boardTypeCreate")
	public String boardCreate(@ModelAttribute BoardTypeVO vo, Model model) {
		logger.info("게시판 생성, 파라미터 vo = {}", vo);
		
		if(vo.getBoardTypeCommentOk()==null) {
			vo.setBoardTypeCommentOk("N");
		}else {
			vo.setBoardTypeCommentOk("Y");
		}
		
		if(vo.getBoardTypeFileOk()==null) {
			vo.setBoardTypeFileOk("N");
		}else {
			vo.setBoardTypeFileOk("Y");
		}
		
		if(vo.getBoardTypeUse()==null) {
			vo.setBoardTypeUse("N");
		}else {
			vo.setBoardTypeUse("Y");
		}
		String msg = "게시판 생성에 실패하였습니다.", url = "/admin/board/boardTypeCreate";
		int result = boardTypeService.createBoard(vo);
		if(result>0) {
			msg = "게시판이 생성되었습니다.";
			url = "/admin/board/boardTypeList";
		}else if(result<0){
			msg = "이미 사용중인 게시판 이름입니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
	
	@GetMapping("/board/boardTypeEdit")
	public void boardEdit(@RequestParam String boardTypeId, Model model) {
		logger.info("게시판 정보 출력, 파라미터 boardTypeId = {}", boardTypeId);
		
		BoardTypeVO vo = boardTypeService.selectByBoardTypeId(boardTypeId);
		
		model.addAttribute("vo", vo);
		
	}
	
	@RequestMapping("/board/boardTypeEditn")
	public String boardEditn(Model model) {
		model.addAttribute("msg", "변경된 항목이 없습니다.");
		model.addAttribute("url", "/admin/board/boardTypeList");
		
		return "admin/common/message";
	}
	
	@PostMapping("/board/boardTypeEdit")
	public String boardEdit(@ModelAttribute BoardTypeVO vo, Model model) {
		logger.info("게시판 수정, 파라미터 vo = {}", vo);
		
		if(vo.getBoardTypeCommentOk()==null) {
			vo.setBoardTypeCommentOk("N");
		}else {
			vo.setBoardTypeCommentOk("Y");
		}
		
		if(vo.getBoardTypeFileOk()==null) {
			vo.setBoardTypeFileOk("N");
		}else {
			vo.setBoardTypeFileOk("Y");
		}
		
		if(vo.getBoardTypeUse()==null) {
			vo.setBoardTypeUse("N");
		}else {
			vo.setBoardTypeUse("Y");
		}
		String msg = "게시판 수정에 실패하였습니다.", url = "/admin/board/boardTypeEdit";
		int result = boardTypeService.updateBoardType(vo);
		if(result>0) {
			msg = "게시판이 수정되었습니다.";
			url = "/admin/board/boardTypeList";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}	
	
	@RequestMapping("/board/boardList")
	public void boardList(@ModelAttribute SearchVO searchVo, @RequestParam(required = false)String boardTypeName, Model model) {
		logger.info("게시판별 게시물 보기, 파라미터 searchVo = {}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		

		//[2]SearchVo에 입력되지 않은 두 개의 변수에 값 셋팅
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		searchVo.setBoardTypeName(boardTypeName);
		List<BoardTypeVO> boardTypeList = boardTypeService.selectBoardTypeUse();
		List<Map<String, Object>> list = boardService.selectBoardAll(searchVo);
		
		
		logger.info("게시물 조회 결과, list.size = {}", boardTypeList.size());

		int totalRecord=boardService.getTotalRecord(searchVo);
		logger.info("글 목록 전체 조회 - totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		//3
		model.addAttribute("list", list);
		model.addAttribute("searchVo", searchVo);
		model.addAttribute("boardTypeList", boardTypeList);
		model.addAttribute("pagingInfo", pagingInfo);
	}

	@RequestMapping("/board/boardWrite")
	public void boardWrite(@RequestParam String boardTypeName, Model model) {
		logger.info("게시물 작성 화면, 초기 게시판 설정 boardTypeName = {}", boardTypeName);
		
		List<BoardTypeVO> list = boardTypeService.selectBoardTypeUse();
		
		model.addAttribute("boardTypeName", boardTypeName);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("board/boardWrite_file")
	@ResponseBody
	public BoardTypeVO boardWrite_file(@RequestParam String boardTypeName) {
		logger.info("Ajax - 파일사용 유무 확인, 파라미터 boardTypeName = {}", boardTypeName);
		
		BoardTypeVO boardTypeVo = boardTypeService.selectByBoardTypeName(boardTypeName);
		logger.info("Ajax - 조회 결과, boardTypeVo = {}", boardTypeVo);
		
		return boardTypeVo;
	}
	
	//CK 이미지 첨부
	@PostMapping("/board/fileUpload")
	@ResponseBody
	public String fileUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile) throws IOException {
		//Json 객체 생성
		JsonObject json = new JsonObject();
		// Json 객체를 출력하기 위해 PrintWriter 생성
		PrintWriter printWriter = null;
		OutputStream out = null;
		//파일을 가져오기 위해 MultipartHttpServletRequest 의 getFile 메서드 사용
		MultipartFile file = multiFile.getFile("upload");
		//파일이 비어있지 않고(비어 있다면 null 반환)
		if (file != null) {
			// 파일 사이즈가 0보다 크고, 파일이름이 공백이 아닐때
			if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
				if (file.getContentType().toLowerCase().startsWith("image/")) {

					try {
						//파일 이름 설정
						String fileName = file.getName();
						//바이트 타입설정
						byte[] bytes;
						//파일을 바이트 타입으로 변경
						bytes = file.getBytes();
						//파일이 실제로 저장되는 경로 
						String uploadPath = request.getServletContext().getRealPath("/board_images/");
						//저장되는 파일에 경로 설정
						File uploadFile = new File(uploadPath);
						if (!uploadFile.exists()) {
							uploadFile.mkdirs();
						}
						//파일이름을 랜덤하게 생성
						fileName = UUID.randomUUID().toString();
						//업로드 경로 + 파일이름을 줘서  데이터를 서버에 전송
						uploadPath = uploadPath + "/" + fileName;
						out = new FileOutputStream(new File(uploadPath));
						out.write(bytes);

						//클라이언트에 이벤트 추가
						printWriter = response.getWriter();
						response.setContentType("text/html");

						//파일이 연결되는 Url 주소 설정
						String fileUrl = request.getContextPath() + "/board_images/" + fileName;

						//생성된 jason 객체를 이용해 파일 업로드 + 이름 + 주소를 CkEditor에 전송
						json.addProperty("uploaded", 1);
						json.addProperty("fileName", fileName);
						json.addProperty("url", fileUrl);
						printWriter.println(json);
					} catch (IOException e) {
						e.printStackTrace();
					} finally {
						if(out !=null) {
							out.close();
						}
						if(printWriter != null) {
							printWriter.close();
						}
					}
				}
			}
		}
		return null;
	}
	
	//첨부파일 첨부
	@RequestMapping("/board/boardWriteSub")
	public String boardWrite(@RequestParam String boardTypeName, @ModelAttribute BoardVO vo, @ModelAttribute SpaceFileVO spaceFileVo,
			HttpServletRequest request, HttpServletResponse response,  MultipartHttpServletRequest multiFile, Model model) throws IOException {
		logger.info("게시물 저장, 파라미터 vo = {}, spaceFileVo = {}", vo, spaceFileVo);

		String fileName = "", originalFileName = "";
		long fileSize = 0;
		int cnt = 0;
		try {
			List<Map<String, Object>> list = fileuploadUtil.fileupload(request, ConstUtil.UPLOAD_FILE_FLAG);
			logger.info("list.size = {}", list.size());
			cnt = boardService.insertBoard(vo);
			logger.info("cnt = {}", cnt);
			
			for(Map<String, Object>map : list) {
				if(map.get("fileName")!=null && map.get("fileName")!=""){
				fileName = (String)map.get("fileName");
				originalFileName = (String)map.get("originalFileName");
				fileSize = (long)map.get("fileSize");
				
				spaceFileVo.setImgForeignKey("b"+vo.getBoardNum());
				spaceFileVo.setImgOriginalName(originalFileName);
				spaceFileVo.setImgTempName(fileName);
				spaceFileVo.setImgSize(fileSize);
				logger.info("spaceFileVo = {}", spaceFileVo);
				
				cnt = spaceFileService.insertSpaceFile(spaceFileVo);
				}
			}
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		logger.info("게시물 저장 결과, cnt = {}", cnt);
		
		String msg = "게시물 등록에 실패하였습니다. <br> 관리자에게 문의해주시기 바랍니다.", 
				url = "/admin/board/boardWrite";
		
		if(cnt>0) {
			msg = "게시물이 등록되었습니다.";
			url = "/admin/board/boardList?boartTypeName="+boardTypeName;
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
	
	@GetMapping("/board/boardDetail")
	   public String boardDetail(@RequestParam(defaultValue = "0")int boardNum, HttpSession session, Model model) {
	      logger.info("게시물 상세보기, 파라미터 boardNum = {}", boardNum);
	      
	      if(boardNum==0) {
	         model.addAttribute("msg", "잘못된 URL 입니다.");
	         model.addAttribute("url", "/admin/board/boardList");
	         
	         return "admin/common/message";
	      }else {
	         Map<String, Object> map = boardService.selectByBoardNum(boardNum);
	         List<SpaceFileVO> spaceFileList = spaceFileService.selectSpaceFileByBoardNum("b"+boardNum);
	         logger.info("게시물 상세조회 결과, map = {}, spaceFileList.size = {}", map, spaceFileList.size());
	         if(map==null || map.isEmpty()) {
	            model.addAttribute("msg", "삭제되었거나 존재하지 않는 게시물입니다.");
	            model.addAttribute("url", "/admin/board/boardList");
	            
	            return "admin/common/message";


			}else {
				
				String userid = (String)session.getAttribute("userid");
				
				model.addAttribute("spaceFileList", spaceFileList);
				model.addAttribute("userid", userid);
				model.addAttribute("map", map);
				
				return "admin/board/boardDetail";
			}
		}
	}
	
	@RequestMapping("/board/boardDetail/ajax_commentLoad")
	@ResponseBody
	public List<Map<String, Object>> commentsLoad(@RequestParam(defaultValue = "0")int boardNum, @RequestParam(defaultValue = "0")int addNum) {
		logger.info("ajax - 댓글 조회, 파라미터 boardNum = {}, addNum = {}", boardNum, addNum);
		
		CommentsVO commentsVo = new CommentsVO();
		commentsVo.setBoardNum(boardNum);
		commentsVo.setAddNum(addNum);
		
		List<Map<String, Object>> list = commentsService.selectByBoardNum(commentsVo);
		for(Map<String, Object> map : list) {
			map.put("COMMENT_REG_DATE", (map.get("COMMENT_REG_DATE")+"").substring(0, 10));
			map.put("COMMENT_CONTENT", ((String)map.get("COMMENT_CONTENT")).replace("\n", "<br>"));
		}

		logger.info("ajax - 댓글 조회결과, list.size = {}", list.size());
		
		return list;
	}
	
	@PostMapping("/board/boardDetail/commentsWrite")
	public String commentsWrite(@ModelAttribute CommentsVO vo, Model model) {
		logger.info("댓글 등록, 파라미터 vo = {}", vo);
		
		int cnt = commentsService.insertComments(vo);
		logger.info("댓글 등록 결과, cnt = {}", cnt);
		logger.info("vo={}",vo);
		String msg = "댓글 등록에 실패하였습니다. 다시 시도해주시기 바랍니다.", url = "/admin/board/boardDetail?boardNum=" + vo.getBoardNum();
		if(cnt>0) {
			msg = "댓글이 등록되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
	
	@RequestMapping("/board/boardDelete")
	public String boardDelete(@ModelAttribute BoardListVO listVo, Model model) { 
		logger.info("게시물 삭제, 파라미터 listVo = {}", listVo);
		
		int cnt = boardService.updateBoardDelFlag(listVo);
		
		String msg = "게시물 삭제 중 문제가 발생했습니다. 관리자에게 문의해주시기 바랍니다."
				, url = "/admin/board/boardList";
		if(cnt>0) {
			msg = "게시물을 삭제하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "admin/common/message";
	}
	
	@RequestMapping("/board/download")
	public ModelAndView download(@RequestParam String boardNum, @RequestParam String fileName, HttpServletRequest request) {
		logger.info("다운로드 처리, 파라미터 boardNum={}", boardNum);
		
		//강제 다운로드 처리를 위한 뷰페이지로 보내준다
		Map<String, Object> map = new HashMap<>();
		//업로드 경로
		String upPath = fileuploadUtil.getUploadPath(request, ConstUtil.UPLOAD_FILE_FLAG);
		logger.info("업로드 경로를 확인해보자 = {}", upPath);
		File file = new File(upPath, fileName);
		map.put("file", file);
		//ModelAndView(String viewName, @Nullable Map<String, ?> model)
		ModelAndView mav = new ModelAndView("boardDownloadView", map);
		return mav;
	}
	
	@GetMapping("/board/boardEdit")
	public void boardEdit(@RequestParam(defaultValue = "0")int boardNum, Model model) {
		logger.info("게시물 수정, 파라미터 boardNum", boardNum);
		
		List<BoardTypeVO> list = boardTypeService.selectBoardTypeUse();
		logger.info("게시물타입 조회결과, list.size = {}", list.size());
		
		Map<String, Object> map = boardService.selectByBoardNum(boardNum);
		logger.info("게시물 내용 조회결과, map = {}", map);
		
		List<SpaceFileVO> spaceFileList = spaceFileService.selectSpaceFileByBoardNum("b"+boardNum);
		logger.info("첨부파일 조회결과, spaceFileList.size = {}", spaceFileList.size());
		
		model.addAttribute("list", list);
		model.addAttribute("map", map);
		model.addAttribute("spaceFileList", spaceFileList);
		
	}
	
	@PostMapping("/board/boardEdit")
	public String boardEdit(@RequestParam String boardTypeName, @ModelAttribute BoardVO boardVo, @ModelAttribute SpaceFileListVO spaceFileListVo,
				HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multiFile, Model model) {
		logger.info("게시판 수정, 파라미터 boardVo = {}, spaceFileListVo = {}", boardVo, spaceFileListVo);
		
		String transBtn = "";
		try {
			transBtn = URLEncoder.encode(boardTypeName, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int cnt = 0;
		if(spaceFileListVo.getSpaceFileItems()!=null && !spaceFileListVo.getSpaceFileItems().isEmpty()) {
			for(SpaceFileVO vo : spaceFileListVo.getSpaceFileItems()) {
				if(vo.getImgTempName()!=null && !vo.getImgTempName().isEmpty()) {
					cnt = spaceFileService.deleteSpaceFileByImgeTempName(vo.getImgTempName());
					logger.info("db 파일 삭제 결과, cnt = {}", cnt);
					
					String uploadPath = fileuploadUtil.getUploadPath(request, ConstUtil.UPLOAD_FILE_FLAG);
					File file = new File(uploadPath, vo.getImgTempName());
					if(file.exists()) {
						boolean bool = file.delete();
						
						logger.info("파일 삭제 여부, bool={}", bool);
					}
				}
			}
		}
		
		String fileName = "", originalFileName = "";
		long fileSize = 0;
		cnt = 0;
		try {
			List<Map<String, Object>> list = fileuploadUtil.fileupload(request, ConstUtil.UPLOAD_FILE_FLAG);
			logger.info("list.size = {}", list.size());
			
			SpaceFileVO spaceFileVo = new SpaceFileVO();
			for(Map<String, Object>map : list) {
				if(map.get("fileName")!=null && map.get("fileName")!=""){
				fileName = (String)map.get("fileName");
				originalFileName = (String)map.get("originalFileName");
				fileSize = (long)map.get("fileSize");
				
				spaceFileVo.setImgForeignKey("b"+boardVo.getBoardNum());
				spaceFileVo.setImgOriginalName(originalFileName);
				spaceFileVo.setImgTempName(fileName);
				spaceFileVo.setImgSize(fileSize);
				logger.info("spaceFileVo = {}", spaceFileVo);
				
				cnt = spaceFileService.insertSpaceFile(spaceFileVo);
				logger.info("파일 db저장 결과, cnt = {}", cnt);
				}
			}
			
			cnt = boardService.updateBoard(boardVo);
			logger.info("게시물 수정 결과, cnt = {}", cnt);
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		logger.info("게시물 저장 결과, cnt = {}", cnt);
		
		
		return "redirect:/admin/board/boardDetail?boardNum="+boardVo.getBoardNum()+"&boardTypeName="+transBtn;
	}
	
	@RequestMapping("/board/boardDetail/ajax_commentsDelete")
	@ResponseBody
	public int ajax_commentsDelete(@RequestParam(defaultValue = "0")int commentNum) {
		logger.info("ajax - 댓글 삭제, 파라미터 commentNum = {}", commentNum);
		
		int cnt = commentsService.updateCommentsDelFlag(commentNum);
		logger.info("ajax - 댓글 삭제 결과, cnt = {}", cnt);
		
		return cnt;
	}
	
	@RequestMapping("/board/boardDetail/ajax_commentsEdit")
	@ResponseBody
	public int ajax_commentsEdit(@ModelAttribute CommentsVO commentsVo) {
		logger.info("ajax - 댓글 수정, 파라미터 commentsVo = {}", commentsVo);
		
		int cnt = commentsService.updateComments(commentsVo);
		logger.info("ajax - 댓글 수정 결과, cnt = {}", cnt);
		
		return cnt;
	}
	
	@GetMapping("/chatting")
	public String chatting() {
		return "admin/common/chatting";
	}
	
}
