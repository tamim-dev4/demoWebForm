using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormApp
{
    public partial class RdlcReportPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = GetReportDataSource();
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("DataSet1", dt));
                ReportViewer1.ShowPageNavigationControls = true;
                ReportViewer1.LocalReport.Refresh();
            }
        }

        private DataTable GetReportDataSource()
        {
            SqlConnection sqlConn = new SqlConnection(@"Data Source = DEV4; Initial Catalog = dbRegister; Integrated Security = True");
            string query = "SELECT name, email, phone, dob, gender, religion FROM tbl_user";
            SqlDataAdapter adapter = new SqlDataAdapter(query, sqlConn);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            return dt;
        }

    }
}