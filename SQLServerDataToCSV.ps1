$SQLServer = "LAPTOP-6NNFSG9S\SQLEXPRESS" #use Server\Instance for named SQL instances!
$SQLDBName = "CustomersDB"
$SqlConnection = New-Object System.Data.SqlClient.SqlConnection
$SqlConnection.ConnectionString = "Server = $SQLServer; Database = $SQLDBName; Integrated Security = True;" 
$SqlCmd = New-Object System.Data.SqlClient.SqlCommand
$SqlCmd.CommandText = '[dbo].[GetCustomersList]'
$SqlCmd.Connection = $SqlConnection 
$SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter
$SqlAdapter.SelectCommand = $SqlCmd 
$DataSet = New-Object System.Data.DataSet
$ds = New-Object System.Data.DataSet
$da.Fill($ds) >$null| Out-Null
$ds.Tables[0] | export-csv tofile.csv -notypeinformation
$SqlAdapter.Fill($DataSet)
$SqlConnection.Close()