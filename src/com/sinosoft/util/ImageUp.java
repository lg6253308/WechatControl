package com.sinosoft.util;

import java.io.File;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;

public class ImageUp {
	private static final long serialVersionUID = 1L;
	private File 	upfile;				//上传文件    
	private String  upfileFileName; 		//上传文件名
	private String  upfileContentType;   	//上传文件内容类型
	String info ="";
    
	public String execute() {
		return "SUCCESS";
	}
	
	public String templateUpload() throws Exception {
		 String targetDirectory =System.getProperty("user.dir");//ServletActionContext.getServletContext().getRealPath("/");
         System.out.println("===============realpath: ================="+targetDirectory);
         targetDirectory = targetDirectory+"/WebRoot/image";
         File savefile = new File(targetDirectory, upfileFileName);
         try{
        	 FileUtils.copyFile(upfile, savefile);
		 }catch (Exception e) {
			 e.printStackTrace();
		 }
		 
		 return "SUCCESS";   
	 }

	public File getUpfile() {
		return upfile;
	}

	public void setUpfile(File upfile) {
		this.upfile = upfile;
	}

	public String getUpfileFileName() {
		return upfileFileName;
	}

	public void setUpfileFileName(String upfileFileName) {
		this.upfileFileName = upfileFileName;
	}

	public String getUpfileContentType() {
		return upfileContentType;
	}

	public void setUpfileContentType(String upfileContentType) {
		this.upfileContentType = upfileContentType;
	}
}
