<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="product.aspx.cs" Inherits="product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <style type="text/css">
        .auto-style8 {
            width: 100%;
        }
        .auto-style9 {
            height: 23px;
        }
    </style>
    
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
    
    <table class="auto-style8">
        <tr>
            <td class="auto-style9">Product name:</td>
            <td class="auto-style9">
                <asp:TextBox ID="txtpname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Product price:</td>
            <td>
                <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Product image:</td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>Product description:</td>
            <td>
                <asp:TextBox ID="txtdescription" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Category id:</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="categoryname" DataValueField="categoryname">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" ProviderName="<%$ ConnectionStrings:ConnectionString2.ProviderName %>" SelectCommand="SELECT * FROM [tblcategory]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="ADD" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="Productid" DataSourceID="SqlDataSource2">
                    <EditItemTemplate>
                        Productid:
                        <asp:Label ID="ProductidLabel1" runat="server" Text='<%# Eval("Productid") %>' />
                        <br />
                        Productname:
                        <asp:TextBox ID="ProductnameTextBox" runat="server" Text='<%# Bind("Productname") %>' />
                        <br />
                        categoryid:
                        <asp:TextBox ID="categoryidTextBox" runat="server" Text='<%# Bind("categoryid") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        Productname:
                        <asp:TextBox ID="ProductnameTextBox" runat="server" Text='<%# Bind("Productname") %>' />
                        <br />
                        categoryid:
                        <asp:TextBox ID="categoryidTextBox" runat="server" Text='<%# Bind("categoryid") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        Productid:
                        <asp:Label ID="ProductidLabel" runat="server" Text='<%# Eval("Productid") %>' />
                        <br />
                        Productname:
                        <asp:Label ID="ProductnameLabel" runat="server" Text='<%# Bind("Productname") %>' />
                        <br />

                        categoryid:
                        <asp:Label ID="categoryidLabel" runat="server" Text='<%# Bind("categoryid") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString3 %>" DeleteCommand="DELETE FROM [tblaproduct] WHERE [Productid] = ?" InsertCommand="INSERT INTO [tblaproduct] ([Productid], [Productname], [categoryid]) VALUES (?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString3.ProviderName %>" SelectCommand="SELECT [Productid], [Productname], [categoryid] FROM [tblaproduct]" UpdateCommand="UPDATE [tblaproduct] SET [Productname] = ?, [categoryid] = ? WHERE [Productid] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="Productid" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Productid" Type="Int32" />
                        <asp:Parameter Name="Productname" Type="String" />
                        <asp:Parameter Name="categoryid" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Productname" Type="String" />
                        <asp:Parameter Name="categoryid" Type="Int32" />
                        <asp:Parameter Name="Productid" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    
</asp:Content>


