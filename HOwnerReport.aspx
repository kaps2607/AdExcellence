<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HOwnerReport.aspx.cs" Inherits="AdExcellence.UserReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title></title>
    <script src="https://cdn.tailwindcss.com"></script>
  </head>
  <body>
    <form id="form1" runat="server">
      <div class="w-full h-screen p-8 bg-slate-100">
        <div
          class="w-full h-full p-8 bg-white rounded-[16px] shadow-lg overflow-y-auto"
        >
          <div class="flex flex-col">
            <label class="font-semibold mb-1 text-sm">Select User</label>
            <asp:DropDownList
              ID="DropDownList1"
              runat="server"
              DataSourceID="SqlDataSource1"
              DataTextField="name"
              DataValueField="name"
              AutoPostBack="True"
              class="w-[296px] px-5 py-2 rounded-lg border border-gray-400"
            >
            </asp:DropDownList>
          </div>
          <asp:SqlDataSource
            ID="SqlDataSource1"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:adexcelConnectionString3 %>"
            ProviderName="<%$ ConnectionStrings:adexcelConnectionString3.ProviderName %>"
            SelectCommand="SELECT [name] FROM [Login] WHERE (([type] = @type) AND ([status] = @status))"
          >
            <SelectParameters>
              <asp:Parameter DefaultValue="howner" Name="type" Type="String" />
              <asp:Parameter DefaultValue="yes" Name="status" Type="String" />
            </SelectParameters>
          </asp:SqlDataSource>

          <asp:GridView
            ID="GridView1"
            runat="server"
            AutoGenerateColumns="False"
            DataSourceID="SqlDataSource2"
            class="w-full mt-10"
          >
            <Columns>
              <asp:BoundField
                DataField="id"
                HeaderText="id"
                SortExpression="id"
              />
              <asp:BoundField
                DataField="name"
                HeaderText="name"
                SortExpression="name"
              />
              <asp:BoundField
                DataField="Email"
                HeaderText="Email"
                SortExpression="Email"
              />
              <asp:BoundField
                DataField="address"
                HeaderText="address"
                SortExpression="address"
              />
              <asp:BoundField
                DataField="city"
                HeaderText="city"
                SortExpression="city"
              />
              <asp:BoundField
                DataField="state"
                HeaderText="state"
                SortExpression="state"
              />
              <asp:BoundField
                DataField="landmark"
                HeaderText="landmark"
                SortExpression="landmark"
              />
              <asp:BoundField
                DataField="mobile"
                HeaderText="mobile"
                SortExpression="mobile"
              />
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
            <HeaderStyle
              BackColor="#E36452"
              Font-Bold="True"
              ForeColor="White"
            />
            <RowStyle BackColor="White" />
          </asp:GridView>
          <asp:SqlDataSource
            ID="SqlDataSource2"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:adexcelConnectionString4 %>"
            ProviderName="<%$ ConnectionStrings:adexcelConnectionString4.ProviderName %>"
            SelectCommand="SELECT [id], [name], [Email], [address], [city], [state], [landmark], [mobile] FROM [Login] WHERE ([name] = @name)"
          >
            <SelectParameters>
              <asp:ControlParameter
                ControlID="DropDownList1"
                Name="name"
                PropertyName="SelectedValue"
                Type="String"
              />
            </SelectParameters>
          </asp:SqlDataSource>
        </div>
      </div>
    </form>
  </body>
</html>
