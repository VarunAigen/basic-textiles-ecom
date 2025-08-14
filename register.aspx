<%@ Page Language="C#" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .bg-custom { background-color: #b9b7b7; }
        .text-custom { color: #002D74; }
        .hover-effect:hover { transform: scale(1.05); transition: 0.3s; }
        
        /* Icon positioning fix */
        .icon-toggle {
            position: absolute;
            top: 50%;
            right: 12px;
            transform: translateY(-50%);
            cursor: pointer;
            z-index: 10;
            width: 20px;
        }
    </style>
</head>
<body class="bg-gray-50">
    <form id="form1" runat="server">
    <section class="min-h-screen flex justify-center items-center px-4">
        <div class="bg-custom rounded-2xl flex flex-col md:flex-row max-w-3xl w-full p-5 items-center">
            <!-- Left Side (Form) -->
            <div class="w-full md:w-1/2 px-8">
                <h2 class="font-bold text-3xl text-custom">Register</h2>
                <p class="text-sm mt-4 text-custom">Create an account to get started.</p>

                <asp:TextBox ID="txtEmail" runat="server" CssClass="p-2 mt-5 rounded-xl border w-full" TextMode="Email" placeholder="Email" required="true"></asp:TextBox>

                <!-- Password Input -->
                <div class="relative mt-4">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="p-2 rounded-xl border w-full pr-10" TextMode="Password" placeholder="Password" required="true"></asp:TextBox>
                    <i class="fas fa-eye icon-toggle" onclick="togglePasswordVisibility('txtPassword');"></i>
                </div>

                <!-- Confirm Password Input -->
                <div class="relative mt-4">
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="p-2 rounded-xl border w-full pr-10" TextMode="Password" placeholder="Confirm Password" required="true"></asp:TextBox>
                    <i class="fas fa-eye icon-toggle" onclick="togglePasswordVisibility('txtConfirmPassword');"></i>
                </div>

                <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="bg-white border py-2 w-full rounded-xl mt-5 text-sm hover-effect font-medium" OnClick="btnRegister_Click" />

                <div class="mt-4 text-sm flex justify-between items-center">
                    <p>Already have an account?</p>
                    <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="~/login.aspx" CssClass="text-blue-700 hover:underline">Login here</asp:HyperLink>
                </div>
            </div>

            <!-- Right Side (Image) -->
            <div class="hidden md:block w-1/2">
                <img class="rounded-2xl max-h-[400px]" src="assets/3d%20welcome.jpg" alt="Register Form Image">
            </div>
        </div>
    </section>
    </form>

    <script>
        function togglePasswordVisibility(fieldId) {
            var passwordField = document.getElementById(fieldId);
            var icon = passwordField.nextElementSibling;

            if (passwordField.type === "password") {
                passwordField.type = "text";
                icon.classList.replace("fa-eye", "fa-eye-slash");
            } else {
                passwordField.type = "password";
                icon.classList.replace("fa-eye-slash", "fa-eye");
            }
        }
    </script>
</body>
</html>
