<%@ Page Language="C#" MasterPageFile="~/UserContent.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="vsr.Contact" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHeading" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" runat="server">
    <h3>
        Contact Me
    </h3>
    <p>
        Got any questions? Comments? Concerns? Feel free to drop me a line. I try to 
        reply to everything personally addressed to me. Thanks for reading!
    </p>
    <asp:ScriptManager ID="mgrCntc" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="udpCntc" runat="server">        
    <ContentTemplate>
    <asp:MultiView ID="mv1" runat="server" ActiveViewIndex="0">
        <asp:View ID="v1" runat="server">
            <center>
                <div id="cntSection" style="margin-top: 24px; width: 60%;">
                    <fieldset style="border-color: #565656;">
                        <legend>
                            <strong>Contact Form</strong>
                        </legend>
                        <table cellpadding="4" cellspacing="4">
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="Your name"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server" MaxLength="200" Width="200"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ValidationGroup="m" ControlToValidate="txtName" 
                                        ErrorMessage="Name is required" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator runat="server" ID="regValidateUsername"
                                            ControlToValidate="txtName" ErrorMessage="The Name you entered was invalid."
                                            ValidationExpression="^((?=[^\.]*\.?[^\.]*)(?=[^_]*_?[^_]*)(?=[^@]*@?[^@]*)[a-zA-Z0-9]{4,190})$"
                                            ValidationGroup="m">Invalid name</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text="E-mail"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEmail" runat="server" MaxLength="200" Width="200"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ValidationGroup="m" ControlToValidate="txtEmail" 
                                    ErrorMessage="Name is required" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                                    ValidationExpression="^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$"
                                    ControlToValidate="txtEmail" runat="server" ErrorMessage="Invalid email address">Invalid 
                                    e-mail
                                    </asp:RegularExpressionValidator>                            
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    Message
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:TextBox ID="txtMessage" runat="server" Rows="8" Width="400" EnableTheming="True" TextMode="MultiLine"></asp:TextBox>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ValidationGroup="m" ControlToValidate="txtMessage" 
                                    ErrorMessage="Name is required" Display="Dynamic"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" 
                                        onclick="btnSubmit_Click" />
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </div>
            </center>
        </asp:View>
        <asp:View ID="v2" runat="server">
            <br /><br />
            <p>
                Thank you for your submission!  I hope to get back to you as soon as possible.
            </p>
        </asp:View>
        </asp:MultiView>
    </ContentTemplate></asp:UpdatePanel>    
</asp:Content>
