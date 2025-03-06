<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.Master" AutoEventWireup="true" CodeBehind="PrivacyPolicy.aspx.cs" Inherits="AdExcellence.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .privacy-container {
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
    <div class="privacy-container">
        <h2>Please read the following terms and conditions carefully before using AdExcellence.</h2><br>

        <h3>Acceptance of Terms:</h3>
        <p>By accessing or using AdExcellence, you agree to comply with and be bound by these terms and conditions.</p><br>

        <h3>User Registration:</h3>
        <p>Users must provide accurate and complete information during the registration process. Misrepresentation may result in account suspension.</p><br>

        <h3>Use of Content:</h3>
        <p>Users agree not to reproduce, distribute, or exploit any content on AdExcellence without explicit permission.</p><br>

        <h3>Privacy Policy:</h3>
        <p>Our Privacy Policy outlines how we collect, use, and protect user information. By using AdExcellence, you consent to our privacy practices.</p><br>

        <h3>Payments and Transactions:</h3>
        <p>Advertisers and hoarding owners agree to adhere to our payment terms. AdExcellence ensures secure transactions, but users are responsible for the accuracy of payment details.</p><br>
    </div>
</asp:Content>
