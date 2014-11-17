<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.ParamValue>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>Attribute Value Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="full_w">
        <div class="h_title">Details Page</div>
        <section id="loginForm">
            <% using (Html.BeginForm())
               { %>
            <div class="display-label">
                <%: Html.LabelFor(model => model.ProductParam.ProductParamName) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.ProductParam.ProductParamName,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.ParamValue1) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.ParamValue1,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>
            <br />
            <br />
            <p>
                <%: Html.ActionLink("Edit", "Edit", "AttributeValues", new { id=Model.ParamValueId }, new {@class="button"})%>
                <%: Html.ActionLink("Back to List", "Index", "AttributeValues", null, new {@class="button"})%>
            </p>

            <% } %>
        </section>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
