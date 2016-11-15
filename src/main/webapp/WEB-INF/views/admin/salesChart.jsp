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
<script type="text/javascript">
	$(function(){
		document.getElementById("now").value = '${now}';
	});
</script>
<title>Sales Chart</title>
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
		<lable id="centerLable"> 기준 날짜 검색 : </lable><input type="date" name="now" id="now" class="searchDateInput">
		 &nbsp; <input type="submit" value="검색" class="admin_btn_min"> 
		</form>
	</div><!-- searchDate -->   
    </div>
    <ul id="admin_order_detail">
	    <li>검색 버튼 미 사용시 현재 날짜 기준으로 조회됩니다.</li>
	    <li>해당 차트에 마우스를 올리시면 해당 수치를 확인할 수 있습니다.</li>
	    <li>모든 가격수치는 10,000원단위입니다.</li>
    </ul> 
 	
 	<div id="main_chart" class="chartTable" >
 		<h2 id="firstH2">일일 매출 내역</h2>
	<div id="chart8"></div>
	<script>
		var options = {
			'legend': {
	            names: [ '결제건', '판매개수', '판매액(만원)'],
	            hrefs: []
	        },
	        'dataset': {
	            title: 'today sale',
	            values: ['${today.orderCount }', '${today.totalQuantity }', '${today.totalPrice }'],	
	            colorset: ['#56b4e9']
	        },
	        'chartDiv': 'chart8',
	        'chartType': 'column',
	        'chartSize': { width: 700, height: 400 },
	        'maxValue': 100,
	        'increment': 10
		};

		Nwagon.chart(options);

	</script>
 	
 	<table id="today" class="chartTable">
 		<tr><th>결제건수</th><th>판매개수</th><th>판매액(만원)</th></tr>
 		<tr><td>${today.orderCount }</td><td>${today.totalQuantity }</td><td>${today.totalPrice }</td></tr>
 	</table>
 	
 	<h2>주간 매출 내역</h2>
	<div id="chartWeek"></div>
	<script>	
		
		var options = {
			'legend':{
				names: ['${now6 }', '${now5 }', '${now4 }', '${now3 }', '${now2 }', '${now1 }', '${now0 }'] 
				//names: ['1', '2', '3', '4', '5', '6', '7']
					},
			'dataset':{
				title:'Playing time per day', 
				values: [['${thisWeek.get(6)}', '${LastWeek.get(6)}'], ['${thisWeek.get(5)}', '${LastWeek.get(5)}'], 
				         ['${thisWeek.get(4)}', '${LastWeek.get(4)}'], ['${thisWeek.get(3)}', '${LastWeek.get(3)}'], 
				         ['${thisWeek.get(2)}', '${LastWeek.get(2)}'], ['${thisWeek.get(1)}', '${LastWeek.get(1)}'], 
				         ['${thisWeek.get(0)}', '${LastWeek.get(0)}']],
				colorset: ['#DC143C','#FF8C00'],
				fields:['이번주', '지난주']
			},
			'chartDiv' : 'chartWeek',
			'chartType' : 'line',
			'leftOffsetValue': 40,
			'bottomOffsetValue': 60,
			'chartSize' : {width:700, height:300},
			'minValue' : 0,
			'maxValue' : 200,
			'increment' : 20,
			'isGuideLineNeeded' : true 
		};

		Nwagon.chart(options);
	</script>	
	<table id="week" class="chartTable" >
 		<tr><th></th><th>6일전</th><th>5일전</th><th>4일전</th><th>3일전</th><th>2일전</th><th>1일전</th><th>오늘</th></tr>
 		<tr><th>이번주</td><td>${thisWeek.get(6)}</td><td>${thisWeek.get(5)}</td><td>${thisWeek.get(4)}</td><td>${thisWeek.get(3)}</td><td>${thisWeek.get(2)}</td><td>${thisWeek.get(1)}</td><td>${thisWeek.get(0)}</td></tr>
		<tr><th>지난주</td><td>${LastWeek.get(6)}</td><td>${LastWeek.get(5)}</td><td>${LastWeek.get(4)}</td><td>${LastWeek.get(3)}</td><td>${LastWeek.get(2)}</td><td>${LastWeek.get(1)}</td><td>${LastWeek.get(0)}</td></tr> 	
		</table>	

 	
   		<h2>연간 매출 내역</h2>
	<div id="chartYear"></div>
	<script>
		var options = {
			'legend':{
				names: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
					},
			'dataset':{
				title:'Playing time per day', 
				values: [['${nowYears.get(0)}', '${lastYears.get(0)}'], ['${nowYears.get(1)}','${lastYears.get(1)}'], 
				         ['${nowYears.get(2)}', '${lastYears.get(2)}'], ['${nowYears.get(3)}', '${lastYears.get(3)}'], 
				         ['${nowYears.get(4)}', '${lastYears.get(4)}'], ['${nowYears.get(5)}', '${lastYears.get(5)}'], 
				         ['${nowYears.get(6)}', '${lastYears.get(6)}'], ['${nowYears.get(7)}', '${lastYears.get(7)}'], 
				         ['${nowYears.get(8)}', '${lastYears.get(8)}'], ['${nowYears.get(9)}', '${lastYears.get(9)}'], 
				         ['${nowYears.get(10)}', '${lastYears.get(10)}'], ['${nowYears.get(11)}', '${lastYears.get(11)}']
				         ],
				colorset: ['#0072b2', '#cc79a7'],
				fields:['작년', '금년']
			},
			'chartDiv' : 'chartYear',
			'chartType' : 'line',
			'leftOffsetValue': 40,
			'bottomOffsetValue': 60,
			'chartSize' : {width:700, height:300},
			'minValue' :0,
			'maxValue' : 1000,
			'increment' : 100,
			'isGuideLineNeeded' : true //default set to false
		};

		Nwagon.chart(options);
	</script>	
	<table id="year" class="chartTable" >
 		<tr><th></th><th>1월</th><th>2월</th><th>3월</th><th>4월</th><th>5월</th><th>6월</th><th>7월</th><th>8월</th><th>9월</th><th>10월</th><th>11월</th><th>12월</th></tr>
 		<tr><th>금년</th><td>${nowYears.get(0)}</td><td>${nowYears.get(1)}</td><td>${nowYears.get(2)}</td><td>${nowYears.get(3)}</td><td>${nowYears.get(4)}</td><td>${nowYears.get(5)}</td><td>${nowYears.get(6)}</td><td>${nowYears.get(7)}</td><td>${nowYears.get(8)}</td><td>${nowYears.get(9)}</td><td>${nowYears.get(10)}</td><td>${nowYears.get(11)}</td></tr>
 		<tr><th>작년</th><td>${lastYears.get(0)}</td><td>${lastYears.get(1)}</td><td>${lastYears.get(2)}</td><td>${lastYears.get(3)}</td><td>${lastYears.get(4)}</td><td>${lastYears.get(5)}</td><td>${lastYears.get(6)}</td><td>${lastYears.get(7)}</td><td>${lastYears.get(8)}</td><td>${lastYears.get(9)}</td><td>${lastYears.get(10)}</td><td>${lastYears.get(11)}</td></tr>
 	</table>


<h2>카테고리별 매출현황</h2>
	<div id="chart"></div>
	<script>
		var bag = ${category.bag };
		var tool = ${category.tool };
		var food = ${category.food };
		var protect = ${category.protect };
		var etc = ${category.etc };
		
		var options = {
			'dataset': {
				title: 'Web accessibility status',
				values:[bag, tool, food, protect, etc ],
				colorset: ['#56b4e9', '#e69f00', '#cc79a7', '#009e73', '#0072b2'],
				fields: ['bag', 'tool',  'food', 'protect', 'etc'] 
			},
			'donut_width' : 140, 
			'core_circle_radius':0,
			'chartDiv': 'chart',
			'chartType': 'pie',
			'chartSize': {width:900, height:400}
		};

		Nwagon.chart(options);
	</script>
	<table id="category" class="chartTable" >
	<tr><th>bag</th><th>tool</th><th>food</th><th>protect</th><th>etc</th></tr>
	<tr><td>${category.bag }</td><td>${category.tool }</td><td>${category.food }</td><td>${category.protect }</td><td>${category.etc }</td></tr>
	</table>
	
	
	<h2>KIT DIY 매출현황</h2>
	<div id="chart_d"></div>
	<script>
		var yes =${kit.kitYES };
		var no = ${kit.kitNO };
		
		var options = {
			'dataset': {
				title: 'Web accessibility status',
				values:[yes, no],
				colorset: ['#2BC8C9', '#FF8C00'],
				fields: ['kit', 'not kit'] 
			},
			'donut_width' : 80, 
			'core_circle_radius':60,
			'chartDiv': 'chart_d',
			'chartType': 'donut',
			'chartSize': {width:900, height:400}
		};

		Nwagon.chart(options);
	</script>
	<table id="kit" class="chartTable" >
	<tr><th>kit</th><th>not kit</th></tr>
	<tr><td>${kit.kitYES }</td><td>${kit.kitNO }</td></tr>
	</table>
	
	</div>


	</div><!-- admin_order_contents_wrap -->
	</div><!-- admin_order_contents -->
	
	
	<div class="footer">			
		<jsp:include page="../main_footer.jsp" flush="false" />
	</div>
	
</body>
</html>