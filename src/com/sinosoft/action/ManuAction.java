package com.sinosoft.action;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.sinosoft.dao.MessageResponseDao;
import com.sinosoft.dao.WechatManuDao;
import com.sinosoft.entity.ManuDto;
import com.sinosoft.entity.MessageResponseDto;
import com.sinosoft.entity.MessageResponseKey;
import com.sinosoft.entity.UserDto;
import com.sinosoft.entity.WechatManuKey;
import com.sinosoft.manu.POJO.Button;
import com.sinosoft.manu.POJO.CommonButton;
import com.sinosoft.manu.POJO.ComplexButton;
import com.sinosoft.manu.POJO.Menu;
import com.sinosoft.manu.POJO.ViewButton;
import com.sinosoft.manu.common.WxMenuUtils;
import com.sinosoft.manu.common.https.HttpClientConnectionManager;
import com.sinosoft.util.Configuration;

public class ManuAction extends ActionSupport implements ServletRequestAware {
	private MessageResponseDao messageResponseDao;
	private WechatManuDao wechatManuDao;
	private String name;
	private String position;
	private String type;
	private String keyurl;
	private String listNum;
	
	private String content;
	private String title;
	private String responseType;
	private String  requestType;
	private String linkurl;
	private File uploadImage;
	
	String accessToken;
	public static DefaultHttpClient httpclient;
	static {
		httpclient = new DefaultHttpClient();
		httpclient = (DefaultHttpClient) HttpClientConnectionManager
				.getSSLInstance(httpclient);
	}
	private HttpServletRequest request;

	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
	}

	public String showManu() {
		List<ManuDto> manuList = null;
		ManuDto mad = null;
		if (null == request.getSession().getAttribute("currentuser")
				|| request.getSession().isNew()) {
			// 没有登录
			System.out.print("没有登录");

			return "login";
		} else {
			System.out.print("============showManu==========================");
			UserDto ud = (UserDto) request.getSession().getAttribute(
					"currentuser");
			manuList = wechatManuDao.selectByUserId(ud.getUserid());
     System.out.println("===========get list===========");
			List<ManuDto> list0 = new ArrayList();
			List<ManuDto> list1 = new ArrayList();
			List<ManuDto> list2 = new ArrayList();
			if (manuList.size() != 0) {
				for (int i = 0; i < manuList.size(); i++) {
					mad = manuList.get(i);
					String s = mad.getPosition();
					if (s.startsWith("0")) {
						System.out.println("-------------------------------"
								+ mad.getName());
						list0.add(mad);
					} else if (s.startsWith("1")) {
						list1.add(mad);
					} else if (s.startsWith("2")) {
						list2.add(mad);
					}
				}
			}
			//初始化显示
			System.out.println("========================"+"初始化");
			ManuDto defamd= new ManuDto();
			defamd.setName("菜单");
			defamd.setType("click");
			if(list0.size()==0){
				defamd.setPosition("00");
				list0.add(defamd);
			}
			if(list1.size()==0){
				defamd.setPosition("10");
				list1.add(defamd);
			}
			if(list2.size()==0){
				defamd.setPosition("20");
				list2.add(defamd);
			}
			
			request.setAttribute("manuList0", list0);
			System.out.println(list0.get(0).getName());
			request.setAttribute("manuList1", list1);
			request.setAttribute("manuList2", list2);
			
			return "showManu";
		}
	}
	public String addComanu(){
		if (null == request.getSession().getAttribute("currentuser")
				|| request.getSession().isNew()) {
			// 没有登录
			System.out.print("没有登录");
			return "login";
		} else {
			UserDto ud = (UserDto) request.getSession().getAttribute(
			"currentuser");
			if (null==ud.getAppId() || null==ud.getAppSecret()) {
				return "update";
				}
			ManuDto md = new ManuDto();
			md.setUserid(ud.getUserid());
			md.setName(name);
			md.setType(type);
			System.out.println(position+"=======position================");
			md.setPosition(position);
			keyurl=position+position+position;
			md.setKeyurl(keyurl);
			WechatManuKey mk = new WechatManuKey();
			mk.setPosition(position);
			mk.setUserid(ud.getUserid());
			if(null==wechatManuDao.selectByPrimaryKey(mk)){
			    int i= wechatManuDao.insert(md);
			    System.out.println("插入返回=================="+i);
			}else{
				int j = wechatManuDao.updateByPrimaryKey(md);
				System.out.println("更新返回=================="+j);
			}
			return "success"; 
		}
	}
	public String addBtn() {
		if (null==request.getSession().getAttribute("currentuser")
				|| request.getSession().isNew()) {
			// 没有登录
			System.out.print("没有登录");

			return "login";
		} else {
			System.out.print("没有登录,为空取值");
			UserDto ud = (UserDto) request.getSession().getAttribute(
					"currentuser");
			if (null==ud.getAppId() || null==ud.getAppSecret()) {
				return "update";
			}
			System.out.println("=================进入" );
			List<ManuDto> manuList = wechatManuDao.selectByUserId(ud.getUserid());

			List<ManuDto> list0 = new ArrayList();
			List<ManuDto> list1 = new ArrayList();
			List<ManuDto> list2 = new ArrayList();
			ManuDto mad =null;

			if (manuList.size() != 0) {
				for (int i = 0; i < manuList.size(); i++) {
					mad = manuList.get(i);
					String s = mad.getPosition();
					if (s.startsWith("0")) {
						System.out.println("-------------------------------"
								+ mad.getName());
						list0.add(mad);
					} else if (s.startsWith("1")) {
						list1.add(mad);
					} else if (s.startsWith("2")) {
						list2.add(mad);
					}
				}
			
			ManuDto manuDto = new ManuDto();
			manuDto.setUserid(ud.getUserid());
			manuDto.setName(name);
			manuDto.setPosition(position);
			manuDto.setType(type);
			manuDto.setKeyurl(keyurl);
			WechatManuKey mk = new WechatManuKey();
			
			mk.setUserid(ud.getUserid());
			List<ManuDto> btns =null;
			if ((null == position) || ("".equals(position))) {
				boolean flag = true;
				if("0".equals(listNum)){
					btns =list0;
					}else if("1".equals(listNum)){
						btns =list1;
					}else if("2".equals(listNum)){
						btns = list2;
					}				
				for (int m = 0; m < 5; m++) {
					for (int i = 0; i < btns.size(); i++) {
						int num = Integer.parseInt(btns.get(i).getPosition()
								.substring(1));
						if (num == m) {
							flag = true;
							break;
						}else{
							flag = false;
							position=listNum+Integer.toString(m);
						}
					}
					if (!flag) {
						break;
					}
				}
			}
			System.out.println("=======position====================="+position);
			mk.setPosition(position);
			if("click".equals(type)){
				keyurl=position+position+position;
				manuDto.setKeyurl(keyurl);
			}
			manuDto.setPosition(position);
			if (null == wechatManuDao.selectByPrimaryKey(mk)) {
				System.out.println("关键字不存在");
				wechatManuDao.insert(manuDto);
			} else {
				System.out.println("关键字存在");
				wechatManuDao.updateByPrimaryKey(manuDto);
			}
			if("view".equals(type)){}else{
				System.out.println("存入回复对象");
			MessageResponseDto mrd = new MessageResponseDto();
			mrd.setContent(content);
			System.out.println("=========keyurl=========="+keyurl);
			mrd.setKeyword(keyurl);
			
			mrd.setLinkurl(linkurl);
			mrd.setRequesttype("click");
			mrd.setResponsetype(responseType);
			mrd.setTitle(title);
			mrd.setUserid(ud.getUserid());
			
			String targetDirectory =ServletActionContext.getServletContext().getRealPath("/");
          	targetDirectory = targetDirectory+"/image";
            System.out.println("===============realpath: ================="+targetDirectory);
            String upfileFileName=ud.getUserid()+keyurl+".jpg";
			File savefile = new File(targetDirectory, upfileFileName);
			
			String path = ManuAction.class.getResource("/").toString();
			path = path.replace("file:/", "").replace("classes/", "configs/sqlServer.properties");
			Configuration configer= new Configuration(path);
			String proPicUrl = configer.getValue("fansPicUrl");
			
	//		System.out.println("FilePath : "+savefile.getAbsolutePath());
            try{
			FileUtils.copyFile(uploadImage, savefile);
           	 ActionContext.getContext().put("message", "文件上传成功");
            }catch (Exception e) {
   			 e.printStackTrace();
   			 ActionContext.getContext().put("message", "文件上传失败："+e.getMessage());
            }
            
            String picUrl=proPicUrl;
      		mrd.setPicture(picUrl+upfileFileName);
			
			if(null==messageResponseDao.selectByPrimaryKey(mrd)){
				messageResponseDao.insert(mrd);
			}else{
				messageResponseDao.updateByPrimaryKey(mrd);
					}
			
				}
			}
		return "success";
		}
	}

	public String doManu() {
		if (null == request.getSession().getAttribute("currentuser")
				|| request.getSession().isNew()) {
			// 没有登录
			System.out.print("没有登录");

			return "login";
		} else {
			System.out.print("没有登录,为空取值");
			UserDto ud = (UserDto) request.getSession().getAttribute(
					"currentuser");
			if (null == ud.getAppId() || null == ud.getAppSecret()) {
				return "update";
			}
				List<ManuDto> manuList = wechatManuDao.selectByUserId(ud
						.getUserid());
			if(null!=manuList||manuList.size()>0){
				
				String manuStr = getDataManu(manuList);
				System.out.println(manuStr);
				
				WxMenuUtils  wu = new WxMenuUtils();
				wu.upLoadManu(ud.getAppId(), ud.getAppSecret(), manuStr);
				
				System.out.println(manuStr);
				// String res = WxMenuUtils.createMenu(s, accessToken);

				// System.out.println(res);
			}
		}
		return "success";
	}// else终止

	public String deleManu() {
		if (null == request.getSession().getAttribute("currentuser")
				|| request.getSession().isNew()) {
			// 没有登录
			System.out.print("没有登录");

			return "login";
		} else {
			System.out.print("没有登录,为空取值");
			UserDto ud = (UserDto) request.getSession().getAttribute(
					"currentuser");
			WechatManuKey mk = new WechatManuKey();
			mk.setPosition(position);
			mk.setUserid(ud.getUserid());
			int i = wechatManuDao.deleteByPrimaryKey(mk);
			if (i == 1) {
				if ("click".equals(type)) {
					MessageResponseKey mrk = new MessageResponseKey(ud
							.getUserid(), keyurl, type);
					int delmsg = messageResponseDao.deleteByPrimaryKey(mrk);
				}
				return "showManu";
			} else {
				return "error";
			}
		}
	}

	public String getButtondataAction() {
		if (null == request.getSession().getAttribute("currentuser")
				|| request.getSession().isNew()) {
			// 没有登录
			System.out.print("没有登录");

			return "login";
		} else {
			UserDto ud = (UserDto) request.getSession().getAttribute(
					"currentuser");
			WechatManuKey mk = new WechatManuKey();
			mk.setPosition(position);
			mk.setUserid(ud.getUserid());
			ManuDto currentBtn = wechatManuDao.selectByPrimaryKey(mk);
			MessageResponseKey mrk = new MessageResponseKey(ud.getUserid(),
					keyurl, type);
			MessageResponseDto currentBtnMsg = messageResponseDao
					.selectByPrimaryKey(mrk);
			System.out.println(currentBtn.getName() + "========name==========");
			currentBtn.setUserid("");
			JSONObject object = JSONObject.fromObject(currentBtn);
			String btnJson = object.toString();

			if (null != currentBtnMsg) {
				JSONObject object1 = JSONObject.fromObject(currentBtnMsg);
				String BtnMsgbtnJson = object1.toString();
				btnJson = btnJson.replaceFirst(",\"userid\":\"\"", "");
				btnJson = btnJson.replace("}", ",")
						+ BtnMsgbtnJson.replace("{", "");
				System.out.println(BtnMsgbtnJson);
			}
			HttpServletResponse response = ServletActionContext.getResponse();
			// 设置输出UTF-8编码
			response.setCharacterEncoding("UTF-8");
			System.out.println(btnJson);
			// 获得输出流

			PrintWriter pw;
			try {
				pw = response.getWriter();
				// 将数据写入输出流
				pw.write(btnJson);

				// 清楚数据流缓冲区
				pw.flush();
				// 关闭输出流
				pw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return null;
		}
	}

	public String getDataManu(List<ManuDto> list) {
		String result = "";
		ManuDto mad = null;
		List<ManuDto> list0 = new ArrayList();
		List<ManuDto> list1 = new ArrayList();
		List<ManuDto> list2 = new ArrayList();

		if (list.size() != 0) {
			for (int i = 0; i < list.size(); i++) {
				mad = list.get(i);
				String s = mad.getPosition();
				if (s.startsWith("0")) {
					System.out.println("-------------------------------"
							+ mad.getName());
					list0.add(mad);
				} else if (s.startsWith("1")) {
					list1.add(mad);
				} else if (s.startsWith("2")) {
					list2.add(mad);
				}
			}
		}
		// ----------------------------------------------------
		Menu menu = new Menu();
		int nonum = 0;
		Button[] btns1 = new Button[] { parseButton(list0), parseButton(list1),
				parseButton(list2) };
		for (int i = 0; i < btns1.length; i++) {
			if (btns1[i] != null) {
				nonum++;
			}
		}
		Button[] btns = new Button[nonum];
		int m = 0;
		for (int i = 0; i < btns1.length; i++) {
			if (btns1[i] != null) {
				btns[m] = btns1[i];
				m++;
			}
		}
		menu.setButton(btns);
		// ---------------------------------------------------------------------------------------------------------------
		result = net.sf.json.JSONObject.fromObject(menu).toString();
		return result;
	}

	public Button parseButton(List<ManuDto> list) {
		ManuDto mad = null;
		if (list.size() == 1) {
			mad = list.get(0);
			if (mad.getType().equals("click")) {
				CommonButton btn11 = new CommonButton();
				btn11.setName(mad.getName());
				btn11.setType(mad.getType());
				btn11.setKey(mad.getKeyurl());
				return btn11;
			} else if (mad.getType().equals("view")) {
				ViewButton btn11 = new ViewButton();
				btn11.setName(mad.getName());
				btn11.setType(mad.getType());
				btn11.setUrl(mad.getKeyurl());
				return btn11;
			}
			return null;
		} else if (null == list) {
			System.out.println("aaaaaaaaaa列表为空？？？？？？？aaaaaaaaaaaaaaaaa");
			return null;
		} else {
			ComplexButton mainBtn = new ComplexButton();
			int num = list.size();
			Button[] btns = new Button[num - 1];
			String btnum = "";
			if (list.size() != 0) {
				for (int j = 0; j < num; j++) {
					mad = list.get(j);
					String s = mad.getPosition();

					if (s.endsWith("0")) {
						mainBtn.setName(mad.getName());
					} else {
						btnum = s.substring(s.length() - 1);
						int i = Integer.parseInt(btnum);
						if (mad.getType().equals("click")) {
							CommonButton btn11 = new CommonButton();
							btn11.setName(mad.getName());
							btn11.setType(mad.getType());
							btn11.setKey(mad.getKeyurl());
							btns[i - 1] = btn11;
						} else if (mad.getType().equals("view")) {
							ViewButton btn11 = new ViewButton();
							btn11.setName(mad.getName());
							btn11.setType(mad.getType());
							btn11.setUrl(mad.getKeyurl());
							btns[i - 1] = btn11;
						}
					}
				}
			} else {
			}

			mainBtn.setSub_button(btns);

			return mainBtn;
		}
	}

	public MessageResponseDao getMessageResponseDao() {
		return messageResponseDao;
	}

	public void setMessageResponseDao(MessageResponseDao messageResponseDao) {
		this.messageResponseDao = messageResponseDao;
	}

	public WechatManuDao getWechatManuDao() {
		return wechatManuDao;
	}

	public void setWechatManuDao(WechatManuDao wechatManuDao) {
		this.wechatManuDao = wechatManuDao;
	}

	public static void main(String[] args) {
		ManuDto manu00 = new ManuDto();
		manu00.setUserid("lg1111");
		manu00.setName("manu00");
		manu00.setKeyurl("000000");
		manu00.setPosition("00");
		manu00.setType("comanu");

		ManuDto manu01 = new ManuDto();
		manu01.setUserid("lg1111");
		manu01.setName("manu01");
		manu01.setKeyurl("010101");
		manu01.setPosition("01");
		manu01.setType("click");

		ManuDto manu02 = new ManuDto();
		manu02.setUserid("lg1111");
		manu02.setName("manu02");
		manu02.setKeyurl("www.baidu.com");
		manu02.setPosition("02");
		manu02.setType("view");

		ManuDto manu10 = new ManuDto();
		manu10.setPosition("10");
		manu10.setUserid("lg1111");
		manu10.setName("manu10");
		manu10.setKeyurl("101010");
		manu10.setType("comanu");

		ManuDto manu11 = new ManuDto();
		manu11.setPosition("11");
		manu11.setUserid("lg1111");
		manu11.setName("manu11");
		manu11.setKeyurl("111111");
		manu11.setType("click");

		ManuDto manu12 = new ManuDto();
		manu12.setPosition("12");
		manu12.setUserid("lg1111");
		manu12.setName("manu12");
		manu12.setKeyurl("121212");
		manu12.setType("click");

		ManuDto manu20 = new ManuDto();
		manu20.setPosition("20");
		manu20.setUserid("lg1111");
		manu20.setName("manu20");
		manu20.setKeyurl("202020");
		manu20.setType("comanu");

		ManuDto manu21 = new ManuDto();
		manu21.setPosition("21");
		manu21.setUserid("lg1111");
		manu21.setName("manu21");
		manu21.setKeyurl("www.sina.com");
		manu21.setType("view");

		ManuDto manu22 = new ManuDto();
		manu22.setPosition("22");
		manu22.setUserid("lg1111");
		manu22.setName("manu22");
		manu22.setKeyurl("222222");
		manu22.setType("click");

		List<ManuDto> manulist = new ArrayList();

		manulist.add(manu00);

		manulist.add(manu01);
		manulist.add(manu02);
		manulist.add(manu10);
		manulist.add(manu11);
		manulist.add(manu12);
		manulist.add(manu20);
		manulist.add(manu21);
		manulist.add(manu22);
		System.out.println("=============" + manulist.size());
		String s = "";
		System.out.println(s);
		ManuAction ma = new ManuAction();
		s = ma.getDataManu(manulist);
		System.out.println("++++++++++++++++++++" + s);

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyurl() {
		return keyurl;
	}

	public void setKeyurl(String keyurl) {
		this.keyurl = keyurl;
	}

	public String getListNum() {
		return listNum;
	}

	public void setListNum(String listNum) {
		this.listNum = listNum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getResponseType() {
		return responseType;
	}

	public void setResponseType(String responseType) {
		this.responseType = responseType;
	}

	public String getRequestType() {
		return requestType;
	}

	public void setRequestType(String requestType) {
		this.requestType = requestType;
	}

	public String getLinkurl() {
		return linkurl;
	}

	public void setLinkurl(String linkurl) {
		this.linkurl = linkurl;
	}

	public File getUploadImage() {
		return uploadImage;
	}

	public void setUploadImage(File uploadImage) {
		this.uploadImage = uploadImage;
	}

	
}
