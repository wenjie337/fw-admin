[#ftl]
[#import "page.ftl" as pager /]

<head>
<script>
function delSysUser(){
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
		htmlobj=$.ajax({url:'sys/delSysUser.htm',data:{"ids":delstr},dataType:"text",async:false});
		if(htmlobj.responseText == '1'){
			window.location.href = 'sys/getSysUser.htm';
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
	            <li class="active">系统用户</li>
	        </ul>
			<section class="panel panel-default">
                <header class="panel-heading">
                  <a href="#modal-form" class="btn btn-success" data-toggle="modal">添加</a>
                  <button type="button" class="btn btn-success" onclick="delSysUser();">删除</button>
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
                        <th>用户名</th>
                        <th>状态</th>
                        <th width="30"></th>
                      </tr>
                    </thead>
                    <tbody>
                    	[#if users?exists]
                    		[#list users as user]
                    			<tr>
			                        <td><input type="checkbox" name="ids" value="${user.id}"></td>
			                        <td>${user.id}</td>
			                        <td>${user.username}</td>
			                        <td>${user.userStatus}</td>
			                        <td>
			                          <a href="sys/getSysUserById.htm?userId=${user.id}" class="active"><i class="fa fa-check text-success text-active"></i><i class="fa fa-times text-danger text"></i></a>
			                        </td>
			                    </tr>
                    		[/#list]
                    	[/#if]
                    </tbody>
                  </table>
                </div>
            </section>
            
            <div class="modal fade" id="modal-form">
			<div class="modal-dialog">
			  <div class="modal-content">
			    <div class="modal-body">
			      <div class="row">
			        <div class="col-sm-12 b-r">
			          <h3 class="m-t-none m-b">添加用户</h3>
			          <p>请输入用户名密码.</p>
			          <form role="form" data-validate="parsley" action="sys/addSysUser.htm">
			            <div class="form-group">
			              <label>用户名</label>
			              <input name="username" type="textfield" class="form-control" data-required="true" placeholder="Username">
			            </div>
			            <div class="form-group">
			              <label>密码</label>
			              <input name="password" type="password" class="form-control" data-required="true" placeholder="Password">
			            </div>
			            <div class="checkbox m-t-lg">
			              <button type="submit" class="btn btn-sm btn-success pull-right text-uc m-t-n-xs"><strong>确定</strong></button>
			            </div>                
			          </form>
			        </div>
			      </div>          
			    </div>
			  </div><!-- /.modal-content -->
			</div><!-- /.modal-dialog -->
			</div>
            
            
		</section>
		
		[@pager.footer page,'sys/getSysUser.htm' /]
        
	</section>
</section>



<pagetitle>系统用户</pagetitle>

<pagescript>
<script src="js/parsley/parsley.min.js"></script>
<script src="js/parsley/parsley.extend.js"></script>
<script>
function menuactive(){
	$("span:contains('系统用户')").parent().attr('class','active');
	$("span:contains('系统用户')").parent().parent().attr('class','active');
}
jQuery(function($) {
	menuactive();
});
</script>
</pagescript>