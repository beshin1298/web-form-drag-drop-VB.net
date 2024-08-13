Imports System.Data.SqlClient

Public Class _Default
    Inherits Page

    Private Property DataTable As DataTable
        Get
            If ViewState("DataTable") Is Nothing Then
                ' Tạo mới DataTable nếu chưa có
                Dim dt As New DataTable()
                dt.Columns.Add("Id", GetType(Integer))
                dt.Columns.Add("name", GetType(String))
                dt.Columns.Add("code", GetType(String))
                dt.Columns.Add("email", GetType(String))
                ViewState("DataTable") = dt
            End If
            Return CType(ViewState("DataTable"), DataTable)
        End Get
        Set(value As DataTable)
            ViewState("DataTable") = value
        End Set
    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Load dữ liệu từ cơ sở dữ liệu vào DataTable

            Dim dt As DataTable = LoadDataFromDatabase()
            DataTable = dt
            gClient.DataSource = DataTable
            gClient.DataBind()
        End If
    End Sub

    Private Function LoadDataFromDatabase() As DataTable
        Dim dt As New DataTable()
        Dim sql As String = "SELECT * FROM [m_client]"
        Using conn As New SqlConnection(ConfigurationManager.ConnectionStrings("Drag_Drop_DemoConnectionString").ConnectionString)
            Using cmd As New SqlCommand(sql, conn)
                conn.Open()
                Dim adapter As New SqlDataAdapter(cmd)
                adapter.Fill(dt)
                conn.Close()
            End Using
        End Using
        Return dt
    End Function

    Protected Sub gClient_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gClient.RowCommand

        If e.CommandName = "Copy" Then
            Dim dt As DataTable = DataTable

            Dim rowIndex As Integer = Convert.ToInt32(e.CommandArgument)


            ' Lấy dữ liệu từ dòng được chọn
            Dim newRow As DataRow = dt.NewRow()

            newRow("name") = dt.Rows(rowIndex)("name")
            newRow("email") = dt.Rows(rowIndex)("email")
            newRow("code") = dt.Rows(rowIndex)("code")

            ' Thêm dòng mới vào DataTable
            dt.Rows.Add(newRow)

            ' Cập nhật lại GridView
            DataTable = dt
            gClient.DataSource = dt
            gClient.DataBind()
        End If
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim dt As DataTable = DataTable

        ' Cập nhật lại DataTable với dữ liệu từ GridView
        UpdateDataTableFromGridView(dt)

        Using conn As New SqlConnection(ConfigurationManager.ConnectionStrings("Drag_Drop_DemoConnectionString").ConnectionString)
            conn.Open()
            For Each row As DataRow In dt.Rows
                ' Kiểm tra trạng thái của dòng
                If row.RowState = DataRowState.Added Then
                    ' Nếu là dòng mới thêm
                    Dim sql As String = "INSERT INTO [m_client] ([name], [email],[code]) VALUES (@name, @email, @code)"
                    Using cmd As New SqlCommand(sql, conn)
                        cmd.Parameters.AddWithValue("@name", row("name"))
                        cmd.Parameters.AddWithValue("@email", row("email"))
                        cmd.Parameters.AddWithValue("@code", row("code"))
                        cmd.ExecuteNonQuery()
                    End Using
                ElseIf row.RowState = DataRowState.Modified Then
                    ' Nếu là dòng được chỉnh sửa
                    Dim sql As String = "UPDATE [m_client] SET [name] = @name, [email] = @email, [code] = @code WHERE [id] = @id"
                    Using cmd As New SqlCommand(sql, conn)
                        cmd.Parameters.AddWithValue("@name", row("name"))
                        cmd.Parameters.AddWithValue("@email", row("email"))
                        cmd.Parameters.AddWithValue("@code", row("code"))
                        cmd.Parameters.AddWithValue("@id", row("id"))
                        cmd.ExecuteNonQuery()
                    End Using
                End If
            Next
            conn.Close()
        End Using

        ' Sau khi lưu, reload lại dữ liệu từ cơ sở dữ liệu
        DataTable = LoadDataFromDatabase()
        gClient.DataSource = DataTable
        gClient.DataBind()
    End Sub


    Protected Sub btnAddNewRow_Click(sender As Object, e As EventArgs) Handles btnAddNewRow.Click
        Dim dt As DataTable = DataTable

        ' Trước khi thêm dòng mới, cập nhật lại dữ liệu từ GridView vào DataTable
        UpdateDataTableFromGridView(dt)

        ' Tạo dòng mới và thêm vào DataTable
        Dim newRow As DataRow = dt.NewRow()
        dt.Rows.Add(newRow)

        ' Cập nhật lại ViewState và GridView
        DataTable = dt
        gClient.DataSource = dt
        gClient.DataBind()

        ' Đặt EditIndex để dòng mới được chỉnh sửa ngay lập tức
        gClient.EditIndex = dt.Rows.Count - 1
        gClient.DataBind()
    End Sub
    Private Sub UpdateDataTableFromGridView(ByVal dt As DataTable)
        For i As Integer = 0 To gClient.Rows.Count - 1
            Dim row As DataRow = dt.Rows(i)


            row("name") = CType(gClient.Rows(i).FindControl("txtName"), TextBox).Text
            row("email") = CType(gClient.Rows(i).FindControl("txtEmail"), TextBox).Text
            row("code") = CType(gClient.Rows(i).FindControl("txtCode"), TextBox).Text
        Next
    End Sub






End Class