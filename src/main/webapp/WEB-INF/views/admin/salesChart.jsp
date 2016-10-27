<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/h72/resources/css/admin.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="/h72/resources/js/jquery-3.1.0.min.js"></script>
<script src="/h72/resources/js/jquery.battatech.excelexport.js"></script>
<script type="text/javascript" src="/h72/resources/js/chart.js"></script>
<title>Sales Chart</title>
<script type="text/javascript">
	//탭 변경	
	function openTab(evt, tabname) {
		var i, tabcontent, tablinks;
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}
		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace("active", "");
		}
		document.getElementById(tabname).style.display = "block";
		evt.currentTarget.className += " active";
	}

 	//현재 날짜 value입력
 	$(function(){
 		var tDay = new Date();
 		var bMonth = tDay.getMonth();
 		var tMonth = tDay.getMonth()+1;
 		var tDate = tDay.getDate();
 		
 		document.getElementById("nowDate").value = tDay.getFullYear()+"-"+tMonth+"-"+ tDate;
 	});
</script>
</head>
<body>
	<div class="content_wrap">
		<jsp:include page="/WEB-INF/views/main_header.jsp"/>
	</div>
	
	<div class="admin_contents_wrap">
	<div class="admin_contents">
	
	<div class="admin_order_titleArea">
  			<h2>매출 내역</h2> 
	</div>

	<div id="admin_order_search">
	<div id="searchDate">
		<form>
		<lable> 날짜 검색 : </lable><input type="date" name="nowDate" id="nowDate" class="searchDateInput">
		 &nbsp; <input type="submit" value="검색" class="admin_btn_min"> 
		</form>
	</div><!-- searchDate -->   
    </div>
    <ul id="admin_order_detail">
	    <li>검색 버튼 미 사용시 현재 날짜 기준으로 조회됩니다.</li>
	    <li>해당 차트에 마우스를 올리시면 해당 수치를 확인할 수 있습니다.</li>
    </ul> 
 	
 	<div id="main_chart" style="border: 1px solid #ccc;">
 		<h2>Column Chart</h2>
	<div id="chart8"></div>
	<script>
		var options = {
			'legend': {
	            names: ['A','B','C','D','E','F','G','H','I'],
	            hrefs: []
	        },
	        'dataset': {
	            title: 'Playing time per day',
	            values: [5,7,1,4,6,3,5,2,10],
	            colorset: ['#56b4e9'],
	            fields:['Error']
	        },
	        'chartDiv': 'chart8',
	        'chartType': 'column',
	        'chartSize': { width: 700, height: 300 },
	        'maxValue': 10,
	        'increment': 1
		};

		Nwagon.chart(options);

	</script>
 	
 	
   		<h2>연간 매출 내역</h2>
	<div id="chartYear"></div>
	<script>
		var options = {
			'legend':{
				names: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12']
					},
			'dataset':{
				title:'Playing time per day', 
				values: [[56,76], [58,66], [60,62], [58,70], [85, 76], [86,83], [82, 73], [77,66], [87,66], [49,56], [58,76], [85, 76]],
				colorset: ['#0072b2', '#cc79a7'],
				fields:['작년', '금년']
			},
			'chartDiv' : 'chartYear',
			'chartType' : 'line',
			'leftOffsetValue': 40,
			'bottomOffsetValue': 60,
			'chartSize' : {width:700, height:300},
			'minValue' :0,
			'maxValue' : 100,
			'increment' : 20,
			'isGuideLineNeeded' : true //default set to false
		};

		Nwagon.chart(options);
	</script>

	<h2>주간 매출 내역</h2>
	<div id="chartWeek"></div>
	<script>
		var options = {
			'legend':{
				names: ['08-12', '08-19', '08-26', '09-02', '09-09', '09-16', '9-23']
					},
			'dataset':{
				title:'Playing time per day', 
				values: [[77, 66], [76, 66], [49, 45], [58, 76], [48, 76], [56, 83], [56, 83]],
				colorset: ['#DC143C','#FF8C00'],
				fields:['이번주', '지난주']
			},
			'chartDiv' : 'chartWeek',
			'chartType' : 'line',
			'leftOffsetValue': 50,
			'bottomOffsetValue': 60,
			'chartSize' : {width:700, height:300},
			'minValue' : 40,
			'maxValue' : 100,
			'increment' : 10
		};

		Nwagon.chart(options);
	</script>	
	<h2>카테고리별 매출현황</h2>
	<div id="chart"></div>
	<script>
		
		var options = {
			'dataset': {
				title: 'Web accessibility status',
				values:[18, 12, 3, 10, 7],
				colorset: ['#56b4e9', '#e69f00', '#cc79a7', '#009e73', '#0072b2'],
				fields: ['bag', 'tool',  'food', 'protect', 'etc'] 
			},
			'donut_width' : 100, 
			'core_circle_radius':0,
			'chartDiv': 'chart',
			'chartType': 'pie',
			'chartSize': {width:600, height:300}
		};

		Nwagon.chart(options);
	</script>
	<h2>KIT DIY 매출현황</h2>
	<div id="chart_d"></div>
	<script>
		
		var options = {
			'dataset': {
				title: 'Web accessibility status',
				values:[18, 12, 3, 10, 7],
				colorset: ['#2BC8C9', '#FF8C00', '#DC143C','#2EB400', '#666666'],
				fields: ['bag', 'tool',  'food', 'protect', 'etc'] 
			},
			'donut_width' : 100, 
			'core_circle_radius':60,
			'chartDiv': 'chart_d',
			'chartType': 'donut',
			'chartSize': {width:1000, height:700}
		};

		Nwagon.chart(options);
	</script>
	</div><!-- tab -->



	</div><!-- admin_order_contents_wrap -->
	</div><!-- admin_order_contents -->
	
	
	<div class="footer">			
		<jsp:include page="../main_footer.jsp" flush="false" />
	</div>
	
</body>
</html>