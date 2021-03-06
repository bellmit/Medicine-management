package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Drug;
import dao.DrugDao;
import dao.DrugDaoImpl;
import net.sf.json.JSONArray;
import utils.FenYe;

/**
 * Servlet implementation class ShowDrug
 */
@WebServlet("/ShowDrug")
public class ShowDrug extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowDrug() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			DrugDao drugDao = new DrugDaoImpl();
			List<Drug> drugs = drugDao.queryAll();
			
//			request.setAttribute("drug", drugs);
//			request.getRequestDispatcher("/index.jsp").forward(request, response);
			JSONArray data = JSONArray.fromObject(drugs);
			
			  //接下来发送数据
			 /*设置编码，防止出现乱码问题*/
			response.setContentType("text/html; charset=utf-8"); 
			             /*得到输出流*/
			 PrintWriter respWritter = response.getWriter();
			             /*将JSON格式的对象toString()后发送*/
			 respWritter.append(data.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
