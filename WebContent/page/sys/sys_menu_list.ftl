[#ftl]
[#import "page.ftl" as pager /]

<head>
<script>
function delSysMenu(){
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
		htmlobj=$.ajax({url:'sys/delSysMenu.htm',data:{"ids":delstr},dataType:"text",async:false});
		if(htmlobj.responseText == '1'){
			window.location.href = 'sys/getSysMenu.htm';
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
	            <li class="active">系统资源</li>
	        </ul>
	        
			<section class="panel panel-default">
                <header class="panel-heading">
                  <a href="sys/addSysMenuForm.htm" class="btn btn-success">添加</a>
                  <button type="button" class="btn btn-success" onclick="delSysMenu();">删除</button>
                </header>
                
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
                        <th>资源名称</th>
                        <th>请求地址</th>
                        <th>资源类型</th>
                        <th>显示层级</th>
                        <th>父节点</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                    	[#if menus?exists]
                    		[#list menus as menu]
                    			<tr>
			                        <td><input type="checkbox" name="ids" value="${menu.id}"></td>
			                        <td>${menu.id}</td>
			                        <td>${menu.menuName}</td>
			                        <td>${menu.menuUrl}</td>
			                        <td>${menu.menuType}</td>
			                        <td>${menu.menuIndex}</td>
			                        <td>${menu.parentId}</td>
			                        <td>
			                          <a href="sys/getSysMenuById.htm?menuId=${menu.id}" class="active">修改</a>
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
		
		[@pager.footer page,'sys/getSysMenu.htm' /]
        
	</section>
</section>

<pagetitle>系统资源</pagetitle>

<pagescript>
<script>
function menuactive(){
	var obj = $("span:contains('系统资源')");
	obj.parent().attr('class','active');
	obj.parent().parent().attr('class','active');
}
jQuery(function($) {
	menuactive();
});
</script>
</pagescript>