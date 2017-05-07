[#ftl]
<head>
    <link rel="stylesheet" href="js/parsley/parsley.css" type="text/css" />
    <link rel="stylesheet" href="css/fileinput.css" type="text/css" />
    <script src="js/jquery.min.js"></script>
    <script src="js/fileinput.js" type="text/javascript"></script>
    <script src="js/fileinput_locale_zh.js" type="text/javascript"></script>
    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
	<!-- (Optional) Latest compiled and minified JavaScript translation files -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/i18n/defaults-*.min.js"></script>
    <style>
    .form-group button{
    	width:100px;
    	margin-right:10px
    }
    .file-drop-zone-title {
    color: #aaa;
    font-size: 20px;
    padding: 30px;
}
    </style>
</head>
<section class="scrollable padder">
    <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
        <li><a href="index.htm"><i class="fa fa-home"></i> Home</a></li>
        <li class="active">任务列表</li>
    </ul>


    <section class="panel panel-default">
        <header class="panel-heading font-bold">
            添加
        </header>
        <div class="panel-body">
            <form class="form-horizontal" method="post" id="idForm" action="task/addTask.htm" data-parsley-validate>
				<input type="hidden" name="bannerImg" id="bannerImg"/>
				<input type="hidden" name="detailImg" id="detailImg"/>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">任务名称<span class="text-danger">*</span></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="taskName" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">发布目标<span class="text-danger">*</span></label>
                     <div class="col-sm-10">
                        <select class="form-control" name="source">
	                    	<option value="1">58同城</option>
	                    	<option value="2">赶集网</option>
	                    	<option value="3">百姓网</option>
	                    </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">待发送的帐号<span class="text-danger">*</span></label>
                     <div class="col-sm-10">
                        <select id="userIds" name="userIds" class="selectpicker show-tick form-control" multiple data-live-search="false">
                        [#if userList?exists]
                   			[#list userList as c]
	                    		<option value="${c.userId}">${c.userName}</option>
	                    	[/#list]
	                    [/#if]
	                    </select>
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">发送地址<span class="text-danger">*</span></label>
                     <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="sendUrl" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">小区名称<span class="text-danger">*</span></label>
                     <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="xiaoqu" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">房屋户型<span class="text-danger">*</span></label>
                    <div class="col-sm-1">
                     	<div class="input-group">
					      <input type="text" class="form-control" id="huxingshi" name="huxingshi" aria-describedby="inputGroupSuccess3Status">
					      <span class="input-group-addon">室</span>
					    </div>
                    </div>
                    <div class="col-sm-1">
                     	<div class="input-group">
					      <input type="text" class="form-control" id="huxingting" name="huxingting" aria-describedby="inputGroupSuccess3Status">
					      <span class="input-group-addon">厅</span>
					    </div>
                    </div>
                    <div class="col-sm-1">
                     	<div class="input-group">
					      <input type="text" class="form-control" id="huxingwei" name="huxingwei" aria-describedby="inputGroupSuccess3Status">
					      <span class="input-group-addon">卫</span>
					    </div>
                    </div>
                    <div class="col-sm-2">
                     	<div class="input-group">
                     	  <span class="input-group-addon">共</span>
					      <input type="text" class="form-control" id="area" name="area" aria-describedby="inputGroupSuccess3Status">
					      <span class="input-group-addon">平米</span>
					    </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">楼层<span class="text-danger">*</span></label>
                    <div class="col-sm-2">
                     	<div class="input-group">
                     	  <span class="input-group-addon">第</span>
					      <input type="text" class="form-control" id="floor" name="floor" aria-describedby="inputGroupSuccess3Status">
					      <span class="input-group-addon">层</span>
					    </div>
                    </div>
                    <div class="col-sm-2">
                     	<div class="input-group">
                     	  <span class="input-group-addon">共</span>
					      <input type="text" class="form-control" id="zonglouceng" name="zonglouceng" aria-describedby="inputGroupSuccess3Status">
					      <span class="input-group-addon">层</span>
					    </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">租金<span class="text-danger">*</span></label>
                    <div class="col-sm-2">
                     	<div class="input-group">
					      <input type="text" class="form-control" id="minPrice" name="minPrice" aria-describedby="inputGroupSuccess3Status">
					      <span class="input-group-addon">元/月</span>
					    </div>
                    </div>
                    <div class="col-sm-1">
                    	<select class="form-control" name="fukuanfangshi">
	                    	<option value="0">面议</option>
	                    	<option value="1">押一付三</option>
	                    	<option value="2">押一付二</option>
	                    	<option value="3">押一付一</option>
	                    	<option value="4">押二付二</option>
	                    	<option value="5">押二付三</option>
	                    	<option value="6">半年付</option>
	                    	<option value="7">年付</option>
	                    </select>
                    </div>
                </div>
                 <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">标题<span class="text-danger">*</span></label>
                     <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="title" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">房源描述<span class="text-danger">*</span></label>
                     <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="roomDesc" required>
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">图标</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="roomImg" name="roomImg">
                        <img id="pimg" src="" style="width:120px;height:120px;"/>
                        <a href="#modal-form" class="btn btn-success" data-toggle="modal">上传图片</a>
                    </div>
                </div>
				<div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">联系人<span class="text-danger">*</span></label>
                     <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="goblianxiren" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">联系电话<span class="text-danger">*</span></label>
                     <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="phone" required>
                    </div>
                </div>
                
                
               
                [#--
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">banner图片<span class="text-danger">*</span></label>
                    <div class="col-sm-10">
                         <input id="banner" name="banner" type="file" multiple class="file-loading">
                    </div>
                </div>
                
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">详情图片<span class="text-danger">*</span></label>
                    <div class="col-sm-10">
                         <input id="detail" name="banner" type="file" multiple class="file-loading">
                    </div>
                </div>
                --]
                
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
    <div class="modal fade" id="modal-form">
	 <div class="modal-dialog">
	  <div class="modal-content">
	    <div class="modal-body">
	      <div class="row">
	        <div class="col-sm-12 b-r">
	          <h3 class="m-t-none m-b">上传图片</h3>
	          <p>请选择需要上传的图片.</p>
		          <div class="form-group">
		              <input id="file-1" name="banner" type="file" class="file">
		          </div>
	        </div>
	      </div>          
	    </div>
	  </div><!-- /.modal-content -->
	 </div><!-- /.modal-dialog -->
	 </div>
</section>

<script>
$('#file-1').fileinput({
    language: 'zh',
    uploadUrl: 'addImg.htm',
    allowedFileExtensions : ['jpg', 'png','gif'],
    uploadExtraData:{id:'0'}
});

$('#file-1').on('fileuploaderror', function(event, data, previewId, index) {
    var form = data.form, files = data.files, extra = data.extra,
        response = data.response, reader = data.reader;
});

$('#file-1').on('fileuploaded', function(event, data, previewId, index) {
    var form = data.form, files = data.files, extra = data.extra,
        response = data.response, reader = data.reader;
    $('#productImg').val(response.fileName);
});

</script>
<pagescript>
    <script src="js/parsley/parsley.min.js"></script>
    <script src="js/parsley/i18n/zh_cn.js"></script>
    <script>
    
        Array.prototype.remove = function(val) {
			var index = this.indexOf(val);
			if (index > -1) {
			this.splice(index, 1);
			}
		};
    
    /*
        var banner = [];
        var detail = [];
    	//初始上传图片
	    function initImgInput(ctrlName,type) {    
		    var control = $('#' + ctrlName); 
		    
		    var fileinput = control.fileinput({
		        language: 'zh', //设置语言
		        uploadUrl: "addImg.htm", //上传的地址
		        allowedFileExtensions : ['jpg', 'png','gif'],//接收的文件后缀
		        browseClass: "btn btn-primary", //按钮样式  
		        showCaption: false,//是否显示标题           
		        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>", 
		    });
		    
		    fileinput.off('fileuploaded').on('fileuploaded', function(event, data, previewId, index) {
		       $("#"+previewId).attr("dd",data.response.fileName); 
		       if(type == "1"){
		       		banner.push(data.response.fileName)
		       		$("#bannerImg").val(banner);
		       }else{
		       		detail.push(data.response.fileName)
		       		$("#detailImg").val(detail);
		       }
		    });
		    fileinput.off('filesuccessremove').on('filesuccessremove', function(event,uploadId) {
			      var fileName = $("#"+uploadId).attr("dd");
			      if(type == "1"){
			      	  banner.remove(fileName);
			      	  $("#bannerImg").val(banner);
			      }else{
			      	  detail.remove(fileName);
			      	  $("#detailImg").val(detail);
			      }
		    });
		    
		    
		}
    	
    	
    	
    	
    
		$(document).on('ready', function() {
		    initImgInput("banner","1");
		    initImgInput("detail","2");
		});
		
		*/
		
		
	</script>
</pagescript>