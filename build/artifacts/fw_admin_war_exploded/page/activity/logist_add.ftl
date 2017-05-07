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
        <li class="active">物流信息</li>
    </ul>


    <section class="panel panel-default">
        <header class="panel-heading font-bold">
            添加
        </header>
        <div class="panel-body">
            <form class="form-horizontal" method="post" id="idForm" action="addLogistical.htm" data-parsley-validate>
 				<input type="hidden" name="activityId" value="${activityId}" />
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">物流公司<span class="text-danger">*</span></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="wayName" required >
                    </div>
                </div>

                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-2 control-label" for="input-id-1">物流单号<span class="text-danger">*</span></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="" name="wayBill"  required>
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
    
</pagescript>