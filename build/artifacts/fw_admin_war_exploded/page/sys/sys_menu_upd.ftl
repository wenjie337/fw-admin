[#ftl]
<head>
<link rel="stylesheet" href="js/fuelux/fuelux.css" type="text/css" />
<script>
function setTreeCode(obj){
	var v = obj.options[obj.selectedIndex].text;
	v = v.substring(v.indexOf("(")+1,v.indexOf(")"));
	
	$('#idTreeCode').val(v+"-");
}
</script>
</head>
<section id="content">
	<section class="vbox">
		<section class="scrollable padder">
			<ul class="breadcrumb no-border no-radius b-b b-light pull-in">
	            <li><a href="index.html"><i class="fa fa-home"></i> Home</a></li>
	            <li class="active">系统资源</li>
	        </ul>
	        
	        
	        <section class="panel panel-default">
                <header class="panel-heading font-bold">
                  	修改
                </header>
                <div class="panel-body">
                  <form class="form-horizontal" method="post" data-validate="parsley" action="sys/updSysMenu.htm">
                    <input type="hidden" name="id" value="${sysmenu.id}" />
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-id-1">资源名称</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="menuName" value="${sysmenu.menuName}">
                      </div>
                    </div>
                    <div class="line line-dashed line-lg pull-in"></div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-id-1">请求地址</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="menuUrl" data-required="true" value="${sysmenu.menuUrl}">
                      </div>
                    </div>
                    <div class="line line-dashed line-lg pull-in"></div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-id-1">资源类型</label>
                      <div class="col-sm-2">
                        <div class="radio">
                          <label class="radio-custom">
                            <input type="radio" name="menuType" value="1" [#if sysmenu?exists && sysmenu.menuType==1]checked[/#if]>
                            <i class="fa fa-circle-o"></i>
                            	目录菜单
                          </label>
                        </div>
                        <div class="radio">
                          <label class="radio-custom">
                            <input type="radio" name="menuType" value="2" [#if sysmenu?exists && sysmenu.menuType==2]checked[/#if]>
                            <i class="fa fa-circle-o"></i>
                            	请求菜单
                          </label>
                        </div>
                        <div class="radio">
                          <label class="radio-custom">
                            <input type="radio" name="menuType" value="0" [#if sysmenu?exists && sysmenu.menuType==0]checked[/#if]>
                            <i class="fa fa-circle-o"></i>
                            	请求地址
                          </label>
                        </div>
                      </div>
                      
                      <label class="col-sm-2 control-label" for="input-id-1">是否展开</label>
                      <div class="col-sm-6">
                        <div class="radio">
                          <label class="radio-custom">
                            <input type="radio" name="expand" value="0" [#if sysmenu?exists && sysmenu.expand==0]checked[/#if]>
                            <i class="fa fa-circle-o"></i>
                            	否
                          </label>
                        </div>
                        <div class="radio">
                          <label class="radio-custom">
                            <input type="radio" name="expand" value="1" [#if sysmenu?exists && sysmenu.expand==1]checked[/#if]>
                            <i class="fa fa-circle-o"></i>
                            	是
                          </label>
                        </div>
                      </div>
                    </div>
                    
                    <div class="line line-dashed line-lg pull-in"></div>
                    <div class="form-group">
                      
                    </div>
                    
                    <div class="line line-dashed line-lg pull-in"></div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-id-1">显示层级</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="menuIndex" value="${sysmenu.menuIndex}">
                      </div>
                    </div>
                    <div class="line line-dashed line-lg pull-in"></div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-id-1">菜单图标</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control" name="menuIcon" value="${sysmenu.menuIcon}">
                      </div>
                    </div>
                    <div class="line line-dashed line-lg pull-in"></div>
                    <div class="form-group">
                      <label class="col-sm-2 control-label" for="input-id-1">父节点</label>
                      <div class="col-sm-2">
                        <select name="parentId" class="form-control m-b" onchange="setTreeCode(this)"> 
                          <option value='0'></option>
                          [#if menus?exists]
                          	[#list menus as menu]
                          		[#if menu.menuType>0]
                          		<option value='${menu.id}' [#if sysmenu?exists && sysmenu.parentId==menu.id]selected[/#if]>${menu.menuName}(${menu.treeCode})</option>
                          		[/#if]
                          	[/#list]
                          [/#if]
                        </select>
                      </div>
                      <label class="col-sm-2 control-label" for="input-id-1">TreeCode</label>
                      <div class="col-sm-6">
                        <input type="text" class="form-control" id="idTreeCode" name="treeCode" value="${sysmenu.treeCode}">
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


<pagetitle>系统资源</pagetitle>

<pagescript>
<script src="js/parsley/parsley.min.js"></script>
<script src="js/parsley/parsley.extend.js"></script>
<script src="js/fuelux/fuelux.js"></script>
<script>
function menuactive(){
	$("span:contains('系统资源')").parent().attr('class','active');
	$("span:contains('系统资源')").parent().parent().attr('class','active');
}
jQuery(function($) {
	menuactive();
});
</script>
</pagescript>