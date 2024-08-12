<%@ Page Title="About" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.vb" Inherits="Web_Form_Drag_Drop.About" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <ajaxToolkit:ReorderList ID="ReOrderList" runat="server" SortOrderField="index"
        AllowReorder="true" DataSourceID="SqlConnection" DataKeyField="Id" OnItemReorder ="ReOrderList_ItemReorder">

        <ItemTemplate>          
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>' />             
            <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("name") %>' />
        </ItemTemplate>

        <DragHandleTemplate>
            <div class="drag-handle">
                <i class="bi bi-grip-vertical"></i>
            </div>
        </DragHandleTemplate>
    </ajaxToolkit:ReorderList>

    <asp:SqlDataSource ID="SqlConnection" runat="server"
        ConnectionString="<%$ ConnectionStrings:Drag_Drop_DemoConnectionString %>"
        SelectCommand="SELECT * FROM [demo] ORDER BY [index]"
        UpdateCommand="UPDATE [demo] SET [index] = @index, [name] = @name WHERE Id = @Id">

        <UpdateParameters>
            <asp:Parameter Name="index" Type="Int32" />
            <asp:Parameter Name="Id" Type="Int32" />
            <asp:Parameter Name="name" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <style type="text/css">
        .drag-handle {
            width: 24px;
            height: 24px;
            background-color: #f0f0f0;
            cursor: move;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .drag-handle i {
            font-size: 16px;
            color: #333;
        }
    </style>

</asp:Content>
