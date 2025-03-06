<%@ Page Title="" Language="C#" MasterPageFile="~/HOwner.Master"
AutoEventWireup="true" CodeBehind="HChangePassword.aspx.cs"
Inherits="AdExcellence.WebForm14" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
    .auto-style1 {
        margin-left: 40px;
    }
    .error-message {
        display: inline;
        color: red;
        font-size: smaller;
        margin-left: 5px; /* Adjust as needed */
    }
</style>
</asp:Content>
<asp:Content
  ID="Content2"
  ContentPlaceHolderID="ContentPlaceHolder1"
  runat="server"
>
  <div class="w-full h-screen flex justify-center items-center">
    <div class="bg-white border border-gray-500 py-6 px-8 rounded-2xl">
      <h2 class="text-2xl font-bold text-gray-700 mb-6">Change Password</h2>

      <div class="flex flex-col">
        <label class="text-sm mb-2">Old Password</label>
        <asp:TextBox
          ID="txtOldPass"
          runat="server"
          class="px-4 py-2 rounded-lg border border-gray-500 bg-white w-[296px]"
          TextMode="Password"
          placeholder="Enter Old Password"
        ></asp:TextBox>
        <asp:RequiredFieldValidator
          ID="RfvOldPass"
          runat="server"
          CssClass="error-message"
          ControlToValidate="txtOldPass"
          Display="Dynamic"
          ErrorMessage="Old password is required"
        ></asp:RequiredFieldValidator>
        <br />
      </div>

      <div class="flex flex-col">
        <label class="text-sm mb-2">New Password</label>
        <asp:TextBox
          ID="txtNewPass"
          runat="server"
          class="px-4 py-2 rounded-lg border border-gray-500 bg-white w-[296px]"
          TextMode="Password"
          placeholder="Enter New Password"
        ></asp:TextBox>

        <asp:RequiredFieldValidator
          ID="RfvNewPass"
          runat="server"
          ControlToValidate="txtNewPass"
          CssClass="error-message"
          Display="Dynamic"
          ErrorMessage="Enter Your New Password."
        ></asp:RequiredFieldValidator>
        <asp:CustomValidator
          ID="CVPass"
          runat="server"
          ClientValidationFunction="CVPass_ServerValidate"
          ControlToValidate="txtNewPass"
          ErrorMessage="Password Must Be Of 8 Characters Or More."
          CssClass="error-message"
          Display="Dynamic"
          onservervalidate="CVPass_ServerValidate"
        ></asp:CustomValidator>
        <asp:RegularExpressionValidator 
          ID="weakPass" 
          runat="server" 
          ControlToValidate="txtNewPass"
          ErrorMessage="Weak password. Please choose a stronger one"
          ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"
          Display="Dynamic"
          CssClass="error-message"
         ></asp:RegularExpressionValidator>
        <br />
      </div>

      <div class="flex flex-col">
        <label class="text-sm mb-2">Retype Password</label>
        <asp:TextBox
          ID="txtRetypePass"
          runat="server"
          class="px-4 py-2 rounded-lg border border-gray-500 bg-white w-[296px]"
          TextMode="Password"
          placeholder="Retype Password"
        ></asp:TextBox>

        <asp:CompareValidator
          ID="CompareValidator1"
          runat="server"
          Display="Dynamic"
          ControlToCompare="txtNewPass"
          ControlToValidate="txtRetypePass"
          ErrorMessage="Password Does Not Match."
          CssClass="error-message"
        ></asp:CompareValidator>
        <asp:RequiredFieldValidator
          ID="RequiredFieldValidator1"
          runat="server"
          ControlToValidate="txtRetypePass"
          Display="Dynamic"
          ErrorMessage="Re-Type Password"
          CssClass="error-message"
        ></asp:RequiredFieldValidator>
        <br />
      </div>

      <div class="flex w-full justify-end">
        <asp:Button
          ID="ImgChangePass"
          runat="server"
          class="px-5 py-3 rounded-lg bg-red-500 hover:cursor-pointer hover:opacity-95 text-white font-medium"
          onclick="ImgChangePass_Click"
          Text="Change Password"
        />
      </div>
    </div>
  </div>
</asp:Content>
