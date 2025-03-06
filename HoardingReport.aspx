<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HoardingReport.aspx.cs" Inherits="AdExcellence.UserReport" %>

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
          <asp:GridView
            ID="GridView1"
            class="w-full"
            runat="server"
            AutoGenerateColumns="False"
            DataSourceID="SqlDataSource1"
          >
            <Columns>
              <asp:BoundField
                DataField="hid"
                HeaderText="hid"
                SortExpression="hid"
              />
              <asp:BoundField
                DataField="size"
                HeaderText="size"
                SortExpression="size"
              />
              <asp:BoundField
                DataField="location"
                HeaderText="location"
                SortExpression="location"
              />
              <asp:BoundField
                DataField="cost"
                HeaderText="cost"
                SortExpression="cost"
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
            ID="SqlDataSource1"
            runat="server"
            ConnectionString="<%$ ConnectionStrings:adexcelConnectionString5 %>"
            SelectCommand="SELECT [hid], [size], [location], [cost] FROM [Hoarding] ORDER BY [hid] DESC"
          ></asp:SqlDataSource>
        </div>
      </div>
    </form>
</body>
</html>
