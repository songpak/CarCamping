<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../top.jsp"%>
<%@ include file="left.jsp"%>

<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<c:url var="root" value="/"></c:url>
<script>
	//웹소켓 연결하고 처리하는 부분
	function connect(){
		//브라우저에서 자체 지원
		
	}
	
	var ws = new SockJS("${root}carCamping");
	 
	ws.onopen = function(){ //이벤트 리스너 >> 커넥션되면 실행
		console.log('Info: connection opened.');
		
	};
	
	ws.onmessage = function (event){
		console.log(event.data+'\n');
	};
	
	ws.onclose = function (event) {
		console.log('Info: connection closed.');
		setTimeout(function(){connect();},1000) // retry connection >> 1초에 한 번씩 다시 Connection을 맺겠다는 의미
	};
	
	ws.onerror = function (event) {console.log('Error:'); };
	
	
	$('#btnSend').on('click',function(evt){
		evt.preventDefault();
		if (socket.readyState !== 1) return;
		let msg = $('input#msg').val();
		ws.send(msg);
	})
</script>

	

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
	
	<div class="col-md-8 themed-grid-col">
		
		<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
	  알림전송
	</button>
	
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">알림전송</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      
	      <div class="modal-body">
	        <div class="mb-3">
			  <label for="modal-body textarea" class="form-label">내용</label>
			  <textarea class="form-control" id="modal-body textarea" rows="3"></textarea>
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary" id="notifySendBtn">알림전송</button>
	      </div>
	    </div>
	  </div>
	</div>
		
	
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="resources/images/flag.jpg" class="d-block w-100" alt="...">
			</div>
			<div class="carousel-item">
				<img src="${upPath}/adminMain.jsp" class="d-block w-100" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
</div>
<%@ include file="../bottom.jsp"%>