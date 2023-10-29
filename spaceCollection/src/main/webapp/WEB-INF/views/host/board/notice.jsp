<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/form/hostTop.jsp" %>

<style type="text/css">
	.reservation-header{
		margin-top :120px;
		padding: 5% 20% 4% 20%;
	}
	.search-box{
		border : 5px solid #193D76;
		border-radius : 1rem;
		padding: 4% 4% 4% 4%;
		color: transparent;
 		text-shadow: 0 0 0 black;
		
	}
	input[name=searchKeyword]{
		font-size:25px;
		width: 65%;
		height: 60px;
		margin-left: 3%;
		padding-left:1%;
		border : 3px solid lightgrey;
		border-radius: 0.5rem;
	
		
	}
	input[name=searchKeyword]::placeholder{
		color:lightgrey;
		font-weight: bold;
		font-size: 18px;
		
	}
	.searchBt{
		border: none;
		width: 10%;
		padding: 1.3% 0% 1% 0%;
		margin-bottom:1%;
		margin-left:4%;
		color: white;
		font-weight: bold;
		background: #ffd014;
		font-size: 20px;
		caret-color:none;
		color: transparent;
 		text-shadow: 0 0 0 black;
		border-radius: 1rem;
	}
	.orderSelector{
		width: 100%;
	}
	.statusSelector{
		width: 100%;
	}
	.calendarBtn{
		width: 80%;
		padding:4% 0% 4% 0%;
		border:none;
		background: #ffd014;
		color: black;
		font-size:18px;
		font-weight: bold;
		border-radius: 1rem;
	}
	.row{
		margin-top:2%;
		color: transparent;
 		text-shadow: 0 0 0 black;
	}
	select{
		height: 45px;
		border: lightgrey solid 2px;
		padding:0% 0% 0% 4%;
		border-radius: 1rem;
	}
	.reservationData{
		border: 3px solid lightgrey;
	}
	.row.dataTitle{
		/*border: 2px solid lightgrey;*/
		padding:1% 0% 1% 0%;
		margin-bottom:2%;
		font-size:16px;
		font-weight: bold;
	}
	.row.data{
		border: 2px solid lightgrey;
		padding:0% 2% 0% 2%;
		margin-top:0;
		height: 70px;
		font-size:16px;
		font-weight: bold;
	}
	.row.data .col-1{
		padding:1.8% 0% 0% 0%;
	}
	.row.data .col-2{
		padding:1.8% 0% 0% 0%;
	}
	.row.data .col-4{
		padding:1.8% 0% 0% 0%;
	}
	
	
	.checkReservation{
		border : none;
		border-radius: 0.5rem;
		background : #ffd014;
		width:100%;
		padding: 0% 0% 0% 0%;
		height: 30px;
		
	}
	.pageBox{
		width:20%;
		padding: 3% 47% 0% 47%;	
	}
	/* h2.accordion-header {
	    border-top: 0.5px solid #193D76;
	} */
	div#accordionFlushExample {
    /* margin-top: 30px; */
	}
	h2.accordion-header {
    background-color: #93c8d8;
    /* border-top: 1px solid #193D76;
    border-bottom: 1px solid #193D76; */
	}
	button.accordion-button.collapsed {
	}
	#accordionFlushExample{
	
	}
	div#accordionFlushExample {
    	align-content: center;
	}
	.divBox2 {
		border-top: 2.5px solid #656565;
	    border-bottom: 2.5px solid #656565;
	    background-color: #656565;
	    margin-bottom: 100px;
		width: 60%;
    	margin-left: 20%;
	}

	span#span1 {
    font-weight: bold;
	}
	span#span2 {
    margin-left: 60px;
	}
	.search-box {
    text-align: center;
	}
	.accordion-body {
    border: 30px solid #ffffff;
    }
    img{
    width: 100%!important;
	}
</style>

<script type="text/javascript">

function search() {
    	var searchKeyword = document.getElementById('searchKeyword').value;
        var currentUrl = window.location.href.split('?')[0];
        var params = new URLSearchParams(window.location.search);
        params.set("searchKeyword", searchKeyword);
        window.location.href = currentUrl + '?' + params.toString();
}


</script>

	
<section>

	<div class="reservation-header">
		<div class="search-box">
			<label style="font-size: 18px; font-weight: bold"> 공지 사항 검색</label>
				<input type="text" id = "searchKeyword" name = "searchKeyword" placeholder="검색어를 입력하세요." 
				<c:if  test="${!empty param.keyword}"> value="${param.keyword}"</c:if>> 
			<button class="searchBt" id="searchBt" onclick="search()">검색</button>
		</div>
	</div>
	
<div class="divBox2">
<c:forEach var="item" items="${list}" varStatus="loop">
    <div class="accordion accordion-flush" id="accordionFlushExample">
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                        data-bs-target="#flush-collapse${loop.index}" aria-expanded="false"
                        aria-controls="flush-collapse${loop.index}"
                        style="background-color: ${loop.index % 2 == 0 ? '#eef1f3' : 'white'};">
                    <span id="span1">[ 공지사항 ]</span><span id="span2">${item.BOARD_TITLE}</span>
                </button>
            </h2>
            <div id="flush-collapse${loop.index}" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                <div class="accordion-body">
                    ${item.BOARD_CONTENT}
                </div>
            </div>
        </div>
    </div>
</c:forEach>
</div>

</section> 


<%@ include file="/WEB-INF/views/form/hostBottom.jsp" %>
