Imports AjaxControlToolkit

Public Class About
    Inherits Page

    Protected Sub ReOrderList_ItemReorder(ByVal sender As Object, ByVal e As AjaxControlToolkit.ReorderListItemReorderEventArgs)

        For i As Integer = 0 To ReOrderList.Items.Count - 1
            Dim itemId As Integer = Convert.ToInt32(ReOrderList.DataKeys(i))
            SqlConnection.UpdateParameters("Id").DefaultValue = itemId.ToString()
            SqlConnection.UpdateParameters("index").DefaultValue = i.ToString()
            Dim item As ReorderListItem = ReOrderList.Items(i)
            SqlConnection.UpdateParameters("name").DefaultValue = CType(item.FindControl("txtName"), TextBox).Text
            SqlConnection.Update()
        Next
    End Sub

End Class