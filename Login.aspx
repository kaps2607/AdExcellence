<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.Master"
AutoEventWireup="true" CodeBehind="Login.aspx.cs"
Inherits="AdExcellence.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content
  ID="Content2"
  ContentPlaceHolderID="ContentPlaceHolder1"
  Runat="Server"
>
  <div class="w-screen h-[80vh] flex items-center">
    <div class="w-[400px] h-[400px] mx-auto border p-12 rounded-xl">
      <form class="w-full mx-auto">
        <h2 class="text-2xl font-bold mb-4">Login</h2>
        <div class="mb-5">
          <label
            for="email"
            class="block mb-2 text-sm font-medium text-gray-900"
            >Your email</label
          >
          <asp:TextBox
            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
            ID="txtemail"
            runat="server"
            MaxLength="50"
            placeholder="Enter Email"
          ></asp:TextBox>

          <p class="text-sm">
            <asp:RequiredFieldValidator
              ID="RFVEmail"
              runat="server"
              ErrorMessage="Enter your Email ID."
              ControlToValidate="txtemail"
              Display="None"
            ></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator
              ID="REVEmail"
              runat="server"
              ErrorMessage="Invalid Email ID."
              ControlToValidate="txtemail"
              Display="None"
              ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
            ></asp:RegularExpressionValidator>
          </p>
        </div>
        <div class="mb-5">
          <label
            for="password"
            class="block mb-2 text-sm font-medium text-gray-900"
            >Your password</label
          >
          <asp:TextBox
            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
            ID="txtpassword"
            runat="server"
            placeholder="Enter Password"
            MaxLength="15"
            TextMode="Password"
          ></asp:TextBox>

          <p class="text-sm">
            <asp:RequiredFieldValidator
              ID="RFVPass"
              runat="server"
              ErrorMessage="Enter your Password."
              ControlToValidate="txtpassword"
              Display="None"
              EnableViewState="False"
            ></asp:RequiredFieldValidator>
          </p>
        </div>
        <asp:Button
          ID="btnLogin"
          runat="server"
          text="Login"
          onclick="btnLogin_Click"
          class="text-white bg-red-700 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm w-full px-5 py-2.5 text-center"
        ></asp:Button>
        <asp:ValidationSummary
          ID="ValidationSummary1"
          runat="server"
          HeaderText="Errors in Login"
          ShowMessageBox="True"
          ShowSummary="False"
        />
      </form>
    </div>
  </div>
</asp:Content>
