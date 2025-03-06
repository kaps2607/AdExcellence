<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.Master"
AutoEventWireup="true" CodeBehind="SignUpU.aspx.cs"
Inherits="AdExcellence.WebForm2" %> <%@ Register assembly="EO.Web"
namespace="EO.Web" tagprefix="eo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <style type="text/css">
    .style1 {
      height: 19px;
    }
    .error-message {
      color: #b91c1c;
    }
  </style>
</asp:Content>
<asp:Content
  ID="Content2"
  ContentPlaceHolderID="ContentPlaceHolder1"
  Runat="Server"
>
  <div class="w-screen h-auto min-h-[80vh] py-10 flex items-center">
    <div class="w-[400px] h-auto mx-auto border p-8 rounded-xl">
      <form class="w-full mx-auto">
        <h2 class="text-2xl font-bold mb-4">Sign Up as User</h2>

        <asp:Label
          ID="lblid"
          runat="server"
          Width="218px"
          Visible="False"
        ></asp:Label>

        <!-- Name -->
        <div class="mb-5">
          <label for="name" class="block mb-2 text-sm font-medium text-gray-900"
            >Name *</label
          >

          <asp:TextBox
            ID="txtname"
            runat="server"
            onkeypress="return isCharKey(event)"
            style="text-transform:capitalize;"
            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
            placeholder="Enter your name"
          ></asp:TextBox>

          <p class="text-sm">
            <asp:RequiredFieldValidator
              ID="RequiredFieldValidator5"
              runat="server"
              ErrorMessage="Enter your Name."
              ControlToValidate="txtname"
              Display="Dynamic"
              CssClass="error-message"
            ></asp:RequiredFieldValidator>
          </p>
        </div>

        <!-- E-mail Id -->
        <div class="mb-5">
          <label
            for="email"
            class="block mb-2 text-sm font-medium text-gray-900"
            >Email-id *</label
          >

          <asp:TextBox
            ID="txtemail"
            runat="server"
            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
            placeholder="Enter your email"
          ></asp:TextBox>

          <p class="text-sm">
            <asp:RequiredFieldValidator
              ID="RequiredFieldValidator1"
              runat="server"
              ErrorMessage="Enter your E-mail."
              ControlToValidate="txtemail"
              Display="Dynamic"
              CssClass="error-message"
            ></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator
              ID="RequiredExpressionValidator1"
              runat="server"
              ErrorMessage="Invalid E-mail."
              ControlToValidate="txtemail"
              Display="Dynamic"
              ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
              CssClass="error-message"
            ></asp:RegularExpressionValidator>
          </p>
        </div>

        <!-- Mobile -->
        <div class="mb-5">
          <label
            for="mobile"
            class="block mb-2 text-sm font-medium text-gray-900"
            >Mobile *</label
          >

          <asp:TextBox
            ID="txtMobile"
            runat="server"
            MaxLength="10"
            onkeypress="return isNumberKey(event)"
            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
            placeholder="Enter your mobile"
          ></asp:TextBox>

          <p class="text-sm">
            <asp:RequiredFieldValidator
              ID="RequiredFieldValidator6"
              runat="server"
              ErrorMessage="Enter your Mobile."
              ControlToValidate="txtMobile"
              Display="Dynamic"
              CssClass="error-message"
            ></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator 
              ID="RFVMOB" 
              runat="server" 
              ErrorMessage="Mobile must be of 10 digits only. "
              ControlToValidate="txtMobile"
              ValidationExpression="^\d{10}$"
              Display="Dynamic"
              EnableViewState="false"
              CssClass="error-message"
            ></asp:RegularExpressionValidator>
            <asp:RegularExpressionValidator
              ID="RVFMOB1" 
              runat="server" 
              ErrorMessage="Mobile number must start with 6, 7, 8, or 9."
              ControlToValidate="txtMobile" 
              ValidationExpression="^[6-9]\d*$"
              Display="Dynamic"
              EnableViewState="false"
              CssClass="error-message"
             ></asp:RegularExpressionValidator>
          </p>
        </div>

        <!-- Full Address -->
        <div class="mb-5">
          <label
            for="address"
            class="block mb-2 text-sm font-medium text-gray-900"
            >Full Address</label
          >

          <asp:TextBox
            ID="txtadd"
            TextMode="MultiLine"
            runat="server"
            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
            Height="54px"
            ontextchanged="txtadd_TextChanged"
            placeholder="Enter your address"
            style="text-transform:capitalize;"
          ></asp:TextBox>

          <p class="text-sm">
            <%--<asp:RequiredFieldValidator
              ID="RequiredFieldValidator7"
              runat="server"
              ErrorMessage="Enter your Address."
              ControlToValidate="txtadd"
              Display="Dynamic"
              CssClass="error-message"
            ></asp:RequiredFieldValidator>
          </p>--%>
        </div>

        <!-- City -->
        <div class="mb-5">
          <label for="city" class="block mb-2 text-sm font-medium text-gray-900"
            >City *</label
          >

          <asp:TextBox
            ID="txtcity"
            runat="server"
            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
            placeholder="Enter your city"
            style="text-transform:capitalize;"
            onkeypress="return isCharKey(event)"
            MaxLength="20"
          ></asp:TextBox>

          <p class="text-sm">
            <asp:RequiredFieldValidator
              ID="RequiredFieldValidator8"
              runat="server"
              ErrorMessage="Enter your City."
              ControlToValidate="txtcity"
              Display="Dynamic"
              CssClass="error-message"
            ></asp:RequiredFieldValidator>
          </p>
        </div>

        <!-- State -->
        <div class="mb-5">
          <label
            for="state"
            class="block mb-2 text-sm font-medium text-gray-900"
            >State *</label
          >

          <asp:TextBox
            ID="txtState"
            runat="server"
            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
            placeholder="Enter your state"
            style="text-transform:capitalize;"
            onkeypress="return isCharKey(event)"
            MaxLength="20"
          ></asp:TextBox>

          <p class="text-sm">
            <asp:RequiredFieldValidator
              ID="RequiredFieldValidator9"
              runat="server"
              ErrorMessage="Enter your State."
              ControlToValidate="txtState"
              Display="Dynamic"
              CssClass="error-message"
            ></asp:RequiredFieldValidator>
          </p>
        </div>

        <!-- Landmark -->
        <div class="mb-5">
          <label
            for="landmark"
            class="block mb-2 text-sm font-medium text-gray-900"
           >Landmark</label>

          <asp:TextBox
            ID="txtLandmark"
            runat="server"
            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
            placeholder="Enter your landmark"
            MaxLength="20"
            style="text-transform:capitalize;"
          ></asp:TextBox>

          <p class="text-sm">
          <asp:RequiredFieldValidator
              ID="RequiredFieldValidator10"
              runat="server"
              ErrorMessage="Enter your Landmark."
              ControlToValidate="txtLandmark"
              Display="Dynamic"
              CssClass="error-message"
            ></asp:RequiredFieldValidator>
          </p>
        </div>

        <!-- Image -->
        <div class="mb-5">
          <label
            for="aadhar"
            class="block mb-2 text-sm font-medium text-gray-900"
            >Upload Profile Image</label
          >

          <asp:Image
            ID="Image1"
            runat="server"
            class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5"
            Height="220px"
            AlternateText="No Image"
            ForeColor="Red"
            ImageUrl="~/images/noimgjpg.jpg"
          /><br />
          <asp:FileUpload
            ID="FileUpload1"
            runat="server"
            OnChange="FileUpload1_OnChanged"
          />
          <br />
          <%--<asp:RequiredFieldValidator 
            ID="RequiredFieldValidator11" 
            runat="server" 
            ControlToValidate="FileUpload1"
            ErrorMessage="Select Image"
            CssClass="error-message"
          ></asp:RequiredFieldValidator>--%>
        </div>

        <!-- Buttons -->
        <asp:Button
          class="px-5 py-3 rounded-lg bg-green-500 hover:cursor-pointer hover:opacity-95 text-white font-medium"
          ID="btnSave"
          runat="server"
          Text="Save"
          OnClick="btnSave_Click1"
        />
        <asp:Button
          class="px-5 py-3 rounded-lg bg-red-500 hover:cursor-pointer hover:opacity-95 text-white font-medium"
          ID="btnCancel"
          runat="server"
          Text="Cancel"
          OnClick="btnCancel_Click"
        />
      </form>
    </div>
  </div>
</asp:Content>
