<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="quickform.aspx.cs" Inherits="WebApplication16drone.quickform" %>

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

         
          
        <div class="input-icon"><i class="fa fa-envelope"></i></div>
      </div>  
        
      
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

