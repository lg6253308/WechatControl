package com.sinosoft.action;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.sinosoft.common.Userutil;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class GroupChAction extends ActionSupport implements ServletRequestAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private HttpServletResponse response;
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request=request;
	}

//	public void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//        String username = request.getParameter("username");
//        byte[] by = new WxService().getVerifycode(username,request);
//        response.setContentType("image/jpeg");
//        ServletOutputStream out = response.getOutputStream(); 
//		ByteArrayInputStream in = new ByteArrayInputStream(by);    //��b��Ϊ������
//		BufferedImage image = ImageIO.read(in);     //��in��Ϊ�������ȡͼƬ����image�У�������in����ΪByteArrayInputStream();
//		JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
//        encoder.encode(image);
//		out.flush();
//		out.close();
//	}

	public String groupIdC(){
		String groupId = request.getParameter("groupId");
		System.out.println("groupId======"+groupId);
		PrintWriter out=null;
		boolean flag=false;
		try {
			flag = new Userutil().getFanList(request,groupId);
			System.out.println("==============----==="+flag);
//			out = response.getWriter();
//			out.print(flag);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
//        out.flush();
//		out.close();
			System.out.println("==============----=1=="+flag);
		}
		if(flag==true){
			return SUCCESS;
		}else{
			return ERROR;
		}
	}

}
