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
 * ͨ��BaseServlet<���Ʋ�>
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
	 * ͨ��ɾ������
	 * 
	 * @param req
	 * @param resp
	 * @throws IOException
	 * @throws ServletException
	 */
	protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// ��ȡ����ID
		String id = getId(req);
		// ����ҵ�񷽷�
		baseService.deleteById(id);
		// ���²�ѯ����
		refresh();
		queryAll(req, resp, true);
	}

	/**
	 * ͨ���޸ķ���
	 * 
	 * @param req
	 * @param resp
	 * @throws IOException
	 * @throws ServletException
	 * @throws Exception
	 */
	protected void modify(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String msg = "�޸ĳɹ���";

		try {
			// 1.��ȡ������
			E e = getReqParamters(req);
			// 2.����ҵ�񷽷�
			baseService.modify(e);
			// 3.��װ������
			req.setAttribute("entity", e);

		} catch (Exception e1) {
			msg = "�޸�ʧ�ܣ�";
			e1.printStackTrace();
		}
		req.setAttribute("msg", msg);
		// 4.��ת
		refresh();
		req.getRequestDispatcher(urlMap.get("modify_ok")).forward(req, resp);
	}

	/**
	 * ����������ѯ����
	 * 
	 * @param req
	 * @param resp
	 * @throws IOException
	 * @throws ServletException
	 */
	protected void queryById(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 1.��ȡ������Ϣ
		String id = getId(req);

		if (id != null && !"".equals(id)) {
			E e = baseService.queryById(id);
			req.setAttribute("entity", e);
			req.getRequestDispatcher(urlMap.get("queryById_ok")).forward(req, resp);
		}
	}

	/**
	 * ��ȡ����IDֵ
	 * 
	 * @param req
	 * @return
	 */
	protected String getId(HttpServletRequest req) {
		return req.getParameter("id");
	}

	/**
	 * ͨ�ð�������ѯ����
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
			// 1.��ѯ����
			E e = null;
			// flagΪtrueʱ������Ҫ��ѯ����
			if (falg) {
				e = (E) cls.newInstance();
			} else {
				e = getReqParamters(req);
			}

			// 2.��ҳ����
			PageUtil<E> pageUtil = getPageUtilParamters(req);
			pageUtil.setEntity(e);
			// 3.����ҵ�񷽷�
			baseService.queryInfos(pageUtil);
			// 4.��װ��ѯ���
			req.setAttribute("pageUtil", pageUtil);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 5.��תҳ��
		req.getRequestDispatcher(urlMap.get("query_all")).forward(req, resp);
	}

	/**
	 * ͨ�ñ��淽��
	 * 
	 * @param req
	 * @param resp
	 * @throws IOException
	 * @throws ServletException
	 */
	protected void save(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String msg = "����ɹ���";
			// 1.�ռ�����
			E e = getReqParamters(req);
			// 2.����ҵ�񷽷�
			if (!baseService.save(e)) {
				msg = "����ʧ�ܣ�";
			}
			// 3.��ת
			req.setAttribute("entity", e);
			req.setAttribute("msg", msg);

		} catch (Exception e) {
			e.printStackTrace();
			
		}
		refresh();
		req.getRequestDispatcher(urlMap.get("save_ok")).forward(req, resp);
	}

	/**
	 * ��ȡ��ҳ����
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
	 * �Զ���װ������ ��Name�����ʵ�������������ͬ
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
					// �ܿ������
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
	 * ��ȡ�༶�ڵ�ѧ����Ϣ
	 * @param req
	 * @param resp
	 */
	protected void getClassIdStu(HttpServletRequest req, HttpServletResponse resp) {
		
		
	}

}
