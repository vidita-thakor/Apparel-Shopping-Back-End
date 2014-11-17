<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Administrator.Models.Product>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>Details Product
</asp:Content>
<asp:Content ID="headcontent" ContentPlaceHolderID="head" runat="server">
    <link href="../../Content/jquery.cleditor.css" type="text/css" rel="stylesheet" media="screen" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="full_w">
        <div class="h_title">Details Product</div>
        <section id="loginForm">
            <% using (Html.BeginForm())
               { %>
            <div class="display-label">
                <%: Html.LabelFor(model => model.ProductName) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.ProductName,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>
            <div class="display-label">
                <%: Html.LabelFor(model => model.Category.CategoryName) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.Category.CategoryName,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>
            <div class="display-label">
                <%: Html.LabelFor(model => model.ProductShortDescription) %>
            </div>
            <div class="display-field">
                <%: Html.TextAreaFor(model => model.ProductShortDescription,new {@id="input1", disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.ProductLongDescription) %>
            </div>
            <div class="display-field">
                <%: Html.TextAreaFor(model => model.ProductLongDescription,new {@id="input2", disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.ProductUrl) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.ProductUrl,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.ProductPrice) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.ProductPrice,new { disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.ProductDeliveryTxt) %>
            </div>
            <div class="display-field">
                <%: Html.TextAreaFor(model => model.ProductDeliveryTxt,new {@id="input3", disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.ProductReturnsTxt) %>
            </div>
            <div class="display-field">
                <%: Html.TextAreaFor(model => model.ProductReturnsTxt,new {@id="input4", disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.ProductInfoCareTxt) %>
            </div>
            <div class="display-field">
                <%: Html.TextAreaFor(model => model.ProductInfoCareTxt,new {@id="input5", disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <div class="display-label">
                <%: Html.LabelFor(model => model.ProductCreated) %>
            </div>
            <div class="display-field">
                <%: Html.TextBoxFor(model => model.ProductCreated,new {disabled = "disabled", @readonly = "readonly" }) %>
            </div>

            <br />
            <br />
            <p>
                <%: Html.ActionLink("Edit", "Edit", new { id=Model.ProductId }, new {@class="button"}) %>
                <%: Html.ActionLink("Back to List", "Index",null, new {@class="button"}) %>
            </p>

            <%
               } %>
        </section>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
    <script type="text/javascript" src="../../Scripts/jquery.cleditor.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("textarea").cleditor({ width: 500, height: 180, useCSS: true });
        });
    </script>
</asp:Content>
