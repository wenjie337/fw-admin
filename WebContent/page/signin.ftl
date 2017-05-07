[#ftl]
<!DOCTYPE html>
<html lang="en" class="bg-dark">
<head>
  <meta charset="utf-8" />
  <title>FWHD Admin V1.0</title>
  <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" /> 
  <link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
  <link rel="stylesheet" href="css/animate.css" type="text/css" />
  <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
  <link rel="stylesheet" href="css/font.css" type="text/css" />
  <link rel="stylesheet" href="css/app.css" type="text/css" />
  <link rel="stylesheet" href="js/fuelux/fuelux.css" type="text/css"/>
  <!--[if lt IE 9]>
    <script src="js/ie/html5shiv.js"></script>
    <script src="js/ie/respond.min.js"></script>
    <script src="js/ie/excanvas.js"></script>
  <![endif]-->
  <style>
  .form-group {
    margin-bottom: 18px;
  }
  .checkbox {
  	margin-bottom:0
  }
  </style>
</head>
<script language="JavaScript"> 
     if (window != top){
     	top.location.href = location.href;
     } 
</script>
<body class="">
  <section id="content" class="m-t-lg wrapper-md animated fadeInUp">    
    <div class="container aside-xxl">
      <a class="navbar-brand block" href="index.html">FWHD Admin V1.0</a>
      <section class="panel panel-default bg-white m-t-lg">
        <header class="panel-heading text-center">
          <strong>登 录</strong>
        </header>
        <form action="login.htm" class="panel-body wrapper-lg" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          <div class="form-group">
            <label class="control-label">用户名</label>
            <input type="textfield" id="username" name="username" placeholder="" class="form-control input-lg">
          </div>
          <div class="form-group">
            <label class="control-label">密码</label>
            <input type="password" id="password" name="password" id="inputPassword" placeholder="" class="form-control input-lg">
          </div>
          <div class="form-group row">
          	  <div class="checkbox col-xs-6">
	            <label class="checkbox-custom">
	              <input type="checkbox" name="rememberMe" id="rememberMe">
                  <i class="fa fa-fw fa-square-o" id="irememberMe"></i> 记住我
	            </label>
	          </div>
	          <div class="col-xs-6 text-right">
			    <button type="submit" class="btn btn-primary">登 录</button>
			  </div>
          </div>
          <div class="line line-dashed"></div>
        </form>
      </section>
    </div>
  </section>
  <!-- footer -->
  <footer id="footer">
    <div class="text-center padder">
      <p>
        <small>Web app framework base on Bootstrap<br>&copy; 2013</small>
      </p>
    </div>
  </footer>
  <!-- / footer -->
  <script src="js/jquery.min.js"></script>
  <!-- Bootstrap -->
  <script src="js/bootstrap.js"></script>
  <!-- App -->
  <script src="js/app.js"></script> 
  <script src="js/slimscroll/jquery.slimscroll.min.js"></script>
  <script src="js/app.plugin.js"></script>
  <script src="js/fuelux/fuelux.js"></script>
  <script src="js/jquery.cookie.js"></script>
  <script>
      $(function () {
        //判断之前是否有设置cookie，如果有，则设置【记住我】选择框  
	    if($.cookie('zhy_username')!=undefined){  
	        $("#rememberMe").attr("checked", true);  
	        $("#irememberMe").addClass("checked");  
	    }else{  
	        $("#rememberMe").attr("checked", false);  
	        $("#irememberMe").removeClass("checked");  
	    }  
	      
	    //读取cookie  
	    if($('#rememberMe:checked').length>0){  
	    	if($.cookie('zhy_username')!=undefined){
	    		$('#username').val($.cookie('zhy_username'));  
	    	}
	        if($.cookie('zhy_password')!=undefined){
	        	$('#password').val($.cookie('zhy_password'));  
	        }
	    }  
	      
	    //监听【记住我】事件  
	    $("#rememberMe").click(function(){
	        if($('#rememberMe:checked').length>0){//设置cookie  
	            $.cookie('zhy_username', $('#username').val(),{expires:7});  
	            $.cookie('zhy_password', $('#password').val(),{expires:7});  
	        }else{//清除cookie  
	            $.removeCookie('zhy_username');  
	            $.removeCookie('zhy_password');  
	        }  
	    });
      });
  </script>
</body>
</html>