[#ftl]
<!-- .aside -->
<aside class="bg-dark lter aside-md hidden-print hidden-xs" id="nav">          
  <section class="vbox">
    
    <section class="w-f scrollable">
      <div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0" data-size="5px" data-color="#333333">
        <!-- nav -->
        <nav class="nav-primary hidden-xs">
          <ul class="nav">
            <li  class="active">
              <a href="index.html"   class="active">
                <i class="fa fa-dashboard icon">
                  <b class=""></b>
                </i>
                <span class="pull-right">
                  <i class="fa fa-angle-down text"></i>
                  <i class="fa fa-angle-up text-active"></i>
                </span>
                <span>系统管理</span>
              </a>
              <ul class="nav lt">
                <li >
                  <a href="javascript:;" onclick="tab('sys/getSysUser.htm','s1')">                                                        
                    <i class="fa fa-angle-right"></i>
                    <span>系统用户</span>
                  </a>
                </li>
                <li >
                  <a href="javascript:;" onclick="tab('sys/getSysRole.htm','s2')"> 
                    <i class="fa fa-angle-right"></i>
                    <span>系统角色</span>
                  </a>
                </li>
                <li >
                  <a href="javascript:;" onclick="tab('sys/getSysMenu.htm','s3')"> 
                    <i class="fa fa-angle-right"></i>
                    <span>系统资源</span>
                  </a>
                </li>
                <li >
                  <a href="javascript:;" onclick="tab('sys/getSysRoleMenu.htm','s4')"> 
                    <i class="fa fa-angle-right"></i>
                    <span>角色资源</span>
                  </a>
                </li>
                <li >
                  <a href="javascript:;" onclick="tab('sys/getSysUserRole.htm','s5')"> 
                    <i class="fa fa-angle-right"></i>
                    <span>用户角色</span>
                  </a>
                </li>
                
                <li >
                    <a href="javascript:;" onclick="tab('sys/getSysHKey.htm','s6')"> 
                        <i class="fa fa-angle-right"></i>
                        <span>CACHE KEY</span>
                    </a>
                </li>
              </ul>
            </li>
           
            <li >
              <a href="javascript:;"  >
                <i class="fa fa-pencil icon">
                  <b class=""></b>
                </i>
                <span>系统日志</span>
              </a>
            </li>
          </ul>
        </nav>
        <!-- / nav -->
      </div>
    </section>
    
    <footer class="footer lt hidden-xs b-t b-dark">
      <div id="chat" class="dropup">
        <section class="dropdown-menu on aside-md m-l-n">
          <section class="panel bg-white">
            <header class="panel-heading b-b b-light">Active chats</header>
            <div class="panel-body animated fadeInRight">
              <p class="text-sm">No active chats.</p>
              <p><a href="#" class="btn btn-sm btn-default">Start a chat</a></p>
            </div>
          </section>
        </section>
      </div>
      <div id="invite" class="dropup">                
        <section class="dropdown-menu on aside-md m-l-n">
          <section class="panel bg-white">
            <header class="panel-heading b-b b-light">
              John <i class="fa fa-circle text-success"></i>
            </header>
            <div class="panel-body animated fadeInRight">
              <p class="text-sm">No contacts in your lists.</p>
              <p><a href="#" class="btn btn-sm btn-facebook"><i class="fa fa-fw fa-facebook"></i> Invite from Facebook</a></p>
            </div>
          </section>
        </section>
      </div>
      <a href="#nav" data-toggle="class:nav-xs" class="pull-right btn btn-sm btn-dark btn-icon">
        <i class="fa fa-angle-left text"></i>
        <i class="fa fa-angle-right text-active"></i>
      </a>
    </footer>
  </section>
</aside>
<!-- /.aside -->