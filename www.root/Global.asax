<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="System.Security.Principal" %>

<script RunAt="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup    

    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
    }
    void Application_BeginRequest(object sender, EventArgs e)
    {
        var url = HttpContext.Current.Request.Url;
        // HttpContext.Current.RewritePath("/index.aspx");
        if (url.AbsolutePath.ToLower().Contains("/avisos"))
        {
            //  HttpContext.Current.RewritePath(MakeUrl(url.Segments));
        }
    }

    void Application_PostAuthenticateRequest(object sender, EventArgs e)
    {        
        new Autenticado().Autenticar();
    }
    void RegisterRoutes(RouteCollection routes)
    {
        //   routes.MapPageRoute("ExpenseReport/{locale}","~/",);
    }

</script>
