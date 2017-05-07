[#ftl]
<head>
    <link rel="stylesheet" href="js/fuelux/fuelux.css" type="text/css"/>
    <link href="css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
    <script src="js/jquery.min.js"></script>
    <script src="js/fileinput.js" type="text/javascript"></script>
    <script src="js/fileinput_locale_zh.js" type="text/javascript"></script>
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
                    修改
                </header>
                <div class="panel-body">
                    <form class="form-horizontal" method="post" data-validate="parsley" action="updateGoodsInfo.htm">
                        [#--<input type="hidden" name="id" value="${goodsInfos.id}"/>--]

                        <div class="form-group" style="padding:15px">
                        	[#if goodsInfos?exists]
                        		<div class="row">
                        			<div class="col-sm-3"></div>
                        			<div class="col-sm-3 text-center">排序</div>
                        			<div class="col-sm-3 text-center">文件</div>
                        			<div class="col-sm-3 text-center">类型</div>
                        		</div>
                                [#list goodsInfos as infos]
                                	<div class="row">
                                		<div class="col-sm-3">
                                			<img style="max-width:50%;height:auto; " src="${configUrl}${infos.infoImg}"/>
                                            <div class="radio" style="float:right;">
                                                <label class="radio-custom">
                                                    <input type="radio" class="infoImg" value="#{infos.id}" [#if infos_index == 0]checked[/#if] onclick="setTitleFocus('${infos.id}')" name="infoImg" />
                                                    <i class="fa fa-circle-o"></i>
                                            </div>
                                		</div>
                                		
                                		<div class="col-sm-3">
                                			<input type="hidden" name="infos[${infos_index}].goodsId" value="${goodsId}" />
                                            <input type="hidden" name="infos[${infos_index}].id" value="${infos.id}" />
                                            <input type="hidden" name="infos[${infos_index}].oldImg" value="${infos.infoImg}" />
                                            <input type="hidden" id="infosiw${infos.id}" name="infos[${infos_index}].imgWidth" value="${infos.imgWidth}" />
                                            <input type="hidden" id="infosih${infos.id}" name="infos[${infos_index}].imgHeight" value="${infos.imgHeight}" />
                                            <input type="text" name="infos[${infos_index}].infoIndex" class="form-control infoIndex" value="${infos.infoIndex}" style="margin-top:9px;" />
                                		</div>
                                		
                                		<div class="col-sm-3">
                                            <input type="text" name="infos[${infos_index}].infoImg" class="npim form-control" readonly id="infosimg${infos.id}" value="${infos.infoImg}" style="margin-top:9px"/>
                                		</div>
                                		
                                		<div class="col-sm-3">
                                			<select name="infos[${infos_index}].infoType" class="form-control m-b" style="margin-top:9px">
                                                <option value="0" [#if infos.infoType==0]selected[/#if]>banner图</option>
                                                <option value="1" [#if infos.infoType==1]selected[/#if]>图文介绍</option>
                                            </select>
                                		</div>
                                	</div>
                                	<div class="line line-dashed pull-in"></div>
                                [/#list]
                            [/#if]
                        </div>                
                        
                        [#if (goodsInfos?exists) && goodsInfos?size>0]
                            <div class="form-group">
                                <div class="col-sm-12 col-sm-offset-2">
                                    <a href="addGoodsInfoForm.htm?goodsId=${goodsId}" class="btn btn-success" data-toggle="modal">添加商品</a>&nbsp
                                    <a href="#modal-form" class="btn btn-success" data-toggle="modal">上传图片</a>&nbsp
                                    <button type="button" class="btn btn-default" onclick="javascript:history.go(-1);">取消
                                    </button>
                                    <button type="submit" id="sureButton" class="btn btn-primary">确定</button>
                                    <button type="button" id="delButton" class="btn btn-danger">删除</button>
                                    <button type="button" id="emptyButton" class="btn btn-danger">清空</button>
                                </div>
                            </div>
                        [#else]
                            <div class="line line-dashed line-lg pull-in"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <a href="addGoodsInfoForm.htm?goodsId=${goodsId}" class="btn btn-success" data-toggle="modal">添加商品</a>&nbsp
                                    <button type="button" class="btn btn-default" onclick="javascript:history.go(-1);">取消
                                    </button>
                                </div>
                            </div>
                        [/#if]
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
                                            <input id="file-1" name="imgfile" type="file" class="file"
                                                   data-upload-url="uploadGoodsInfoImg.htm">
                                        </div>
                                    </from>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>

    </section>
</section>

<script>
    var $el = $('#file-1'), initPlugin = function () {
        var infoId = $("input[name='infoImg']:checked").val();
        $el.fileinput({
            language: 'zh',
            uploadUrl: 'uploadGoodsInfoImg.htm',
            allowedFileExtensions: ['jpg', 'png', 'gif'],
            minFileCount: 1,
            validateInitialCount: true,
            uploadExtraData: {id: infoId}
        }).off('fileuploaded').on('fileuploaded', function (event, data, previewId, index) {
            var form = data.form, files = data.files, extra = data.extra,
                    response = data.response, reader = data.reader;
            $('#infosimg'+infoId).val(response.imgpath);
            $('#infosiw'+infoId).val(response.imgwidth);
            $('#infosih'+infoId).val(response.imgheight);
        });
    };

    initPlugin();

    $(".infoImg").on('click', function() {
        var nid = $("input[name='infoImg']:checked").val();
        $el.fileinput('refresh', {uploadExtraData:{id:nid}})
                .off('fileuploaded').on('fileuploaded', function(event, data, previewId, index){
                    var form = data.form, files = data.files, extra = data.extra,
                            response = data.response, reader = data.reader;
                    $('#infosimg'+response.id).val(response.imgpath);
                    $('#infosiw'+response.id).val(response.imgwidth);
            		$('#infosih'+response.id).val(response.imgheight);
                });
    });

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

        $("#delButton").click(function(){
            var array = new Array();
            $(".infoImg").each(function(){
                if( $(this).is(':checked') ){
                    array.push($(this).val());
                }
            });
            if (array.length == 0) {
                alert("请选择需要删除的选项!");
                return;
            }
            $.post('delGoodsInfo.htm', {'array': array}, function (data) {
                if(data.status == 'success'){
                    window.location.reload();
                    alert("删除成功!");
                }else{
                    alert(data.msg);
                }
            },'json');
        });

        $("#emptyButton").click(function(){
            var array = new Array();
            $(".infoImg").each(function(){
                array.push($(this).val());
            });
            if (array.length == 0) {
                alert("请选择需要删除的选项!");
                return;
            }
            $.post('delGoodsInfo.htm', {'array': array}, function (data) {
                if(data.status == 'success'){
                    window.location.reload();
                    alert("删除成功!");
                }else{
                    alert(data.msg);
                }
            },'json');
        });

    });

    function setTitleFocus(id){
        $('.npim').css('border-color','#d9d9d9');
        $('#infosimg'+id).css('border-color','#4cc0c1');
    }

    jQuery(function($) {
        var id = $("input[name='infoImg']:checked").val();
        setTitleFocus(id);
    });
</script>

<pagetitle>商品详情</pagetitle>

<pagescript>
    <script src="js/parsley/parsley.min.js"></script>
    <script src="js/parsley/parsley.extend.js"></script>
    <script src="js/fuelux/fuelux.js"></script>
</pagescript>