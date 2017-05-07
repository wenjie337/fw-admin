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
        <li class="active">产品列表</li>
    </ul>
    <!-- 删除确认 -->
    <div class="modal fade" id="modal-form">
        <div class="modal-dialog">
            <div class="modal-content message_align">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">提示信息</h4>
                </div>
                <div class="modal-body">
                    <p>您确认要删除吗？</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <a id="delProduct" class="btn btn-success" data-dismiss="modal">确定</a>
                </div>
            </div>
        </div>
    </div>
    
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
			<form class="form-inline form-offset" method="post" id="postWhere" data-validate="parsley" action="getProductList.htm">
				  <input type="hidden" name="pagenum" value="1"/>
				  
			      <div class="input-group">
			         <input placeholder="产品名" class="form-control" size="30" type="text" name="productName" value="${vo.productName}" />
			      </div>
			    
			      <div class="input-group">
			         <button class="btn btn-default" type="submit" style="padding:6px 20px;">查询</button>
			      </div>
            </form>
        </div>
        
        <div class="col-sm-3 text-right">
	      	 <a href="product/addProductForm.htm" class="btn btn-default" data-placement="top" data-toggle="tooltip" data-original-title="添加">
	         	<i class="fa fa-plus"></i>
	         </a>
	         <a href="#modal-form" class="btn btn-default" type="button" data-toggle="modal" data-placement="top" data-original-title="删除">
	         	<i class="fa fa-trash-o"></i>
	         </a>
        </div>
        </div>
	</section>
    
    <section class="panel panel-default">
        <div class="table-responsive">
            <table class="table table-striped b-t b-light">
                <thead>
                <tr>
                    <th width="20"><input type="checkbox"></th>
                    <th class="th-sortable" data-toggle="class">ID
                      <span class="th-sort">
                        <i class="fa fa-sort-down text"></i>
                        <i class="fa fa-sort-up text-active"></i>
                        <i class="fa fa-sort"></i>
                      </span>
                    </th>
                    <th>产品名称</th>
                    <th>产品描述</th>
                    <th>单价</th>
                    <th>所需人次</th>
                    [#--<th class="text-center">创建时间</th>--]
                    <th class="text-center">更新时间</th>
                     <th>状态</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                [#if list?exists]
                    [#list list as c]
                    <tr>
                        <td><input type="checkbox" name="ids" class="ids" value="${c.productId}"></td>
                        <td>${c.productId}</td>
                        <td>${c.productName}</td>
                        <td>${c.productDesc}</td>
                        <td>${c.price}</td>
                        <td>${c.peopleCount}</td>
                        [#--<td class="text-center">${c.createTime}</td>--]
                        <td class="text-center">${c.lastUpdateTime}</td>
                        <td>[#if c.status == 0]
                             	上架
                            [#else]
                             	下架
                            [/#if]
                        </td>
                        <td class="text-right">
                        	[#if c.isActivity == 0]
                           	 <a href="addActivity.htm?productId=${c.productId}">创建活动</a>
                            [/#if]
                            &nbsp;
                            <a href="product/queryProduct.htm?productId=${c.productId}">修改</a>
                            &nbsp;
                            <a href="getGoodsInfoById.htm?id=${c.productId}"><span style="color:#2E6593">详情</span></a>
                        </td>
                    </tr>
                    [/#list]
                [/#if]
                </tbody>
            </table>
        </div>
    </section>
</section>

[@pager.footer page,'getProductList.htm' /]

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