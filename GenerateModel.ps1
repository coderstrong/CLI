param(
    [Parameter(Mandatory=$true)]
    [string]$ConnectString,
    [Parameter(Mandatory=$true)]
    [string]$OutputDir
)

<#
echo "Test Project Path" $testProjectPath
echo "Test Settings Path" $OutputDir
#>

try {

    if (-not (Test-Path $OutputDir)) 
    {
        throw [System.IO.OutputDir] "$OutputDir not found."
    }
	
	Scaffold-DbContext $ConnectString Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models
}
catch {

    write-host "Caught an exception:" -ForegroundColor Red
    write-host "Exception Type: $($_.Exception.GetType().FullName)" -ForegroundColor Red
    write-host "Exception Message: $($_.Exception.Message)" -ForegroundColor Red
}

Read-Host -Prompt "Press Enter to continue"