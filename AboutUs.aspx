<%@ Page Title="" Language="C#" MasterPageFile="~/BeforeLogin.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="AdExcellence.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .about-container {
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
    <div class="about-container">
        <h2>Learn more about the vision, mission, and people behind AdExcellence.</h2><br>

        <h3>Our Vision:</h3>
        <p>At AdExcellence, we envision transforming the outdoor advertising landscape by providing a centralized, user-friendly platform for hoarding owners and advertisers.</p><br>

        <h3>Mission Statement:</h3>
        <p>Our mission is to enhance accessibility, efficiency, and transparency in the advertising ecosystem, fostering innovation and maximizing revenue potential for all stakeholders.</p><br>

        <h3>Meet the Team:</h3>
        <p>Discover the passionate individuals driving AdExcellence's success. Learn about our diverse team dedicated to revolutionizing outdoor advertising.</p><br>

        <h3>Why AdExcellence?</h3>
        <p>Understand the core values that set AdExcellence apart – innovation, transparency, and a commitment to empowering hoarding owners and advertisers.</p><br>
    </div>
</asp:Content>
