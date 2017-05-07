[#ftl]
[#import "page.ftl" as pager /]
<head>
	<link rel="stylesheet" href="js/select2/select2.css" type="text/css" />
    <link rel="stylesheet" href="js/select2/theme.css" type="text/css" />
    <link rel="stylesheet" href="css/bxjapp.css" type="text/css" />
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css" type="text/css" />
</head>

<section class="scrollable padder w-f">
    <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
        <li><a href="index.htm"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">渠道销量</li>
    </ul>
    
    <section class="panel panel-default pos-rlt clearfix">
    	<header class="panel-heading font-bold">
    	<ul class="nav nav-pills pull-right">
			<li>
				<a class="panel-toggle text-muted" href="#">
				<i class="fa fa-caret-down text-active"></i>
				<i class="fa fa-caret-up text"></i>
				</a>
			</li>
		</ul>
          搜索条件
        </header>
    	<div class="row wrapper panel-body clearfix">
    	<div class="col-sm-12">
			<form class="form-inline form-offset" method="post" id="postWhere" data-validate="parsley" action="getVcodeSale.htm">
				  <input type="hidden" name="pagenum" value="1"/>
				  
			      <div class="input-group">
			      	   <select name="channel" id="select2-option" style="width:200px;">
			        		<option value=""></option>
			        		[#if cps?exists]
	                        	[#list cps as cp]
	                        		<option value="${cp.channel}" [#if vs?exists && vs.channel?exists && vs.channel==cp.channel]selected[/#if]>${cp.name}</option>
	                        	[/#list]
	                        [/#if]
                        </select>
			      </div>
			      
			      <div class="input-group">
			         <div class="input-group date form_date" id="startDate" data-date-format="yyyy-mm-dd">
					    <input placeholder="开始日期" class="form-control" size="10" type="text" readonly id="startDateInput" name="startDate" value="${vs.startDate}" >
					    <span class="input-group-addon">
					    <span class="glyphicon glyphicon-remove"></span>
					    </span>
					    <span class="input-group-addon">
					    <span class="glyphicon glyphicon-calendar"></span>
					    </span>
					  </div>
					  
					  <div class="input-group date form_date" id="endDate" data-date-format="yyyy-mm-dd">
					    <input placeholder="结束日期" class="form-control" size="10" type="text" readonly id="endDateInput" name="endDate" value="${vs.endDate}">
					    <span class="input-group-addon">
					    <span class="glyphicon glyphicon-remove"></span>
					    </span>
					    <span class="input-group-addon">
					    <span class="glyphicon glyphicon-calendar"></span>
					    </span>
					  </div>
							
			      </div>
			    
			      <div class="input-group">
			         <button class="btn btn-default" type="submit" style="padding:6px 20px;">查询</button>
			      </div>
            </form>
        </div>
        
        </div>
	</section>

    <section class="panel panel-default">

        <div class="table-responsive">
            <table class="table table-striped b-t b-light">
                <thead>
                <tr>
                    <th width="20"><input type="checkbox"></th>
                    <th>渠道</th>
                    <th>IMSI</th>
                    <th>IMEI</th>
                    <th class="text-center">时间</th>
                </tr>
                </thead>
                <tbody>
                [#if list?exists]
                    [#list list as c]
                    <tr>
                        <td><input type="checkbox" name="ids" class="ids" value="${c.id}"></td>
                        <td>
                        ${c.channel}
                        [#if cps?exists]
                        	[#list cps as cp]
                        	[#if cp.channel == c.channel]
                        		-${cp.name}
                        		[#break]
                        	[/#if]
                        	[/#list]
                        [/#if]
                        </td>
                        <td>${c.imsi}</td>
                        <td>${c.imei}</td>
                        <td class="text-center">${c.createdTm?string('yyyy-MM-dd HH:mm:ss')}</td>
                    </tr>
                    [/#list]
                [/#if]
                </tbody>
            </table>
        </div>
    </section>
</section>

[@pager.footer page,'getVcodeSale.htm' /]

<pagescript>
    <script src="js/select2/select2.min.js"></script>
    <script src="js/bootstrap-datetimepicker.js"></script>
    <script src="js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <script>
    $(function(){
    	$("#select2-option").select2({
	        placeholder: "选择渠道",
	        allowClear: true
	    });
	    
    	$("#startDate,#endDate").datetimepicker({
            format: 'yyyy-mm-dd',
            autoclose :true,
            todayBtn :true,
            minView :2,
            weekStart :1,
            linked :true,
            language: 'zh-CN',
            pickerPosition:'bottom-left'
        });
    });
    </script>
</pagescript>