<%@ Page Language="C#" MasterPageFile="~/UserContent.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="vsr.About" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHeading" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="server">
    <asp:Label ID="Label1" runat="server" Font-Bold="true" Font-Size="Large" Font-Names="verdana" Text="About Me"></asp:Label>
    <div style="margin-left: 1%; margin-top: 18px;">
        <asp:Label ID="Label2" cssclass="postbody" runat="server" Text="Label"></asp:Label>
        <div style="margin-left: 5%; margin-top: 18px; margin-bottom: 18px;">
            <asp:BulletedList ID="BulletedList1" runat="server" BulletStyle="Disc" DisplayMode="Text">
                <asp:ListItem Text="IBM AIX Unix Platform"></asp:ListItem>
                <asp:ListItem Text="Red Hat / GNU Linux Environment"></asp:ListItem>
                <asp:ListItem Text="Microsoft Windows XP, Vista, Server 2003 and Server 2008"></asp:ListItem>
                <asp:ListItem Text="Cisco Routing, Switching, and Wireless"></asp:ListItem>
                <asp:ListItem Text="Juniper NSM"></asp:ListItem>
                <asp:ListItem Text="D3 / Pick MV-Database"></asp:ListItem>
                <asp:ListItem Text="IPCop Firewall"></asp:ListItem>
                <asp:ListItem Text="Microsoft Visual Studio IDE (Mostly ASP.Net in C#)"></asp:ListItem>
                <asp:ListItem Text="PHP/MySQL and ASP Classic Languages"></asp:ListItem>
                <asp:ListItem Text="Extensive Server and Desktop Hardware Experience"></asp:ListItem>
                <asp:ListItem Text="Aruba Wireless Controllers"></asp:ListItem>
                <asp:ListItem Text="Many VMware products, ESX-i, VMware Server, Fusion, etc."></asp:ListItem>            
            </asp:BulletedList>
        </div>
        <asp:Label ID="Label3" cssclass="postbody" runat="server" Text="Label"></asp:Label>
        <br /><br />
        <asp:Label ID="Label4" cssclass="postbody" runat="server" Text="Label"></asp:Label>
    </div>    
</asp:Content>
