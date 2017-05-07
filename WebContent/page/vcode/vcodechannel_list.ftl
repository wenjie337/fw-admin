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
	            <li class="active">渠道业务</li>
	        </ul>
	        
            <div class="col-sm-6">
		        <section class="panel panel-default">
					<header class="panel-heading font-bold">渠道</header>
		        	<div id="tree" class="treeview"></div>
		        </section>
            </div>
            <div class="col-sm-6">
	            <section class="panel panel-default">
					<header class="panel-heading font-bold">业务</header>
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
	                <li><a href="javascript:;" onclick="setchannellist();">保 存</a></li>
	            </ul>
            </div>
          </div>
        </footer>
        
	</section>
</section>

<pagetitle>渠道业务</pagetitle>

<pagescript>
<link href="css/bootstrap-treeview.css" rel="stylesheet">
<script src="js/bootstrap-treeview.js"></script>
<script>
function setchannellist(){
	var channelarr = $('#tree').treeview('getSelected');
	var vcodearr = $('#tree2').treeview('getChecked');
	var vcodeIds = '';
	vcodearr.forEach(function(e){  
    	if(vcodeIds == ''){
    		vcodeIds += e.id;
    	}else{
    		vcodeIds += ',' + e.id;
    	}
	});
	
	htmlobj=$.ajax({
		url:'channelvcodes.htm',
		dataType:"text",
		async:false,
		data:{channel:channelarr[0].channel,vcodeIds:vcodeIds},
		success:function(data){
			if(data == '1'){
				alert('操作成功');
			}else{
				alert('操作失败');
			}
		}
	});
	
}

function channels(){
	htmlobj=$.ajax({url:'channels.htm',dataType:"text",async:false});
	var jsonobj = eval('(' + htmlobj.responseText + ')'); 
	$('#tree').treeview({
		data: jsonobj,
		showBorder: false,
		showCheckbox: false,
		onNodeSelected: function(event, data) {
			$('#tree2').treeview('uncheckAll', { silent: true });
			
			htmlobj=$.ajax({
				url:'vcodesbychannel.htm',
				dataType:"json",
				async:false,
				data:{channel:data.channel},
				success:function(data){
					var treearr = $('#tree2').treeview('getEnabled');
					treearr.forEach(function(e){
						data.forEach(function(d){
							if(e.id == d.vcodeId){
								$('#tree2').treeview('checkNode', [ e.nodeId, { silent: true } ]);
								return false;
							}
						});
					});
				}
			});
	
		}
	});
	
	htmlobj=$.ajax({url:'vcodes.htm',dataType:"text",async:false});
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

jQuery(function($) {
	channels();
});

</script>
</pagescript>