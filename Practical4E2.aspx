<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Practical4E2.aspx.cs" Inherits="Practical4.Practical4E2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 246px;
        }
        .auto-style2 {
            width: 47%;
        }
        .auto-style3 {
            width: 246px;
            height: 32px;
        }
        .auto-style4 {
            height: 32px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style2">
            <tr>
                <td class="auto-style1">Please select staff name:</td>
                <td>Please select year:</td>
               
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:DropDownList ID="ddlName" runat="server" DataSourceID="sdsEmployees" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True" DataTextField="Name" DataValueField="EmployeeID">
    </asp:DropDownList>
                </td>
                <td class="auto-style4">
                    <asp:RadioButtonList ID="rblYear" runat="server" RepeatDirection="Horizontal" DataTextField="Years" DataValueField="Years" DataSourceID="sdsOrders" AutoPostBack="True">
    </asp:RadioButtonList>
                </td>
               
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                </td>
                
            </tr>
        </table>
        <br />
        <asp:GridView runat="server" ID="Gridview" AutoGenerateColumns="False" DataSourceID="sdsOrderList" DataKeyNames="OrderID">
            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" InsertVisible="False" SortExpression="OrderID"></asp:BoundField>
                <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate"></asp:BoundField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sdsEmployees" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionStringLatest %>" SelectCommand="SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS Name FROM Employees"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsOrders" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionStringLatest %>" SelectCommand="SELECT DISTINCT (YEAR(OrderDate)) AS Years

FROM Orders
ORDER BY Years ASC"></asp:SqlDataSource>
        <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionStringLatest %>" SelectCommand="SELECT OrderID, OrderDate
FROM Orders 
WHERE EmployeeID = @EmployeeID AND YEAR(OrderDate) = @Year"
            ID="sdsOrderList" OnSelecting="ctl01_Selecting">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlName" PropertyName="SelectedValue" Name="EmployeeID"></asp:ControlParameter>
            <asp:ControlParameter ControlID="rblYear" PropertyName="SelectedValue" Name="Year"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
        
        <br />
        <br />
    </form>
</body>
</html>
