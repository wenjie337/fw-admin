[#ftl]
[#import "page.ftl" as pager /]

<head>
	<link rel="stylesheet" href="js/select2/select2.css" type="text/css" />
    <link rel="stylesheet" href="js/select2/theme.css" type="text/css" />
    <link rel="stylesheet" href="css/bxjapp.css" type="text/css" />
</head>

<section class="scrollable padder w-f">
    <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
        <li><a href="index.htm"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">活动列表</li>
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
    	<div class="col-sm-9">
			<form class="form-inline form-offset" method="post" id="postWhere" data-validate="parsley" action="getActivityList.htm">
				  <input type="hidden" name="pagenum" value="1"/>
				  
			      <div class="input-group">
			         <input placeholder="产品名" class="form-control" size="30" type="text" name="productName" value="${vo.productName}" />
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
                    <th>产品名称</th>
                    <th>所需人次</th>
                    <th>当前人次</th>
                     <th>活动编码</th>
                    <th>活动状态</th>
                     <th>活动开始时间</th>
                     <th>活动结束时间</th>
                     <th>抽奖期号</th>
                     <th>抽奖时间</th>
                     <th>中奖者</th>
                     <th>物流信息</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                [#if list?exists]
                    [#list list as c]
                    <tr>
                        <td><input type="checkbox" name="ids" class="ids" value="${c.activityId}"></td>
                        <td>${c.productName}</td>
                        <td>${c.peopleCount}</td>
                        <td>-</td>
                         <td>${c.activityCode}</td>
                        <td>
                          	[#if c.status == 0]
                          		未开始
                          	[#elseif c.status == 1]
                          		进行中
                          	[#elseif c.status ==2 ]
                          		待抽奖
                          	[#elseif c.status == 3]
                          		结束
                          	[/#if]
                        </td>
                        <td class="text-center">${c.startTime}</td>
                        <td class="text-center">${c.endTime}</td>
                        <td>${c.lotteryCode}</td>
                        <td>${c.lotteryTime}</td>
                        <td>-</td>
                        <td></td>
                        <td>
                          	[#if c.status == 3]
                          		[#if c.lotteryStatus == 1]
                          			待确认地址
                          		[#elseif c.lotteryStatus==2]
                          			<a href="logist/addLogistForm.htm">待发货</a>
                          		[#elseif c.lotteryStatus==3]
                          			已发货
                          		[#elseif c.lotteryStatus==4]
                          			已收货
                          		[/#if]
                          	[#else]
                          		-
                          	[/#if]
                        </td>
                    </tr>
                    [/#list]
                [/#if]
                </tbody>
            </table>
        </div>
    </section>
</section>

[@pager.footer page,'getBanner.htm' /]

<pagescript>
    <script src="js/select2/select2.min.js"></script>
    <script>
    $(function () {
	    $("#delProduct").click(function(){
    		var delstr = '';
			$("input[name='ids']").each(  
				function(){  
					if($(this).prop('checked')){
						if(delstr==''){
							delstr += $(this).val();
						}else{
							delstr += ',' + $(this).val();
						}
					}
				}
			); 
			if(delstr != ''){
				htmlobj=$.ajax({url:'product/delProduct.htm',data:{"ids":delstr},dataType:"text",async:false});
				if(htmlobj.responseText == '1'){
					window.location.href = 'getProductList.htm';
				} 
			}
    	});
		
	});
    	
    </script>
</pagescript>