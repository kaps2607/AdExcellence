<%@ Page Title="" Language="C#" MasterPageFile="~/MasterUser.Master"
AutoEventWireup="true" CodeBehind="Payment.aspx.cs"
Inherits="AdExcellence.WebForm20" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content
  ID="Content2"
  ContentPlaceHolderID="ContentPlaceHolder1"
  runat="server"
>
    <div class="w-full h-screen flex justify-center items-center">
    <div class="bg-white rounded-2xl shadow-md px-[20px] py-[24px]">
      <h1 class="text-black font-bold text-xl mb-4">Payment Page</h1>

      <div class="mb-3">
        <label class="font-bold text-sm mb-2 ml-1">Customer Id </label>
        <div>
          <asp:Label
            ID="lblcid"
            runat="server"
            class="w-full px-3 py-2 mb-1 rounded-md focus:outline-none transition-colors"
          ></asp:Label>
        </div>
      </div>
      <div class="mb-3">
        <label class="font-bold text-sm mb-2 ml-1">Order Id </label>
        <div>
          <asp:Label
            ID="lblorderid"
            runat="server"
            class="w-full px-3 py-2 mb-1 rounded-md focus:outline-none transition-colors"
          ></asp:Label>
        </div>
      </div>
      <div class="mb-3">
        <label class="font-bold text-sm mb-2 ml-1">Total Amount</label>
        <div>
          <asp:Label
            ID="lbltotalamt"
            runat="server"
            class="w-full px-3 py-2 mb-1 rounded-md focus:outline-none transition-colors"
          ></asp:Label>
        </div>
      </div>
      <div class="mb-3">
        <label class="font-bold text-sm mb-2 ml-1">Mode of Payment</label>
        <div>
          <asp:DropDownList
            ID="DdlMode"
            runat="server"
            AutoPostBack="True"
            class="w-full px-3 py-2 mb-1 border-2 border-gray-200 rounded-md focus:outline-none focus:border-red-500 transition-colors"
          >
            <asp:ListItem>Master Card</asp:ListItem>
            <asp:ListItem>VISA</asp:ListItem>
          </asp:DropDownList>
        </div>
      </div>

      <div class="mb-3">
        <label class="font-bold text-sm mb-2 ml-1">Card No.</label>
        <div class="w-full flex items-center gap-2">
          <asp:TextBox
            ID="txtn1"
            runat="server"
            MaxLength="4"
            class="w-1/4 px-3 py-2 mb-1 border-2 border-gray-200 rounded-md focus:outline-none focus:border-red-500 transition-colors"
            onkeypress="return isNumberKey(event)"
            placeholder="0000"
          ></asp:TextBox
          ><asp:TextBox
            ID="txtn2"
            runat="server"
            MaxLength="4"
            class="w-1/4 px-3 py-2 mb-1 border-2 border-gray-200 rounded-md focus:outline-none focus:border-red-500 transition-colors"
            onkeypress="return isNumberKey(event)"
            placeholder="0000"
          ></asp:TextBox
          ><asp:TextBox
            ID="txtn3"
            runat="server"
            MaxLength="4"
            class="w-1/4 px-3 py-2 mb-1 border-2 border-gray-200 rounded-md focus:outline-none focus:border-red-500 transition-colors"
            onkeypress="return isNumberKey(event)"
            placeholder="0000"
          ></asp:TextBox>
          <asp:TextBox
            ID="txtn4"
            runat="server"
            MaxLength="4"
            class="w-1/4 px-3 py-2 mb-1 border-2 border-gray-200 rounded-md focus:outline-none focus:border-red-500 transition-colors"
            onkeypress="return isNumberKey(event)"
            placeholder="0000"
          ></asp:TextBox>
        </div>
      </div>

      <div class="mb-3">
        <label class="font-bold text-sm mb-2 ml-1">Expiry Date</label>
        <div class="w-full flex items-center gap-4">
          <asp:DropDownList
            ID="Ddlmonth"
            runat="server"
            class="w-1/2 px-3 py-2 mb-1 border-2 border-gray-200 rounded-md focus:outline-none focus:border-red-500 transition-colors"
          >
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>3</asp:ListItem>
            <asp:ListItem>4</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>6</asp:ListItem>
            <asp:ListItem>7</asp:ListItem>
            <asp:ListItem>8</asp:ListItem>
            <asp:ListItem>9</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>11</asp:ListItem>
            <asp:ListItem>12</asp:ListItem>
          </asp:DropDownList>
          <asp:DropDownList
            ID="Ddlyear"
            runat="server"
            class="w-1/2 px-3 py-2 mb-1 border-2 border-gray-200 rounded-md focus:outline-none focus:border-red-500 transition-colors"
          >
          </asp:DropDownList>
        </div>
      </div>

      <p><asp:Label ID="lblerror" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></p>

      <!-- Modal toggle -->
      <div class="mt-[28px] w-full flex justify-end gap-6">
          <asp:Button ID="btnbook1" runat="server" Text="Pay" class="px-5 py-3 rounded-lg bg-red-500 hover:cursor-pointer hover:opacity-95 text-white font-medium" OnClick="btnbook1_Click" />
      </div>
    </div>
  </div>
</asp:Content>
