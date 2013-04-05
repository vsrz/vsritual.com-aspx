<%@ Page Language="C#" MasterPageFile="~/UserContent.Master" AutoEventWireup="true" CodeBehind="AddPost.aspx.cs" Inherits="vsr.AddPost" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="AjaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHeading" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="server">
    <asp:Repeater runat="server" ID="rpPosts">
        <ItemTemplate>
            <div class="post" style="margin-bottom: 64px;">
                <div class="posttitle">                    
                    <h3><%# Eval("title") %></h3>                    
                    <hr />            
                    <div style="text-align: left; float: left; margin: 0;">
                        <h6><%# "Posted by " + Eval("submitter") %></h6>
                    </div>
                    <div style="text-align: right; float: right; margin: 0;">
                        <h6><%# "On " + ((DateTime)Eval("posted")).ToLongDateString() %></h6>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="postbody">
                    <%# Eval("post_content") %>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <asp:ScriptManager runat="server" ID="ScriptManager1" ></asp:ScriptManager>
    <div class="comments">
        <div style="float: left; width: 40%; text-align: left;">
            Comments
        </div>
        <div class="clear"></div>                                
        <asp:Repeater runat="server" ID="rpComments">
            <ItemTemplate>                        
                <hr />
                <div class="commentsTitle">
                    <h4>By <%# Eval("username") %> on <%# ((DateTime) Eval("post_date")).ToString() %> </h4>                    
                </div>
                <div class="clear">
                </div>                        
                <p>
                    <%# Eval("posttext") %>
                </p>                        
            </ItemTemplate>
        </asp:Repeater>          
    </div>
    <div class="clear"></div>
    <br />        
    <div style="width: 600px;">
        <h4>Add a comment</h4>
        <asp:TextBox runat="server" ID="txtComment" Width="590" Rows="12" TextMode="MultiLine"></asp:TextBox>
        <br /><br />
        <h4>Your name</h4>
        <asp:TextBox runat="server" ID="txtUsername" Width="245"></asp:TextBox>
        <br /><br />
        <asp:Button ID="btnCommentSubmit" runat="server" Text="Submit" OnClick="btnCommentSubmit_Click" />
    </div>
</asp:Content>
