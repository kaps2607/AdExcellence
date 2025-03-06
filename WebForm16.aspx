<%@ Page Title="" Language="C#" MasterPageFile="~/MasterUser.Master" AutoEventWireup="true" CodeBehind="WebForm16.aspx.cs" Inherits="AdExcellence.WebForm16" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
        <div class="w-full flex items-start">
            <div class="h-[248px] w-[248px] rounded-lg">
                <asp:Image ID="Image1" runat="server" class="w-full h-full object-cover rounded-[inherit]" AlternateText="No Image" ImageUrl="~/images/noimgjpg.jpg" />
            </div>
            <div class="grid grid-cols-1 gap-4 pl-12">
                <div class="flex flex-col">
                    <label class="text-sm">Name</label>
                    <asp:Label ID="txtname" runat="server" class="text-lg font-bold text-gray-800"></asp:Label>
                </div>
                <div class="flex flex-col">
                    <label class="text-sm">Email</label>
                    <asp:Label ID="txtemail" runat="server" class="text-lg font-bold text-gray-800"></asp:Label>
                </div>
                <div class="flex flex-col">
                    <label class="text-sm">Address</label>
                    <asp:Label ID="lbladdress" runat="server" class="text-lg font-bold text-gray-800"></asp:Label>
                </div>
                <div class="flex flex-col">
                    <label class="text-sm">City</label>
                    <asp:Label ID="lblcity" runat="server" class="text-lg font-bold text-gray-800"></asp:Label>
                </div>
                <div class="flex flex-col">
                    <label class="text-sm">State</label>
                    <asp:Label ID="lblstate" runat="server" class="text-lg font-bold text-gray-800"></asp:Label>
                </div>
                <div class="flex flex-col">
                    <label class="text-sm">Landmark</label>
                    <asp:Label ID="lblland" runat="server" class="text-lg font-bold text-gray-800"></asp:Label>
                </div>
                <div class="flex flex-col">
                    <label class="text-sm">Mobile Phone</label>
                    <asp:Label ID="lblMobile" runat="server" class="text-lg font-bold text-gray-800"></asp:Label>
                </div>
            </div>
    
        </div>
    </div>

    <asp:Label ID=lblsid runat=server Visible=false></asp:Label>


</asp:Content>
