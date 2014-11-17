<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Administrator.Models.OrderItem>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Apparel Shopping - Administrator Panel - Order Item List
</asp:Content>


<asp:Content ID="Content6" ContentPlaceHolderID="MainContent" runat="server">
    <div class="full_w">
        <div class="h_title">Order Item List </div>
        <br />

<table>
    <thead>
    <tr>
        <th scope="col" style="width: 12px;">Order Id</th>
        <th scope="col" style="width: 55px;">Product Name</th>
        <th scope="col" style="width: 55px;">Color</th>
        <th scope="col" style="width: 55px;">Size</th>
        <th scope="col" style="width: 55px;">Quantity</th>
        <th scope="col" style="width: 55px;">Unit Price</th>
        <th scope="col" style="width: 55px;">Subtotal</th>
    </tr>
 </thead>
    <tbody>
<% foreach (var item in Model) { %>
    <tr>
        <td>
           <%: Html.DisplayFor(modelItem => item.OrderId) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Inventory.Product.ProductName) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Inventory.ParamValue.ParamValue1) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.Inventory.ParamValue1.ParamValue1) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.ItemQuantity) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.ItemUnitPrice) %>
        </td>
        <td>
            <%: Html.DisplayFor(modelItem => item.ItemSubtotal) %>
        </td>
    </tr>
 <% } %>
            </tbody>
    
</table>
        </div>
    <%: Html.ActionLink("Back to List", "Index", "Order", null, new {@class="button"})%>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
