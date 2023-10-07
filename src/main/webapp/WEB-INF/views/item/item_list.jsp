<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
 	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=63c0f4f3e00e8d6c49088160aa0fdd64&libraries=services,clusterer,drawing"></script>
    
    <jsp:include page="../head.jsp"></jsp:include>
   
    <style>
    	/* 스타일을 추가하여 검색창과 리스트를 원하는 위치에 배치합니다. */
	    #search-list-container {
	        position: absolute;
	        right: 1px; /* 오른쪽에 위치하도록 조정 */
	        z-index: 1;
	        display: flex; /* 컨테이너 내부의 요소를 가로로 배치하기 위해 flex 사용 */
	        flex-direction: column; /* 컨테이너 내부의 요소를 세로로 배치하기 위해 flex-direction 사용 */
	        max-height: 84%;
	        width: 30%;
	    }
    
	    /* 스타일을 추가하여 검색창을 원하는 위치에 배치합니다. */
	    #search-container {
	        background-color: white;
	        padding: 10px;
	        border-radius: 5px;
	        box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.5);
	        margin-bottom: 10px; /* 검색 폼과 리스트 사이의 간격을 설정 */
	    }
	
	    /* 리스트 창 스타일 설정 */
	    #list-container {
	        background-color: white;
	        padding: 10px;
	        border-radius: 5px;
	        box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.5);
	        overflow-y: scroll;
	    }
	
	    /* 지도 스타일 설정 */
	    #map {
	        position: absolute;
	        left: 5px;
	        width: calc(100% - 30%); /* 검색창과 리스트 창의 너비를 제외한 나머지 공간을 지도가 차지하도록 조정 */
	        height: 84%;
	        z-index: 0; /* 지도를 가장 뒤로 배치 */
	    }
	    
	    /* 스타일을 추가하여 선택한 매물을 노란색으로 표시합니다. */
	    .property-item.selected {
	        background-color: yellow;
	    }
	</style>
</head>
	
	<body>
	    <jsp:include page="../nav.jsp"></jsp:include>
	    
	    <div id="map"></div>
	    <script>
	        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	        mapOption = { 
	            center: new kakao.maps.LatLng(36.35107, 127.4544), // 지도의 중심좌표
	            level: 3 // 지도의 확대 레벨
	        };
	        // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	        var map = new kakao.maps.Map(mapContainer, mapOption); 
	    </script>
	    
	    <div class="container" id="search-list-container" >
		    <form role="search" class="email-search" method="post" id="search-container">
		        <div>
		            <!-- 방종류 -->
		            <select id="itemType" name="itemType">
		                <option value="">원룸,투룸,쓰리룸,오피스텔</option>
		                <option value="O">원룸</option>
		                <option value="T">투룸</option>
		                <option value="H">쓰리룸</option>
		                <option value="F">오피스텔</option>
		            </select>
		        </div>
		        <div>
		            <!-- 월-전세 -->
		            <select id="leaseOrMonth" name="leaseOrMonth">
		                <option value="">월세,전세</option>
		                <option value="month">월세</option>
		                <option value="lease">전세</option>
		            </select>
		        </div>
		        <div class="input-group">
		            <div class="input-group-prepend">
		                <span class="feather-icon"><i data-feather="search"></i></span>
		            </div>
		            <input type="text" class="form-control" name="search" id="search" placeholder="도로명 또는 건물명을 입력하세요.">
		        </div>
		    </form>
		
		    <div class="emailapp-emails-list" id="list-container">
		        <div class="nicescroll-bar">
		            <c:forEach var="item" items="${list}">
		                <a href="/itemDetail/${item.itemNo}" target="_blank" data-note-no="${item.itemNo}" onclick="handleClick('${item.itemNo}')" class="property-item" id="property-${item.itemNo}">
		                    <div class="media-img-wrap">
		                        <div class="avatar">
		                            <img src="/resources/dist/img/avatar1.jpg" alt="user" class="avatar-img rounded-circle">
		                        </div>
		                    </div>
		                    <div class="media-body">
		                        <div>
		                            <div data-note-no="${item.itemNo}"></div>
		                            <div class="email-head font-weight-700 font-lg-15">${item.address}</div>
		                            <div class="email-head font-weight-700 font-lg-15">${item.address2}</div>
		                            <c:if test="${item.leaseOrMonth == 'lease' }">
		                                <div class="email-subject">전세 ${item.leasePrice }</div>
		                            </c:if>
		                            <c:if test="${item.leaseOrMonth == 'month' }">
		                                <div class="email-subject">월세 ${item.depositFee} / ${item.monthPrice}</div>
		                            </c:if>
		                            <c:if test="${item.itemType == 'O' }">
		                                <div class="email-subject">원룸</div>
		                            </c:if>
		                            <c:if test="${item.itemType == 'T' }">
		                                <div class="email-subject">투룸</div>
		                            </c:if>
		                            <c:if test="${item.itemType == 'H' }">
		                                <div class="email-subject">쓰리룸</div>
		                            </c:if>
		                            <c:if test="${item.itemType == 'F' }">
		                                <div class="email-subject">오피스텔</div>
		                            </c:if>
		                            <div class="email-subject">${item.memoShort} </div>
		                            <div class="email-text">
		                                <p>${item.memoDetail}</p>
		                            </div>
		                        </div>
		                    </div>
		                </a>
		                <div class="email-hr-wrap">
		                    <hr>
		                </div>
		            </c:forEach>
		        </div>
		    </div>
		</div>

		<script>
		 	// 페이지 로드 시 저장된 검색 조건을 불러와서 설정
		    window.addEventListener('load', function () {
		        var selectedItemType = localStorage.getItem('selectedItemType');
		        var selectedLeaseOrMonth = localStorage.getItem('selectedLeaseOrMonth');
		        var searchKeyword = localStorage.getItem('searchKeyword');
	
		        // 검색 조건 셀렉트 박스와 검색어 필드에 이전 값 설정
		        if (selectedItemType) {
		            document.getElementById('itemType').value = selectedItemType;
		        }
		        if (selectedLeaseOrMonth) {
		            document.getElementById('leaseOrMonth').value = selectedLeaseOrMonth;
		        }
		        if (searchKeyword) {
		            document.getElementById('search').value = searchKeyword;
		        }
		    });
	
		    // 폼 제출 시 선택한 옵션과 검색어를 저장
		    document.getElementById('search-container').addEventListener('submit', function (e) {
		        var selectedItemType = document.getElementById('itemType').value;
		        var selectedLeaseOrMonth = document.getElementById('leaseOrMonth').value;
		        var searchKeyword = document.getElementById('search').value;
	
		        // localStorage에 저장
		        localStorage.setItem('selectedItemType', selectedItemType);
		        localStorage.setItem('selectedLeaseOrMonth', selectedLeaseOrMonth);
		        localStorage.setItem('searchKeyword', searchKeyword);
		    });
		    
		 	// 페이지를 나갈 때 저장된 검색어 초기화
		    window.addEventListener('beforeunload', function () {
		        localStorage.removeItem('selectedItemType');
		        localStorage.removeItem('selectedLeaseOrMonth');
		        localStorage.removeItem('searchKeyword');
		    });
	    </script>
	    
	    <!-- 매물 봤다면 봤다는 표시 -->
	    <script>
		 	// 클릭한 매물을 저장할 변수
		    var selectedProperty = null;
	
		    // 매물을 클릭했을 때 호출되는 함수
		    function handleClick(propertyId) {
		        // 선택한 매물의 ID를 저장
		        selectedProperty = propertyId;
	
		        // 모든 매물 요소에 클래스를 제거
		        var propertyElements = document.querySelectorAll('.property-item');
		        propertyElements.forEach(function (element) {
		            element.classList.remove('selected');
		        });
	
		        // 선택한 매물에 클래스를 추가하여 노란색 스타일 적용
		        var selectedElement = document.getElementById('property-' + propertyId);
		        if (selectedElement) {
		            selectedElement.classList.add('selected');
		        }
		    }
		</script>
	    
	    <!-- 카테고리에 따른 마커 생성 -->
		<c:forEach var="item" items="${list}">
		
		    <script>
		        var positions = [
		            {
		                title: "${item.itemNo}",
		                latlng: new kakao.maps.LatLng(${item.lat}, ${item.lng})
		            }
		        ]
		
		        // 마커 이미지의 이미지 주소입니다
		        var imageSrc = "../resources/comm/marker.png";
		
		        for (var i = 0; i < positions.length; i++) {
		
		            // 마커 이미지의 이미지 크기 입니다
		            var imageSize = new kakao.maps.Size(28, 35);
		
		            // 마커 이미지를 생성합니다    
		            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
		
		            // 마커를 생성합니다
		            var marker = new kakao.maps.Marker({
		                map: map, // 마커를 표시할 지도
		                position: positions[i].latlng, // 마커를 표시할 위치
		                title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		                image : markerImage // 마커 이미지 
		            });
		            
		            // 마커에 클릭 이벤트를 등록합니다
		            kakao.maps.event.addListener(marker, 'click', function() {
		                // 클릭한 마커의 위치로 지도 중심 이동
		                map.setCenter(marker.getPosition());
		                
		             	// 클릭한 마커의 번호에 해당하는 페이지로 새 창으로 이동
		                var itemNo = this.getTitle(); // 클릭한 마커의 title 속성에 itemNo가 저장되어 있음
		                var url = "/itemDetail/" + itemNo; // 이동할 페이지의 URL을 생성
		                window.open(url, "_blank"); // 페이지를 새 창으로 열기
		            });
		        }
		        
		        // 검색 결과가 있을 때, 첫 번째 마커를 기준으로 지도 중심을 설정합니다
		        if (positions.length > 0) {
		            map.setCenter(positions[0].latlng);
		        }
		    </script>
		</c:forEach>

    </body>
</html>