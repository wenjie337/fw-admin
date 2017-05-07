$(function () {
	var groupId = $('#firstid').val();
	imageList(groupId);
	
	$("#selall").click(function(){
		if($(this).prop('checked')){
			$('.ilcbox').prop('checked',true);
		}else{
			$('.ilcbox').prop('checked',false);
		}
	});

	//delete
	$("#deleteImg").click(function () {
		var array = new Array();
		$('.ilcbox').each(function () {
			if ($(this).is(':checked')) {
				array.push($(this).val());
			}
		});
		if (array.length == 0) {
			alert("请选择需要删除的选项!");
			return;
		}
		$("#arrayParam").val(array);
		$('#delcfmModel').modal();
	});

	$("#sureDelButton").click(function () {
		var array = $("#arrayParam").val();
		array = array.split(",");
		$.post('deleteImgs.htm', {'array': array,'configKey': $("#groupHiddenId").val()}, function (data) {
			if (data.status == 'success') {
				imageList(data.result.configKey);
				alert("删除成功!");
			} else {
				alert(data.msg);
			}
		}, 'json');
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
	groupId = gId;

	$("#groupHiddenId").val(gId);

	$('#cboxi').removeClass('checked');
	$('#selall').prop('checked',false);
	$('#txtgn').html($('#agn_'+groupId.substring(4)).text());
	
	$.ajax({
	    url: 'ajaxImgsByGroupId.htm',
	    data: {
			groupId: groupId
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
	        url = data[0].configUrl+photo.imgUrl;

	        str ='<div class="item">'+
	                '<img src="'+url+'">'+
	                '<a href="javascript:;" rel="" onclick="chkbox('+photo.id+')"></a>'+
	                '<div class="desc">'+
	                    '<h4><input id="cb_'+photo.id+'" name="giid" value="'+photo.imgUrl+'" class="ilcbox" type="checkbox" /></h4>'+
	                    '<p class="text-white">'+ photo.id +'</p>'+
	                    '<span><strong>'+ photo.imgUrl.substring(photo.imgUrl.indexOf("/bxj")) +'</strong></span>'+
	                '</div>'+
	              '</div>';

	        $(str).appendTo(gallery);
	    });
		$("#abc").empty();
		if( data == '' ){
			$("#abc").html("该分组暂无可删除的图片!");
		}

	    buildGallery();
	});
}


