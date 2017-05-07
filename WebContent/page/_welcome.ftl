[#ftl]
<head>
	<link rel="stylesheet" href="js/fullcalendar/fullcalendar.css" type="text/css"  />
    <link rel="stylesheet" href="js/fullcalendar/theme.css" type="text/css" />
</head>
<body>
	<section class="scrollable padder">
	  <ul class="breadcrumb no-border no-radius b-b b-light pull-in">
	    <li><a href="index.html"><i class="fa fa-home"></i> Home</a></li>
	    <li class="active">Workset</li>
	  </ul>
	  
	  
	  <section class="panel panel-default">
	    <header class="panel-heading bg-light clearfix">
	      <div class="btn-group pull-right" data-toggle="buttons">
	        <label class="btn btn-sm btn-bg btn-default active" id="monthview">
	          <input type="radio" name="options">Month
	        </label>
	        <label class="btn btn-sm btn-bg btn-default" id="weekview">
	          <input type="radio" name="options">Week
	        </label>
	        <label class="btn btn-sm btn-bg btn-default" id="dayview">
	          <input type="radio" name="options">Day
	        </label>
	      </div>
	      <span class="m-t-xs inline">
	        Fullcalendar
	      </span>
	    </header>
	    <div class="calendar" id="calendar">
	
	    </div>
	  </section>
	  
	</section>
        
	<pagescript>
	    <script src="js/jquery-ui-1.10.3.custom.min.js"></script>
		<script src="js/jquery.ui.touch-punch.min.js"></script>
		<script src="js/fullcalendar/fullcalendar.min.js"></script>
		<script src="js/fullcalendar/demo.js"></script>
	</pagescript>
</body>