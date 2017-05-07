[#ftl]
[#import "page.ftl" as pager /]

<section id="content">
	<section class="vbox">
		<section class="scrollable padder">
			<ul class="breadcrumb no-border no-radius b-b b-light pull-in">
	            <li><a href="index.html"><i class="fa fa-home"></i> Home</a></li>
	            <li class="active">系统角色</li>
	        </ul>
	        
			<section class="panel panel-default">
                <header class="panel-heading">
                  <a href="#modal-form" class="btn btn-success" data-toggle="modal">添加</a>
                  <button type="button" class="btn btn-success" onclick="delSysRole();">删除</button>
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
                        <th>角色名</th>
                        <th>描述</th>
                        <th width="30"></th>
                      </tr>
                    </thead>
                    <tbody>
                    	[#if roles?exists]
                    		[#list roles as role]
                    			<tr>
			                        <td><input type="checkbox" name="post[]" value="2"></td>
			                        <td>${role.id}</td>
			                        <td>${role.roleName}</td>
			                        <td>${role.roleDesc}</td>
			                        <td>
			                          <a href="#" class="active" data-toggle="class"><i class="fa fa-check text-success text-active"></i><i class="fa fa-times text-danger text"></i></a>
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
		
		[@pager.footer page,'sys/getSysRole.htm' /]
        
	</section>
</section>

<pagetitle>系统角色</pagetitle>

<pagescript>
<script>
function menuactive(){
	var obj = $("span:contains('系统角色')");
	obj.parent().attr('class','active');
	obj.parent().parent().attr('class','active');
}
jQuery(function($) {
	menuactive();
});
</script>
</pagescript>