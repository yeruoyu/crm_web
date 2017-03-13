<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:url value="/records" var="recordsUrl" />
<c:url value="/publishRecords" var="publishRecordsUrl" />
<c:url value="/customer/lockCustomer" var="lockCustomerUrl" />
<c:url value="/channel/allChannel" var="channelUrl" />
<c:url value="/scheduleRecords" var="scheduleUrl" />

<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CRM系统</title>
	
<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/fonts/linecons/css/linecons.css"/>' />
<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/fonts/fontawesome/css/font-awesome.min.css"/>' />
<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>' />
<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/xenon-core.css"/>' />
<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/xenon-forms.css"/>' />
<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/xenon-components.css"/>' />
<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/css/xenon-skins.css"/>' />


<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/jqgrid/css/ui.jqgrid-bootstrap.css"/>' />
<link rel="stylesheet" type="text/css" media="screen" href='<c:url value="/resources/datetimepicker/css/bootstrap-datetimepicker.min.css"/>' />

<script type='text/ecmascript' src='<c:url value="/resources/js/jquery-1.11.0.min.js"/>'></script>
</head>
<body class="page-body">
	<div class="page-container">
		<jsp:include page="common/menu.jsp"/>
		<!-- Content -->
		<div class="main-content">
			<jsp:include page="common/navbar.jsp"/>
			<div class="page-title">
				<div class="breadcrumb-env">
					<ol class="breadcrumb bc-1">
						<li>
							<a href="<c:url value='/index'/>"><i class="fa-home"></i>首页</a>
						</li>
					</ol>		
				</div>
			</div>
			<!-- Content Panel -->
			<div class="row">
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">公告</h3>
						</div>
						<div class="panel-body">
							<!-- Content -->
							<div id="publishJgrid">
								<table id='publishGrid' ></table>
								<div id='publishPager'></div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">客户联系提醒</h3>
						</div>
						<div class="panel-body">
							<!-- Content -->
							<div id="jgrid">
								<table id='grid' ></table>
								<div id='pager'></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">工作日历</h3>
						</div>
						<div class="panel-body">
							<!-- Content -->	
							<section class="calendar-env">
								
								<div class="col-sm-12 calendar-right">
									
									<div class="calendar-main">
										<div id="calendar"></div>
									</div>
								</div>
							</section>
						</div>
					</div>	
				</div>
			</div>
			<jsp:include page="common/footer.jsp"/>
		</div>
	</div>
</body>

<!-- Bottom Scripts -->
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/resources/js/fullcalendar/fullcalendar.min.css"/>" />




<script type="text/ecmascript" src='<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/js/TweenMax.min.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/js/resizeable.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/js/joinable.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/js/xenon-api.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/js/xenon-toggles.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/js/xenon-custom.js"/>'></script>


<script type='text/ecmascript' src='<c:url value="/resources/jqgrid/js/i18n/grid.locale-cn.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/jqgrid/js/jquery.jqGrid.js"/>'></script>

<script type='text/ecmascript' src='<c:url value="/resources/datetimepicker/js/bootstrap-datetimepicker.min.js"/>'></script>
<script type='text/ecmascript' src='<c:url value="/resources/datetimepicker/js/locales/bootstrap-datetimepicker.fr.js"/>'></script>

<script type="text/ecmascript" src='<c:url value="/resources/bootstrap/js/bootstrap3-typeahead.js"/>'></script>
<script type="text/ecmascript" src='<c:url value="/resources/bootstrap/js/jquery.bootstrap.teninedialog.v3.js"/>'></script>	

<script type="text/ecmascript" src='<c:url value="/resources/js/moment.min.js"/>'></script>
<script type="text/ecmascript" src='<c:url value="/resources/js/fullcalendar/fullcalendar.js"/>'></script>
<script type="text/ecmascript" src='<c:url value="/resources/js/jquery-ui/jquery-ui.min.js"/>'></script>


<script type='text/ecmascript'>
	//$.jgrid.defaults.width = 780;
	$.jgrid.defaults.responsive = true;
	$.jgrid.defaults.styleUI = 'Bootstrap';
</script>

<script type='text/ecmascript'>
$(function() {
	$.jgrid.styleUI.Bootstrap.base.rowTable = "table table-bordered table-striped";
		
	$("#grid").jqGrid({
		url : '${recordsUrl}',
		datatype : 'json',
		mtype : 'GET',
		colModel : [{
			index : 'customerCode',
			name : 'customerCode',
			label : '客户Code',
			width : 100,
			editable : false
		}, {
			name : 'customerName',
			index : 'customerName',
			label : '客户姓名',
			width : 100,
			editable : false,
		}, {
			name : 'channelCode',
			index : 'channelCode',
			label : '来源渠道',
			width : 100,
			editable : false,
			formatter : 'select',
			stype : 'select',
			formatoptions : {
				value : getAllChannel()
			}
		}, {
			name : 'customerLocked',
			index : 'customerLocked',
			label : '客户锁定',
			width : 80,
			editable : true,
			editrules : {
				required : false
			},
			edittype : "select",
			formatter : 'select',
			stype : 'select',
			editoptions : {
				value : "1:锁定;0:未锁定"
			},
			formatoptions : {
				value : "1:锁定;0:未锁定"
			}
		}, {
			name : 'customerStatus',
			index : 'customerStatus',
			label : '客户状态',
			width : 80,
			editable : true,
			editrules : {
				required : false
			},
			edittype : "select",
			formatter : 'select',
			stype : 'select',
			editoptions : {
				value : "1:活动;0:停用;-1:注销"
			},
			formatoptions : {
				value : "1:活动;0:停用;-1:注销"
			}
		},{
			name : 'execLock',
			index : 'execLock',
			label : '锁定',
			width : 100,
			editable : false,
			formatter : formateExceLock
		} ],
		postData : {},
		rowNum : 5,
		rowList : [ 10, 20, 40, 60 ],
		height : 200,
		autowidth : true,
		rownumbers : false,
		pager : '#pager',
		viewrecords : true,
		sortable : false,
		loadonce : false,
		sortorder : "asc",
		emptyrecords : "空记录",
		onSelectRow: editRow, 
		loadComplete : function() {
			jQuery("#grid").trigger("reloadGrid");
		},
		jsonReader : {
			root : "rows",
			page : "page",
			total : "total",
			records : "records",
			repeatitems : false,
			cell : "cell",
			id : "id"
		}
	});

	$("#grid").jqGrid('navGrid', '#pager', {
		edit : false,
		add : false,
		del : false,
		search : false,
		refresh : true,
		view : true,
		position : "left",
		cloneToTop : false
	}, {}, {}, {}, {});
	
	var lastSelection;

    function editRow(id) {
        if (id && id !== lastSelection) {
            var grid = $("#jqGrid");
            grid.jqGrid('restoreRow',lastSelection);
            grid.jqGrid('editRow',id, {keys: true} );
            lastSelection = id;
        }
    }
});

/** 公告信息 */
$(function() {
	$.jgrid.styleUI.Bootstrap.base.rowTable = "table table-bordered table-striped";
		
	$("#publishGrid").jqGrid({
		url : '${publishRecordsUrl}',
		datatype : 'json',
		mtype : 'GET',
		colModel : [{
			index : 'publishId',
			name : 'publishId',
			label : '公告Id',
			width : 50,
			editable : false
		}, {
			name : 'publishTitle',
			index : 'publishTitle',
			label : '公告标题',
			width : 200,
			editable : false,
		},
		{
			name : 'execViewPublish',
			index : 'execViewPublish',
			label : '查看',
			
			width : 50,
			editable : false,
			formatter : formateExceViewPublish
		} ],
		postData : {},
		rowNum : 5,
		height : 200,
		autowidth : true,
		rownumbers : false,
		pager : '#publishPager',
		viewrecords : false,
		sortable : false,
		loadonce : false,
		emptyrecords : "空记录",
		loadComplete : function() {
			jQuery("#publishGrid").trigger("reloadGrid");
		},
		jsonReader : {
			root : "rows",
			page : "page",
			total : "total",
			records : "records",
			repeatitems : false,
			cell : "cell",
			id : "id"
		}
	});

	$("#publishGrid").jqGrid('navGrid', '#publishPager', {
		edit : false,
		add : false,
		del : false,
		search : false,
		refresh : true,
		view : false,
		position : "left",
		cloneToTop : false
	}, {}, {}, {}, {});
});

function getAllChannel(){
	var str=":;";
	$.ajax({
		type:'post',
		async:false,
		url:'${channelUrl}',
		success:function(data){
			if (data != null) {
				var length=data.length;
				for(var i=0;i<length;i++){
					if(i!=length-1){
						str+=data[i].channelCode+":"+data[i].channelName+";";
					}else{ 
						str+=data[i].channelCode+":"+data[i].channelName;
					}
				}
			}
		}
	});
	return str;
}

function formateExceViewPublish(cellvalue, options, rowObject) {
    var strFromat =  "<a href=/crm_web/publish/publishDetail?publishId="+ rowObject.publishId + ">查看</a>";
	return strFromat;
}

function formateExceLock(cellvalue, options, rowObject) {
    var strFromat =  "<a href=/crm_web/customer/customerDetail?returnUrl=myCustomerList&customerCode="+ rowObject.customerCode + ">查看</a>";
    strFromat = strFromat +"&nbsp;<a href='#' onclick='execLock(\""+rowObject.customerCode+"\")' >锁定</a>";
	return strFromat;
}

function execLock(customerCode){
	alert(customerCode);
	$.ajax({
		url:"${lockCustomerUrl}?customerCode="+customerCode,
		type:"POST",
		async:false,
		success:function(response, postdata) {
			var result = response.success;
			var errors = "";
			if (result == false) {
				for (var i = 0; i < response.message.length; i++) {
					errors += response.message[i] + "<br/>";
				}
				$.teninedialog({
                    title:'系统提示',
                    content:'锁定用户失败：'+errors
                });
				
			} else {
				$.teninedialog({
					title:'系统提示',
					content:'锁定用户成功。'
				});
				$("#grid").trigger("reloadGrid");
			}
		}
	});
}
</script>

<script type="text/javascript">
	// Calendar Initialization
	jQuery(document).ready(function($)
	{

		$('#calendar').fullCalendar({
			header: {
				left: 'title',
				center: '',
				right: 'month,agendaWeek,agendaDay prev,next'
			},monthNames: 
				["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]
			,monthNamesShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"]
			,dayNames: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"]
			,dayNamesShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六"]
			
			,today: ["今天"]
			,firstDay: 1
			,buttonText: {today: '今天',month: '月',week: '周',day: '日',prev: '上一月',next: '下一月'}
			,buttonIcons: {
				prev: 'prev fa-angle-left',
				next: 'next fa-angle-right',
			},
			// defaultDate: '2014-09-12',
			editable: true,
			eventLimit: true,
			/* events: [
				{
					title: 'All Day Event',
					url: '/crm_web/schedule/scheduleDetail?scheduleId='+19,
					start: '2016-10-01 16:00:00',
					end: '2016-10-02 16:00:00'
				}
			], */
			droppable: false,
			events:function(start, end, timezone, callback) {    
		    	//var viewStart = $.fullCalendar.formatDate(view.start,"yyyy-MM-dd HH:mm:ss");  
		        //var viewEnd = $.fullCalendar.formatDate(view.end,"yyyy-MM-dd HH:mm:ss");
		        //$("#calendar").fullCalendar('removeEvents');    
		        $.ajax({
		        	url:'${scheduleUrl}',
		        	type:"POST",
		        	async:false,
		    		success:function(response, postdata) {
		    			$("#calendar").fullCalendar('removeEvents');    
		    			for(var i=0;i<response.length;i++) {    
		            		var obj = new Object();    
		                   	//obj.id = response[i].id;    
		                   	obj.title = response[i].scheduleTitle;  
		                   	obj.url="/crm_web/schedule/scheduleDetail?scheduleId="+response[i].scheduleId; 
		                   	//obj.description = data[i].description;            
		                   	//obj.color = data[i].color;  
		                   	//obj.remindertime = $.fullCalendar.parseDate(data[i].remindertime);  
		                   	//obj.messagenotice = data[i].messagenotice;  
		                   //	obj.description = data[i].description;  
		                   	obj.start = response[i].scheduleStartTime;                   
		                   	obj.end = response[i].scheduleEndTime;   
		                   $("#calendar").fullCalendar('renderEvent',obj,true);                     
		               } 
		    		}
		        }); //把从后台取出的数据进行封装以后在页面上以fullCalendar的方式进行显示  
		    }
		});
	});
</script>
</html>