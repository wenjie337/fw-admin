function gopage(pagenum){
	$('#pagenum').val(pagenum);
	$('#pageform').submit();
}

function asidea(){
	var asideaClass = $('#aside-a').attr('class');
	
	var indexa = asideaClass.indexOf('active');
	
	var xs = 0;
	if(indexa > -1){
		xs = 1;
	}
	
	$.ajax({url:'asidexs.htm',dataType:"text",async:false,data:{xs:xs}});
	
}