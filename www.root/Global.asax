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
        if (!FormsAuthentication.IsEnabled)
        {
            Application_AcquireRequestState(null, null);
        }
    }
    protected void Application_AcquireRequestState(object sender, System.EventArgs e)
    {
        if (HttpContext.Current.Session != null)
        {
            string szCookieHeader = Request.Headers["Cookie"];
            if ((szCookieHeader != null) && (szCookieHeader.IndexOf("ASP.NET_SessionId") >= 0) && HttpContext.Current.Session.IsNewSession)
            {
                if (User.Identity.IsAuthenticated)
                {
                    var id = Convert.ToInt32(Autenticador.CurrentUser.Id);
                    Library.Inclock.web.br.BL.Login.Logout(id);
                    HttpContext.Current.Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, "") { Expires = DateTime.Now.AddDays(-1) });
                    HttpContext.Current.Response.Cookies.Add(new HttpCookie("integracao", "") { Expires = DateTime.Now.AddDays(-1) });

                }
            }
        }
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
        if (!HttpContext.Current.User.Identity.IsAuthenticated && Autenticador.Ticket != null)
        {
            Autenticador.Instance.Autenticar();
        }
    }
    void RegisterRoutes(RouteCollection routes)
    {
        routes.MapHttpRoute(
                 name: "api",
                 routeTemplate: "api/{controller}/{action}/{id}",
                 defaults: new { id = System.Web.Http.RouteParameter.Optional });
    }
</script>
