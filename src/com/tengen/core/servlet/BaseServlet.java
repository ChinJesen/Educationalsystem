package com.tengen.core.servlet;

import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tengen.core.service.BaseService;
import com.tengen.core.service.impl.IBaseService;
import com.tengen.core.util.CommUtil;
import com.tengen.core.util.PageUtil;

/**
 * 通用BaseServlet<控制层>
 * 
 * @author Administrator
 *
 * @param <E>
 */
public class BaseServlet<E> extends HttpServlet {

	private static final long serialVersionUID = -116603712021475951L;

	private Class<?> cls;
	private IBaseService<E> baseService;

	public void setBaseService(IBaseService<E> baseService) {
		this.baseService = baseService;
	}

	protected Map<String, String> urlMap;

	public BaseServlet() {
		Type type = this.getClass().getGenericSuperclass();
		if (type instanceof ParameterizedType) {
			Type[] types = ((ParameterizedType) type).getActualTypeArguments();
			cls = (Class<?>) types[0];
		}
		urlMap = new HashMap<String, String>();
		urlMap.put("save_ok", "");
		urlMap.put("query_all", "");
		urlMap.put("queryById_ok", "");
		urlMap.put("modify_ok", "");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String flag = req.getParameter("flag");
		if ("save".equals(flag)) {
			save(req, resp);
		} else if ("queryAll".equals(flag)) {
			queryAll(req, resp, false);
		} else if ("queryById".equals(flag)) {
			queryById(req, resp);
		} else if ("modify".equals(flag)) {
			modify(req, resp);
		} else if ("delete".equals(flag)) {
			delete(req, resp);
		} else if ("queryusers".equals(flag)) {
			queryusers(req, resp);
		} else if ("getClassIdStu".equals(flag)) {
			getClassIdStu(req,resp);
		}
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String flag = req.getParameter("flag");
		if ("login".equals(flag)) {
			login(req, resp);
		} else if ("valid".equals(flag)) {
			valid(req, resp);
		}
	}

	/**
	 * 通用删除方法
	 * 
	 * @param req
	 * @param resp
	 * @throws IOException
	 * @throws ServletException
	 */
	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 获取主键ID
		String id = getId(req);
		// 调用业务方法
		baseService.deleteById(id);
		// 重新查询数据
		refresh();
		queryAll(req, resp, true);
	}

	/**
	 * 通用修改方法
	 * 
	 * @param req
	 * @param resp
	 * @throws IOException
	 * @throws ServletException
	 * @throws Exception
	 */
	protected void modify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String msg = "修改成功！";

		try {
			// 1.获取表单数据
			E e = getReqParamters(req);
			// 2.调用业务方法
			baseService.modify(e);
			// 3.封装表单数据
			req.setAttribute("entity", e);

		} catch (Exception e1) {
			msg = "修改失败！";
			e1.printStackTrace();
		}
		req.setAttribute("msg", msg);
		// 4.跳转
		refresh();
		req.getRequestDispatcher(urlMap.get("modify_ok")).forward(req, resp);
	}

	/**
	 * 根据主键查询数据
	 * 
	 * @param req
	 * @param resp
	 * @throws IOException
	 * @throws ServletException
	 */
	protected void queryById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1.获取主键信息
		String id = getId(req);

		if (id != null && !"".equals(id)) {
			E e = baseService.queryById(id);
			req.setAttribute("entity", e);
			req.getRequestDispatcher(urlMap.get("queryById_ok")).forward(req, resp);
		}
	}

	/**
	 * 获取主键ID值
	 * 
	 * @param req
	 * @return
	 */
	protected String getId(HttpServletRequest req) {
		return req.getParameter("id");
	}

	/**
	 * 通用按条件查询方法
	 * 
	 * @param req
	 * @param resp
	 * @param falg
	 * @throws ServletException
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	protected void queryAll(HttpServletRequest req, HttpServletResponse resp, boolean falg)
			throws ServletException, IOException {
		try {
			// 1.查询条件
			E e = null;
			// flag为true时，不需要查询条件
			if (falg) {
				e = (E) cls.newInstance();
			} else {
				e = getReqParamters(req);
			}

			// 2.分页条件
			PageUtil<E> pageUtil = getPageUtilParamters(req);
			pageUtil.setEntity(e);
			// 3.调用业务方法
			baseService.queryInfos(pageUtil);
			// 4.封装查询结果
			req.setAttribute("pageUtil", pageUtil);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 5.跳转页面
		req.getRequestDispatcher(urlMap.get("query_all")).forward(req, resp);
	}

	/**
	 * 通用保存方法
	 * 
	 * @param req
	 * @param resp
	 * @throws IOException
	 * @throws ServletException
	 */
	protected void save(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String msg = "保存成功！";
			// 1.收集数据
			E e = getReqParamters(req);
			// 2.调用业务方法
			if (!baseService.save(e)) {
				msg = "保存失败！";
			}
			// 3.跳转
			req.setAttribute("entity", e);
			req.setAttribute("msg", msg);

		} catch (Exception e) {
			e.printStackTrace();
			
		}
		refresh();
		req.getRequestDispatcher(urlMap.get("save_ok")).forward(req, resp);
	}

	/**
	 * 获取分页条件
	 * 
	 * @param req
	 * @return
	 */
	protected PageUtil<E> getPageUtilParamters(HttpServletRequest req) {
		PageUtil<E> pageUtil = new PageUtil<E>();
		String pageSize = req.getParameter("pageSize");
		String pageNum = req.getParameter("pageNum");
		if (pageSize != null && !"".equals(pageSize)) {
			pageUtil.setPageSize(Integer.parseInt(pageSize));
		}
		if (pageNum != null && !"".equals(pageNum)) {
			pageUtil.setPageNum(Integer.parseInt(pageNum));
		}
		return pageUtil;
	}

	/**
	 * 自动封装表单数据 表单Name必须跟实体类的属性名相同
	 * 
	 * @return
	 * @throws IllegalAccessException
	 * @throws InstantiationException
	 */
	@SuppressWarnings("unchecked")
	protected E getReqParamters(HttpServletRequest req) throws Exception {
		Map<String, String[]> parameMap = req.getParameterMap();
		E e = (E) cls.newInstance();
		Field[] fields = cls.getDeclaredFields();

		for (String fromName : parameMap.keySet()) {
			String[] vals = parameMap.get(fromName);
			String valSrc = "";
			for (String v : vals) {
				if ("".equals(valSrc)) {
					valSrc = v;
				} else {
					valSrc += "@@@" + v;
				}
			}

			for (Field field : fields) {
				String fieldName = field.getName();
				if (fieldName.equalsIgnoreCase(fromName)) {
					// 避开虚拟机
					field.setAccessible(true);
					String fieldType = field.getType().getSimpleName();
					if ("Integer".equals(fieldType)) {
						if (valSrc != null && !"".equals(valSrc)) {
							field.set(e, Integer.parseInt(valSrc));
						}
					} else {
						field.set(e, valSrc);
					}
					break;
				}
			}
		}

		return e;
	}

	public void setBaseService(BaseService<E> baseService) {
		this.baseService = baseService;
	}

	/**
	 * @param req
	 * @param resp
	 */
	protected void valid(HttpServletRequest req, HttpServletResponse resp) {

	}

	/**
	 * @param req
	 * @param resp
	 */
	protected void queryusers(HttpServletRequest req, HttpServletResponse resp) {

	}

	/**
	 * @param req
	 * @param resp
	 */
	protected void login(HttpServletRequest req, HttpServletResponse resp) {

	}
	
	public void refresh(){
		CommUtil.newInstance().refresh();
		ServletContext application=this.getServletContext();
		application.setAttribute("userMap", CommUtil.newInstance().getUserMap());
		application.setAttribute("departMap", CommUtil.newInstance().getDepartMap());
		application.setAttribute("createUserMap", CommUtil.newInstance().getCreateUserMap());
		application.setAttribute("classMap", CommUtil.newInstance().getClassMap());
		application.setAttribute("stuNameMap", CommUtil.newInstance().getStuNameMap());
		application.setAttribute("groupMap", CommUtil.newInstance().getGroupMap());
	}

	/**
	 * 获取班级内的学生信息
	 * @param req
	 * @param resp
	 */
	protected void getClassIdStu(HttpServletRequest req, HttpServletResponse resp) {
		
		
	}

}
