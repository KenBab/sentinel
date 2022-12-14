# Authenticate to AzureRM
Login-AzureRmAccount

#==============================================================
# Define environment variables
#==============================================================
  
    $SavePath  = "C:\SentinelTables"
    $FileDate    = Get-Date -Format "yyyy-MM-dd"
    
# Fill in your Log Analytics workspace ID    
    $WorkspaceID = "[$WKSID]"


# Change the TableName to the table you want to extract
    $TableName = "AzureActivity"
  
# Output to CSV
    $OutputCSV   = "$SavePath\$TableName-$FileDate.csv"
  
# Get the Table data from Log Analytics
        $TableResult = Invoke-AzureRmOperationalInsightsQuery -WorkspaceId $WorkspaceID -Query $TableName | Select-Object Results -ExpandProperty Results
        $TableResultCount = ($TableResult | Measure-Object).Count


# Fill up the CSV
        If ($TableResultCount -ge 1){
            foreach ($Result in $TableResult){
                $Result | Select-Object * | Export-Csv $OutputCsv -NoTypeInformation -Append
            }
        }
