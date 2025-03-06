<%@ Page Title="" Language="C#" MasterPageFile="~/HOwner.Master"
AutoEventWireup="true" CodeBehind="HoardingDetails.aspx.cs"
Inherits="AdExcellence.WebForm15" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .error-message {
            color: #b91c1c;
        }
    </style>
</asp:Content>

<asp:Content
  ID="Content2"
  ContentPlaceHolderID="ContentPlaceHolder1"
  runat="server"
>
  <div
    class="w-full h-screen bg-slate-50 flex justify-center items-center p-6 box-content"
  >
    <div class="p-6 rounded-lg border border-gray-700 w-[60%] bg-white max-h-[90vh] overflow-y-auto">
      <h1 class="text-3xl font-bold text-gray-700 mb-6">Hoarding Details</h1>

      <asp:Label ID="lblid" runat="server" Visible="False"></asp:Label>

      <div class="flex flex-col mb-4">
        <label class="text-sm text-gray-700 mb-1">Location</label>
        <asp:DropDownList
          ID="DdlLocation"
          runat="server"
          class="min-h-[40px] px-4 py-2 rounded-lg w-full border border-gray-500 bg-slate-50"
        >
        </asp:DropDownList>
      </div>

      <div class="flex flex-col mb-4">
        <label class="text-sm text-gray-700 mb-1">Description *</label>
        <asp:TextBox
          ID="txtsummary"
          runat="server"
          TextMode="MultiLine"
          class="min-h-[40px] px-4 py-2 rounded-lg w-full border border-gray-500 bg-slate-50"
          MaxLength="500"
        ></asp:TextBox>
        <asp:RequiredFieldValidator
          ID="RequiredFieldValidator2"
          runat="server"
          ControlToValidate="txtsummary"
          Display="Dynamic"
          ErrorMessage="Description is required."
          CssClass="error-message"
        ></asp:RequiredFieldValidator>
      </div>

      <div class="flex flex-col mb-4">
        <label class="text-sm text-gray-700 mb-1">Image *</label>

        <div class="h-[128px] w-[128px] rounded-lg mb-3">
          <asp:Image
            ID="Image1"
            runat="server"
            AlternateText="No Image"
            class="w-full h-full rounded-[inherit] object-cover"
            ImageUrl="~/images/products/NAvail.jpg"
          />
        </div>

        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:RequiredFieldValidator
          ID="RequiredFieldValidator3"
          runat="server"
          ControlToValidate="FileUpload1"
          ErrorMessage="Select Image."
          CssClass="error-message"
        ></asp:RequiredFieldValidator>
      </div>

      <div class="flex flex-col mb-4">
        <label class="text-sm text-gray-700 mb-1">Price (Per Month) *</label>
        <asp:TextBox
          ID="txtcost"
          runat="server"
          class="min-h-[40px] px-4 py-2 rounded-lg w-full border border-gray-500 bg-slate-50"
          onkeypress="return isnumberKey(event)"
          MaxLength="10"
        ></asp:TextBox>

        <asp:RequiredFieldValidator
          ID="RFVCostPrice"
          runat="server"
          ErrorMessage="Price is required."
          ControlToValidate="txtcost"
          Display="Dynamic"
          CssClass="error-message"
        ></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator
          ID="RegularExpressionValidator3"
          runat="server"
          ErrorMessage="Price cannot be negative."
          ControlToValidate="txtcost"
          ValidationExpression="\d+"
          CssClass="error-message"
        ></asp:RegularExpressionValidator>
      </div>

      <div class="flex flex-col mb-4">
        <label class="text-sm text-gray-700 mb-1">Size *</label>
        <asp:TextBox
          ID="txtsize"
          runat="server"
          MaxLength="10"
          class="min-h-[40px] px-4 py-2 rounded-lg w-full border border-gray-500 bg-slate-50"
        ></asp:TextBox>
        <asp:RequiredFieldValidator 
          ID="RequiredFieldValidator4" 
          runat="server" 
          ErrorMessage="Hoarding size is required."
          ControlToValidate="txtsize"
          Display="Dynamic"
          CssClass="error-message"
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
          ForeColor="#333333"
          GridLines="None"
          class="w-full"
          onselectedindexchanged="GridView1_SelectedIndexChanged"
        >
          <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
          <RowStyle BackColor="White" />
          <Columns>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True">
              <ControlStyle
                ForeColor="Black"
              />
            </asp:CommandField>
          </Columns>
          <PagerStyle
            BackColor="#FFCC66"
            ForeColor="#333333"
            HorizontalAlign="Center"
          />
          <SelectedRowStyle
            BackColor="#EEEEEE"
            Font-Bold="True"
            ForeColor="Black"
          />
          <HeaderStyle BackColor="#E36452" Font-Bold="True" ForeColor="White" />

          <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
      </div>
      <asp:ValidationSummary
        ID="ValidationSummary1"
        runat="server"
        ShowMessageBox="false"
        ShowSummary="False"
      />
    </div>
  </div>
</asp:Content>
