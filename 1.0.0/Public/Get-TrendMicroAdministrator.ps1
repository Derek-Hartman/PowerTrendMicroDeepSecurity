<#
.Synopsis
    Describe an administrator by ID.  

.EXAMPLE 
    Get-TrendMicroAdministrator -SecretKey "Secret Key" -AdministratorID "AdminID"

.NOTES
    Modified by: Derek Hartman
    Date: 8/31/2023

#>
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Function Get-TrendMicroAdministrator {
    [CmdletBinding()]

    param(
        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            HelpMessage = "Enter your Secret Key.")]
        [string]$SecretKey,
        
        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            HelpMessage = "Enter your Administrator ID.")]
        [string]$AdministratorID 
    )

    $Uri = "https://app.deepsecurity.trendmicro.com:443/api/administrators/$AdministratorID"

    $Header = @{
        'api-secret-key' = "$SecretKey";
        'api-version'    = "v1";
        'Content-Type'   = "application/json";
    }  

    $Response = Invoke-RestMethod -Method Get -Uri $Uri -Headers $Header
    Write-Output $Response
}