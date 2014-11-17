<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PagedList.IPagedList<Administrator.Models.Customer>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>List Customers
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="full_w">
        <div class="h_title">Manage Customers </div>
        <br />
        <p><%: @Html.ActionLink("Create", "Register", "Account", null, new {@class="button add"})%></p>
        <div class="entry">
            <% using (Html.BeginForm())
               { %>
            <p>Search By User Name, First Name, Last Name, Email: <%: @Html.TextBox("SearchString",ViewBag.CurrentFilter as string)%> &nbsp;&nbsp;<input type="submit" value="Search" class="button cursor" /></p>

            <% } %>
        </div>
        <div class="message-success">
            <%: ViewData["Success"] %>
        </div>
        <table>
            <tr>
                <th><%: Html.ActionLink("UserName", "Index", new { sortOrder=ViewBag.UserNameSortParm, currentFilter=ViewBag.CurrentFilter })%></th>
                <th><%: Html.ActionLink("First Name", "Index", new { sortOrder=ViewBag.FirstNameSortParm, currentFilter=ViewBag.CurrentFilter })%></th>
                <th><%: Html.ActionLink("Last Name", "Index", new { sortOrder=ViewBag.LastNameSortParm, currentFilter=ViewBag.CurrentFilter })%></th>
                <th>Email</th>
                <th scope="col" style="width: 63px;"><%: Html.ActionLink("Created", "Index", new { sortOrder=ViewBag.DateSortParm, currentFilter=ViewBag.CurrentFilter })%></th>
                <th scope="col" style="width: 80px;">Modify</th>
            </tr>

            <% foreach (var item in Model)
               { %>
            <tr>
                <td>
                    <%: Html.DisplayFor(modelItem => item.UserProfile.UserName) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.CustomerFirstName) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.CustomerLastName) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.CustomerEmail) %>
                </td>
               
                <td>
                    <%: Html.DisplayFor(modelItem => item.CustomerCreated) %>
                </td>
                <td>
                    <%: Html.ActionLink(" ", "Edit", new { id=item.CustomerId },new {@class="table-icon edit"}) %> |
                    <%: Html.ActionLink(" ", "Details", new { id=item.CustomerId }, new {@class="table-icon archive"}) %> |
                    <%: Html.ActionLink(" ", "Delete", new { id=item.CustomerId }, new {@class="table-icon delete"}) %>
                </td>
            </tr>
            <% } %>
        </table>
        <div class="entry">
            <div class="pagination">
                Page <%: Model.PageCount < Model.PageNumber ? 0 : Model.PageNumber %> of <%: @Model.PageCount %>

                <% if (Model.HasPreviousPage)
                   { %>

                <%: Html.ActionLink("<<", "Index", new { page = 1, sortOrder = ViewBag.CurrentSort, currentFilter = ViewBag.CurrentFilter }) %>
                <%: Html.Raw(" ") %>
                <%: Html.ActionLink("< Prev", "Index", new { page = Model.PageNumber - 1, sortOrder = ViewBag.CurrentSort, currentFilter=ViewBag.CurrentFilter  }) %>

                <% 
                   }
                   else
                   { 
                %>
                 << 
                    <%: Html.Raw(" ") %>
                 < Prev 
             <%  
             }
             %>

                <% if (Model.HasNextPage)
                   {
                %>
                <%: Html.ActionLink("Next >", "Index", new { page = Model.PageNumber + 1, sortOrder = ViewBag.CurrentSort, currentFilter=ViewBag.CurrentFilter  }) %>
                <%: Html.Raw(" ") %>
                <%: Html.ActionLink(">>", "Index", new { page = Model.PageCount, sortOrder = ViewBag.CurrentSort, currentFilter=ViewBag.CurrentFilter  }) %>
                <% 
                }
                   else
                   { 
                %>
                Next >
                <%: Html.Raw(" ") %>
                >> 
              <% 
               } 
              %>
            </div>
            <div class="sep"></div>
            <%: @Html.ActionLink("Create", "Register", "Account", null, new {@class="button add"})%>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
