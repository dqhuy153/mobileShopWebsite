using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace shopMobileOnline
{
    public class DataAccess
    {
        private SqlConnection connection;
        public void MoKetNoiCSDL()
        {
            connection = new SqlConnection();
            connection.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename='C:\Users\Laptop T&T\documents\visual studio 2017\Projects\shopMobileOnline\shopMobileOnline\App_Data\ShopMobileOnline.mdf';Integrated Security=True;MultipleActiveResultSets=true";
            if(connection.State == ConnectionState.Closed)
                connection.Open();
        }

        public SqlConnection getConnection()
        {
            return this.connection;
        }
        public DataTable LayBangDuLieu(string sql)
        {
            SqlDataAdapter adapter = new SqlDataAdapter(sql, this.connection);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            return dataTable;
        }

        public void DongKetNoiCSDL()
        {
            if (connection.State == ConnectionState.Open)
                connection.Close();
        }
    }
}