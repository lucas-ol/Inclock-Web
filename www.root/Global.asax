<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Web.Http" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="Library.Inclock.web.br.BL.Common"%>
<%@ Import Namespace="Library.Inclock.web.br.BL"%>

<script RunAt="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup    
        RegisterRoutes(RouteTable.Routes);
    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown
    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs
        var vt = Server.GetLastError();
    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        var cur = Autenticador.CurrentUser;
        Library.Inclock.web.br.BL.Login.Logout(cur.Id);
        Session.Abandon();
        Response.Redirect("/");
    }
    void Application_BeginRequest(object sender, EventArgs e)
    {
        var url = HttpContext.Current.Request.Url;
        // HttpContext.Current.RewritePath("/index.aspx");
        if (url.AbsolutePath.ToLower().Contains(".aspx"))
        {
        //    HttpContext.Current.RewritePath(HttpContext.Current.Request.Url.ToString().Replace(".aspx",""));
        }
    }

    void Application_PostAuthenticateRequest(object sender, EventArgs e)
    {
        Autenticador.Instance.Autenticar();
    }
    void RegisterRoutes(RouteCollection routes)
    {
        routes.MapHttpRoute(
                 name: "api",
                 routeTemplate: "api/{controller}/{action}/{id}",
                 defaults: new { id = System.Web.Http.RouteParameter.Optional });
    }
</script>
