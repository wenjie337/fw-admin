[#ftl]
<head>
<link rel="stylesheet" href="js/fuelux/fuelux.css" type="text/css" />
<script>
</script>
</head>
<section id="content">
	<section class="vbox">
		<section class="scrollable padder">
			<ul class="breadcrumb no-border no-radius b-b b-light pull-in">
	            <li><a href="index.html"><i class="fa fa-home"></i> Home</a></li>
	            <li class="active">CACHE KEY</li>
	        </ul>
	        
	        
	        <section class="panel panel-default">
                <header class="panel-heading font-bold">
                  	添加
                </header>
                <div class="panel-body">
                  <form class="form-horizontal" method="post" data-validate="parsley" action="sys/addSysHKey.htm">
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-id-1">KEY</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="hessianKey">
                      </div>
                    </div>
                    <div class="line line-dashed line-lg pull-in"></div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-id-1">包名.类名</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="className" data-required="true">
                      </div>
                    </div>
                    <div class="line line-dashed line-lg pull-in"></div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-id-1">方法名</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="methodName" data-required="true">
                      </div>
                    </div>
                    
                    <div class="line line-dashed line-lg pull-in"></div>
                    <div class="form-group">
                      
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


<pagetitle>CACHE KEY</pagetitle>

<pagescript>
<script src="js/parsley/parsley.min.js"></script>
<script src="js/parsley/parsley.extend.js"></script>
<script src="js/fuelux/fuelux.js"></script>
<script>
function menuactive(){
	$("span:contains('CACHE KEY')").parent().attr('class','active');
	$("span:contains('CACHE KEY')").parent().parent().attr('class','active');
}
jQuery(function($) {
	menuactive();
});
</script>
</pagescript>