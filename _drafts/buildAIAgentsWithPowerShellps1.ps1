<#
. ".\WebSearch.ps1"

$agent = New-Agent -Tools (Register-Tool Invoke-WebSearch) -Instructions "Today is $(Get-Date)"
$agent | Get-AgentResponse 'What were the latest employment numbers in the US?'
#>

<#
function Get-OrderDetail {
    "status: on the way"    
}

$agent = New-Agent -Tools (Register-Tool Get-OrderDetail) 
$agent | Get-AgentResponse "Where's my order?"
#>

<#
if ($null -eq (Get-Module -list PSDuckDB -ErrorAction SilentlyContinue) ) {
    Install-Module PSDuckDB
}

Install-Module PSDuckDB

function Invoke-DuckDB {
    param(
        [string]$sql
    )

    $db = New-DuckDBConnection
    $result = $db.sql($sql)
    $null -eq $result ? $sql : $result
}

$agent = New-Agent -Tools (Register-Tool Invoke-DuckDB)
$agent | Get-AgentResponse "create a customer table, add 3 mock records and show"
#>