<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.ProductImage>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>Delete Product Image
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="full_w">

        <div class="h_title">Delete Product</div>
        <section id="loginForm">
            <h3>Are you sure you want to delete this?</h3>
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

            <input type="submit" value="Delete" class="button cursor" />
            <%: Html.ActionLink("Edit", "Edit", "ProductImage", new { id=Model.ImageId }, new {@class="button"})%>
            <%: Html.ActionLink("Back to List", "Index", "ProductImage", null, new {@class="button"})%>


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
