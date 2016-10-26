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
 	
 // Create a YUI sandbox on your page.
 	YUI().use('node', 'event', function (Y) {
 	    // The Node and Event modules are loaded and ready to use.
 	    // Your code goes here!
 	});
 
 	YUI().use('node', function (Y) {
 	    // Access DOM nodes.
 	    var oneElementById     = Y.one('#foo'),
 	        oneElementByName   = Y.one('body'),
 	        allElementsByClass = Y.all('.bar');

 	    // Create DOM nodes.
 	    var contentNode = Y.Node.create('<div>'),
 	        listNode    = Y.Node.create('<ul>'),
 	        footerNode  = Y.Node.create('<footer>');

 	    contentNode.setHTML('<p>Node makes it easy to add content.</p>');
 	    listNode.insert('<li>Buy milk</li>');
 	    footerNode.prepend('<h2>Footer Content</h2>');

 	    // Manipulate DOM nodes.
 	    Y.all('.important').addClass('highlight');

 	    Y.one('#close-button').on('click', function () {
 	        contentNode.hide();
 	    });
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
    			<h2>Sales Chart</h2> 
			</div>

	<div id="admin_order_search">
	<div id="searchDate">
		<form>
		<input type="date" name="nowDate" id="nowDate" class="searchDateInput">
		 &nbsp; <input type="submit" value="검색" class="admin_btn_min">
		</form>
	</div><!-- searchDate -->    
    </div>
 
	<br>
	<br>
	<div id="admin_tab">
	<ul class="tab">
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openTab(event, 'all')" id="defaultOpen">모두 보기</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openTab(event, 'order')">주문접수</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openTab(event, 'payed')">결제완료</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openTab(event, 'move')">배송중</a></li>
		<li><a href="javascript:void(0)" class="tablinks"
			onclick="openTab(event, 'back')">취소/교환/반품</a></li>
	</ul>

	<div id="all" class="tabcontent" style="display:block">
   		<h2>TEST</h2>
	<h2>Radar Chart with dimmed background</h2>
	<div id="chart12"></div>
	<script>

		var options = {
			'legend':{
				names: ['Perceivable', 'Information', 'Understandable', 'Enough', 'Epilepsy', 'Operable', 'Navigation','Error'],
				hrefs: []
					},
			'dataset': {
				title: 'Web accessibility status',
				values: [['n/a',53,67,23,78, 55, 45, 89]], 
				bgColor: '#f9f9f9',
				fgColor: '#cc79a7'
			},
			'chartDiv': 'chart12',
			'chartType': 'radar',
			'chartSize': {width:600, height:300}
		};

		Nwagon.chart(options);

	</script>
	<h2>Radar Chart</h2>
	<div id="chart11"></div>
	<script>

		var options = {
			'legend':{
				names: ['Perceivable', 'Information', 'Understandable', 'Enough', 'Epilepsy', 'Operable', 'Navigation','Error'],
				hrefs: []
					},
			'dataset': {
				title: 'Web accessibility status',
				values: [[33,53,67,23,78,45,69, 89], [53,67,23,78,45,69, 89, 33]], 
				bgColor: '#f9f9f9',
				fgColor: '#cc79a7'
			},
			'chartDiv': 'chart11',
			'chartType': 'radar',
			'chartSize': {width:600, height:300}
		};

		Nwagon.chart(options);

	</script>

	<h2>Line Chart with guide line

	</h2>
	<div id="chart71"></div>
	<p style = 'font-size:12px; padding:0 0 40px 40px'>** Mouse over the chart area in order to move the guide line</p>
	<script>
		var options = {
			'legend':{
				names: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15',]
					},
			'dataset':{
				title:'Playing time per day', 
				values: [[56,76], [58,66], [60,62], [58,70], [85, 76], [86,83], [82, 73], [77,66], [87,66], [49,56], [58,76], [85, 76], [56,83], [56, 83], [45, 34]],
				colorset: ['#0072b2', '#cc79a7'],
				fields:['Company A', 'Company B']
			},
			'chartDiv' : 'chart71',
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

	<h2>Line Chart with offset values</h2>
	<div id="chart7"></div>
	<script>
		var options = {
			'legend':{
				names: ['08-12', '08-19', '08-26', '09-02', '09-09', '09-16', '9-23']
					},
			'dataset':{
				title:'Playing time per day', 
				values: [[77,47, 66], [76,53, 66], [49,62, 45], [58,86, 76], [48, 85, 76], [56, 48,83], [56, 48,83]],
				colorset: ['#DC143C','#FF8C00', '#2EB400'],
				fields:['Company A', 'Company B', 'Company C']
			},
			'chartDiv' : 'chart7',
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

	<h2>Area Chart with colorblind safe colors</h2>
	<div id="chart72"></div>
	<script>
		var options = {
			'legend':{
				names: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15',]
					},
			'dataset':{
				title:'Playing time per day', 
				values: [[56,76], [58,66], [60,62], [58,70], [85, 76], [86,83], [82, 73], [77,66], [87,66], [49,56], [58,76], [85, 76], [56,83], [56, 83], [45, 34]],
				colorset: ['#0072b2', '#cc79a7'],
				fields:['Company A', 'Company B']
			},
			'chartDiv' : 'chart72',
			'chartType' : 'area',
			'leftOffsetValue': 40,
			'bottomOffsetValue': 60,
			'chartSize' : {width:700, height:300},
			'minValue' :20,
			'maxValue' : 100,
			'increment' : 20
		};

		Nwagon.chart(options);
	</script>

	<h2>Comparison Chart</h2>
	<div id="chart73"></div>
	<script>
		var options = {
			'legend':{
				names: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15',]
					},
			'dataset':{
				title:'Playing time per day', 
				values: [[56,76], [58,66], [60,62], [58,70], [85, 76], [86,83], [82, 73], [77,66], [87,66], [49,56], [58,76], [85, 76], [56,83], [56, 83], [45, 34]],
				colorset: ['#DC143C','#2EB400'],
				fields:['Company A', 'Company B']
			},
			'chartDiv' : 'chart73',
			'chartType' : 'jira',
			'leftOffsetValue': 40,
			'bottomOffsetValue': 60,
			'chartSize' : {width:700, height:300},
			'minValue' :20,
			'maxValue' : 100,
			'increment' : 20
		};

		Nwagon.chart(options);
	</script>

	<h2>Polar Pie Chart with colorblind safe colors</h2>
	<div id="Nwagon11"></div>
	<script>
	    var options = {
	        'legend':{
	            names: [['A'], ['B'], ['C']]
	        },
	        'dataset': {
	            title: 'Avg Bill Paid',
	            values: [[32],[78],[42]],
	            degree_values:[510, 180, 310],
	            colorset: ['#009e73', '#56b4e9', "#666666"], //color-blind safe colors 
	            fields: ['A', 'B',  'C'],
	            opacity:[0.9]
	        },
	        'core_circle_value' : ['50.6%'],
	        'core_circle_radius':25,
	        'maxValue' : 100,
	        'increment' : 20,
	        'chartDiv': 'Nwagon11',
	        'chartType': 'polar_pie',
	        'chartSize': {width:700, height:400}
	    };
	    Nwagon.chart(options);
	</script>

	<h2>Polar Area chart</h2>
	<div id="Nwagon"></div>
	<script>
	    var options = {
	        'legend':{
	            names: [['A-a'], ['B-a', 'B-b', 'B-c'], ['C-a',  'C-b', 'C-c', 'C-d']]
	        },
	        'dataset': {
	            title: 'Web accessibility status',
	            values: [[60], [50, 100, 67], [90, 70, 44, 88]],
	            colorset: ['#2EB400', '#2BC8C9', "#666666"],
	            fields: ['A', 'B', 'C'],
	            opacity:[0.3, 0.5, 0.7, 0.9]
	        },
	        'core_circle_value' : ['72.7%'],
	        'core_circle_radius':30,
	        'maxValue' : 100,
	        'increment' : 20,
	        'chartDiv': 'Nwagon',
	        'chartType': 'polar',
	        'chartSize': {width:700, height:400}
	    };
	    Nwagon.chart(options);
	</script>

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

	<h2>Multi Column Chart with colorblind safe colors</h2>	
	<div id="chart18"></div>
	<script>
		var options = {
			'legend':{
				names: ['08-12', '08-19', '08-26', '09-02', '09-09', '09-16','09-16', '09-16', '09-16'],
				hrefs: []
					},
			'dataset':{
				title:'Playing time per day', 
				values: [[5,7,2,6], [2,5,7,4], [7,2,3,6], [6,1,5,3], [5,3,8,8], [8,3,1,6], [6,3,9,8], [6,2,6,2], [8,2,4,2]],
				colorset: ['#cc79a7', '#0072b2', "#f0e442", '#d55e00'],
				fields:['Working Time', 'Late count', 'Blah','Vacation']
				},
			'chartDiv' : 'chart18',
			'chartType' : 'multi_column',
			'chartSize' : {width:700, height:300},
			'maxValue' : 10,
			'increment' : 1
		};

		Nwagon.chart(options);

	</script>
	<h2>Multi Column chart</h2>	
	<div id="chart19"></div>
	<script>
		var options = {
			'legend':{
				names: ['08-12', '08-19', '08-26', '09-02', '09-09', '09-16','09-16', '09-16', '09-16'],
				hrefs: []
					},
			'dataset':{
				title:'Playing time per day', 
				values: [[5,7,2,6], [2,5,7,4], [7,2,3,6], [6,1,5,3], [5,3,8,8], [8,3,1,6], [6,3,9,8], [6,2,6,2], [8,2,4,2]],
				colorset: ['#DC143C','#FF8C00', '#2EB400', '#666666'],
				fields:['Working Time', 'Late count', 'Blah','Vacation']
				},
			'chartDiv' : 'chart19',
			'chartType' : 'multi_column',
			'chartSize' : {width:700, height:300},
			'maxValue' : 10,
			'increment' : 1
		};

		Nwagon.chart(options);

	</script>


	<h2>Stacked Column chart</h2>	
	<div id="chart17"></div>
	<script>
		var options = {
			'legend':{
				names: ['08-12', '08-19', '08-26', '09-02', '09-09', '09-16','09-16', '09-16', '09-16', '09-16', '09-16', '09-16'],
				hrefs: []
					},
			'dataset':{
				title:'Playing time per day', 
				values: [[5,7,2,6], [2,5,7,4], [7,2,3,6], [6,1,5,3], [5,3,8,8], [8,3,1,6], [6,3,9,8], [6,2,6,2], [6,2,6,2],[6,2,6,2], [5,3,8,8], [8,3,1,6]],
				colorset: ['#DC143C','#FF8C00', '#2EB400', '#666666'],
				fields:['Working Time', 'Late count', 'Blah','Vacation']
				},
			'chartDiv' : 'chart17',
			'chartType' : 'stacked_column',
			'chartSize' : {width:700, height:300},
			'maxValue' : 30,
			'increment' : 3
		};

		Nwagon.chart(options);

	</script>


	<h2>Pie Chart with colorblind safe colors</h2>
	<div id="chart"></div>
	<script>
		
		var options = {
			'dataset': {
				title: 'Web accessibility status',
				values:[18, 12, 3, 10, 7],
				colorset: ['#56b4e9', '#e69f00', '#cc79a7', '#009e73', '#0072b2'],
				fields: ['A', 'B',  'C', 'D', 'E'] 
			},
			'donut_width' : 100, 
			'core_circle_radius':0,
			'chartDiv': 'chart',
			'chartType': 'pie',
			'chartSize': {width:600, height:300}
		};

		Nwagon.chart(options);
	</script>
	<h2>Donut Chart</h2>
	<div id="chart_d"></div>
	<script>
		
		var options = {
			'dataset': {
				title: 'Web accessibility status',
				values:[18, 12, 3, 10, 7],
				colorset: ['#2BC8C9', '#FF8C00', '#DC143C','#2EB400', '#666666'],
				fields: ['A', 'B',  'C', 'D', 'E'] 
			},
			'donut_width' : 40, 
			'core_circle_radius':60,
			'chartDiv': 'chart_d',
			'chartType': 'donut',
			'chartSize': {width:600, height:300}
		};

		Nwagon.chart(options);
	</script>
	</div><!-- tab -->

	<div id="order" class="tabcontent">
	
	</div><!-- tab -->

	<div id="payed" class="tabcontent">
		<h3>Tokyo</h3>
		<p>Tokyo is the capital of Japan.</p>
	</div><!-- tab -->
	
	<div id="move" class="tabcontent">
		<h3>Tokyo</h3>
		<p>Tokyo is the capital of Japan.</p>
	</div><!-- tab -->
	
	<div id="back" class="tabcontent">
		<h3>취소내역</h3>
	
	</div><!-- tab -->

	</div><!-- all tab -->


	</div><!-- admin_order_contents_wrap -->
	</div><!-- admin_order_contents -->
	
	
	<div class="footer">			
		<jsp:include page="../main_footer.jsp" flush="false" />
	</div>
	
</body>
</html>