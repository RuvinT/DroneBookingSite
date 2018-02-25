using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace WebApplication16drone
{
    public partial class AddDrawn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
               // BindGridData();
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //Condition to check if the file uploaded or not   
            if (fileuploadEmpImage.HasFile)
            {
                //getting length of uploaded file  
                int length = fileuploadEmpImage.PostedFile.ContentLength;
                //create a byte array to store the binary image data  
                byte[] imgbyte = new byte[length];
                //store the currently selected file in memeory  
                HttpPostedFile img = fileuploadEmpImage.PostedFile;
                //set the binary data  
                img.InputStream.Read(imgbyte, 0, length);
                string id = txtID.Text;
                string name = txtName.Text;
                string bloodGroup = txtBloodGroup.Text;
                string phoneNo = txtContactNo.Text;

                //Connection String  
                SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dronerentConnectionString"].ConnectionString);
                //Open The Connection  
                connection.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO Drones (DroneId,DroneName,DroneType,Description,Image) VALUES (@id,@Name,@BloodGroup,@ContactNo,@imagedata)", connection);
                cmd.Parameters.Add("@id", SqlDbType.VarChar, 150).Value = id;
                cmd.Parameters.Add("@Name", SqlDbType.VarChar, 150).Value = name;
                cmd.Parameters.Add("@BloodGroup", SqlDbType.NVarChar, 250).Value = bloodGroup;
                cmd.Parameters.Add("@ContactNo", SqlDbType.VarChar, 50).Value = phoneNo;
                cmd.Parameters.Add("@imagedata", SqlDbType.Image).Value = imgbyte;

                int count = cmd.ExecuteNonQuery();
                //Close The Connection  
                connection.Close();
                if (count == 1)
                {
                    //BindGridData();  
                    txtID.Text = string.Empty;
                    txtName.Text = string.Empty;
                    txtBloodGroup.Text = string.Empty;
                    txtContactNo.Text = string.Empty;
                    grdEmployee.DataBind();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('Record added successfully')", true);
                    //call the method to bind the grid  
                    // BindGridData();
                    
                }
            }
        }
        
        private void BindGridData()
        {
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dronerentConnectionString"].ConnectionString);
            SqlCommand command = new SqlCommand("SELECT * from  Drones", connection);
            SqlDataAdapter daimages = new SqlDataAdapter(command);
            DataTable dt = new DataTable();
            daimages.Fill(dt);
            grdEmployee.DataSource = dt;
            grdEmployee.DataBind();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                //Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);

                //Reference the GridView Row.
                GridViewRow row = grdEmployee.Rows[rowIndex];

                //Fetch value of Name.
                string id = (row.FindControl("Id") as TextBox).Text;

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dronerentConnectionString"].ConnectionString);
                conn.Open();
                String insertQ2 = "delete from Drones WHERE Id='" + id + "'";
                SqlCommand com2 = new SqlCommand(insertQ2, conn);

                com2.ExecuteNonQuery();



                conn.Close();
            }
        }

       
    }
}