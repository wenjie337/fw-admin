[#ftl]
<head>
    <link rel="stylesheet" href="js/parsley/parsley.css" type="text/css" />
    <link rel="stylesheet" href="css/fileinput.css" type="text/css" />
    <script src="js/jquery.min.js"></script>
    <script src="js/fileinput.js" type="text/javascript"></script>
    <script src="js/fileinput_locale_zh.js" type="text/javascript"></script>
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
        <li class="active">产品列表</li>
    </ul>


    <section class="panel panel-default">
        <header class="panel-heading font-bold">
            添加
        </header>
        <div class="panel-body">
            <form class="form-horizontal" method="post" id="idForm" action="product/addProduct.htm" data-parsley-validate>
				<input type="hidden" name="bannerImg" id="bannerImg"/>
				<input type="hidden" name="detailImg" id="detailImg"/>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">产品名称<span class="text-danger">*</span></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="productName" required>
                    </div>
                </div>
                
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">图标</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="productImg" name="productImg">
                        <img id="pimg" src="" style="width:120px;height:120px;"/>
                        <a href="#modal-form" class="btn btn-success" data-toggle="modal">上传图片</a>
                    </div>
                </div>

                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">产品描述<span class="text-danger">*</span></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="productDesc">
                    </div>
                </div>

                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">单价（分）<span class="text-danger">*</span></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="price">
                    </div>
                </div>
                
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">参与人次<span class="text-danger">*</span></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="peopleCount">
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