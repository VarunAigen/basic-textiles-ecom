using System;
using System.Data.SqlClient;
using System.Web.UI;

public partial class Register : Page
{
    // Connection string to the SQL Server 
    private string connectionString = "Data Source=LAPTOP-ATNH6G09\\SQLEXPRESS;Initial Catalog=comser;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=False";

    // Event handler for Register Button Click
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        string email = txtEmail.Text.Trim();
        string password = txtPassword.Text.Trim();
        string confirmPassword = txtConfirmPassword.Text.Trim();

        // Validate if password and confirm password match
        if (password != confirmPassword)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Passwords do not match.');", true);
            return;
        }

        // Check if email is already registered (you can skip this part if you don’t need it)
        if (IsEmailAlreadyRegistered(email))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Email is already registered.');", true);
            return;
        }

        // Insert data into database
        if (RegisterUser(email, password))
        {
            // Redirect to login page upon successful registration
            Response.Redirect("login.aspx");
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Registration failed. Please try again.');", true);
        }
    }

    // Method to check if email already exists in the database
    private bool IsEmailAlreadyRegistered(string email)
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "SELECT COUNT(*) FROM Users WHERE Email = @Email";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Email", email);

            conn.Open();
            int count = (int)cmd.ExecuteScalar();
            return count > 0;
        }
    }

    // Method to insert new user into the database
    private bool RegisterUser(string email, string password)
    {
        using (SqlConnection conn = new SqlConnection(connectionString))
        {
            string query = "INSERT INTO Users (Email, Password, ConfirmPassword) VALUES (@Email, @Password, @ConfirmPassword)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Password", password);  // Password should ideally be hashed before saving
            cmd.Parameters.AddWithValue("@ConfirmPassword", password);  // Assuming confirm password matches the password

            conn.Open();
            int rowsAffected = cmd.ExecuteNonQuery();
            return rowsAffected > 0;
        }
    }
}
