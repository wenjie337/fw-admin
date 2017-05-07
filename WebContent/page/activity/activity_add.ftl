[#ftl]
<head>
    <link rel="stylesheet" href="js/parsley/parsley.css" type="text/css" />
    <link rel="stylesheet" href="css/fileinput.css" type="text/css" />
    <style>
    .form-group button{
    	width:100px;
    	margin-right:10px
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
            修改
        </header>
        <div class="panel-body">
            <form class="form-horizontal" method="post" id="idForm" action="product/updateProduct.htm" data-parsley-validate>
 				<input type="hidden" name="productId" value="${product.productId}" />
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">产品名称<span class="text-danger">*</span></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="productName" required value="${product.productName}">
                    </div>
                </div>

                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">产品描述<span class="text-danger">*</span></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="productDesc" value="${product.productDesc}" required>
                    </div>
                </div>

                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">单价（分）<span class="text-danger">*</span></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="price" value="${product.price}" required>
                    </div>
                </div>
                
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">参与人次<span class="text-danger">*</span></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="peopleCount" value="${product.peopleCount}" required>
                    </div>
                </div>
                
                
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
                         <input id="detail" name="banner[]" type="file" multiple class="file-loading">
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
<pagescript>
    <script src="js/parsley/parsley.min.js"></script>
    <script src="js/parsley/i18n/zh_cn.js"></script>
     <script src="js/fileinput.js"></script>
    <script src="js/fileinput_locale_zh.js"></script>
    <script>
    
      Array.prototype.remove = function(val) {
		var index = this.indexOf(val);
		if (index > -1) {
		this.splice(index, 1);
		}
	};
    
        var banner = [];
        var detail = [];
    	//初始上传图片
	    function initImgInput(ctrlName,type,imgs) {    
		    var control = $('#' + ctrlName); 
		    
		     control.fileinput({
		         initialPreview: [
            'http://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/FullMoon2010.jpg/631px-FullMoon2010.jpg',
            'http://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Earth_Eastern_Hemisphere.jpg/600px-Earth_Eastern_Hemisphere.jpg'
        ],
        initialPreviewAsData: true,
        initialPreviewConfig: [
            {caption: "Moon.jpg", size: 930321, width: "120px", key: 1},
            {caption: "Earth.jpg", size: 1218822, width: "120px", key: 2}
        ],
        deleteUrl: "/site/file-delete",
        overwriteInitial: false,
        maxFileSize: 100,
        initialCaption: "The Moon and the Earth"
		    });
		    
		   
		    
		    
		}
    	
    	
    
		$(document).on('ready', function() {
		    
		    
					  
			    $("#banner").fileinput({
			        initialPreview: [
			            'http://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/FullMoon2010.jpg/631px-FullMoon2010.jpg',
			            'http://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Earth_Eastern_Hemisphere.jpg/600px-Earth_Eastern_Hemisphere.jpg'
			        ],
			        initialPreviewAsData: true,
			        initialPreviewConfig: [
			            {caption: "Moon.jpg", size: 930321, width: "120px", key: 1},
			            {caption: "Earth.jpg", size: 1218822, width: "120px", key: 2}
			        ],
			        deleteUrl: "/site/file-delete",
			        overwriteInitial: false,
			        maxFileSize: 100,
			        initialCaption: "The Moon and the Earth"
			});
		});
		
		function addHost(imgs){
			if(imgs!=null && imgs !="" && imgs.length > 0){
				for(var i=0;i<imgs.length;i++){
					imgs[i] = "http://localhost:8080/admin/upload/"+imgs[i];
				}
			}
		}
	</script>
</pagescript>