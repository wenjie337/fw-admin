[#ftl]
<head>
    <link rel="stylesheet" href="js/fuelux/fuelux.css" type="text/css"/>
    <link href="css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
    <script src="js/jquery.min.js"></script>
    <script src="js/fileinput.js" type="text/javascript"></script>
    <script src="js/fileinput_locale_zh.js" type="text/javascript"></script>
    <style>

        .panel img {
            max-width: 80px;
            height: auto;
        }
    </style>
</head>
<section id="content">
    <section class="vbox">
        <section class="scrollable padder">
            <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
                <li><a href="index.htm"><i class="fa fa-home"></i> Home</a></li>
                <li class="active">商品详情</li>
            </ul>


            <section class="panel panel-default">
                <header class="panel-heading font-bold">
                    添加
                </header>
                <div class="panel-body">
                    <form class="form-horizontal" method="post" data-validate="parsley" id="goodsInfoForm" action="addGoodsInfo.htm">
                        <div class="form-group">
                            <label class="col-sm-2 control-label" for="input-id-1">商品名称</label>

                            <div class="col-sm-10">
                                <input type="text" class="form-control" readonly name="goodsName" value="${goodsById.productName}">
                            </div>
                        </div>
                        
                        <input type="hidden" name="goodsId" value="${goodsById.productId}"/>
                        
                        <div class="form-group" style="padding:15px">
                        	<div class="row">
                    			<div class="col-sm-3"></div>
                    			<div class="col-sm-3 text-center">排序</div>
                    			<div class="col-sm-3 text-center">文件</div>
                    			<div class="col-sm-3 text-center">类型</div>
                    		</div>
                    		
                    		<div id="infolist">
                    		<div class="row">
                        		<div class="col-sm-3">
                        			<img style="max-width:50%;height:auto; " src=""/>
                        		</div>
                        		
                        		<div class="col-sm-3">
                                    <input type="text" name="infoIndex" class="form-control infoIndex" style="margin-top:9px;" />
                        		</div>
                        		
                        		<div class="col-sm-3">
                                    <input type="text" name="infoImg" class="npim form-control" readonly id="infoImg" style="margin-top:9px"/>
                        		</div>
                        		
                        		<div class="col-sm-3">
                        			<select name="infoType" class="form-control m-b" style="margin-top:9px">
                                        <option value="0">banner图</option>
                                        <option value="1">图文介绍</option>
                                    </select>
                        		</div>
                        	</div>
                        	<div class="line line-dashed pull-in"></div>
                        	</div>
                        </div>

                        
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <a href="#modal-form" class="btn btn-success" data-toggle="modal">上传图片</a>&nbsp
                                <button type="button" class="btn btn-default" onclick="javascript:history.go(-1);">取消
                                </button>
                                <button type="button" id="sureButton" class="btn btn-primary">确定</button>
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

                                    <form enctype="multipart/form-data">
                                        <div class="form-group">
                                            <input id="file-1" name="imgfile" multiple type="file" class="file"
                                                   data-upload-url="uploadGoodsInfoImg.htm">
                                        </div>
                                    </from>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>

        </section>

    </section>
</section>

<script>
    var count=0;
    var $el = $('#file-1'), initPlugin = function () {
        $el.fileinput({
            language: 'zh',
            uploadUrl: 'uploadGoodsInfoImg.htm',
            allowedFileExtensions: ['jpg', 'png', 'gif'],
            minFileCount: 1,
            uploadExtraData: {id: '0'}
        }).off('fileuploaded').on('fileuploaded', function (event, data, previewId, index) {
            var form = data.form, files = data.files, extra = data.extra,
                    response = data.response, reader = data.reader;
            count++;
            /*
            if( count == 1 ){
                $('#index_div').empty();$('#img_div').empty();$('#type_div').empty();
            }
            $('#minImg_div').append("<div><img src='http://120.25.2.230:8181"+response.imgpath+"' style='margin-top: 17px; max-width:45px; height: auto;'></div>");
            $('#index_div').append("<input type='text' class='form-control infoIndex' id='infoIndex_"+count+"' name='infos["+(count-1)+"].infoIndex' value='"+response.index+"' style='margin-top:15px;' />");
            $('#img_div').append("<input type='text' class='npim form-control infoImg' readonly id='infoImg_"+count+"' name='infos["+(count-1)+"].infoImg' style='margin-top:15px'/>");
            
            if(response.imgtype==0){
            	$('#type_div').append("<select name='infos["+(count-1)+"].infoType'  class='form-control m-b' style='margin-top:15px'>"
                        +"<option value='0' selected>banner图</option>"
                        +"<option value='1' >图文介绍</option>"
                        +"</select>");
            }else{
            	$('#type_div').append("<select name='infos["+(count-1)+"].infoType'  class='form-control m-b' style='margin-top:15px'>"
                        +"<option value='0' >banner图</option>"
                        +"<option value='1' selected>图文介绍</option>"
                        +"</select>");
            }*/
            
            if( count == 1 ){
                $('#infolist').empty();
            }
            
            var infoRow = '<div class="row">';
            infoRow = infoRow + '<div class="col-sm-3 text-right"><img style="max-width:30%;height:auto; " src="'+response.configUrl+response.imgpath+'"/></div>';
            infoRow = infoRow + '<div class="col-sm-3"><input type="text" id="infoIndex_"'+count+' name="infos['+(count-1)+'].infoIndex" value="'+response.index+'" class="form-control infoIndex" style="margin-top:9px;" /></div>';
            infoRow = infoRow + '<div class="col-sm-3"><input type="text" id="infoImg_"'+count+' name="infos['+(count-1)+'].infoImg" value="'+response.imgpath+'" class="npim form-control" readonly id="infoImg" style="margin-top:9px"/></div>';
            if(response.imgtype==0){
            	infoRow = infoRow + '<div class="col-sm-3"><select name="infos['+(count-1)+'].infoType" class="form-control m-b" style="margin-top:9px">'
            					  + '<option value="0" selected>banner图</option>'
                        		  + '<option value="1" >图文介绍</option>'
                                  + '</select>';
            }else{
            	infoRow = infoRow + '<div class="col-sm-3"><select name="infos['+(count-1)+'].infoType" class="form-control m-b" style="margin-top:9px">'
            					  + '<option value="0">banner图</option>'
                        		  + '<option value="1" selected>图文介绍</option>'
                                  + '</select>';
            }
            infoRow = infoRow + '</div>';
            infoRow = infoRow + '<div class="line line-dashed pull-in"></div>';
            infoRow = infoRow + '<input type="hidden" name="infos['+(count-1)+'].imgWidth" value="'+response.imgwidth+'" />';
            infoRow = infoRow + '<input type="hidden" name="infos['+(count-1)+'].imgHeight" value="'+response.imgheight+'" />';
            
            $('#infolist').append(infoRow);
            
            
            //$('#infoImg_'+count).val(response.imgpath);
        });
    };

    initPlugin();

    $(function(){
        //只能输入数字
        $(".infoIndex").bind("input propertychange", function() {
            if(""!=this.value){
                var str = this.value.replace(/(^\s*)|(\s*$)/g, "");
                if(this.value != str )
                    this.value = str;
            }
            if (isNaN(Number(this.value))) {
                this.value = ($.trim(this.value)).replace(/[\D]/, '');
                this.focus();
            }
        });

        $('#sureButton').click(function(){
            var indexFlag = false, imgFlag = false;
            $('.infoIndex').each(function(){
                if( $(this).val() == null || $(this).val() == '' ){
                    indexFlag = true;
                }
            });
            $('.infoImg').each(function(){
                if( $(this).val() == null || $(this).val() == '' ){
                    imgFlag = true;
                }
            });
            if( indexFlag || imgFlag ){
                alert("排序不能为空或者请先上传图片！");
                return;
            }
            $('#goodsInfoForm').submit();
        });

    });

</script>

<pagetitle>商品详情</pagetitle>

<pagescript>
    <script src="js/parsley/parsley.min.js"></script>
    <script src="js/parsley/parsley.extend.js"></script>
    <script src="js/fuelux/fuelux.js"></script>
</pagescript>