# 6 Easy Ways to Export Data to Excel in PowerShell


## Pre-requisites

- [PowerShell 5.1](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-windows-powershell?view=powershell-5.1)
- [ImportExcel module](https://www.powershellgallery.com/packages/ImportExcel) `Install-Module ImportExcel`

## DataTable to Excel

```powershell
# Create a DataTable with some sample data
$dataTable = New-Object System.Data.DataTable
$null = $dataTable.Columns.Add("Name")
$null = $dataTable.Columns.Add("Age")
$null = $dataTable.Rows.Add("John", 30)
$null = $dataTable.Rows.Add("Jane", 25)

# Export the DataTable to Excel
$dataTable | Select Name, Age | Export-Excel -Path ".\file.xlsx" -AutoSize -AutoFilter -Show
```

## Collection of objects to Excel

```powershell
# Create a collection of objects with some sample data
$collection = @()
$collection+=[PSCustomObject]@{Name = "John"; Age = 30}
$collection+=[PSCustomObject]@{Name = "Jane"; Age = 25}

# Export the collection of objects to Excel
$collection | Export-Excel -Path ".\file.xlsx" -AutoSize -AutoFilter -Show
```

## Get-Process to Excel
Easily export the output of a PowerShell cmdlet to Excel.

```powershell
# Get the processes
$processes = Get-Process | Select -First 10 Company, Name, CPU, PM, VM, WS

# Export the processes to Excel
$processes | Export-Excel -Path ".\file.xlsx" -AutoSize -AutoFilter -Show
```

## CSV to Excel

CSV formats are very common in the IT world. It is very easy to export a CSV file to Excel.

```powershell
# Create a CSV file with some sample data
@"
Name,Age
John,30
Jane,25
"@ | Out-File -FilePath ".\file.csv"

# Import the CSV file
$csv = Import-Csv -Path ".\file.csv"

# Export the CSV file to Excel
$csv | Export-Excel -Path ".\file.xlsx" -AutoSize -AutoFilter -Show
```

## JSON to Excel

JSON formats are also very common in the IT world. It is very easy to export a JSON file to Excel.

```powershell
# Create JSON with some sample data

$data = @"
[
    {
        "Name": "John",
        "Age": 30
    },
    {
        "Name": "Jane",
        "Age": 25
    }
]
"@ | ConvertFrom-Json

# Export the JSON to Excel
$data | Export-Excel -Path ".\file.xlsx" -AutoSize -AutoFilter -Show
```

## Database to Excel

```powershell
# Create a connection to the database
$connection = New-Object System.Data.SqlClient.SqlConnection
$connection.ConnectionString = "Server=.;Database=main;Integrated Security=True"

# Create a command to get the data
$command = New-Object System.Data.SqlClient.SqlCommand
$command.Connection = $connection
$command.CommandText = "SELECT * FROM [dbo].[Users]"
$adapter = New-Object System.Data.SqlClient.SqlDataAdapter
$adapter.SelectCommand = $command
$dataTable = New-Object System.Data.DataTable
$adapter.Fill($dataTable)

# Export the data to Excel
$dataTable | Export-Excel -Path ".\file.xlsx" -AutoSize -AutoFilter -Show
```

