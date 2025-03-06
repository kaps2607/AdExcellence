<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="AdExcellence.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .contact-container {
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
    <div class="contact-container">
        <h2>Got questions or feedback? Reach out to us! We're here to help.</h2><br>

        <h3>Contact Form:</h3>
        <p>Fill out our contact form for inquiries, feedback, or assistance. We aim to respond promptly.</p><br>

        <h3>Customer Support:</h3>
        <p>For immediate assistance, you can contact our customer support at <a href="mailto:support@adexcellence.com">support@adexcellence.com</a>.</p><br>

        <h3>Office Address:</h3>
        <p>Visit us at our office located at AdExcellence Headquarters, 123 Main Street, Suite 456, Washington, US. Please schedule an appointment in advance.</p>
    </div>
</asp:Content>
