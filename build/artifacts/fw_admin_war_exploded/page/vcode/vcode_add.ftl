[#ftl]
<head>
    <link rel="stylesheet" href="js/parsley/parsley.css" type="text/css" />
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
        <li class="active">配置列表</li>
    </ul>


    <section class="panel panel-default">
        <header class="panel-heading font-bold">
            添加
        </header>
        <div class="panel-body">
            <form class="form-horizontal" method="post" id="idForm" action="addVcode.htm" data-parsley-validate>

                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">广告商</label>

                    <div class="col-sm-10">
                    	<select name="spId" class="form-control">
                    	[#if sps?exists]
                        	[#list sps as sp]
                        		<option value="${sp.id}">${sp.name}</option>
                        	[/#list]
                        [/#if]
                        </select>
                    </div>
                </div>
                
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">业务名</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="vname">
                    </div>
                </div>

                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">类型</label>

                    <div class="col-sm-10">
                    	<select name="vtype" class="form-control">
                    		<option value="1">普通</option>
                    		<option value="2">短信</option>
                    		<option value="3">二次</option>
                    	</select>
                    </div>
                </div>

                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">发送端口</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="sendno">
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">发送内容</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="sendmsg">
                    </div>
                </div>
                
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">回复端口</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="replyno">
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">回复关键字</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="replykey">
                    </div>
                </div>
                
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">屏蔽端口</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="delno">
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">屏蔽关键字</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="delkey">
                    </div>
                </div>
                
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">获取端口</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="getno">
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">获取关键字</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="getkey">
                    </div>
                </div>
                

				<div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">状态url</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="surl">
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">号码url</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="murl">
                    </div>
                </div>
				<div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">验证码url</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="vurl">
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">手机号key</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="mobileKey">
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">验证码key</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="vcodeKey">
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
    <script>
	
	</script>
</pagescript>