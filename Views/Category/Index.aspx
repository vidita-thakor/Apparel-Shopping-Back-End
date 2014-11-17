<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<PagedList.IPagedList<Administrator.Models.Category>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%: System.Configuration.ConfigurationManager.AppSettings["SiteTitle"] %>List Category
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="full_w">
        <div class="h_title">Manage Categories </div>
        <br />
        <p><%: @Html.ActionLink("Create", "Create", "Category", null, new {@class="button add"})%></p>
        <div class="entry">
             <% using (Html.BeginForm())
               { %>
            <p>Search By Title: <%: @Html.TextBox("SearchString",ViewBag.CurrentFilter as string)%> &nbsp;&nbsp;<input type="submit" value="Search"  class="button cursor" /></p>

            <% } %>
        </div>
         <div class="message-success">
                <%: ViewData["Success"] %>
            </div>
         <table>
            <thead>
                <tr>
                    <th scope="col">
                        <%: Html.ActionLink("Name", "Index", new { sortOrder=ViewBag.NameSortParm, currentFilter=ViewBag.CurrentFilter })%>
                    </th>
                    <th>
                        Parent Category
                    </th>
                    <th scope="col" style="width: 150px;">
                       <%: Html.ActionLink("Created", "Index", new { sortOrder=ViewBag.DateSortParm, currentFilter=ViewBag.CurrentFilter })%>
                    </th>
                    <th scope="col" style="width: 100px;">Modify</th>
                </tr>
            </thead>

            <% foreach (var item in Model)
               { %>
            <tr>
                <td>
                    <%: Html.DisplayFor(modelItem => item.CategoryName) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.ParentCategoryId) %>
                </td>
                <td>
                    <%: Html.DisplayFor(modelItem => item.CategoryCreated) %>
                </td>
                <td>
                    <%: Html.ActionLink(" ", "Edit", new { id=item.CategoryId }, new {@class="table-icon edit"}) %> |
                    <%: Html.ActionLink(" ", "Details", new { id=item.CategoryId }, new {@class="table-icon archive"}) %> |
                    <%: Html.ActionLink(" ", "Delete", new { id=item.CategoryId }, new {@class="table-icon delete"}) %>
                </td>
            </tr>
            <% } %>
        </table>

        <div class="entry">
             <div class="pagination">
            Page <%: Model.PageCount < Model.PageNumber ? 0 : Model.PageNumber %> of <%: @Model.PageCount %>
            
            <% if (Model.HasPreviousPage) { %>

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
                 
             <% if(Model.HasNextPage)
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
            <%: @Html.ActionLink("Create", "Create", "Category", null, new {@class="button add"})%>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ScriptsSection" runat="server">
</asp:Content>
