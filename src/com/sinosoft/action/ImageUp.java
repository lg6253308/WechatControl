package com.sinosoft.action;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ImageUp extends ActionSupport implements ServletRequestAware {
	private static final long serialVersionUID = 1L;
	private File 	upfile;				//上传文件    
	private String  upfileFileName; 		//上传文件名
	private String  upfileContentType;   	//上传文件内容类型
	private HttpServletRequest request ;
	String info ="";
    
//	public String execute() {
//		return "SUCCESS";
//	}
//	
	public String templateUpload() throws Exception {
		 String targetDirectory =ServletActionContext.getServletContext().getRealPath("/");
		 targetDirectory = targetDirectory+"/image";
         System.out.println("===============realpath: ================="+targetDirectory);
         File savefile = new File(targetDirectory, upfileFileName);
         try{
        	 FileUtils.copyFile(upfile, savefile);
        	 ActionContext.getContext().put("message", "文件上传成功");
		 }catch (Exception e) {
			 e.printStackTrace();
			 ActionContext.getContext().put("message", "文件上传失败："+e.getMessage());
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

	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request ;
	}
	public static void main(String[] args) {
		File fl = new File("E:\\照片\\头像\\logo1.jpg");
		ImageUp iu = new ImageUp();
		iu.setUpfile(fl);
		iu.setUpfileFileName("imageUpTest.jpg");
		try {
			iu.templateUpload();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
