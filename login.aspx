<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .bg-custom { background-color: #b9b7b7; }
        .text-custom { color: #002D74; }
        .hover-effect:hover { transform: scale(1.05); transition: 0.3s; }
        .icon-toggle { position: absolute; top: 50%; right: 12px; transform: translateY(-50%); cursor: pointer; z-index: 10; }
    </style>
</head>
<body class="bg-gray-100">
    <form id="form1" runat="server">
        <section class="min-h-screen flex justify-center items-center px-4">
            <div class="bg-custom rounded-2xl flex flex-col md:flex-row max-w-3xl w-full p-5 items-center">
                <!-- Left Side -->
                <div class="w-full md:w-1/2 px-8">
                    <h2 class="font-bold text-3xl text-custom">Login</h2>
                    <p class="text-sm mt-4 text-custom">If you are already a member, easily log in now.</p>

                    <asp:TextBox ID="txtEmail" runat="server" CssClass="p-2 mt-5 rounded-xl border w-full" TextMode="Email" placeholder="Email" required="true"></asp:TextBox>

                    <div class="relative mt-2">
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="p-2 rounded-xl border w-full pr-10" TextMode="Password" placeholder="Password" required="true"></asp:TextBox>
                        <i class="fa-solid fa-eye icon-toggle" onclick="togglePassword();"></i>
                    </div>

                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="bg-white border py-2 w-full rounded-xl mt-5 text-sm hover-effect font-medium" OnClick="btnLogin_Click" />

                    <div class="mt-6 text-gray-100 flex items-center">
                        <hr class="border-gray-300 flex-grow">
                        <p class="text-center text-sm mx-2">OR</p>
                        <hr class="border-gray-300 flex-grow">
                    </div>

                    <asp:Button ID="btnGoogleLogin" runat="server" Text="Login with Google" CssClass="bg-white border py-2 w-full rounded-xl mt-5 text-sm hover-effect font-medium" OnClientClick="showGoogleLoginMessage(); return false;" />

                

                    <div class="mt-4 text-sm flex justify-between items-center">
                        <p>If you don't have an account..</p>
                        <asp:HyperLink ID="lnkRegister" runat="server" NavigateUrl="~/register.aspx" CssClass="text-blue-700 hover:underline">Register</asp:HyperLink>
                    </div>
                </div>

                <!-- Right Side (Image) -->
                <div class="hidden md:block w-1/2">
                    <img class="rounded-2xl max-h-[400px]" src="assets/3d%20welcome.jpg" alt="Login Form Image">
                </div>
            </div>
        </section>
    </form>

    <script>
        function togglePassword() {
            var passwordField = document.getElementById('<%= txtPassword.ClientID %>');
            var icon = document.querySelector(".icon-toggle");

            if (passwordField.type === "password") {
                passwordField.type = "text";
                icon.classList.replace("fa-eye", "fa-eye-slash");
            } else {
                passwordField.type = "password";
                icon.classList.replace("fa-eye-slash", "fa-eye");
            }
        }

        function showGoogleLoginMessage() {
            alert("Google login will be implemented soon.");
        }
    </script>
</body>
</html>
