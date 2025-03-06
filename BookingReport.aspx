<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookingReport.aspx.cs" Inherits="AdExcellence.UserReport" %>

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
                DataField="bookid"
                HeaderText="bookid"
                SortExpression="bookid"
              />
              <asp:BoundField
                DataField="hid"
                HeaderText="hid"
                SortExpression="hid"
              />
              <asp:BoundField
                DataField="fromdate"
                HeaderText="fromdate"
                SortExpression="fromdate"
              />
              <asp:BoundField
                DataField="todate"
                HeaderText="todate"
                SortExpression="todate"
              />
              <asp:BoundField
                DataField="totalcost"
                HeaderText="totalcost"
                SortExpression="totalcost"
              />
              <asp:BoundField
                DataField="emailid"
                HeaderText="emailid"
                SortExpression="emailid"
              />
              <asp:BoundField
                DataField="status"
                HeaderText="status"
                SortExpression="status"
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
            ProviderName="<%$ ConnectionStrings:adexcelConnectionString5.ProviderName %>"
            SelectCommand="SELECT * FROM [Booking] ORDER BY [bookid] DESC"
          ></asp:SqlDataSource>
        </div>
      </div>
    </form>
  </body>
</html>
