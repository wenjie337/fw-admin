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
	            <li class="active">角色资源</li>
	        </ul>
	        
            <div class="col-sm-6">
		        <section class="panel panel-default">
					<header class="panel-heading font-bold">角色</header>
		        	<div id="tree" class="treeview"></div>
		        </section>
            </div>
            <div class="col-sm-6">
	            <section class="panel panel-default">
					<header class="panel-heading font-bold">资源</header>
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
	                <li><a href="javascript:;" onclick="setrolemenu();">保 存</a></li>
	            </ul>
            </div>
          </div>
        </footer>
        
	</section>
</section>

<pagetitle>角色资源</pagetitle>

<pagescript>
<link href="css/bootstrap-treeview.css" rel="stylesheet">
<script src="js/bootstrap-treeview.js"></script>
<script>
function setrolemenu(){
	var rolearr = $('#tree').treeview('getSelected');
	var menuarr = $('#tree2').treeview('getChecked');
	var menuIds = '';
	menuarr.forEach(function(e){  
    	if(menuIds == ''){
    		menuIds += e.id;
    	}else{
    		menuIds += ',' + e.id;
    	}
	});
	
	htmlobj=$.ajax({
		url:'sys/sysrolemenu.htm',
		dataType:"text",
		async:false,
		data:{roleId:rolearr[0].id,menuIds:menuIds},
		success:function(data){
			if(data == '1'){
				alert('操作成功');
			}
		}
	});
	
}

function rolemenu(){
	htmlobj=$.ajax({url:'sys/menurole.htm',dataType:"text",async:false});
	var jsonobj = eval('(' + htmlobj.responseText + ')'); 
	$('#tree').treeview({
		data: jsonobj,
		showBorder: false,
		showCheckbox: false,
		onNodeSelected: function(event, data) {
			$('#tree2').treeview('uncheckAll', { silent: true });
			
			htmlobj=$.ajax({
				url:'sys/sysmenubyrole.htm',
				dataType:"json",
				async:false,
				data:{roleId:data.id},
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
	
	htmlobj=$.ajax({url:'sys/sysmenu.htm',dataType:"text",async:false});
	jsonobj = eval('(' + htmlobj.responseText + ')');
	
	$('#tree2').treeview({
		data: jsonobj,
		showBorder: false,
		showCheckbox: true,
		onNodeChecked: function(event, data) {
			var nodes = $('#tree2').treeview('getEnabled');
			subs(data.id,nodes,1)
		},
		onNodeUnchecked: function(event, data) {
			var nodes = $('#tree2').treeview('getEnabled');
			subs(data.id,nodes,2)
		}
	});
	
}

function subs(nid,ns,ntype){
	
	for(var i=0;i<ns.length;i++){
		var sn = $('#tree2').treeview('getParent', ns[i]);
		if(typeof(sn['id']) != 'undefined' && nid == sn['id']){
			if(ntype == 1){
				$('#tree2').treeview('checkNode', ns[i]);
			}else{
				$('#tree2').treeview('uncheckNode', ns[i]);
			}
			
			subs(ns[i]['id'],ns);
		}
	}
}

function menuactive(){
	var obj = $("span:contains('角色资源')");
	obj.parent().attr('class','active');
	obj.parent().parent().attr('class','active');
}

jQuery(function($) {
	rolemenu();
	menuactive();
});

</script>
</pagescript>