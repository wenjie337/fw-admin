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
        <li class="active">配置列表</li>
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
			<form class="form-inline form-offset" method="post" id="postWhere" data-validate="parsley" action="getVcode.htm">
				  <input type="hidden" name="pagenum" value="1"/>
			      <div class="input-group">
			        	<select name="spId" id="select2-option" style="width:250px;">
			        		<option value=""></option>
                    	[#if sps?exists]
                        	[#list sps as sp]
                        		<option value="${sp.id}" [#if vcode?exists && vcode.spId?exists && vcode.spId==sp.id]selected[/#if]>${sp.name}</option>
                        	[/#list]
                        [/#if]
                        </select>
			      </div>
			    
			      <div class="input-group">
			         <button class="btn btn-default" type="submit" style="padding:6px 20px;">查询</button>
			      </div>
            </form>
        </div>
        
        <div class="col-sm-3 text-right">
	      	 <a href="addVcodeForm.htm" class="btn btn-default" data-placement="top" data-toggle="tooltip" data-original-title="添加">
	         	<i class="fa fa-plus"></i>
	         </a>
	         <a id="delVcode" href="javascript:;" class="btn btn-default" type="button" data-placement="top" data-toggle="tooltip" data-original-title="删除">
	         	<i class="fa fa-trash-o"></i>
	         </a>
        </div>
        </div>
	</section>

    <!-- 信息删除确认 -->
    <div class="modal fade" id="delcfmModel">
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
                    <input type="hidden" id="arrayParam" value=""/>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <a href="javascript:void(0)" id="sureDelButton" class="btn btn-success" data-dismiss="modal">确定</a>
                </div>
            </div>
        </div>
    </div>
    
    
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
                    <th>广告商</th>
                    <th>业务名</th>
                    <th>类型</th>
                    <th>获取端口</th>
                    <th>获取关键字</th>
                    <th>状态</th>
                    <th class="text-center">创建时间</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                [#if list?exists]
                    [#list list as c]
                    <tr>
                        <td><input type="checkbox" name="ids" class="ids" value="${c.id}"></td>
                        <td>${c.id}</td>
                        <td>
                        [#if sps?exists]
                        	[#list sps as sp]
                        	[#if sp.id == c.spId]
                        		${sp.name}
                        		[#break]
                        	[/#if]
                        	[/#list]
                        [/#if]
                        </td>
                        <td>${c.vname}</td>
                        <td>
                        ${c.vtype}
                        </td>
                        <td>${c.getno}</td>
                        <td>${c.getkey}</td>
                        <td>${c.state}</td>
                        <td class="text-center">${c.createdTm?string('yyyy-MM-dd HH:mm:ss')}</td>
                        <td class="text-right">
                            <a href="updVcodeForm.htm?id=${c.id}">修改</a>
                        </td>
                    </tr>
                    [/#list]
                [/#if]
                </tbody>
            </table>
        </div>
    </section>
</section>

[@pager.footer page,'getVcode.htm' /]

<pagescript>
	<script src="js/select2/select2.min.js"></script>
    <script src="js/parsley/parsley.min.js"></script>
    <script src="js/parsley/parsley.extend.js"></script>
    <script>
    $(function () {
		$("#select2-option").select2({
	        placeholder: "选择广告商",
	        allowClear: true
	    });
    	$("#delCp").click(function(){
    		var delstr = '';
			$("input[name='ids']").each(  
				function(){  
					if($(this).prop('checked')){
						if(delstr==''){
							delstr += $(this).val();
						}else{
							delstr += '@' + $(this).val();
						}
					}
				}
			); 
			
			if(delstr != '' && confirm("确认删除？")){
				htmlobj=$.ajax({url:'delVcode.htm',data:{"ids":delstr},dataType:"text",async:false});
				if(htmlobj.responseText == '1'){
					window.location.href = 'getVcode.htm';
				} 
			}
    	});
    });
    </script>
</pagescript>