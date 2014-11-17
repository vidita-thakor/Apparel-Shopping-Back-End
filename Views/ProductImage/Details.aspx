<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.ProductImage>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>Details Product Image
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="full_w">
        <div class="h_title">Details Product Image</div>
        <section id="loginForm">
            <% using (Html.BeginForm())
               { %>
            <div class="display-label">
                <%: Html.LabelFor(model => model.Product.ProductName) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.Product.ProductName,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.ImageTitle) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.ImageTitle,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.ImageAltText) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.ImageAltText,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.ImageName) %>
            </div>
            <div class="display-field">
               
                <br />
                <%
                if (Model.ImageName != null)
                {
                %>
                <img border="0" src="<%=Url.Content("../../uploads/"+Model.ImageName) %>" />
                <%
                }
                %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.ImageIsMain) %>
            </div>
            <div class="display-field">
                <%: Html.DisplayFor(model => model.ImageIsMain,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.ImageCreated) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.ImageCreated,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>
            <br />
            <br />
            <p>
                <%: Html.ActionLink("Edit", "Edit", new { id=Model.ImageId }, new {@class="button"}) %>
                <%: Html.ActionLink("Back to List", "Index",null, new {@class="button"}) %>
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
