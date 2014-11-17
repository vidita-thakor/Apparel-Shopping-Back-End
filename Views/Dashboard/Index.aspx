<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>Dashboard
</asp:Content>
<asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="Scripts/highcharts_init.js"></script>
    <script type="text/javascript" src="Scripts/highcharts.js"></script>
</asp:Content>
<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="full_w">
        <div class="h_title">Welcome to Administrator Panel</div>
        <br class="clear" />
        <div class="half_w half_left">
            <div class="h_title">Visits statistics</div>
            <div id="container" style="min-width: 300px; height: 180px; margin: 0 auto"></div>
        </div>
        <div class="half_w half_right">
            <div class="h_title">Site statistics</div>
            <div class="stats">
                <div class="today">
                    <h3>Today</h3>
                    <p class="count">2 349</p>
                    <p class="type">Visits</p>
                    <p class="count">96</p>
                    <p class="type">Comments</p>
                    <p class="count">9</p>
                    <p class="type">Articles</p>
                </div>
                <div class="week">
                    <h3>Last week</h3>
                    <p class="count">12 931</p>
                    <p class="type">Visits</p>
                    <p class="count">521</p>
                    <p class="type">Comments</p>
                    <p class="count">38</p>
                    <p class="type">Articles</p>
                </div>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
