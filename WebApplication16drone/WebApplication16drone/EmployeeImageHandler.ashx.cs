using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication16drone
{
    /// <summary>
    /// Summary description for EmployeeImageHandler
    /// </summary>
    public class EmployeeImageHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string imageid = context.Request.QueryString["Id"];
            SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["dronerentConnectionString"].ConnectionString);
            connection.Open();
            SqlCommand command = new SqlCommand("select Image from Drones where Id=" + imageid, connection);
            SqlDataReader dr = command.ExecuteReader();
            dr.Read();
            context.Response.BinaryWrite((Byte[])dr[0]);
            connection.Close();
            context.Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}