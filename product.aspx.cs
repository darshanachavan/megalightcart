using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class product : System.Web.UI.Page
{
    OleDbConnection con=new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\megalight\dbmegalight.mdb");
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        OleDbCommand cmd = new OleDbCommand("insert into tblaproduct(Productname,Productprice,Productimage,Productdescri,categoryid) values(@1,@2,@3,@4,@5)", con);
        cmd.Parameters.AddWithValue("@1",txtpname.Text);
        cmd.Parameters.AddWithValue("@2",txtprice.Text);
        cmd.Parameters.AddWithValue("@3", FileUpload1.FileBytes);
        cmd.Parameters.AddWithValue("@4",txtdescription.Text);
        cmd.Parameters.AddWithValue("@5",DropDownList1.SelectedValue);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
}