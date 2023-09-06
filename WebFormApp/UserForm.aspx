<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserForm.aspx.cs" Inherits="WebFormApp.WebControls" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Form</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body class="main">
    <div class="container my-4">
        <div class="card">
            <div class="card-body">

                <form id="form1" class="row g-2 justify-content-md-center" runat="server">
                    <div class="col-md-6">
                        <b>
                            <asp:Label ID="labelName" runat="server">Name </asp:Label></b></br>
                        <asp:TextBox ID="userName" runat="server" placeholder="Your Name" ToolTip="Enter your name"></asp:TextBox>
                    </div>

                    <div class="col-md-6">
                        <b>
                            <asp:Label ID="labelGender" runat="server">Gender </asp:Label></b></br>
                        <asp:RadioButton ID="Rb1" runat="server" Text="Male" GroupName="gender" />
                        <asp:RadioButton ID="Rb2" runat="server" Text="Female" GroupName="gender" />
                    </div>

                    <div class="col-md-6">
                        <b>
                            <asp:Label ID="labelEmail" runat="server">Email </asp:Label></b></br>
                        <asp:TextBox ID="txtEmail" runat="server" type="email" placeholder="name@example.com" ToolTip="Enter your Email"></asp:TextBox>
                    </div>

                    <div class="col-md-6">
                        <b>
                            <asp:Label ID="labelReligion" runat="server">Religion </asp:Label></b></br>
                        <asp:DropDownList ID="ddlReligion" runat="server">
                            <asp:ListItem Value="">Please select religion</asp:ListItem>
                            <asp:ListItem>Islam</asp:ListItem>
                            <asp:ListItem>Hinduism</asp:ListItem>
                            <asp:ListItem>Christianity</asp:ListItem>
                            <asp:ListItem>Buddhism</asp:ListItem>
                            <asp:ListItem>Atheist</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-6">
                        <b>
                            <asp:Label ID="labelPhone" runat="server">Phone </asp:Label></b></br>
                        <asp:TextBox ID="txtPhone" runat="server" placeholder="Enter your mobile" pattern="[0-9]{11}" ToolTip="Enter your mobile"></asp:TextBox>
                    </div>

                    <div class="col-md-6">
                        <b>
                            <asp:Label ID="labelPassword" runat="server">Password </asp:Label></b></br>
                        <asp:TextBox ID="txtPass" runat="server" TextMode="Password" placeholder="Enter your password" ToolTip="Enter your password"></asp:TextBox>
                    </div>

                    <div class="col-md-9">
                        <b>
                            <asp:Label ID="labelDob" runat="server">Date of Birth </asp:Label></b></br>
                        <asp:TextBox ID="txtDob" runat="server" type="date" TextMode="Date"></asp:TextBox>
                    </div>

                    </br>
                    <div class="col-md-3">
                        <asp:Button ID="BtnSubmit" runat="server" Text="Save" OnClick="BtnSubmit_Click" OnClientClick="return displaySuccessAlert();"/>
                        <asp:Button ID="BtnClear" runat="server" Text="Clear" OnClick="BtnClear_Click" />
                    </div>

            </div>
        </div>
    </div>

    <div>
        <p style="text-align: center">
            <asp:Label ID="labelWebConfig" runat="server"></asp:Label>
        </p>
        <div class="row justify-content-md-center">
            <asp:Button ID="BtnShow" runat="server" Text="Show" OnClick="BtnShow_Click" />
            <asp:Button ID="BtnHide" runat="server" Text="Hide" OnClick="BtnHide_Click" />
        </div>
    </div>

    <div class="container my-4">
        <div class="card">
            <div class="card-body">
                <div class="row justify-content-md-center">
                    <asp:GridView ID="DgvUser" runat="server" Width="888px" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Height="362px" DataKeyNames="id" OnRowCommand="DgvUser_RowCommand" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" AllowPaging="True" AllowSorting="True">
                        <AlternatingRowStyle BackColor="#CCCCCC" />
                        <Columns>
                            <asp:TemplateField HeaderText="Name" SortExpression="name">
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="editName" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="editEmail" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Phone">
                                <ItemTemplate>
                                    <asp:Label ID="lblPhone" runat="server" pattern="[0-9]{11}" Text='<%# Eval("phone") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="editPhone" runat="server" pattern="[0-9]{11}" Text='<%# Bind("phone") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DOB">
                                <ItemTemplate>
                                    <asp:Label ID="lblDob" runat="server" type="date" TextMode="Date" Text='<%# Eval("dob") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="editDob" runat="server" type="date" TextMode="Date" Text='<%# Bind("dob") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Gender">
                                <ItemTemplate>
                                    <asp:Label ID="lblGender" runat="server" Text='<%# Eval("gender") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="editGender" runat="server" Text='<%# Bind("gender") %>'>
                                        <asp:ListItem Value="">Select Gender</asp:ListItem>
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Religion">
                                <ItemTemplate>
                                    <asp:Label ID="lblReligion" runat="server" Text='<%# Eval("religion") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="editReligion" runat="server" Text='<%# Bind("religion") %>'>
                                        <asp:ListItem Value="">Please select religion</asp:ListItem>
                                        <asp:ListItem>Islam</asp:ListItem>
                                        <asp:ListItem>Hinduism</asp:ListItem>
                                        <asp:ListItem>Christianity</asp:ListItem>
                                        <asp:ListItem>Buddhism</asp:ListItem>
                                        <asp:ListItem>Atheist</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" CommandArgument='<%# Container.DataItemIndex %>' />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="Update" CommandArgument='<%# Container.DataItemIndex %>' OnClientClick="return confirmUpdate();" />
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" CommandArgument='<%# Container.DataItemIndex %>' />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CommandArgument='<%# Container.DataItemIndex %>' OnClientClick="return confirmDelete();" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                </div>
                </ br>
                <div class="float-right">
                    <asp:Button ID="BtnPrint" runat="server" Text="Print" OnClick="BtnPrint_Click" />
                </div>
                <div class="float-left">
                    <asp:Button ID="BtnTemplate" runat="server" Text="Template" OnClick="BtnTemplate_Click" />
                </div>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:dbRegisterConnectionString %>"
                    SelectCommand="SELECT [id], [name], [email], [phone], [dob], [gender], [religion] FROM [tbl_user]"
                    DeleteCommand="DELETE FROM [tbl_user] WHERE [id] = @id"
                    UpdateCommand="UPDATE [tbl_user] SET [name] = @name, [email] = @email, [phone] = @phone, [dob] = @dob, [gender] = @gender, [religion] = @religion WHERE [id] = @id">

                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>

                    <UpdateParameters>
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="phone" Type="String" />
                        <asp:Parameter Name="dob" Type="DateTime" />
                        <asp:Parameter Name="gender" Type="String" />
                        <asp:Parameter Name="religion" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>

                </asp:SqlDataSource>
                </br></br>
            </div>
        </div>

        </form>

    </div>

    <script>
        function displaySuccessAlert()
        {
            return alert('Data saved successfully!');
        }

        function confirmUpdate()
        {
            return confirm('Are you sure to update this record?');
        }

        function confirmDelete()
        {
            return confirm('Are you sure to delete this record?');
        }
    </script>

</body>
</html>
