<%@ Page Title="" Language="C#" MasterPageFile="~/UserContent.Master" AutoEventWireup="true" CodeBehind="PhotoView.aspx.cs" Inherits="vsr.PhotoView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHeading" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="server">
    <asp:FormView runat="server" ID="photoView">
        <ItemTemplate>
            <asp:Label runat="server" ID="photoCaption" Text=" Eval(Caption); "></asp:Label>
            <asp:Image runat="server" ID="photoImage" ImageUrl=" Eval(ImageUrl) " />             
        </ItemTemplate>        
    </asp:FormView>
    <asp:HiddenField runat="server" ID="imgCurrentGuid" Value="" />                    
    <p style="margin: 0 auto;">
        <asp:Label runat="server" ID="lblFirstImage" Text="This is the first photo" Visible="false"></asp:Label>
        <asp:HyperLink runat="server" ID="lnkPreviousImage" Text="<< Previous Photo"></asp:HyperLink>
        &nbsp;|&nbsp;
        <asp:HyperLink runat="server" ID="lnkRandomImage" Text="Random Photo"></asp:HyperLink>
        &nbsp;|&nbsp;
        <asp:HyperLink runat="server" ID="lnkNextImage" Text="Next Photo >>"></asp:HyperLink>
        <asp:Label runat="server" ID="lblLastImage" Text="This is the last photo" Visible="false"></asp:Label>
    </p>

</asp:Content>
