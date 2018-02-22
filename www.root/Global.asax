<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>

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

    void RegisterRoutes(RouteCollection routes)
    {
        //   routes.MapPageRoute("ExpenseReport/{locale}","~/",);
    }

   /*  string MakeUrl(string[] url)
    {
       
        if (url.Contains("cadastrar"))
        {         
            return string.Format("/{0}Default.aspx?acao=1", url[1].ToLower());
        }
        else if (url.Contains("alterar"))
        {
            return string.Format("/{0}Default.aspx?acao=2", url[1].ToLower());
        }
        else if (url.Contains("excluir"))
        {
            return string.Format("/{0}Default.aspx?acao=3", url[1].ToLower());
        }
        else
            return "/";
    }*/
</script>
