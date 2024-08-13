<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="Web_Form_Drag_Drop._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <ajaxToolkit:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="1" Height="500px" Width="1000px" Style="margin-right: 11px">

        <ajaxToolkit:TabPanel runat="server" HeaderText="Product" ID="TabPanel1">
            <ContentTemplate>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" Height="56px" Width="944px">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                        <asp:BoundField DataField="code" HeaderText="code" SortExpression="code" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Drag_Drop_DemoConnectionString %>" SelectCommand="SELECT * FROM [m_product]"></asp:SqlDataSource>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>

        <ajaxToolkit:TabPanel runat="server" HeaderText="Client" ID="TabPanel2">
            <ContentTemplate>

                <asp:GridView ID="gClient" runat="server" Height="16px" Width="980px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" AutoGenerateColumns="False" ForeColor="Black">
                    <Columns>

                        <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />


                        <asp:TemplateField HeaderText="name">
                            <ItemTemplate>
                                <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="email">
                            <ItemTemplate>
                                <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="code">
                            <ItemTemplate>
                                <asp:TextBox ID="txtCode" runat="server" Text='<%# Bind("code") %>'></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:ButtonField ButtonType="Button" CommandName="Copy" ShowHeader="True" Text="Copy" />

                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="Black" HorizontalAlign="Left" BackColor="#CCCCCC" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="Gray" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />
                </asp:GridView>
                <asp:Button ID="btnAddNewRow" runat="server" Text="Add new Row"  CommandName="AddNew"/>
                
                <br />
                <br />
                <asp:Button ID="btnSave" runat="server" Text="Save" />
            </ContentTemplate>

        </ajaxToolkit:TabPanel>

    </ajaxToolkit:TabContainer>

</asp:Content>
