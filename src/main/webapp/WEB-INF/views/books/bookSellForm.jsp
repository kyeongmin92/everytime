<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" href="../resources/css/common.css"
	rel="stylesheet">
<link type="text/css" href="../resources/css/common.partial.css"
	rel="stylesheet">
<link type="text/css" href="../resources/css/container.community.css"
	rel="stylesheet">
<link href="#" rel="shortcut icon">
<link rel="stylesheet" type="text/css"
	href="../resources/css/assets/style.css">
<script type="text/javascript" src="../js/analytics.js"></script>
<script type="text/javascript"
	src="../resources/js/extensions.jquery-1.10.2.min.js"></script>
<script type="text/javascript"
	src="../resources/js/extensions.underscore-min.js"></script>
<script type="text/javascript" src="../resources/js/common.js"></script>
<script type="text/javascript" src="../resources/js/community.side.js"></script>
<script type="text/javascript" src="../resources/js/community.index.js"></script>
<script type="text/javascript" src="../resources/js/assets/sell.js"></script>
<style>
#preview {
	display: inline-block;
	white-space: nowrap;
}

#pre0 {
	float: left;
}

#pre1 {
	float: left;
}

#pre2 {
	float: right;
}

#preview img {
	width: 100px;
	height: 100px;
}

#preview p {
	text-overflow: ellipsis;
	overflow: hidden;
}

.preview-box {
	border: 1px solid;
	padding: 5px;
	border-radius: 2px;
	margin-bottom: 10px;
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	//임의의 file object영역
	var files = {};
	var previewIndex = 0;
	// image preview 기능 구현
	// input = file object[]
	function addPreview(input) {
		if (input[0].files) {
			//파일 선택이 여러개였을 시의 대응
			for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
				var file = input[0].files[fileIndex];
				if (validation(file.name))
					continue;
				setPreviewForm(file);
			}
		} else
			alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
	}

	function guid() {
		function s4() {
			return ((1 + Math.random()) * 0x10000 | 0).toString(16)
					.substring(1);
		}
		return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4()
				+ s4() + s4() + '_';
	}

	function setPreviewForm(file, img) {
		var reader = new FileReader();
		var path = "c:\sh/";
		//div id="preview" 내에 동적코드추가.
		//이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
		reader.onload = function(img) {
			var imgNum = previewIndex++;

			$("#preview")
					.append(
							"<div class='preview-box' id='pre" + imgNum +"' value='" + imgNum +"'>"
									+ "<img class='thumbnail' src='" + img.target.result + "'/>"
									+ "<input type='text' id='uuid' name='imgfile" + ++imgNum + "' value='" + path + file.name + "' />"
									+ "<a href='#' value='" + imgNum
									+ "' onclick='deletePreview(this)'>" + "삭제"
									+ "</a>" + "</div>");
			resizeHeight();
			files[imgNum] = file;

		};

		reader.readAsDataURL(file);
	}

	//preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
	function deletePreview(obj) {
		var imgNum = obj.attributes['value'].value;
		delete files[imgNum];
		$("#preview .preview-box[value=" + imgNum + "]").remove();
		resizeHeight();
	}

	//client-side validation
	//always server-side validation required
	function validation(fileName) {
		fileName = fileName + "";
		var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
		var fileNameExtension = fileName.toLowerCase().substring(
				fileNameExtensionIndex, fileName.length);
		if (!((fileNameExtension === 'jpg') || (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
			alert('jpg, gif, png 확장자만 업로드 가능합니다.');
			return true;
		} else {
			return false;
		}
	}

	$(document).ready(function() {
		//submit 등록. 실제로 submit type은 아니다.
		$('.submit a').on('click', function() {
			var form = $('#uploadForm')[0];
			var formData = new FormData(form);

			for (var index = 0; index < Object.keys(files).length; index++) {
				//formData 공간에 files라는 이름으로 파일을 추가한다.
				//동일명으로 계속 추가할 수 있다.
				formData.append('files', files[index]);
			}

			//ajax 통신으로 multipart form을 전송한다.
			$.ajax({
				type : 'POST',
				enctype : 'multipart/form-data',
				processData : false,
				contentType : false,
				cache : false,
				timeout : 600000,
				url : '/upload',
				dataType : 'JSON',
				data : formData,
				success : function(result) {
					//이 부분을 수정해서 다양한 행동을 할 수 있으며,
					//여기서는 데이터를 전송받았다면 순수하게 OK 만을 보내기로 하였다.
					//-1 = 잘못된 확장자 업로드, -2 = 용량초과, 그외 = 성공(1)
					if (result === -1) {
						alert('jpg, gif, png, bmp 확장자만 업로드 가능합니다.');
						// 이후 동작 ...
					} else if (result === -2) {
						alert('파일이 10MB를 초과하였습니다.');
						// 이후 동작 ...
					} else {
						alert('이미지 업로드 성공');
						// 이후 동작 ...
					}
				}
			//전송실패에대한 핸들링은 고려하지 않음
			});
		});
		// <input type=file> 태그 기능 구현
		$('#attach input[type=file]').change(function() {
			addPreview($(this)); //preview form 추가하기
		});
	});
</script>
<!-- <script type="text/javascript">
const input = document.querySelector('input');
const preview = document.querySelector('.file_list');

input.addEventListener('change', showTextFile);

function showTextFile() {
    const selectedFiles = input.files;
    const list = document.createElement('ul');
    preview.appendChild(list);

    for(const file of selectedFiles) {
        const listItem = document.createElement('li');
        const summary = document.createElement('div');

        summary.textContent = file.webkitRelativePath;

        listItem.appendChild(summary);
        list.appendChild(listItem);
    }
}
</script> -->
</head>
<body class="app">

	<form id="sell">
		<c:forEach var="booklist" items="${booklist}">
			<div class="group group-book">
				<h2>책 정보</h2>
				<p>listnum : <input type="text" value="${booklist.listnum }" /></p>
				<p>
					책 제목 : <input type="text" value="${booklist.title }" readonly />
				</p>
				<p>
					저자 : <input type="text" value="${booklist.authors}" readonly />
				</p>
				<p>
					출판사 : <input type="text" value="${booklist.publisher }" readonly />
				</p>
				<p>
					가격 : <input type="text" value="${booklist.price }" readonly />
				</p>
				<c:if test="${empty booklist.translators }">
					<p>옮긴이 : 정보없음</p>
				</c:if>
				<c:if test="${not empty booklist.translators }">
					<p>
						옮긴이 : <input type="text" value="${booklist.translators }" readonly />
					</p>
				</c:if>
			</div>
		</c:forEach>
	</form>

	<form id="sell" action="/books/upload" enctype="multipart/form-data"
		method="post">
		<div class="items">
		<c:forEach var="booklist" items="${booklist}">
			<p><input type="text" name="listnum" value="${booklist.listnum }" /></p>
		</c:forEach>	
			<p>닉네임 : ${member.nickname }</p>
			<p>
				추가설명을 적어주세요<br />
				<textarea name="contents" rows="" cols="" placeholder="(500자 이내)"
					required="required"></textarea>
			</p>
			<div class="group group-book">
				<h2>책 상태</h2>
				<p>
					<label for="underline">밑줄 흔적: <input type="radio"
						name="underline" value="없음" id="underline" checked="checked" />없음
						<input type="radio" name="underline" value="연필/샤프" id="underline" />연필/샤프
						<input type="radio" name="underline" value="볼펜/형광펜" id="underline" />볼펜/형광펜
					</label>
				</p>
				<p>
					<label for="writing">필기 흔적: <input type="radio"
						name="writing" value="없음" id="writing" checked="checked" />없음 <input
						type="radio" name="writing" value="연필/샤프" id="writing" />연필/샤프 <input
						type="radio" name="writing" value="볼펜/형광펜" id="writing" />볼펜/형광펜
					</label>
				</p>
				<p>
					<label for="cover">겉표지: <input type="radio" name="cover"
						value="깨끗함" id="cover" checked="checked" />깨끗함 <input
						type="radio" name="cover" value="깨끗하지않음" id="cover" />깨끗하지않음
					</label>
				</p>
				<p>
					<label for="nameentry">이름 기입: <input type="radio"
						name="nameentry" value="없음" id="nameentry" checked="checked" />없음
						<input type="radio" name="nameentry" value="있음" id="nameentry" />있음
					</label>
				</p>
				<p>
					<label for="pagecolor">페이지 변색: <input type="radio"
						name="pagecolor" value="없음" id="pagecolor" checked="checked" />없음
						<input type="radio" name="pagecolor" value="있음" id="pagecolor" />있음
					</label>
				</p>
				<p>
					<label for="pagestate">페이지 훼손: <input type="radio"
						name="pagestate" value="없음" id="pagestate" checked="checked" />없음
						<input type="radio" name="pagestate" value="있음" id="pagestate" />있음
					</label>
				</p>
				<p>
					<input type="text" name="sellprice" placeholder="판매 가격 입력" />
				</p>

				<div class="wrapper">
					<div class="body">

						<div id="attach">
							<label class="waves-effect waves-teal btn-flat" id="show_uuid"
								for="uploadInputBox">사진첨부</label> <input id="uploadInputBox"
								style="display: none" type="file" name="file" multiple />

						</div>

						<!-- 미리보기 영역 -->
						<div id="preview" class="content"></div>

					</div>
				</div>


<!-- 				<form>
					<div>
						<input type="file" id="directory_upload" webkitdirectory>
					</div>
					<div class="file_list">
						<p></p>
					</div>
				</form> -->


				<h2>거래 수단</h2>
				<p>
					<label for="pagestate">택배: <input type="radio"
						name="delivery" value="가능" id="delivery" checked="checked" />가능 <input
						type="radio" name="delivery" value="불가능" id="delivery" />불가능
					</label>
				</p>
				<p>
					<label for="pagestate">직거래: <input type="radio"
						name="directdeal" value="가능" id="directdeal" checked="checked" />가능
						<input type="radio" name="directdeal" value="불가능" id="directdeal" />불가능
					</label>
				</p>
				<p>
					<input type="text" name="location" placeholder="장소입력 입력" />
				</p>
				<p>
					<input type="submit" value="submit" />
				</p>
			</div>
		</div>
	</form>






	<div id="map" style="width: 50%; height: 350px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=293654733c566c2df57a50fda13d9eaa&libraries=services"></script>
	<script>
		// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();

		// 키워드로 장소를 검색합니다
		ps.keywordSearch('서울대학교', placesSearchCB);

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				var bounds = new kakao.maps.LatLngBounds();

				for (var i = 0; i < data.length; i++) {
					displayMarker(data[i]);
					bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
				}

				// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
				map.setBounds(bounds);
			}
		}

		// 지도에 마커를 표시하는 함수입니다
		function displayMarker(place) {

			// 마커를 생성하고 지도에 표시합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : new kakao.maps.LatLng(place.y, place.x)
			});

			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(marker, 'click', function() {
				// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				infowindow
						.setContent('<div style="padding:5px;font-size:12px;">'
								+ place.place_name + '</div>');
				infowindow.open(map, marker);
			});
		}
	</script>

</body>
</html>