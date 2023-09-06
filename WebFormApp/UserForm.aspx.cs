using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;

namespace WebFormApp
{
    public partial class WebControls : System.Web.UI.Page
    {
        SqlConnection sqlConn = new SqlConnection(@"Data Source = DEV4; Initial Catalog = dbRegister; Integrated Security = True");
        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            string name = userName.Text;
            string email = txtEmail.Text;
            string phone = txtPhone.Text;
            string dob = txtDob.Text;
            string gender = Rb1.Checked ? "Male" : "Female";
            string religion = ddlReligion.SelectedValue;
            string password = txtPass.Text;

            using (sqlConn)
            {
                string insertQuery = "INSERT INTO tbl_user (Name, Email, Phone, DOB, Gender, Religion, Password) VALUES (@Name, @Email, @Phone, @DOB, @Gender, @Religion, @Password)";

                using (SqlCommand cmd = new SqlCommand(insertQuery, sqlConn))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Phone", phone);
                    cmd.Parameters.AddWithValue("@DOB", dob);
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@Religion", religion);
                    cmd.Parameters.AddWithValue("@Password", password);

                    sqlConn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            GridViewBind();
            ClearFields();
        }

        protected void DgvUser_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                DgvUser.EditIndex = rowIndex; 
                GridViewBind();
            }

            else if (e.CommandName == "Update")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = DgvUser.Rows[rowIndex];
                int userId = Convert.ToInt32(DgvUser.DataKeys[rowIndex].Value);

                string updatedName = ((TextBox)row.FindControl("editName")).Text;
                string updatedEmail = ((TextBox)row.FindControl("editEmail")).Text;
                string updatedPhone = ((TextBox)row.FindControl("editPhone")).Text;
                string updatedDob = ((TextBox)row.FindControl("editDob")).Text;
                string updatedGender = ((DropDownList)row.FindControl("editGender")).SelectedValue;
                string updatedReligion = ((DropDownList)row.FindControl("editReligion")).SelectedValue;

                using (sqlConn)
                {
                    string updateQuery = "UPDATE tbl_user SET Name = @Name, Email = @Email, Phone = @Phone, DOB = @DOB, Gender = @Gender, Religion = @Religion WHERE id = @UserId";

                    using (SqlCommand cmd = new SqlCommand(updateQuery, sqlConn))
                    {
                        cmd.Parameters.AddWithValue("@Name", updatedName);
                        cmd.Parameters.AddWithValue("@Email", updatedEmail);
                        cmd.Parameters.AddWithValue("@Phone", updatedPhone);
                        cmd.Parameters.AddWithValue("@DOB", updatedDob);
                        cmd.Parameters.AddWithValue("@Gender", updatedGender);
                        cmd.Parameters.AddWithValue("@Religion", updatedReligion);
                        cmd.Parameters.AddWithValue("@UserId", userId);

                        sqlConn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                DgvUser.EditIndex = -1; 
                GridViewBind();
            }

            else if (e.CommandName == "Cancel")
            {
                DgvUser.EditIndex = -1; 
                GridViewBind();
            }

            else if (e.CommandName == "Delete")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int userId = Convert.ToInt32(DgvUser.DataKeys[rowIndex].Value);

                using (sqlConn)
                {
                    string deleteQuery = "DELETE FROM tbl_user WHERE id = @UserId";

                    using (SqlCommand cmd = new SqlCommand(deleteQuery, sqlConn))
                    {
                        cmd.Parameters.AddWithValue("@UserId", userId);

                        sqlConn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                GridViewBind();
            }
        }

        private void GridViewBind()
        {
            SqlDataSource1.DataBind();
            DgvUser.DataBind();
        }

        protected void BtnClear_Click(object sender, EventArgs e)
        {
            ClearFields();
        }

        void ClearFields()
        {
            userName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtDob.Text = string.Empty;       
            Rb1.Checked = false;
            Rb2.Checked = false;
            ddlReligion.SelectedIndex = 0;
            txtPass.Text = string.Empty;
        }

        protected void BtnPrint_Click(object sender, EventArgs e)
        {
            string script = "window.open('RdlcReportPage.aspx', '_blank');";
            ClientScript.RegisterStartupScript(this.GetType(), "OpenReportPage", script, true);
        }

        string conValue1 = ConfigurationManager.AppSettings["key1"];
        string conValue2 = ConfigurationManager.AppSettings["key2"];

        protected void BtnShow_Click(object sender, EventArgs e) 
        {
            labelWebConfig.Text = conValue1;
        }
        protected void BtnHide_Click(object sender, EventArgs e) 
        {
            labelWebConfig.Text = conValue2;
        }

        protected void DgvUser_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dt = (DataTable)ViewState["dirState"];
            if (dt.Rows.Count > 0)
            {
                if (Convert.ToString(ViewState["sortDirection"]) == "Asc")
                {
                    dt.DefaultView.Sort = e.SortExpression + " Desc";
                    ViewState["sortDirection"] = "Desc";
                }
                else
                {
                    dt.DefaultView.Sort = e.SortExpression + " Asc";
                    ViewState["sortDirection"] = "Asc";
                }
                DgvUser.DataSource = dt;
                DgvUser.DataBind();

            }

        }

        protected void BtnTemplate_Click(object sender, EventArgs e)
        {
            string script = "window.open('RdlcReportPage.aspx', '_blank');";
            ClientScript.RegisterStartupScript(this.GetType(), "OpenReportPage", script, true);
        }
    }
}


