using System;
using System.Data.SqlClient;
using System.Web.UI;

public partial class login : Page
{
    // Event handler for the login button click
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string email = txtEmail.Text.Trim();
        string password = txtPassword.Text.Trim();

        // Connection string to your database
        string connectionString = "Data Source=LAPTOP-ATNH6G09\\SQLEXPRESS;Initial Catalog=comser;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=False";

        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            try
            {
                connection.Open();

                // Create the SQL query to check if the email and password match
                string query = "SELECT UserId FROM dbo.Users WHERE Email = @Email AND Password = @Password";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Add parameters to avoid SQL injection
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Password", password);

                    // Execute the query and get the userId if a match is found
                    object result = command.ExecuteScalar();

                    if (result != null)
                    {
                        int userId = (int)result;

                        // If you want to store the login time in Users table, use the following query:
                        string updateLastLoginQuery = "UPDATE dbo.Users SET LastLogin = @LoginDate WHERE UserId = @UserId";

                        using (SqlCommand updateCommand = new SqlCommand(updateLastLoginQuery, connection))
                        {
                            updateCommand.Parameters.AddWithValue("@LoginDate", DateTime.Now);
                            updateCommand.Parameters.AddWithValue("@UserId", userId);
                            updateCommand.ExecuteNonQuery();
                        }

                        // Or if you are using LoginHistory table to store the login attempt:
                        string insertLoginHistoryQuery = "INSERT INTO dbo.LoginHistory (UserId, LoginDate) VALUES (@UserId, @LoginDate)";

                        using (SqlCommand historyCommand = new SqlCommand(insertLoginHistoryQuery, connection))
                        {
                            historyCommand.Parameters.AddWithValue("@UserId", userId);
                            historyCommand.Parameters.AddWithValue("@LoginDate", DateTime.Now);
                            historyCommand.ExecuteNonQuery();
                        }

                        // Redirect to the homepage after successful login
                        Response.Redirect("index.html");
                    }
                    else
                    {
                        // Show an error message if login fails
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Invalid email or password.');", true);
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle any errors that occur during the database operation
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Error: " + ex.Message + "');", true);
            }
        }
    }
}