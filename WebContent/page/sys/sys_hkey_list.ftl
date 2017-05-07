[#ftl]
[#import "page.ftl" as pager /]

<head>
<script>
function delSysHKey(){
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
		htmlobj=$.ajax({url:'sys/delSysHKey.htm',data:{"ids":delstr},dataType:"text",async:false});
		if(htmlobj.responseText == '1'){
			window.location.href = 'sys/getSysHKey.htm';
		} 
	}
}
</script>
</head>
<section id="content">
	<section class="vbox">
		<section class="scrollable padder">
			<ul class="breadcrumb no-border no-radius b-b b-light pull-in">
	            <li><a href="index.html"><i class="fa fa-home"></i> Home</a></li>
	            <li class="active">CACHE KEY</li>
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
					<form class="form-inline form-offset" method="post" id="postWhere" data-validate="parsley" action="sys/getSysHKey.htm">
					      <div class="input-group">
					         <input placeholder="KEY" class="form-control" size="30" type="text" name="hessianKey" id="hessianKey" value="${hessianKey}" />
					      </div>
					    
					      <div class="input-group">
					         <button class="btn btn-default" type="submit" style="padding:6px 20px;">查询</button>
					      </div>
	                </form>
                </div>
                
                <div class="col-sm-3 text-right">
			      	 <a href="sys/addSysHKeyForm.htm" class="btn btn-default" data-placement="left" data-toggle="tooltip" data-original-title="添加">
			         	<i class="fa fa-plus"></i>
			         </a>
			         <a class="btn btn-default" type="button" data-placement="left" data-toggle="tooltip" onclick="delSysHKey();" data-original-title="删除">
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
                        <th>KEY</th>
                        <th>包名.类名</th>
                        <th>方法名</th>
                        <th width="80"></th>
                      </tr>
                    </thead>
                    <tbody>
                    	[#if hkeys?exists]
                    		[#list hkeys as hkey]
                    			<tr>
			                        <td><input type="checkbox" name="ids" value="${hkey.id}"></td>
			                        <td>${hkey.id}</td>
			                        <td>${hkey.hessianKey}</td>
			                        <td>${hkey.className}</td>
			                        <td>${hkey.methodName}</td>
			                        <td>
			                          <a href="sys/getSysHKeyById.htm?keyId=${hkey.id}" class="active">修改</a>
			                        </td>
			                    </tr>
                    		[/#list]
                    	[/#if]
                    </tbody>
                  </table>
                </div>
            </section>
            
            <div id="tree" class="treeview col-sm-6"></div>
            <div id="tree2" class="treeview col-sm-6"></div>
            
		</section>
		
		[@pager.footer page,'sys/getSysHKey.htm' /]
        
	</section>
</section>

<pagetitle>CACHE KEY</pagetitle>

<pagescript>
<script>
function menuactive(){
	var obj = $("span:contains('CACHE KEY')");
	obj.parent().attr('class','active');
	obj.parent().parent().attr('class','active');
}
jQuery(function($) {
	menuactive();
});
</script>
</pagescript>