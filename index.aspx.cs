using System;
using System.Data.SqlClient;
using System.Configuration;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string name = txtName.Text.Trim();
        string email = txtEmail.Text.Trim();
        string message = txtMessage.Text.Trim();

        if (!string.IsNullOrEmpty(name) && !string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(message))
        {
            // Database connection string (update with your details)     
            string connectionString = "Data Source=LAPTOP-ATNH6G09\\SQLEXPRESS;Initial Catalog=comser;Integrated Security=True;Connect Timeout=15;Encrypt=False;TrustServerCertificate=False";

            using (SqlConnection conn = new SqlConnection(connectionString))

            {
                string query = "INSERT INTO dbo.Contacts (Name, Email, Message) VALUES (@Name, @Email, @Message)";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Message", message);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery();
                        Response.Write("<script>alert('Message Sent Successfully');</script>");
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                    }
                }
            }
        }
        else
        {
            Response.Write("<script>alert('Please fill all fields');</script>");
        }
    }
}
