<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="form.aspx.cs" Inherits="WebApplication16drone.form"  MaintainScrollPositionOnPostback="true" %>



<!DOCTYPE html>
<html >
<head runat="server">
  <meta charset="UTF-8">
  <title>Sign Up Form</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  <link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

      <link rel="stylesheet" href="css/formstyle.css">

  
</head>

<body>
  <form id="form1" runat="server">
<div class="container">
  <form>
    <div class="row">
      <h4>Drone Order</h4>
      <div class="input-group input-group-icon">
       
          <asp:TextBox ID="TextBoxFullName" placeholder="Full Name" Font-Italic="true" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxFullName" runat="server" ControlToValidate="TextBoxFullName" ErrorMessage="Full Name is Required"></asp:RequiredFieldValidator>
        <div class="input-icon"><i class="fa fa-user"></i></div>
      </div>

       <div class="input-group input-group-icon">
       
          <asp:TextBox ID="TextBoxID" placeholder="ID NO" Font-Italic="true" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxID" runat="server" ControlToValidate="TextBoxID" ErrorMessage="NIC is Required"></asp:RequiredFieldValidator>
        <div class="input-icon"><i class="fa fa-user"></i></div>
      </div>

       <div class="input-group input-group-icon">
       
          <asp:TextBox ID="TextBoxPhoneNumber" placeholder="Phone Number" Font-Italic="true" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxPhoneNumber" runat="server" ControlToValidate="TextBoxPhoneNumber" ErrorMessage="Please Enter Phone Number"></asp:RequiredFieldValidator>
        <div class="input-icon"><i class="fa fa-user"></i></div>
      </div>

      <div class="input-group input-group-icon">
        
          <asp:TextBox ID="TextBoxemail" placeholder="Email Adress" Font-Italic="true" runat="server"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidatorTextBoxemail" runat="server" ControlToValidate="TextBoxemail" ErrorMessage="Please Enter E-mail"></asp:RequiredFieldValidator>
          <asp:RegularExpressionValidator ID="RegularExpressionValidatorTextBoxemail" runat="server" ErrorMessage="Invalid E-mail" ControlToValidate="TextBoxemail" CssClass="auto-style2" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <div class="input-icon"><i class="fa fa-envelope"></i></div>
      </div>
        
      <div class="input-group input-group-icon">
        
          <asp:TextBox ID="TextBoxLocation" placeholder="Location" Font-Italic="true" runat="server"></asp:TextBox>

          <br /><br />
          <asp:Calendar ID="Calendar1" runat="server" OnDayRender=" Calendar1DayRender" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="227px" ShowGridLines="True" Width="280px" OnSelectionChanged="Calendar1_SelectionChanged" >
                                                    <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                                                    <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                                                    <OtherMonthDayStyle ForeColor="#CC9966" />
                                                    <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                                                    <SelectorStyle BackColor="#FFCC66" />
                                                    <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                                                    <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                                                </asp:Calendar>
          
        <div class="input-icon"><i class="fa fa-envelope"></i></div>
          <br/>
         <b> <span style="color: Red">Red</span></b><span> - Booked</span>
      </div>  
        
      
    </div>
    <div class="row">
     

      

          </div>

      
        <div class="row">
      <h4>Terms and Conditions</h4>
      <div class="input-group">
        <input type="checkbox" id="terms"/>
          
        <label for="terms">I accept the terms and conditions for signing up to this service, and hereby confirm I have read the privacy policy.</label>
      </div>
    </div>
    <div >
          <asp:Button ID="Buttonconfirm" runat="server" Text="Order" Font-Italic="true" OnClick="Buttonconfirm_Click" Width="174px" />
      </div>
  </form>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    <script src="js/formindex.js"></script>

      

    </form>
</body>
</html>

