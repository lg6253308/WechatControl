package com.sinosoft.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.sinosoft.app.ManuService;
import com.sinosoft.dao.MessageResponseDao;




public class WeServlet extends HttpServlet {
	 MessageResponseDao messageResponseDao ;
	private String TOKEN = "sinosoft";
	
	/**
	 * Constructor of the object.
	 */
	public WeServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		 // 微信加密签名
        String signature = request.getParameter("signature");
        // 随机字符串
        String echostr = request.getParameter("echostr");
        // 时间戳
        String timestamp = request.getParameter("timestamp");
        // 随机数
        String nonce = request.getParameter("nonce");
 
        String[] str = {TOKEN, timestamp, nonce };
        Arrays.sort(str); // 字典序排序
        String bigStr = str[0] + str[1] + str[2];
        // SHA1加密
        String digest = new SHA1().getDigestOfString(bigStr.getBytes()).toLowerCase();
        
        // 确认请求来至微信
        if (digest.equals(signature)) {
            response.getWriter().print(echostr);
        }
		doPost(request,response);
	
	
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
	    String userid = request.getParameter("id");
	    System.out.println(userid);
		PrintWriter out = response.getWriter();
		ManuService ms = new ManuService();
		System.out.println("结果"+"--------------manuservice  -------------------");
		String  result = ms.processRequest(request,userid,messageResponseDao);
		out.print(result);
		System.out.println(result);
		System.out.println("结果"+"---------------------------------111");
	}
	

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	 public void init() throws ServletException {  
		  
	        super.init();  
	        ServletContext servletContext = this.getServletContext();  
	  
	        WebApplicationContext ctx = WebApplicationContextUtils  
	                .getWebApplicationContext(servletContext);  
	  
	        messageResponseDao= (MessageResponseDao)ctx.getBean("messageResponseDao");  
	       
	    }

	public MessageResponseDao getMessageResponseDao() {
		return messageResponseDao;
	}
     
	public void setMessageResponseDao(MessageResponseDao messageResponseDao) {
		this.messageResponseDao = messageResponseDao;
	}  

}
