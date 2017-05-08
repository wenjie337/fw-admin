package com.bxj.service;

import java.io.File;
import java.io.IOException;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.bxj.model.task.TaskVo;
import com.bxj.model.task.TaskWebUserVo;
import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.ScriptResult;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.DomElement;
import com.gargoylesoftware.htmlunit.html.DomNode;
import com.gargoylesoftware.htmlunit.html.DomNodeList;
import com.gargoylesoftware.htmlunit.html.HtmlInput;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.gargoylesoftware.htmlunit.html.HtmlSpan;

@Service
public class TaskExecutorService {

    private static final Logger LOGGER = Logger.getLogger(TaskExecutorService.class);
    private static final String LOGIN_URL = "https://passport.58.com/login";
    private static final String UPLOAD_ICON_URL = "http://upload.58cdn.com.cn/json";

    private WebClient getWebClient() {
        WebClient webClient = new WebClient(BrowserVersion.CHROME);
        //启动JS
        webClient.getOptions().setJavaScriptEnabled(true);
        //取消CSS
        webClient.getOptions().setCssEnabled(false);
        //运行错误时，是否抛出异常
        webClient.getOptions().setThrowExceptionOnScriptError(false);
        //设置cookied
        webClient.getCookieManager().setCookiesEnabled(true);

        return webClient;
    }

    /**
     * 获取必要的登陆参数信息
     *
     * @throws IOException
     */
    public void login(WebClient webClient, TaskWebUserVo userVo) throws IOException {
        HtmlPage page = webClient.getPage(LOGIN_URL);
        System.out.println(userVo.getUserName() + "  开始登录。。。。。");
        LOGGER.info(userVo.getUserName() + "  开始登录。。。。。");

        ScriptResult scriptResult = page.executeJavaScript("clickLog('from=PC_login_zmqicon')");
        HtmlPage loginPage = (HtmlPage) scriptResult.getNewPage();
        HtmlInput userName = loginPage.getHtmlElementById("usernameUser");
        userName.setAttribute("value", userVo.getUserName());
        HtmlInput pwd = loginPage.getHtmlElementById("passwordUserText");
        pwd.setAttribute("value", userVo.getPwd());
        HtmlInput password = loginPage.getHtmlElementById("passwordUser");
        password.setAttribute("value", userVo.getPwd());
        HtmlInput btn = loginPage.getHtmlElementById("btnSubmitUser");
        HtmlPage loginResultPage = btn.click();
        //        System.out.println(loginResultPage.asXml());
        try {
            HtmlInput name = loginResultPage.getHtmlElementById("usernameUser");
            System.out.println("登录失败。");
            LOGGER.info(userVo.getUserName() + "  登录失败。");
        } catch (Exception e) {
            System.out.println("登录成功。");
            LOGGER.info(userVo.getUserName() + "  登录成功。");
        }
    }

    /**
     * 发布信息
     * @param webClient
     * @throws Exception
     */
    public void push(WebClient webClient, TaskVo taskVo, TaskWebUserVo userVo) throws Exception {
        System.out.println(userVo.getUserName() + "开始发布信息......");
        LOGGER.info(userVo.getUserName() + "  开始发布信息......");
        HtmlPage pushPage = webClient.getPage(taskVo.getSendUrl());
        pushPage.getHtmlElementById("xiaoqu").setAttribute("value", taskVo.getXiaoqu());
        //        pushPage.getHtmlElementById("dizhi").setAttribute("value",taskVo.getXiaoqu());
        pushPage.getHtmlElementById("huxingshi").setAttribute("value", taskVo.getHuxingshi());
        pushPage.getHtmlElementById("huxingting").setAttribute("value", taskVo.getHuxingting());
        pushPage.getHtmlElementById("huxingwei").setAttribute("value", taskVo.getHuxingwei());
        pushPage.getHtmlElementById("area").setAttribute("value", taskVo.getArea());
        pushPage.getHtmlElementById("Floor").setAttribute("value", taskVo.getFloor());
        pushPage.getHtmlElementById("zonglouceng").setAttribute("value", taskVo.getZonglouceng());
        pushPage.getHtmlElementById("MinPrice").setAttribute("value", taskVo.getMinPrice());
        pushPage.getHtmlElementById("Title").setAttribute("value", taskVo.getXiaoqu() + " " + taskVo.getHuxingshi() + "室" + taskVo.getHuxingting() + "厅" + taskVo.getHuxingwei() + "卫");
        //        pushPage.getHtmlElementById("miaoshu").setAttribute("value","有正当职业，无不良嗜好即可");
        pushPage.getHtmlElementById("goblianxiren").setAttribute("value", taskVo.getGoblianxiren());
        //设置房源描述
        pushPage.executeJavaScript("UE.getEditor(\"editor\").setContent(\"" + taskVo.getRoomDesc() + "\")");
        DomNodeList<DomElement> list = pushPage.getElementsByTagName("span");
        for (DomNode node : list) {
            if (node.asText().equals("发布")) {
                HtmlSpan span = (HtmlSpan) node;
                HtmlPage p = span.click();
                Thread.sleep(10000);
                //                System.out.println(p.asXml());

                System.out.println("发布成功.");
                LOGGER.info(userVo.getUserName() + "  发布成功.");
            }
        }
        webClient.close();
    }

    /**
     * 上传图片
     */
    private void uploadIcon(HtmlPage pushPage, String filePath) {
        File file = new File(filePath);
        if (file.isDirectory()) {
            File[] iconList = file.listFiles();
            if (iconList == null || iconList.length == 0) {
                return;
            }
            for (File f : iconList) {

            }
        }
    }

    public void start(TaskVo taskVo, TaskWebUserVo userVo) throws Exception {
        WebClient webClient = getWebClient();
        //登录
        login(webClient, userVo);
        //发贴
        push(webClient, taskVo, userVo);
        //关闭浏览器
        getWebClient().close();

    }

    public static void main(String[] ar) {
        try {
            TaskVo taskVo = new TaskVo();
            TaskWebUserVo userVo = new TaskWebUserVo();
            userVo.setUserName("18928434455");
            userVo.setPwd("yao1983");
            TaskExecutorService t = new TaskExecutorService();
            t.start(taskVo, userVo);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
