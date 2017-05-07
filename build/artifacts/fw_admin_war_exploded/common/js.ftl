[#ftl]
  <script src="js/jquery.min.js"></script>
  <!-- Bootstrap -->
  <script src="js/bootstrap.js"></script>
  <!-- App -->
  <script src="js/app.js"></script> 
  <script src="js/slimscroll/jquery.slimscroll.min.js"></script>
  <script src="js/charts/easypiechart/jquery.easy-pie-chart.js"></script>
  <script src="js/charts/sparkline/jquery.sparkline.min.js"></script>
  <script src="js/charts/flot/jquery.flot.min.js"></script>
  <script src="js/charts/flot/jquery.flot.tooltip.min.js"></script>
  <script src="js/charts/flot/jquery.flot.resize.js"></script>
  <script src="js/charts/flot/jquery.flot.grow.js"></script>
  <script src="js/charts/flot/demo.js"></script>

  <!--<script src="js/calendar/bootstrap_calendar.js"></script>-->
  <!--<script src="js/calendar/demo.js"></script>-->

  <script src="js/sortable/jquery.sortable.js"></script>
  <script src="js/app.plugin.js"></script>
  
  <script src="js/default.js"></script>

  <!--<script type="text/javascript" src="js/ajax-pushlet-client.js"></script>-->
  <script type="text/javascript" src="js/store/store.js"></script>
  <script type="text/javascript" src="js/store/store.min.js"></script>
  <script type="text/javascript">
  	  /*
  	  function setpd(){
  	  	  var pd = store.get("pushData");
	      if( pd != null && pd > 0){
	      	$('#pushData').text(pd);
	        $('#pushData').css('display','inline-block');
	      }else{
	      	$('#pushData').css('display','none');
	      }
  	  }
      var userId="";
      $.ajax({
          url: "getusername.htm",
          async: false,
          dataType:"json",
          success:function(data){
              userId = data.result.username;
          }
      });
      PL.userId = userId;
      PL._init();
      PL.joinListen('orderNotice');
      function onData(event) {
          console.log("sessionID==" + PL.sessionId + "==" + event.get("pushData_"+userId));
      	  store.set("pushData",event.get("pushData_"+userId));
      	  setpd();
      }
      
      setpd();
      */
  </script>
  
  
  <sitemesh:write property="pagescript"/>