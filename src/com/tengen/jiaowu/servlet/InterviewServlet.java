package com.tengen.jiaowu.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.tengen.core.servlet.BaseServlet;
import com.tengen.jiaowu.entity.Interview_Info;
import com.tengen.jiaowu.service.InterviewService;
import com.tengen.jiaowu.service.impl.IInterviewService;

public class InterviewServlet extends BaseServlet<Interview_Info> {
	private static final long serialVersionUID = -7283856823426998990L;

	private IInterviewService ivService;

	public InterviewServlet() {
		super();
		ivService = new InterviewService();
		setBaseService(ivService);

		urlMap.put("save_ok", "jsp/Interview/registerInterviewInfo.jsp");
		urlMap.put("query_all", "jsp/Interview/showInterviewInfo.jsp");
		urlMap.put("queryById_ok", "jsp/Interview/editInterviewInfo.jsp");
		urlMap.put("modify_ok", "jsp/Interview/editInterviewInfo.jsp");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doGet(req, resp);
		String flag = req.getParameter("flag");

		if ("ajaxFileDownload".equals(flag)) {
			ajaxFileDownload(req, resp);
		}
	}

	private void ajaxFileDownload(HttpServletRequest req, HttpServletResponse resp) {
		String photoName = req.getParameter("fileName");
		String path = "D:/workspace/Educationalsystem/WebRoot/images/" + photoName;
		try {
			FileInputStream fis = new FileInputStream(path);
			ServletOutputStream sos = resp.getOutputStream();
			byte[] bbuf = new byte[2048];
			int hasRead = 0;
			while ((hasRead = fis.read(bbuf)) > 0) {
				sos.write(bbuf, 0, hasRead);
			}
			fis.close();
			sos.flush();
			sos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		super.doPost(req, resp);
		String flag = req.getParameter("flag");

		if ("ajaxfileupload".equals(flag)) {
			ajaxfileupload(req, resp);
		}
	}

	private void ajaxfileupload(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		try {
			DiskFileItemFactory factoy = new DiskFileItemFactory();
			factoy.setSizeThreshold(1024 * 1024);
			factoy.setRepository(new File("D:/workspace/Educationalsystem/WebRoot/images"));
			ServletFileUpload upload = new ServletFileUpload(factoy);
			upload.setFileSizeMax(1021 * 1024 * 2);
			upload.setSizeMax(1024 * 1024 * 10);
			@SuppressWarnings("unchecked")
			List<FileItem> list = upload.parseRequest(req);
			for (FileItem fileItem : list) {
				if (!fileItem.isFormField()) {
					InputStream in = fileItem.getInputStream();
					File file = new File("D:/workspace/Educationalsystem/WebRoot/images");
					if (!file.exists()) {
						file.mkdirs();
					}
					file.setWritable(true);
					String filePath = file.getAbsolutePath() + "\\" + fileItem.getName();
					FileOutputStream out = new FileOutputStream(filePath);
					byte[] b = new byte[1024];
					int len = 0;
					while ((len = in.read(b)) != -1) {
						out.write(b, 0, len);
					}
					out.flush();
					out.close();
					in.close();

					// 返回图片到客户端
					PrintWriter out1 = resp.getWriter();
					// out1.print("{\"filePath\":"+"\"http://127.0.0.1:8080//FileImages//"+fileItem.getName()+"\"}");
					out1.print("{\"filePath\":\"" + fileItem.getName() + "\"}");
					out1.flush();
					out1.close();
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
