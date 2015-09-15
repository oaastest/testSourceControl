<#
    Stops one or more Azure VMs.
#>
workflow Stop-AzVM {
    
    # Names of the Azure VMs to stop
    # TODO: replace with your Azure VM names
    $VMsToStop = @("avmtotest2")

    # Get creds to access Azure
    $AzureCred = Get-AutomationPSCredential -Name "AzureCreds"

    # Connect to Azure
    $null = Add-AzureAccount -Credential $AzureCred

    # Stop the VMs, in parallel
    ForEach -Parallel ($VMName in $VMsToStop) {
        Stop-AzureVM -Name $VMName -ServiceName $VMName -Force
    }
   
}
