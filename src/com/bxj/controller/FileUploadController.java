package com.bxj.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bxj.model.product.GoodsInfo;
import com.bxj.util.Config;
import com.bxj.util.FileUtil;

import net.sf.json.JSONObject;

@Controller
public class FileUploadController {
	
	private static final Logger logger = Logger.getLogger(FileUploadController.class);
	@Autowired
	private Config config;

	@RequestMapping("/addImg")
	public void uploadImg(HttpServletRequest request,HttpServletResponse response
			, @RequestParam("banner") MultipartFile file){
		/*
		try{
			String contentType = file.getContentType();
			String suffix = FileUtil.getImgSuffix(contentType);
			
			String newName = UUID.randomUUID()+"."+suffix;
			String path = request.getServletContext().getRealPath("/")+"upload/";
			File newfile = new File(path+newName);
			InputStream is = file.getInputStream();
			FileUtils.copyInputStreamToFile(is, newfile);
			is.close();
			
			JSONObject jobj = new JSONObject();
			jobj.put("fileName", newName);
			response.getWriter().print(jobj);
			response.getWriter().flush();
		}catch(Exception ex){
			ex.printStackTrace();
			logger.error(ex.getMessage(), ex);
		}*/
		
		
		String newName = "";
		try{
			
			String contentType = file.getContentType();
			String suffix = FileUtil.getImgSuffix(contentType);
			
			String oName = (file.getOriginalFilename()==null?"":file.getOriginalFilename());
			String curTime = ""+System.currentTimeMillis();
			
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
			newName = config.getProductDir()+"/"+format.format(new Date())+"/"+config.getImagePrefix()
				+FileUtil.encrypt(oName+curTime)+"."+suffix;
			File newfile = new File(config.getResdir()+newName);
			InputStream is = file.getInputStream();
			FileUtils.copyInputStreamToFile(is, newfile);
			is.close();
			
		}catch(Exception ex){
			logger.error(ex.getMessage(), ex);
		}finally{
			
		}
		
		try{
			JSONObject jobj = new JSONObject();
			jobj.put("fileName", newName);
			jobj.put("baseUrl", config.getBaseUrl());
			response.getWriter().print(jobj);
			response.getWriter().flush();
		}catch(Exception ex){
			logger.error(ex.getMessage(), ex);
		}
		
	}
	
	
	@RequestMapping("/uploadGoodsInfoImg")
    public void uploadGoodsInfoImg(HttpServletRequest request,HttpServletResponse response
            , @RequestParam("imgfile") MultipartFile file,GoodsInfo goodsInfo){

        String strId = "0";
        String newName = "";
        String oldNameNum = "0";
        int imgType = 0;
        int imgWidth=0,imgHeight=0;
        try{

            if(goodsInfo == null)return;

            String contentType = file.getContentType();
            String suffix = FileUtil.getImgSuffix(contentType);

            strId = (goodsInfo.getId()==null?"0":""+goodsInfo.getId());
            String oName = (file.getOriginalFilename()==null?"":file.getOriginalFilename());

            oldNameNum = oName.replace(" ","");
            oldNameNum = oldNameNum.replace(oldNameNum.substring(oldNameNum.lastIndexOf(".")),"");
            try{
                String reg = "[\\(（][\\s\\S]*[\\)）]";
                Pattern pattern = Pattern.compile(reg);
                Matcher mat = pattern.matcher(oldNameNum);
                boolean result = mat.find();
                if( result ){
                    oldNameNum = oldNameNum.replace(mat.group(),"");
                }
                if( oldNameNum.split("_").length >= 2 ){
                    oldNameNum = oldNameNum.split("_")[1];
                }else{
                    oldNameNum = "0";
                }
                
                if(!oName.startsWith("b_")){
                	imgType = 1;
                }
            }catch (Exception e){
                e.printStackTrace();
            }

            String curTime = ""+System.currentTimeMillis();

            SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
            newName = config.getProductInfoDir()+"/"+format.format(new Date())+"/"+config.getImagePrefix()
                    +FileUtil.encrypt(strId+oName+curTime)+"."+suffix;
            File newfile = new File(config.getResdir()+newName);
            InputStream is = file.getInputStream();
            FileUtils.copyInputStreamToFile(is, newfile);
            is.close();
            
            BufferedImage img = javax.imageio.ImageIO.read(file.getInputStream());
            imgWidth = img.getWidth();
            imgHeight = img.getHeight();

        }catch(Exception ex){
            ex.printStackTrace();
        }finally{

        }
        try{
            JSONObject jobj = new JSONObject();
            jobj.put("id",strId);
            jobj.put("index",oldNameNum);
            jobj.put("imgpath", newName);
            jobj.put("imgtype", imgType);
            jobj.put("imgwidth", imgWidth);
            jobj.put("imgheight", imgHeight);
            jobj.put("configUrl", config.getBaseUrl());
            response.getWriter().print(jobj);
            response.getWriter().flush();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

}
