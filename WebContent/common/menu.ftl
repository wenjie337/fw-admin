[#ftl]
<!-- .aside -->
[#if asidexs?exists && asidexs==0]
<aside class="bg-dark lter aside-md hidden-print hidden-xs nav-xs" id="nav">      
[#else]
<aside class="bg-dark lter aside-md hidden-print hidden-xs" id="nav">      
[/#if]
  <section class="vbox">
    <section class="w-f scrollable">
      <div class="slim-scroll" data-height="auto" data-disable-fade-out="true" data-distance="0" data-size="5px" data-color="#333333">
        
        <!-- nav -->
        <nav class="nav-primary hidden-xs">
          <ul class="nav"><!--rc.requestUri-->
          	[#if usermenus?exists]
          		[#assign curpid = 0 /]
          		[#assign curid = 0 /]
          		[#assign cursid = 0 /]
          		[#list usermenus as menu]
          			[#if menu.subs?exists && menu.subs?size>0]
          				[#list menu.subs as sub]
          					[#if sub.menuType == 1]
          						[#list sub.subs as s]
          							[#if m?exists && s.id == m]
		          						[#assign curid = s.id /]
		          						[#assign curpid = menu.id /]
		          						[#assign cursid = sub.id /]
		          						[#break/]
		          					[/#if]
          						[/#list]
          					[#else]
	          					[#if m?exists && sub.id == m]
	          						[#assign curid = sub.id /]
	          						[#assign curpid = menu.id /]
	          						[#break/]
	          					[/#if]
          					[/#if]
          				[/#list]
          			[/#if]
          		[/#list]
          		
          		[#list usermenus as menu]
          			<li [#if menu.id==curpid || (curpid ==0 && menu.expand==1)]class="active"[/#if]>
		              <a href="javascript:;" [#if menu.id==curpid || (curpid ==0 && menu.expand==1)]class="active"[/#if]>
		                <i class="fa ${menu.menuIcon} icon">
		                  <b class="${menu.menuClass}"></b>
		                </i>
		                <span class="pull-right">
		                  <i class="fa fa-angle-down text"></i>
		                  <i class="fa fa-angle-up text-active"></i>
		                </span>
		                <span>${menu.menuName}</span>
		              </a>
		              [#if menu.subs?exists && menu.subs?size>0]
		              <ul class="nav lt">
		              	[#list menu.subs as sub]
		                <li [#if sub.id == curid || sub.id == cursid]class="active"[/#if]><!-- active bg-primary lter -->
		                	[#if sub.menuType == 1]
		                	  <a href="#" [#if sub.id == curid || sub.id == cursid]class="active"[/#if]> 
			                    <i class="fa fa-angle-down text"></i>
                                <i class="fa fa-angle-up text-active"></i>
			                    <span>${sub.menuName}</span>
			                  </a>
			                  <ul class="nav bg">
			                  [#list sub.subs as s]
			                  	<li [#if s.id == curid]class="active"[/#if]>
	                              <a href="javascript:;" onclick="tab('${s.menuUrl}','${s.id}')" [#if s.id == curid]class="active"[/#if]>
		                            [#if s.id == curid]
				                    <span class="pull-right">
				                  	<i class="fa fa-thumb-tack text-primary"></i>    
				                  	</span> 
				                  	[/#if] 
	                                <i class="fa fa-angle-right"></i>
	                                <span>${s.menuName}</span>
	                              </a>
	                            </li>
			                  [/#list]
			                  </ul>
		                	[#else]
		                	  <a href="javascript:;" onclick="tab('${sub.menuUrl}','${sub.id}')" [#if sub.id == curid]class="active"[/#if]> 
			                    [#if sub.id == curid]
			                    <span class="pull-right">
			                  	[#--<i class="fa fa-thumb-tack text-primary"></i>--]    
			                  	</span> 
			                  	[/#if]                                                  
			                    <i class="fa fa-angle-right"></i>
			                    <span>${sub.menuName}</span>
			                  </a>
		                	[/#if]
		                  
		                </li>
		                [/#list]
		              </ul>
		              [/#if]
		            </li>
          		[/#list]
          	[/#if]
            
          
            <li >
              <a href="javascript:;"  >
                <i class="">
                  <b class=""></b>
                </i>
                <span>&nbsp;</span>
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
      [#if asidexs?exists && asidexs==0]
      <a href="#nav" data-toggle="class:nav-xs" class="pull-right btn btn-sm btn-dark btn-icon active" id="aside-a" onclick="asidea()">
      [#else]
      <a href="#nav" data-toggle="class:nav-xs" class="pull-right btn btn-sm btn-dark btn-icon" id="aside-a" onclick="asidea()">
      [/#if]
        <i class="fa fa-angle-left text"></i>
        <i class="fa fa-angle-right text-active"></i>
      </a>
      
    </footer>
  </section>
</aside>
<!-- /.aside -->