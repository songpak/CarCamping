<link rel="stylesheet" href="assets/css/map_region.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- <script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script> -->
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>

 <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link rel="stylesheet"
	href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>


<script>
	function popup() {
		var url = "regionReviewView.region";
		var name = "popup test";
		var option = "width = 700, height = 1000, top = 100, left = 200, location = no"
		window.open(url, name, option);
	}
	
	function changeHotRegion(region_num, mem_id){
		console.log(region_num);
		console.log(mem_id);
		var send_region_num = region_num;
		var send_mem_id = mem_id;
		$.ajax({
			url: "changeHotRegion.region", //컨트롤러 맵핑
            type: "GET",
            data: { //사용자가 데이터를 정의한다	
            	"regionNum" : region_num,
            	"memId" : mem_id
            },
            contentType: "application/json",
            success: function (result) {
		   			alert("성공");
		   			const ultag = document.getElementById('hotRegion_list');//ul - id : hotRegion_list 비우기
		   		 	const items = ultag.getElementsByTagName('li');   		
		   			 while (ultag.firstChild) {                   
		   				ultag.removeChild(ultag.firstChild);                
		   			}
		   		 $("#hotRegion_list").append(result);
		   		
		   		
           	},
            error: function() {
                alert("에러 발생");
            }

            });
		
		
		
	}
</script>

<div id="ccm-doc-hs" class="ccm-t7-hs">
	<div id="ccm-bd-hs">
		<div id="ccm-main-hs">
			<div class="ccm-b-hs">
				<div class="ccm-gc-hs">
					<div class="ccm-u-hs first">
						<div class="map_content-hs">
							<div id="map" class="border rounded-4 border-4"
								style="width: 100%; height: 600px;">
								<script type="text/javascript"
									src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a12f9fc709978bc3b122b007b64e2afd"></script>
								<script>
									//카카오 지도 api를 사용하여 지도를 생성
									var container = document 
											.getElementById('map'); //지조를 담을 container생성
									var options = {//지도 옵션 설정
										center : new kakao.maps.LatLng(36, 128), //지도 중심 좌표 설정
										level : 13,//지도 확대 레벨
										draggable : false, //사용자 드래그 액션 막기
										disableDoubleClick : true,//사용자 더블클릭 액션 막기
										disableDoubleClickZoom : true // 자용자 지도 더블클릭시 지도 확대 이벤트 막기
									};
									var map = new kakao.maps.Map(container,
											options); // 지도 객체 생성

									
									function Position(x, y, regionName) { //region Marker의 정보 객체 정의
										this.x = x;// x position
										this.y = y;// y position
										this.regionName= regionName; //region name

									}
									var PositionArr = [ //region Marker 배열
											new Position(37.540705, 126.956764,"서울&경기도"),//서울=1
											new Position( 37.58682247087561, 128.26747425295994    ,"강원도"),//강원도 2 
											new Position(36.628503, 127.929344,"경상북도"),//경상북도 5 
											new Position(36.557229, 126.779757,"경상남도"),//경상남도 6 
											new Position(36.248647, 128.664734,"충청북도"),//충청북도 3
											new Position(35.259787, 128.664734,"충청남도"),//충청남도 4 
											new Position(35.716705, 127.144185,"전라북도"),//전라북도 7 
											new Position(34.819400, 126.893113,"전라남도"),//전라남도 8
											new Position(33.364805, 126.542671,"제주도") //제주도=9
									];

									
									imageSize = new kakao.maps.Size(64, 69),//marker size 정의
											imageOption = {
												offset : new kakao.maps.Point(
														27, 69)//마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정
											};

									//마커를 Map위에 올리기
									for (var i = 0; i < PositionArr.length; i++) { //region Marker 배열의 크기만큼 반복
										var markerPosition = new kakao.maps.LatLng(
												PositionArr[i].x,
												PositionArr[i].y);//region Marker의 좌표
										var imageSrc = "resources/images/mapMarkerImage/"
												+ (i + 1) + ".png"//Marker의 image 설정
										var markerImage = new kakao.maps.MarkerImage(
												imageSrc, imageSize,
												imageOption);//marker Image 객체 생성
										addMarker(i);// marker를 Map에 추가하는 함수
									}
									
									function addMarker(i) {
										var marker = new kakao.maps.Marker({
											map : map,// 마커를 올릴 지도
											position : markerPosition, //마커의 위치
											image : markerImage, // 마커의 이미지
											clickable : true //마커 클릭 가능 설정
										});
										//마커 mouseOver 액션시, 나오는 content
										var content = '<div id="ifw" class="btn btn-primary" style="padding:5px;"><span>'+
										PositionArr[i].regionName+'</span></div>';
										//마커 mouseOver 액션시, 나오는 커스텀오버레이 객체 생성
										var customOverlay = new kakao.maps.CustomOverlay(
												{	map : map, //올릴 map
													clickable : true, //클릭 가능
													content : content, // 보이는 내용
													position :markerPosition, //나타나는 위치(마커 위에 나타나므로 position을 marker position과 동일하게 설정)
												    xAnchor: 0.3, // 마커를 기준으로 위치를 설정
												    yAnchor: 3
												});
										customOverlay.setMap(map); //커스텀오버레이를 map에 올림
										customOverlay.setVisible(false); // 사용자가 mouseOver시, 커스텀오버레이가 나타나므로 처음에는 false로 안보이게 함
													kakao.maps.event.addListener(marker,'click',function() {//사용자가 마커를 누르면 regionMain(우측div박스) 해당지역에 대한 안기 carCampingRegion이 나타남
														document.hotRegionLocation.region_num.value = i + 1
														document.hotRegionLocation.mem_id = '${sessionScope.id}'
														var region_num = i+1;//marker 마다 해당 region_num 설정
														var mem_id = '${sessionScope.id}';// session에 id가 있을시 저장
														changeHotRegion(region_num,mem_id);//ajax를 사용한 비동기 통신으로 해당 region에 대한 carCampingRegion을 가져옴
														});
											kakao.maps.event.addListener(marker,'mouseover', function() { // 해당 마커에 마우스를 올리면 사용자에게 보이게 하는 액션을 마커에 추가
												customOverlay.setVisible(true);
											});
											
											  kakao.maps.event.addListener(marker, 'mouseout', function() {  // 해당 마커에 마우스를 올리면 사용자에게 사라진게하는 액션을 마커에 추가
											 customOverlay.setVisible(false);
										});
									}
								</script> 
							</div>
						</div>
					</div>
					<form name="hotRegionLocation" action="regionHotLocList.region" method="post">
						<input type="hidden" name="region_num"/>
						<input type="hidden" name="mem_id"/>
					</form>
								
					<!--지역별 HOT리뷰글  -->
					<div class="ccm-u-hs border rounded-4 border-4"
						style="height: 600px;">