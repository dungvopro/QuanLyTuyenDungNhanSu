using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace TeamHire
{
    public class xuly01 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter adp;
        SqlDataReader reader;
        DataTable dt;

        public xuly01()
        {
            string sqlCon = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=" + Server.MapPath("/App_Data/teamhire.mdf") + ";Integrated Security=True";
            con = new SqlConnection(sqlCon);
        }
        private void setData(string sql)
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            cmd = new SqlCommand(sql, con);
            cmd.CommandType = CommandType.Text;
        }

        public DataTable getData(string sql)
        {
            dt = new DataTable();
            try
            {
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                da.Fill(dt);
            }
            catch
            {
                //thông báo
            }
            return dt;
        }

        public void checkConnectState(SqlConnection myCon)
        {
            if (myCon.State == ConnectionState.Open)
                myCon.Close();
        }

        public int updateData(string sql)
        {
            int row = -1;
            setData(sql);
            try
            {

                row = cmd.ExecuteNonQuery();
            }
            catch
            {

            }
            finally
            {
                con.Close();
            }
            return row;
        }

        public SqlDataReader readData(string sql)
        {
            reader = null;
            readData(sql);
            try
            {
                reader = cmd.ExecuteReader();
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message);
            }
            return reader;
        }

        public object getSingleValue(string sql)
        {
            object result = null;
            setData(sql);
            try
            {
                result = cmd.ExecuteScalar();
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                con.Close();
            }
            return result;
        }
    }
}