package com.bxj.service;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.*;

import com.bxj.mapper.TaskWebUserMapper;
import com.bxj.util.HttpRequestUtils;
import com.gargoylesoftware.htmlunit.*;
import com.gargoylesoftware.htmlunit.html.*;
import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bxj.model.task.TaskVo;
import com.bxj.model.task.TaskWebUserVo;
import com.bxj.util.MapperUtils;
import com.bxj.util.OkHttpUtils;
import com.squareup.okhttp.Headers;
import com.squareup.okhttp.Response;
import org.w3c.dom.Node;

@Service
public class TaskExecutorService {

    private static final Logger LOGGER = Logger.getLogger(TaskExecutorService.class);
    private static final String LOGIN_URL="https://passport.58.com/login";


    private  WebClient getWebClient(){
        WebClient webClient=new WebClient(BrowserVersion.CHROME);
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
    public void login(WebClient webClient,TaskWebUserVo userVo) throws IOException {
        HtmlPage page=webClient.getPage(LOGIN_URL);
        System.out.println("开始登录。。。。。"+userVo.getUserName());
        LOGGER.info("获取必要的登陆信息。。。。。");

        ScriptResult scriptResult =  page.executeJavaScript("clickLog('from=PC_login_zmqicon')");
        HtmlPage loginPage = (HtmlPage) scriptResult.getNewPage();
        HtmlInput userName = loginPage.getHtmlElementById("usernameUser");
        userName.setAttribute("value",userVo.getUserName());
        HtmlInput pwd = loginPage.getHtmlElementById("passwordUserText");
        pwd.setAttribute("value",userVo.getPwd());
        HtmlInput password = loginPage.getHtmlElementById("passwordUser");
        password.setAttribute("value",userVo.getPwd());
        System.out.println("设置登陆信息。。。。。");
        HtmlInput btn = loginPage.getHtmlElementById("btnSubmitUser");
        System.out.println("登录。。。。。");
        HtmlPage loginResultPage = btn.click();
//        System.out.println(loginResultPage.asXml());
        try {
            HtmlInput name = loginResultPage.getHtmlElementById("usernameUser");
            System.out.println("登录失败。");
        }catch (Exception e){
            System.out.println("登录成功。");
        }
    }

    /**
     * 发布信息
     * @param webClient
     * @throws Exception
     */
    public  void  push(WebClient webClient,TaskVo taskVo) throws Exception{
        System.out.println("开始发布信息......");
        HtmlPage pushPage = webClient.getPage(taskVo.getSendUrl());
        pushPage.getHtmlElementById("xiaoqu").setAttribute("value",taskVo.getXiaoqu());
//        pushPage.getHtmlElementById("dizhi").setAttribute("value",taskVo.getXiaoqu());
        pushPage.getHtmlElementById("huxingshi").setAttribute("value",taskVo.getHuxingshi());
        pushPage.getHtmlElementById("huxingting").setAttribute("value",taskVo.getHuxingting());
        pushPage.getHtmlElementById("huxingwei").setAttribute("value",taskVo.getHuxingwei());
        pushPage.getHtmlElementById("area").setAttribute("value",taskVo.getArea());
        pushPage.getHtmlElementById("Floor").setAttribute("value",taskVo.getFloor());
        pushPage.getHtmlElementById("zonglouceng").setAttribute("value",taskVo.getZonglouceng());
        pushPage.getHtmlElementById("MinPrice").setAttribute("value",taskVo.getMinPrice());
        pushPage.getHtmlElementById("Title").setAttribute("value",taskVo.getXiaoqu()+" "+taskVo.getHuxingshi()+"室"+taskVo.getHuxingting()+"厅"+taskVo.getHuxingwei()+"卫");
//        pushPage.getHtmlElementById("miaoshu").setAttribute("value","有正当职业，无不良嗜好即可");
        pushPage.getHtmlElementById("goblianxiren").setAttribute("value",taskVo.getGoblianxiren());
        //设置房源描述
        pushPage.executeJavaScript("UE.getEditor(\"editor\").setContent(\""+taskVo.getRoomDesc()+"\")");
        DomNodeList<DomElement> list  = pushPage.getElementsByTagName("span");
        for(DomNode node :list){
            if(node.asText().equals("发布")){
                HtmlSpan span = (HtmlSpan) node;
                HtmlPage p =  span.click();
                Thread.sleep(10000);
//                System.out.println(p.asXml());

                System.out.println("发布成功.");
            }
        }
        webClient.close();
    }

    public void start(TaskVo taskVo, TaskWebUserVo userVo) throws Exception{
        WebClient webClient = getWebClient();
        //登录
        login(webClient,userVo);
        //发贴
        push(webClient,taskVo);
        //关闭浏览器
        getWebClient().close();


    }


    public static void main(String[] ar) {
        try{
        TaskVo taskVo = new TaskVo();
        TaskWebUserVo userVo = new TaskWebUserVo();
        userVo.setUserName("18928434455");
        userVo.setPwd("yao1983");
        TaskExecutorService t = new TaskExecutorService();
        t.start(taskVo, userVo);
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
