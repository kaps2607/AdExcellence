<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="VerifyAccount.aspx.cs" Inherits="AdExcellence.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="w-full h-screen bg-slate-50 flex justify-center items-center p-6 box-content">
        <div class="p-6 rounded-lg border border-gray-700 w-[60%] bg-white">
            <h1 class="text-3xl font-bold text-gray-700 mb-6">Verify Account</h1>
            <div class="grid grid-cols-2 gap-6">
                <!-- Field Start -->
                <div class="flex flex-col">
                    <label class="text-sm text-gray-700 mb-1">Select Email</label>
                    <asp:DropDownList ID="ddlemail" runat="server" AutoPostBack="True" onselectedindexchanged="ddlemail_SelectedIndexChanged" class="min-h-[40px] px-4 py-2 rounded-lg w-full border border-gray-500 bg-slate-50">
                </asp:DropDownList>
                </div>
                <!-- Field End -->
                <div class="flex flex-col">
                    <label class="text-sm text-gray-700 mb-1">Email</label>
                    <asp:Label ID="txtemail" runat="server" class="min-h-[40px] px-4 py-2 rounded-lg w-full border border-gray-500 bg-slate-50"></asp:Label>
                </div>
                <!-- Field Start -->
                <!-- Field End -->
                <div class="flex flex-col">
                    <label class="text-sm text-gray-700 mb-1">Name</label>
                    <asp:Label ID="txtname" runat="server" class="min-h-[40px] px-4 py-2 rounded-lg w-full border border-gray-500 bg-slate-50"></asp:Label>
                </div>
                <!-- Field Start -->
                <div class="flex flex-col">
                    <label class="text-sm text-gray-700 mb-1">Address</label>
                    <asp:Label ID="lbladdress" runat="server" class="min-h-[40px] px-4 py-2 rounded-lg w-full border border-gray-500 bg-slate-50"></asp:Label>
                </div>
                <!-- Field End -->
                <!-- Field Start -->
                <div class="flex flex-col">
                    <label class="text-sm text-gray-700 mb-1">Select Email</label>
                    <asp:Label ID="lblcity" runat="server" class="min-h-[40px] px-4 py-2 rounded-lg w-full border border-gray-500 bg-slate-50"></asp:Label>
                </div>
                <!-- Field End -->
                <!-- Field Start -->
                <div class="flex flex-col">
                    <label class="text-sm text-gray-700 mb-1">Select Email</label>
                    <asp:Label ID="lblstate" runat="server" class="min-h-[40px] px-4 py-2 rounded-lg w-full border border-gray-500 bg-slate-50"></asp:Label>
                </div>
                <!-- Field End -->
                <!-- Field Start -->
                <div class="flex flex-col">
                    <label class="text-sm text-gray-700 mb-1">Select Email</label>
                    <asp:Label ID="lblland" runat="server" class="min-h-[40px] px-4 py-2 rounded-lg w-full border border-gray-500 bg-slate-50"></asp:Label>
                </div>
                <!-- Field End -->
                <!-- Field Start -->
                <div class="flex flex-col">
                    <label class="text-sm text-gray-700 mb-1">Select Email</label>
                    <asp:Label ID="lblMobile" runat="server" class="min-h-[40px] px-4 py-2 rounded-lg w-full border border-gray-500 bg-slate-50"></asp:Label>
                </div>
                <!-- Field End -->
            
                <div class="flex flex-col">
                    <label class="text-sm text-gray-700 mb-1">Aadhar</label>
                    <div class="h-[128px] w-[128px] rounded-lg border border-gray-200">
                        <asp:Image ID="Image1" runat="server"  class="h-full w-full object-cover" AlternateText="No Image" ForeColor="Red" ImageUrl="~/images/noimgjpg.jpg" />
                    </div>
                </div>


            </div>
            <div class="w-full flex justify-start mt-6">

                <asp:Button class="px-5 py-2 rounded-lg bg-green-500 mr-4 text-white font-bold" ID="btnAccept" runat="server" Text="Accept" OnClick="btnAccept_Click" />
                <asp:Button class="px-5 py-2 rounded-lg bg-red-500 text-white font-bold" ID="btnReject" runat="server" Text="Reject" OnClick="btnReject_Click" />

            </div>

            <asp:Label ID=lblsid runat=server Visible=false></asp:Label>
        </div>
</div>
</asp:Content>

