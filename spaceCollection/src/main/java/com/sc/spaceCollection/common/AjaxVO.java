package com.sc.spaceCollection.common;

import java.util.List;
import java.util.Map;
import lombok.Data;

@Data
public class AjaxVO {
	private PaginationInfo pagingInfo;
	private List<Map<String, Object>> ajaxList;
	private SearchVO searchVo;
	String order;
	String status;
}
