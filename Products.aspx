<%@ Page Title="" Language="C#" MasterPageFile="~/MasterUser.Master"
AutoEventWireup="true" CodeBehind="Products.aspx.cs"
Inherits="AdExcellence.WebForm18" %>
<asp:Content
  ID="Content1"
  ContentPlaceHolderID="ContentPlaceHolder1"
  Runat="Server"
>
  <div class="flex w-full justify-center">
    <div class="flex flex-col">
      <label class="text-sm mb-2">Location</label>
      <asp:DropDownList
        ID="ddlLocation"
        runat="server"
        class="px-4 py-2 rounded-lg border border-gray-500 bg-white w-[296px]"
        AutoPostBack="True"
        OnSelectedIndexChanged="ddlLocation_SelectedIndexChanged"
      >
      </asp:DropDownList>
    </div>
  </div>

  <!-- ✅ Grid Section - Starts Here 👇 -->
  
    <asp:Label ID="lbldisply" runat="server" Text="" class="w-full mx-auto max-h-[90vh] overflow-y-auto grid grid-cols-1 lg:grid-cols-3 md:grid-cols-2 justify-items-center justify-center gap-y-20 gap-x-14 pt-10"></asp:Label>

  <!-- 🛑 Grid Section - Ends Here -->

</asp:Content>
