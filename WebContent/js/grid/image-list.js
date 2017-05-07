$(function () {
	var goodsId = $('#firstid').val();
	imageList(goodsId);
	
    // if you use the local image just need call 
    // buildGallery();
	$("#selall").click(function(){
		if($(this).prop('checked')){
			$('.ilcbox').prop('checked',true);
		}else{
			$('.ilcbox').prop('checked',false);
		}
	});
	
});

var buildGallery = function(){
    $("#gallery").removeClass('hide');
    $('a[rel^="prettyPhoto"]').prettyPhoto({slideshow:5000, autoplay_slideshow:false});

    $("#gallery").gridalicious({
      animate: true,
      gutter: 1,
      width: 250
    });
}

function imageList(gId){
	goodsId = gId;
	
	$('#cboxi').removeClass('checked');
	$('#selall').prop('checked',false);
	$('#txtgn').html($('#agn_'+goodsId).text());
	
	//Load images via flickr for demonstration purposes:
	$.ajax({
	    url: 'ajaxGoodsInfoList.htm',
	    data: {
	        goodsId: goodsId
	    },
	    dataType: 'json'
	}).done(function (data) {
	    var gallery = $('#gallery')
	        , gl = $('#galleryLoading')
	        , str
	        , url;
	    gl.removeClass('fadeInRightBig').addClass('fadeOutLeftBig');
	    _.delay(function(){
	        gl.hide();
	    }, 1000);
	    gallery.removeClass('hide').addClass('animated fadeInUpBig');
	    
	    gallery.empty();

	    $.each(data[0].list, function (index, photo) {
	        url = data[0].configUrl+photo.info_img;

	        str ='<div class="item">'+
	                '<img src="'+url+'">'+
	                '<a href="javascript:;" rel="" onclick="chkbox('+photo.id+')"></a>'+
	                '<div class="desc">'+
	                    '<h4><input id="cb_'+photo.id+'" name="giid" value="'+photo.id+'" class="ilcbox" type="checkbox" /></h4>'+
	                    '<p class="text-white"><strong>'+ (photo.info_type==0?'Banner图':'图文介绍') + '(' + photo.info_index + ')' +'</strong></p>'+
	                    '<span><strong>'+ photo.img_width + ' * ' + photo.img_height +'</strong></span>'+
	                '</div>'+
	              '</div>';

	        $(str).appendTo(gallery);
	    });

	    buildGallery();
	});
}


function imageListXY(ids){
	if(ids == '')return;
	/*
	var opts = {            
        lines: 13, // 花瓣数目
        length: 20, // 花瓣长度
        width: 10, // 花瓣宽度
        radius: 30, // 花瓣距中心半径
        corners: 1, // 花瓣圆滑度 (0-1)
        rotate: 0, // 花瓣旋转角度
        direction: 1, // 花瓣旋转方向 1: 顺时针, -1: 逆时针
        color: '#5882FA', // 花瓣颜色
        speed: 1, // 花瓣旋转速度
        trail: 60, // 花瓣旋转时的拖影(百分比)
        shadow: false, // 花瓣是否显示阴影
        hwaccel: false, //spinner 是否启用硬件加速及高速旋转            
        className: 'spinner', // spinner css 样式名称
        zIndex: 2e9, // spinner的z轴 (默认是2000000000)
        top: '50%', // spinner 相对父容器Top定位 单位 px
        left: '50%',// spinner 相对父容器Left定位 单位 px
    	position: 'absolute'
    };*/
	
	var opts = {
		  lines: 12 // The number of lines to draw
		, length: 15 // The length of each line
		, width: 10 // The line thickness
		, radius: 30 // The radius of the inner circle
		, scale: 1.0 // Scales overall size of the spinner
		, corners: 1 // Corner roundness (0..1)
		, color: '#5882FA' // #rgb or #rrggbb or array of colors
		, opacity: 0.25 // Opacity of the lines
		, rotate: 0 // The rotation offset
		, direction: 1 // 1: clockwise, -1: counterclockwise
		, speed: 1 // Rounds per second
		, trail: 100 // Afterglow percentage
		, fps: 20 // Frames per second when using setTimeout() as a fallback for CSS
		, zIndex: 2e9 // The z-index (defaults to 2000000000)
		, className: 'spinner' // The CSS class to assign to the spinner
		, top: '50%' // Top position relative to parent
		, left: '50%' // Left position relative to parent
		, shadow: true // Whether to render a shadow
		, hwaccel: false // Whether to use hardware acceleration
		, position: 'absolute' // Element positioning
	}

    var spinner = new Spinner(opts);
    //异步请求时spinner出现
    var target = $("#abc").get(0);
    spinner.spin(target);  
    
	//Load images via flickr for demonstration purposes:
	$.ajax({
	    url: 'ajaxSetGoodsInfoXY.htm',
	    data: {
	        goodsId: goodsId,
	        ids:ids
	    },
	    dataType: 'json'
	}).done(function (data) {
		//关闭spinner  
	    //spinner.spin();
		spinner.stop();
		
	    var gallery = $('#gallery')
	        , gl = $('#galleryLoading')
	        , str
	        , url;
	    gl.removeClass('fadeInRightBig').addClass('fadeOutLeftBig');
	    _.delay(function(){
	        gl.hide();
	    }, 1000);
	    gallery.removeClass('hide').addClass('animated fadeInUpBig');
	    
	    gallery.empty();
	    
	    $.each(data[0].list, function (index, photo) {
	        url = data[0].configUrl+photo.info_img;

	        str ='<div class="item">'+
	                '<img src="'+url+'">'+
	                '<a href="javascript:;" rel="" onclick="chkbox('+photo.id+')"></a>'+
	                '<div class="desc">'+
	                    '<h4><input id="cb_'+photo.id+'" name="giid" value="'+photo.id+'" class="ilcbox" type="checkbox" /></h4>'+
	                    '<p class="text-white"><strong>'+ (photo.info_type==0?'Banner图':'图文介绍') + '(' + photo.info_index + ')' +'</strong></p>'+
	                    '<span><strong>'+ photo.img_width + ' * ' + photo.img_height +'</strong></span>'+
	                '</div>'+
	              '</div>';

	        $(str).appendTo(gallery);
	    });

	    buildGallery();
	});
}


