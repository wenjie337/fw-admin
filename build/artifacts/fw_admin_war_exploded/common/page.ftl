[#ftl]
[#macro footer page, action ]
[#if page?exists]
<footer class="footer bg-white b-t">
  <div class="row text-center-xs">
    <div class="col-md-6 hidden-sm">
      <p class="text-muted m-t">显示 ${page.startRow+1}-${page.endRow} 条, 共 ${page.total} 条</p>
    </div>
    <div class="col-md-6 col-sm-12 text-right text-center-xs">     
      <form id="pageform" action="${action}" method="post">
      <input id="pagenum" type="hidden" name="pagenum" />
      <ul class="pagination pagination-sm m-t-sm m-b-none">
      	<li>
        	<a href="javascript:;" 
        	[#if page.pageNum-1<1]class="btn btn-default disabled"
        	[#else]onclick="gopage(1);"
        	[/#if]
        	>
        	<i class="fa fa-angle-double-left"></i>
        	</a>
        </li>
        <li>
        	<a href="javascript:;" 
        	[#if page.pageNum-1<1]class="btn btn-default disabled"
        	[#else]onclick="gopage(${page.pageNum-1});"
        	[/#if]
        	>
        	<i class="fa fa-angle-left"></i>
        	</a>
        </li>
        [#assign startNum = page.pageNum-3 /]
        
        [#if startNum > page.pages-6]
        	[#assign startNum = page.pages-6 /]
        [/#if]
        [#if startNum < 1]
        	[#assign startNum = 1 /]
        [/#if]
        
        [#assign endNum = startNum+6 /]
        [#if page.pages< startNum+6]
        	[#assign endNum = page.pages /]
        [/#if]
        [#if endNum <= 0]
        	[#assign endNum = 1 /]
        [/#if]
        [#list startNum .. endNum as x]
        	<li [#if page.pageNum==x]class="active"[/#if]>
	        	<a href="javascript:;" onclick="gopage(${x});">${x}</a>
        	</li>
        [/#list]
        <li>
        	<a href="javascript:;" 
        	[#if page.pageNum+1>page.pages]class="btn btn-default disabled"
        	[#else]onclick="gopage(${page.pageNum+1});"
        	[/#if]
        	>
        	<i class="fa fa-angle-right"></i>
        	</a>
        </li>
        <li>
        	<a href="javascript:;" 
        	[#if page.pageNum+1>page.pages]class="btn btn-default disabled"
        	[#else]onclick="gopage(${page.pages});"
        	[/#if]
        	>
        	<i class="fa fa-angle-double-right"></i>
        	</a>
        </li>
      </ul>
      </form>
    </div>
  </div>
</footer>
[/#if]
[/#macro]