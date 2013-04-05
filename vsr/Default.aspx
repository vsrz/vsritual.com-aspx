<%@ Page Language="C#" MasterPageFile="UserContent.Master" AutoEventWireup="true" 
    Inherits="vsr.Default" Title="vsritual.com - Home" Codebehind="Default.aspx.cs" %>
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
            <div class="comments">
                <div style="float: left; width: 40%; text-align: left;">
                    Comments
                </div>
                <div style="float: right; width: 40%; text-align: right;">
                    <a href="AddPost.aspx?post=<%# Eval("post_id") %>">Add Comment</a>
                </div>
                <div runat="server" visible="false" id="divAddComment">
                    <asp:Label runat="server" ID="lblTitle" ></asp:Label>
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
            <br /><br />
        </ItemTemplate>
    </asp:Repeater>
    
</asp:Content>
