/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.62
 * Generated at: 2022-06-26 12:39:38 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class adminRegisterAgency_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("jar:file:/C:/WebDevelopment/git/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/CarCamping/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1655811683348L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>대리점 등록</title>\r\n");
      out.write("<link\r\n");
      out.write("	href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\"\r\n");
      out.write("	rel=\"stylesheet\"\r\n");
      out.write("	integrity=\"sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3\"\r\n");
      out.write("	crossorigin=\"anonymous\">\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<div align=\"center\">\r\n");
      out.write("		<form name=\"registerAgency\" method=\"post\"\r\n");
      out.write("			action=\"adminRegisterAgency.admin\" enctype=\"multipart/form-data\"\r\n");
      out.write("			class=\"row g-3 needs-validation\" novalidate>\r\n");
      out.write("			<table class=\"table table-sm\">\r\n");
      out.write("				<tr>\r\n");
      out.write("					<td>\r\n");
      out.write("						<div class=\"form-floating\">\r\n");
      out.write("							<select name=\"region_num\" class=\"form-select\" id=\"floatingSelect\">\r\n");
      out.write("								");
      if (_jspx_meth_c_005fforEach_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("							</select> <label for=\"floatingSelect\">지역</label>\r\n");
      out.write("						</div>\r\n");
      out.write("					<td>\r\n");
      out.write("						<div class=\"form-floating mb-3\">\r\n");
      out.write("							<input type=\"text\" name=\"agency_name\" class=\"form-control\"\r\n");
      out.write("								id=\"validationCustom01\" maxlength=\"15\" placeholder=\"1\" required>\r\n");
      out.write("							<label for=\"validationCustom01\">대리점명</label>\r\n");
      out.write("							<div id=\"validationCustom01\" class=\"form-text\">예) 서울 강북점</div>\r\n");
      out.write("						</div>\r\n");
      out.write("					</td>\r\n");
      out.write("				</tr>\r\n");
      out.write("				<tr>\r\n");
      out.write("					<td colspan=\"2\">\r\n");
      out.write("						<div class=\"form-floating\">\r\n");
      out.write("							<input type=\"text\" name=\"agency_location\" class=\"form-control\"\r\n");
      out.write("								id=\"validationCustom02\" maxlength=\"30\" placeholder=\"1\" required\r\n");
      out.write("								readonly onclick=\"findAddr()\">\r\n");
      out.write("							<label for=\"validationCustom02\" >대리점 위치</label>\r\n");
      out.write("						</div>\r\n");
      out.write("					</td>\r\n");
      out.write("				</tr>\r\n");
      out.write("				<tr>\r\n");
      out.write("					<td colspan=\"2\">\r\n");
      out.write("						<div class=\"form-floating\">\r\n");
      out.write("							<input type=\"tel\" name=\"agency_phone\" class=\"form-control\"\r\n");
      out.write("								id=\"validationCustom03\" maxlength=\"15\" placeholder=\"1\"\r\n");
      out.write("								required> <label for=\"validationCustom03\">대리점 번호</label>\r\n");
      out.write("						</div>\r\n");
      out.write("						<div id=\"validationCustom03\" class=\"form-text\">예)\r\n");
      out.write("							02-933-9933</div>\r\n");
      out.write("					</td>\r\n");
      out.write("				</tr>\r\n");
      out.write("				<tr>\r\n");
      out.write("					<td align=\"center\" colspan=\"2\">\r\n");
      out.write("						<button class=\"btn btn-primary\" type=\"reset\">취소</button>\r\n");
      out.write("						<button class=\"btn btn-primary\" type=\"submit\">등록</button>\r\n");
      out.write("					</td>\r\n");
      out.write("				</tr>\r\n");
      out.write("			</table>\r\n");
      out.write("		</form>\r\n");
      out.write("	</div>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("<!-- 주소 API -->\r\n");
      out.write("<script>\r\n");
      out.write("function findAddr(){\r\n");
      out.write("	new daum.Postcode({\r\n");
      out.write("        oncomplete: function(data) {\r\n");
      out.write("        	\r\n");
      out.write("        	console.log(data);\r\n");
      out.write("        	\r\n");
      out.write("            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.\r\n");
      out.write("            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.\r\n");
      out.write("            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.\r\n");
      out.write("            var roadAddr = data.roadAddress; // 도로명 주소 변수\r\n");
      out.write("            var jibunAddr = data.jibunAddress; // 지번 주소 변수\r\n");
      out.write("            // 우편번호와 주소 정보를 해당 필드에 넣는다.\r\n");
      out.write("          \r\n");
      out.write("            if(roadAddr !== ''){\r\n");
      out.write("                document.getElementById(\"validationCustom02\").value = roadAddr;\r\n");
      out.write("            } \r\n");
      out.write("            else if(jibunAddr !== ''){\r\n");
      out.write("                document.getElementById(\"validationCustom02\").value = jibunAddr;\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("	\r\n");
      out.write("    }).open();\r\n");
      out.write("	\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("	<script\r\n");
      out.write("		src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js\"\r\n");
      out.write("		integrity=\"sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p\"\r\n");
      out.write("		crossorigin=\"anonymous\"></script>\r\n");
      out.write("</body>\r\n");
      out.write("<script>\r\n");
      out.write("	// Example starter JavaScript for disabling form submissions if there are invalid fields\r\n");
      out.write("(function () {\r\n");
      out.write("  'use strict'\r\n");
      out.write("\r\n");
      out.write("  // Fetch all the forms we want to apply custom Bootstrap validation styles to\r\n");
      out.write("  var forms = document.querySelectorAll('.needs-validation')\r\n");
      out.write("\r\n");
      out.write("  // Loop over them and prevent submission\r\n");
      out.write("  Array.prototype.slice.call(forms)\r\n");
      out.write("    .forEach(function (form) {\r\n");
      out.write("      form.addEventListener('submit', function (event) {\r\n");
      out.write("        if (!form.checkValidity()) {\r\n");
      out.write("          event.preventDefault()\r\n");
      out.write("          event.stopPropagation()\r\n");
      out.write("        }\r\n");
      out.write("\r\n");
      out.write("        form.classList.add('was-validated')\r\n");
      out.write("      }, false)\r\n");
      out.write("    })\r\n");
      out.write("})()\r\n");
      out.write("</script>\r\n");
      out.write("<script src=\"//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js\"></script>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fforEach_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:forEach
    org.apache.taglibs.standard.tag.rt.core.ForEachTag _jspx_th_c_005fforEach_005f0 = (org.apache.taglibs.standard.tag.rt.core.ForEachTag) _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.get(org.apache.taglibs.standard.tag.rt.core.ForEachTag.class);
    boolean _jspx_th_c_005fforEach_005f0_reused = false;
    try {
      _jspx_th_c_005fforEach_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fforEach_005f0.setParent(null);
      // /WEB-INF/views/admin/adminRegisterAgency.jsp(25,8) name = items type = javax.el.ValueExpression reqTime = true required = false fragment = false deferredValue = true expectedTypeName = java.lang.Object deferredMethod = false methodSignature = null
      _jspx_th_c_005fforEach_005f0.setItems(new org.apache.jasper.el.JspValueExpression("/WEB-INF/views/admin/adminRegisterAgency.jsp(25,8) '${adminListRegion}'",_jsp_getExpressionFactory().createValueExpression(_jspx_page_context.getELContext(),"${adminListRegion}",java.lang.Object.class)).getValue(_jspx_page_context.getELContext()));
      // /WEB-INF/views/admin/adminRegisterAgency.jsp(25,8) name = var type = java.lang.String reqTime = false required = false fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fforEach_005f0.setVar("dto");
      int[] _jspx_push_body_count_c_005fforEach_005f0 = new int[] { 0 };
      try {
        int _jspx_eval_c_005fforEach_005f0 = _jspx_th_c_005fforEach_005f0.doStartTag();
        if (_jspx_eval_c_005fforEach_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
          do {
            out.write("\r\n");
            out.write("									<option value=\"");
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${dto.region_num}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write('"');
            out.write('>');
            out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${dto.region_name}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
            out.write("</option>\r\n");
            out.write("								");
            int evalDoAfterBody = _jspx_th_c_005fforEach_005f0.doAfterBody();
            if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
              break;
          } while (true);
        }
        if (_jspx_th_c_005fforEach_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return true;
        }
      } catch (java.lang.Throwable _jspx_exception) {
        while (_jspx_push_body_count_c_005fforEach_005f0[0]-- > 0)
          out = _jspx_page_context.popBody();
        _jspx_th_c_005fforEach_005f0.doCatch(_jspx_exception);
      } finally {
        _jspx_th_c_005fforEach_005f0.doFinally();
      }
      _005fjspx_005ftagPool_005fc_005fforEach_0026_005fvar_005fitems.reuse(_jspx_th_c_005fforEach_005f0);
      _jspx_th_c_005fforEach_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fforEach_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fforEach_005f0_reused);
    }
    return false;
  }
}