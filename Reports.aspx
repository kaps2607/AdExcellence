<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="AdExcellence.WebForm22" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="w-full h-[80vh] flex flex-col justify-center items-center">
        <asp:HyperLink target="_blank" ID="HyperLink1" NavigateUrl="UserReport.aspx" runat="server" class="px-5 py-3 rounded-lg bg-red-600 mb-5 text-white font-bold">User Report</asp:HyperLink>
        <asp:HyperLink target="_blank" ID="HyperLink2" NavigateUrl="HOwnerReport.aspx" runat="server" class="px-5 py-3 rounded-lg bg-red-600 mb-5 text-white font-bold">Hoarding Owner Report</asp:HyperLink>
        <asp:HyperLink target="_blank" ID="HyperLink3" NavigateUrl="HoardingReport.aspx" runat="server" class="px-5 py-3 rounded-lg bg-red-600 mb-5 text-white font-bold">Hoarding Report</asp:HyperLink>
        <asp:HyperLink target="_blank" ID="HyperLink4" NavigateUrl="BookingReport.aspx" runat="server" class="px-5 py-3 rounded-lg bg-red-600 mb-5 text-white font-bold">Booking Report</asp:HyperLink>

    </div>
</asp:Content>
