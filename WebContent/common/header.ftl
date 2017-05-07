[#ftl]
<header class="bg-dark dk header navbar navbar-fixed-top-xs">
    <div class="navbar-header aside-md">
        <a class="btn btn-link visible-xs" data-toggle="class:nav-off-screen,open" data-target="#nav,html">
            <i class="fa fa-bars"></i>
        </a>
        <a href="#" class="navbar-brand" data-toggle="fullscreen">FWHD Admin V1.0</a>
        <a class="btn btn-link visible-xs" data-toggle="dropdown" data-target=".nav-user">
            <i class="fa fa-cog"></i>
        </a>
    </div>
    
    
    <ul class="nav navbar-nav hidden-xs">
        <li class="dropdown">
            <div class="btn-group" style="margin-top:12px">
	        <div class="btn-group hidden-nav-xs">
	          <button type="button" class="btn btn-sm btn-dark dropdown-toggle" data-toggle="dropdown">
	            系统模块
	            <span class="caret"></span>
	          </button>
	          [#--
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
	          系统模块
	          	<b class="caret"></b>
	          </a>
	          --]
	          [#if username == 'admin']
	          <ul class="dropdown-menu text-left" style="min-width:120px">
	            <li><a href="switchsys.htm?sys=1">运营管理</a></li>
	            <li><a href="switchsys.htm?sys=0">权限管理</a></li>
	          </ul>
	          [/#if]
	        </div>
	      </div>
        </li>
    </ul>
    <ul class="nav navbar-nav navbar-right m-n hidden-xs nav-user">
        <li class="hidden-xs">
            <a href="#" class="dropdown-toggle dk" data-toggle="dropdown">
                <i class="fa fa-bell"></i><!--icon-animated-bell-->
                <!--
                <span id="pushData" class="badge badge-sm up bg-danger m-l-n-sm" style="display: inline-block;"></span>
                -->
            </a>
            <section class="dropdown-menu aside-xl">
                <section class="panel bg-white">
                    <header class="panel-heading b-light bg-light">
                    </header>
                    <footer class="panel-footer text-sm">
                        <a href="#" class="pull-right"><i class="fa fa-cog"></i></a>
                        <a href="#notes" data-toggle="class:show animated fadeInRight">See all the notifications</a>
                    </footer>
                </section>
            </section>
        </li>
        <li class="dropdown hidden-xs">
            <a href="#" class="dropdown-toggle dker" data-toggle="dropdown"><i class="fa fa-fw fa-search"></i></a>
            <section class="dropdown-menu aside-xl animated fadeInUp">
                <section class="panel bg-white">
                    <form role="search">
                        <div class="form-group wrapper m-b-none">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search">
                                <span class="input-group-btn">
                                  <button type="submit" class="btn btn-info btn-icon"><i class="fa fa-search"></i></button>
                                </span>
                            </div>
                        </div>
                    </form>
                </section>
            </section>
        </li>
        <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
        <span class="thumb-sm avatar pull-left">
          <img src="images/avatar_default.jpg">
        </span>
            ${username?if_exists} <b class="caret"></b>
            </a>
            <ul class="dropdown-menu animated fadeInRight">
                <span class="arrow top"></span>
                <li>
                    <a href="#">Settings</a>
                </li>
                <li>
                    <a href="#">Profile</a>
                </li>
                <li>
                    <a href="#">
                        Notifications
                    </a>
                </li>
                <li>
                    <a href="#">Help</a>
                </li>
                <li class="divider"></li>
                <li>
                    <a href="logout.htm">Logout</a>
                </li>
            </ul>
        </li>
    </ul>
</header>

