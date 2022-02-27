using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class cat : System.Web.UI.Page

{
    OleDbConnection con = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\megalight\dbmegalight.mdb");
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        OleDbCommand cmd = new OleDbCommand("insert into tblcategory(categoryname) values(@1)", con);
        cmd.Parameters.AddWithValue("@1", txtcategory.Text);
        con.Open();
        cmd.ExecuteNonQuery();
        
        con.Close();
    
    }
}