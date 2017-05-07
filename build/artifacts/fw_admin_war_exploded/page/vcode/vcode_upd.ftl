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
            修改
        </header>
        <div class="panel-body">
            <form class="form-horizontal" method="post" id="idForm" action="updVcode.htm" data-parsley-validate>
				<input type="hidden" name="id" value="${vcode.id}" >
				
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">广告商</label>

                    <div class="col-sm-10">
                    	<select name="spId" class="form-control">
                    	[#if sps?exists]
                        	[#list sps as sp]
                        		<option value="${sp.id}" [#if vcode.spId?exists && vcode.spId == sp.id]selected[/#if]>${sp.name}</option>
                        	[/#list]
                        [/#if]
                        </select>
                    </div>
                </div>
                
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">业务名</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="vname" value="${vcode.vname}">
                    </div>
                </div>

                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">类型</label>

                    <div class="col-sm-10">
                    	<select name="vtype" class="form-control">
                    		<option value="1" [#if vcode.vtype?exists && vcode.vtype == 1]selected[/#if]>普通</option>
                    		<option value="2" [#if vcode.vtype?exists && vcode.vtype == 2]selected[/#if]>短信</option>
                    		<option value="3" [#if vcode.vtype?exists && vcode.vtype == 3]selected[/#if]>二次</option>
                    	</select>
                    </div>
                </div>

                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">发送端口</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="sendno" value="${vcode.sendno}">
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">发送内容</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="sendmsg" value="${vcode.sendmsg}">
                    </div>
                </div>
                
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">回复端口</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="replyno" value="${vcode.replyno}">
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">回复关键字</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="replykey" value="${vcode.replykey}">
                    </div>
                </div>
                
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">屏蔽端口</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="delno" value="${vcode.delno}">
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">屏蔽关键字</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="delkey" value="${vcode.delkey}">
                    </div>
                </div>
                
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">获取端口</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="getno" value="${vcode.getno}">
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">获取关键字</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="getkey" value="${vcode.getkey}">
                    </div>
                </div>
                

				<div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">状态url</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="surl" value="${vcode.surl}">
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">号码url</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="murl" value="${vcode.murl}">
                    </div>
                </div>
				<div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">验证码url</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="vurl" value="${vcode.vurl}">
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">手机号key</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="mobileKey" value="${vcode.mobileKey}">
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">验证码key</label>

                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="vcodeKey" value="${vcode.vcodeKey}">
                    </div>
                </div>
                
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">状态</label>

                    <div class="col-sm-10">
                    	<select name="state">
                    		<option value="0" [#if vcode.state?exists && vcode.state == 0]selected[/#if]>正常</option>
                    		<option value="1" [#if vcode.state?exists && vcode.state == 1]selected[/#if]>暂停</option>
                    	</select>
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