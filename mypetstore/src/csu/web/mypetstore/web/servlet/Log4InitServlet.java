package csu.web.mypetstore.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Log4InitServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.setProperty("logPath", "C://Documents and Settings//jl60155//webIVR-workspace//ScriptMaint-WebVersion//logs//myLog.log");
        System.err.println("Log4j Servlet test Path: " + System.getProperty("logPath"));

        //PropertyConfigurator.configure(getServletContext().getRealPath("/") + getInitParameter("configfile"));
    }

}
