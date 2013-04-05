<%@ Page Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="vsr.Admin" Title="Untitled Page" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHeading" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="server">    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:MultiView ID="mvA" runat="server" ActiveViewIndex="0">
                <asp:View ID="View0" runat="server">
                    <asp:Label ID="Label1" Font-Size="Large" runat="server" Text="Page Stats" />
                    <asp:GridView ID="gv1" runat="server"></asp:GridView>                    
                </asp:View>
                <asp:View ID="View1" runat="server">
                    <asp:Label ID="Label2" runat="server" Text="Edit Links">
                    </asp:Label>
                </asp:View>
                <asp:View ID="View2" runat="server" OnActivate="postListingInit">
                    <asp:Label ID="Label3" runat="server" Text="Edit Blog Page"></asp:Label>
                    <asp:DropDownList ID="ddlPostListing" runat="server" OnSelectedIndexChanged="PostListChanged"></asp:DropDownList>
                    <asp:Button ID="editThis" runat="server" Text="Edit Post" OnClick="ButtonEditPost_Clicked" />
                    <br /><br /><br />                
                    <asp:Button ID="btnCreateNew" runat="server" Text="Create new Post" OnClick="ButtonCreateNew_Clicked" />
                    <hr />
                    <asp:MultiView runat="server" ID="mvNewPost" Visible="false">
                        <asp:View ID="editView1" runat="server">
                            <table cellpadding="4" cellspacing="4">
                                <tr>
                                    <td><asp:label ID="Label4" runat="server" Text="Post Title" /></td>
                                    <td><asp:TextBox ID="txtTitle" runat="server" Width="280px" /></td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="Label5" runat="server" Text="Post is enabled" /></td>
                                    <td><asp:CheckBox ID="cbxPostEnabled" runat="server" Checked="true" /></td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="label6" runat="server" Text="Post Date"></asp:Label></td>
                                    <td><asp:TextBox ID="txtPostDate" runat="server" Text="" Width="280px"></asp:TextBox></td>
                                </tr>                                                                
                                  <tr>
                                    <td colspan="2"><asp:Label ID="label7" runat="server" Text="Post Body" /></td>
                                </tr>
                            </table>
                            <FCKeditorV2:FCKeditor ID="fckWindow" runat="server" BasePath="fckeditor/" UseBROnCarriageReturn="true" Height="420"></FCKeditorV2:FCKeditor>
                            <br />
                            <table cellpadding="4" cellspacing="4">
                                <tr>
                                    <td><asp:Label ID="label8" runat="server" Text="Clicking Save will post your entry immediately!" ></asp:Label></td>
                                    <td><asp:Button ID="btnSavePost" runat="server" Text="Save Post" onclick="btnSavePost_Click" /></td>
                                </tr>
                                <tr>
                                    <td><asp:Label ID="Label9" runat="server" Text="To delete this post entirely click Delete. "></asp:Label></td>    
                                    <td><asp:Button ID="btnRemovePost" runat="server" Text="Delete" OnClick="btnRemovePost_Click" /></td>    
                                </tr>                            
                            </table>                            
                        </asp:View>
                        <asp:View ID="editView2" runat="server">
                            <h3>
                                Post successful
                            </h3>
                            <p>
                                Your post was successful. You may view your post by going to the homepage here: 
                                <a href="Default.aspx">Default.aspx</a>
                            </p>
                        </asp:View>
                        <asp:View ID="View4" runat="server">
                            <h3>
                                Post deleted
                            </h3>
                            <p>
                                Your post was successful. You may view your post by going to the homepage here: 
                                <a href="Default.aspx">Default.aspx</a>
                            </p>
                        </asp:View>
                    </asp:MultiView>
                </asp:View>
                <asp:View runat="server" ID="view3">
                </asp:View>
            </asp:MultiView>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSavePost" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
