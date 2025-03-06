<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="AdExcellence.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .faq-container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
    }

    h2, h3 {
        color: #B91C1C;
        font-weight: bold;
    }

    p {
        color: #666;
        line-height: 1.6;
    }
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="faq-container">
        <h2>Welcome to AdExcellence FAQ</h2>
        <p>Here, we address common queries to ensure a seamless experience for our users.</p><br>

        <h3>What is AdExcellence?</h3>
        <p>AdExcellence is a dynamic online platform that connects hoarding owners with advertisers, revolutionizing the outdoor advertising industry.</p><br>

        <h3>How does AdExcellence work?</h3>
        <p>AdExcellence simplifies the process by allowing hoarding owners to register their ad spaces, and advertisers to easily browse, select, and book hoardings based on their specific needs.</p><br>

        <h3>Is my information secure on AdExcellence?</h3>
        <p>Yes, we prioritize data security. Our platform employs robust security measures to protect user information and transactions.</p><br>

        <h3>How can I register as a Hoarding Owner or Advertiser?</h3>
        <p>Visit our registration page, select your user type, and follow the simple steps to create your account.</p><br>

        <h3>What is the revenue model for AdExcellence?</h3>
        <p>AdExcellence operates on a commission-based model, earning revenue by charging a commission from hoarding owners on successful advertisements.</p><br>
    </div>
</asp:Content>
