<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="AdExcellence.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    
    
                    <table style="width: 691px">
                        <tr>
                            <td align="left" class="style2" colspan="2">
                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="20" 
                                    ForeColor="Red" Text="Recover Password through Email"></asp:Label>
                                <br />
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" class="style5" 
                                style="height: 36px; width: 82px; font-weight: bold;" valign="top">
                                <asp:Label ID="Label2" runat="server" Text="Email-ID"></asp:Label>
                            </td>
                            <td class="style4" style="height: 36px; width: 293px" valign="top">
                                <asp:TextBox ID="txtEmailID" runat="server" Width="235px"></asp:TextBox>
                                <br />
                                <asp:Label ID="lblEsend" runat="server" ForeColor="Red" Height="16px"></asp:Label>
                            </td>
                            <td align="left" class="style10" style="height: 36px">
                                <asp:RegularExpressionValidator ID="REVEmail" runat="server" 
                                    ControlToValidate="txtEmailID" Display="None" ErrorMessage="Invalid Email ID" 
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RFVEEmail" runat="server" 
                                    ControlToValidate="txtEmailID" Display="None" ErrorMessage="Enter email Id."></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="style1" colspan="2" style="height: 59px">
                                <asp:ImageButton ID="btnSendMail" runat="server" Height="49px" 
                                    ImageUrl="~/images/Submit.png" onclick="btnSendMail_Click" Width="114px" />
                            </td>
                        </tr>

                        <tr>
                            <td align="left" class="style2" colspan="2">
                                <asp:Label ID="lblpass" runat="server" Font-Bold="True" Font-Size="20" 
                                    ForeColor="Red" Text=""></asp:Label>
                                <br />
                                <br />
                            </td>
                        </tr>

    </table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
        ShowMessageBox="True" ShowSummary="False" />
    <br />
    &nbsp;<div id="newphones">
        &nbsp;</div>

     
</div>
</asp:Content>

