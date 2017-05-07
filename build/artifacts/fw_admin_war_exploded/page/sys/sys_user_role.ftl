[#ftl]
<head>
<style id="treeview-checkable-style" type="text/css">
 .treeview .list-group-item{cursor:pointer}.treeview span.indent{margin-left:10px;margin-right:10px}.treeview span.icon{width:12px;margin-right:5px}.treeview .node-disabled{color:silver;cursor:not-allowed}.node-treeview-checkable{}.node-treeview-checkable:not(.node-disabled):hover{background-color:#F5F5F5;} 
 .panel-body {
	 padding: 5px;
 }
</style>
</head>
<section id="content">
	<section class="vbox">
		<section class="scrollable padder">
			<ul class="breadcrumb no-border no-radius b-b b-light pull-in">
	            <li><a href="index.html"><i class="fa fa-home"></i> Home</a></li>
	            <li class="active">用户角色</li>
	        </ul>
	        
            <div class="col-sm-6">
		        <section class="panel panel-default">
					<header class="panel-heading font-bold">用户</header>
		        	<div id="tree" class="treeview"></div>
		        </section>
            </div>
            <div class="col-sm-6">
	            <section class="panel panel-default">
					<header class="panel-heading font-bold">角色</header>
	            	<div id="tree2" class="treeview"></div>
	            </section>
            </div>
            
		</section>
		
		
		<footer class="footer bg-white b-t">
          <div class="row text-center-xs">
            <div class="col-md-6 hidden-sm">
            </div>
            <div class="col-md-6 col-sm-12 text-right text-center-xs">  
	            <ul class="pagination pagination-sm m-t-sm m-b-none">
	                <li><a href="javascript:;" onclick="setuserrole();">保 存</a></li>
	            </ul>
            </div>
          </div>
        </footer>
        
	</section>
</section>

<pagetitle>用户角色</pagetitle>

<pagescript>
<link href="css/bootstrap-treeview.css" rel="stylesheet">
<script src="js/bootstrap-treeview.js"></script>
<script>
function setuserrole(){
	var userarr = $('#tree').treeview('getSelected');
	var rolearr = $('#tree2').treeview('getChecked');
	var roleIds = '';
	rolearr.forEach(function(e){  
    	if(roleIds == ''){
    		roleIds += e.id;
    	}else{
    		roleIds += ',' + e.id;
    	}
	});
	
	htmlobj=$.ajax({
		url:'sys/sysuserrole.htm',
		dataType:"text",
		async:false,
		data:{userId:userarr[0].id,roleIds:roleIds},
		success:function(data){
			if(data == '1'){
				alert('操作成功');
			}
		}
	});
	
}

function sysuser(){
	htmlobj=$.ajax({url:'sys/sysuser.htm',dataType:"text",async:false});
	var jsonobj = eval('(' + htmlobj.responseText + ')'); 
	
	$('#tree').treeview({
		data: jsonobj,
		showBorder: false,
		showCheckbox: false,
		onNodeSelected: function(event, data) {
			$('#tree2').treeview('uncheckAll', { silent: true });
			
			htmlobj=$.ajax({
				url:'sys/sysrolebyuser.htm',
				dataType:"json",
				async:false,
				data:{userId:data.id},
				success:function(data){
					var treearr = $('#tree2').treeview('getEnabled');
					treearr.forEach(function(e){
						data.forEach(function(d){
							if(e.id == d.id){
								$('#tree2').treeview('checkNode', [ e.nodeId, { silent: true } ]);
								return false;
							}
						});
					});
				}
			});
			
		}
	});
	
	htmlobj=$.ajax({url:'sys/sysrole.htm',dataType:"text",async:false});
	jsonobj = eval('(' + htmlobj.responseText + ')');
	
	$('#tree2').treeview({
		data: jsonobj,
		showBorder: false,
		showCheckbox: true,
		onNodeChecked: function(event, data) {
		},
		onNodeUnchecked: function(event, data) {
		}
	});
	
}

function menuactive(){
	var obj = $("span:contains('用户角色')");
	obj.parent().attr('class','active');
	obj.parent().parent().attr('class','active');
}

jQuery(function($) {
	sysuser();
	menuactive();
});

</script>
</pagescript>