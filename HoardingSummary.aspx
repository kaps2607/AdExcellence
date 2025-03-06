<%@ Page Title="" Language="C#" MasterPageFile="~/MasterUser.Master"
AutoEventWireup="true" CodeBehind="HoardingSummary.aspx.cs"
Inherits="AdExcellence.WebForm19" %>

<asp:Content
  ID="Content1"
  ContentPlaceHolderID="ContentPlaceHolder1"
  Runat="Server"
>
    <section>
    <div class="container mx-auto">
      <div
        class="lg:col-gap-12 xl:col-gap-16 mt-8 grid grid-cols-1 gap-12 lg:mt-12 lg:grid-cols-5 lg:gap-16"
      >
        <div class="lg:col-span-3 lg:row-end-1">
          <div class="lg:flex lg:items-start">
            <div class="lg:order-2 lg:ml-5">
              <div class="max-w-xl overflow-hidden rounded-lg">
                <asp:Label
                  ID="lblimage"
                  runat="server"
                  ForeColor="Black"
                  class="h-[70vh] w-full max-w-full object-cover"
                ></asp:Label>
              </div>
            </div>

            <!-- <div class="mt-2 w-full lg:order-1 lg:w-32 lg:flex-shrink-0">
              <div class="flex flex-row items-start lg:flex-col">
                <button type="button" class="flex-0 aspect-square mb-3 h-20 overflow-hidden rounded-lg border-2 border-gray-900 text-center">
                  <img class="h-full w-full object-cover" src="/images/JHxMnVrtPMdcNU1s_7g7f.png" alt="" />
                </button>
                <button type="button" class="flex-0 aspect-square mb-3 h-20 overflow-hidden rounded-lg border-2 border-transparent text-center">
                  <img class="h-full w-full object-cover" src="/images/JHxMnVrtPMdcNU1s_7g7f.png" alt="" />
                </button>
                <button type="button" class="flex-0 aspect-square mb-3 h-20 overflow-hidden rounded-lg border-2 border-transparent text-center">
                  <img class="h-full w-full object-cover" src="/images/JHxMnVrtPMdcNU1s_7g7f.png" alt="" />
                </button>
              </div>
            </div> -->
          </div>
        </div>

        <div class="lg:col-span-2 lg:row-span-2 lg:row-end-2">
          <!-- <h1 class="sm: text-2xl font-bold text-gray-900 sm:text-3xl">Afro-Brazillian Coffee</h1> -->

          <div class="mt-5 flex items-center">
            <asp:Label
              ID="lbltext"
              runat="server"
              ForeColor="Black"
            ></asp:Label>
          </div>
          <div class="flex flex-col mt-10 mb-16">
            <label class="text-sm mb-2">Duration(In Months)</label>
            <asp:DropDownList
              ID="ddlMonth"
              runat="server"
              class="px-4 py-2 rounded-lg border border-gray-500 bg-white w-[296px]"
            >
            </asp:DropDownList>
          </div>
          <asp:Button ID="btnCart" runat="server" Text="Rent Hoarding" class="inline-flex items-center justify-center rounded-md border-2 border-transparent bg-red-600 bg-none px-12 py-3 text-center text-base font-bold text-white transition-all duration-200 ease-in-out focus:shadow hover:bg-red-600" OnClick="btnCart_Click" />
        </div>
      </div>
    </div>
  </section>
</asp:Content>
