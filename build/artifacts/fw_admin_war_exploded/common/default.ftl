[#ftl]
<!DOCTYPE html>
<html lang="zh_CN" class="app">
<head>
	<base href="${rc.contextPath}/" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	[#--<title><sitemesh:write property="title"/></title>--]
	<title>FWHD Admin V1.0</title>
	[#include 'css.ftl' /]
	<sitemesh:write property="head"/>
</head>
<body>
	<section class="hbox stretch">
		<section id="content">
			<section class="vbox">
				<sitemesh:write property="body"/>
			</section>
		</section>
	</section>
	[#include 'js.ftl' /]
</body>
</html>