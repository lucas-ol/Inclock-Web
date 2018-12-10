<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web" %>
<%@ Import Namespace="System.Web.Http" %>
<%@ Import Namespace="System.Web.Routing" %>
<%@ Import Namespace="Library.Inclock.web.br.BL.Common" %>
<%@ Import Namespace="Library.Inclock.web.br.BL" %>

<script RunAt="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup    
        RegisterRoutes(RouteTable.Routes);
        GlobalConfiguration.Configure(Register);
       

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
    {        //      var user = Autenticador.Ticket;           
             // Application_AcquireRequestState(null, null);
    }
    protected void Application_AcquireRequestState(object sender, System.EventArgs e)
    {
       
    }
    void Application_BeginRequest(object sender, EventArgs e)
    {

    }

    void Application_PostAuthenticateRequest(object sender, EventArgs e)
    {

        Autenticador.Instance.Autenticar();

    }
    void RegisterRoutes(RouteCollection routes)
    {
        routes.MapHttpRoute(
                 name: "routeTemplate",
                 routeTemplate: "api/{controller}/{action}/{code}",
                 defaults: new { code = System.Web.Http.RouteParameter.Optional });
    }
    public void Register(HttpConfiguration config)
    {
        config.Filters.Add(new AuthorizeAttribute());
        //      config.Filters.Add(new AllowAnonymousAttribute());
    }
</script>
