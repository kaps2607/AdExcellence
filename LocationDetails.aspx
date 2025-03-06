<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master"
AutoEventWireup="true" CodeBehind="LocationDetails.aspx.cs"
Inherits="AdExcellence.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content
  ID="Content2"
  ContentPlaceHolderID="ContentPlaceHolder1"
  runat="server"
>
  <div
    class="w-full h-screen bg-slate-50 flex justify-center items-center p-6 box-content"
  >
    <div class="p-6 rounded-lg border border-gray-700 w-[60%] bg-white">
      <h1 class="text-3xl font-bold text-gray-700 mb-6">Location Details</h1>

      <div class="flex flex-col mb-4">
        <label class="text-sm text-gray-700 mb-1">Location Id</label>
        <asp:Label
          ID="lblid"
          runat="server"
          Text=""
          class="min-h-[40px] px-4 py-2 rounded-lg w-full border border-gray-500 bg-slate-50"
        ></asp:Label>
      </div>

      <div class="flex flex-col mb-4">
        <label class="text-sm text-gray-700 mb-1">City Name *</label>
        <asp:TextBox
          ID="txtname"
          runat="server"
          MaxLength="20"
          class="min-h-[40px] px-4 py-2 rounded-lg w-full border border-gray-500 bg-slate-50"
          onkeypress="return isCharKey(event)"
        ></asp:TextBox>
        <asp:RequiredFieldValidator
          ID="RFVProName"
          runat="server"
          ErrorMessage="Enter City Name."
          ControlToValidate="txtname"
          Display="None"
          Font-Bold="True"
        ></asp:RequiredFieldValidator>
      </div>
      
      <div class="flex flex-col mb-4">
        <label class="text-sm text-gray-700 mb-1">City Pincode *</label>
        <asp:TextBox
          ID="txtpincode"
          runat="server"
          class="min-h-[40px] px-4 py-2 rounded-lg w-full border border-gray-500 bg-slate-50"
          MaxLength="20"
          onkeypress="return isNumberKey(event)"
        ></asp:TextBox>
        <asp:RequiredFieldValidator
          ID="RequiredFieldValidator1"
          runat="server"
          ErrorMessage="Enter Pincode."
          ControlToValidate="txtpincode"
          Display="None"
          Font-Bold="True"
        ></asp:RequiredFieldValidator>
      </div>

      <div class="flex gap-6 w-full mt-8">
        <asp:Button
        class="px-5 py-2 rounded-lg hover:opacity-95 bg-green-500 text-white font-bold"
          ID="btnNew"
          runat="server"
          Text="New"
            CausesValidation="false"
          OnClick="btnNew_Click1"
        />
        <asp:Button
        class="px-5 py-2 rounded-lg hover:opacity-95 bg-green-500 text-white font-bold"
          ID="btnModify"
          runat="server"
          Text="Modify"
          OnClick="btnModify_Click1"
        />
        <asp:Button
        class="px-5 py-2 rounded-lg hover:opacity-95 bg-green-500 text-white font-bold"
          ID="btnSave"
          runat="server"
          Text="Save"
          OnClick="btnSave_Click1"
        />
        <asp:Button
        class="px-5 py-2 rounded-lg hover:opacity-95 bg-green-500 text-white font-bold"
          ID="btnRemove"
          runat="server"
          Text="Remove"
          CausesValidation="false"
          OnClick="btnRemove_Click1"
        />
        <asp:Button
        class="px-5 py-2 rounded-lg hover:opacity-95 bg-green-500 text-white font-bold"
          ID="btnCancel"
          runat="server"
          Text="Cancel"
          CausesValidation="false"
          OnClick="btnCancel_Click1"
        />
      </div>

      <div class="w-full mt-12">
        <asp:GridView
          ID="GridView1"
          runat="server"
          CellPadding="4"
          ForeColor="Black"
          class="w-full"
          onselectedindexchanged="GridView1_SelectedIndexChanged"
          BackColor="#CCCCCC"
          BorderColor="#999999"
          BorderStyle="Solid"
          BorderWidth="3px"
          CellSpacing="2"
        >
          <FooterStyle BackColor="#CCCCCC" />
          <RowStyle BackColor="White" />
          <Columns>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True">
              <ControlStyle
                Font-Bold="True"
                ForeColor="Black"
              />
            </asp:CommandField>
          </Columns>
          <PagerStyle
            BackColor="#CCCCCC"
            ForeColor="Black"
            HorizontalAlign="Left"
          />
          <SelectedRowStyle
            BackColor="#EEEEEE"
            Font-Bold="True"
            ForeColor="Black"
          />
          <HeaderStyle BackColor="#E36452" Font-Bold="True" ForeColor="White" />
        </asp:GridView>
      </div>

      <asp:ValidationSummary
        ID="ValidationSummary1"
        runat="server"
        ShowMessageBox="True"
        ShowSummary="False"
      />
    </div>
  </div>
</asp:Content>
