[#ftl]
<head>
<link rel="stylesheet" href="js/fuelux/fuelux.css" type="text/css" />
</head>
<section id="content">
	<section class="vbox">
		<section class="scrollable padder">
			<ul class="breadcrumb no-border no-radius b-b b-light pull-in">
	            <li><a href="index.html"><i class="fa fa-home"></i> Home</a></li>
	            <li class="active">系统用户</li>
	        </ul>
	        
	        
	        <section class="panel panel-default">
                <header class="panel-heading font-bold">
                  Form elements
                </header>
                <div class="panel-body">
                  <form class="form-horizontal" method="post" action="sys/updSysUser.htm">
                  	<input type="hidden" name="id" value="${sysuser.id}" />
                  	<input type="hidden" name="username" value="${sysuser.username}" />
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-id-1">用户名</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" value="${sysuser.username}" disabled>
                      </div>
                    </div>
                    <div class="line line-dashed line-lg pull-in"></div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-id-1">密码</label>
                      <div class="col-sm-10">
                        <input type="password" class="form-control" name="password" >
                      </div>
                    </div>
                    <div class="line line-dashed line-lg pull-in"></div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-id-1">状态</label>
                      <div class="col-sm-10">
                        <div class="radio">
                          <label class="radio-custom">
                            <input type="radio" name="userStatus" value="0" [#if sysuser?exists && sysuser.userStatus==0]checked="checked"[/#if]>
                            <i class="fa fa-circle-o"></i>
                            	正常
                          </label>
                        </div>
                        <div class="radio">
                          <label class="radio-custom">
                            <input type="radio" name="userStatus" value="1" [#if sysuser?exists && sysuser.userStatus!=0]checked="checked"[/#if]>
                            <i class="fa fa-circle-o"></i>
                            	暂停
                          </label>
                        </div>
                      </div>
                    </div>

                    
                    <div class="line line-dashed line-lg pull-in"></div>
                    <div class="form-group">
                      <div class="col-sm-4 col-sm-offset-2">
                        <button type="button" class="btn btn-default" onclick="javascript:history.go(-1);">取消</button>
                        <button type="submit" class="btn btn-primary">确定</button>
                      </div>
                    </div>
                  </form>
                </div>
              </section>
	        
			
		</section>
		
	</section>
</section>


<pagetitle>系统用户</pagetitle>

<pagescript>
<script src="js/fuelux/fuelux.js"></script>
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