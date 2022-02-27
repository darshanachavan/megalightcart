<%@ WebHandler Language="C#" Class="producthandler" %>

using System;
using System.Web;
using System.Data.OleDb;

public class producthandler : IHttpHandler {

    public void ProcessRequest (HttpContext context)
    {
        try
        {
            OleDbConnection con = new OleDbConnection(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\megalight\dbmegalight.mdb");
            OleDbCommand cmd = new OleDbCommand("select Productimage from tblaproduct where categoryid=@categoryid",con);
            cmd.Parameters.AddWithValue("categoryid",context.Request.QueryString["categoryid"]);
            con.Open();
            byte[] img = (byte[])cmd.ExecuteScalar();
            con.Close();
            context.Response.ContentType = "image";
                context.Response.BinaryWrite(img);
        }
        catch(Exception ex)
        {
            //context.Response.ContentType = "text/plain";
            // context.Response.Write("Hello World");
        }
    }

    public bool IsReusable {
        get {
            return false;
        }
    }

}