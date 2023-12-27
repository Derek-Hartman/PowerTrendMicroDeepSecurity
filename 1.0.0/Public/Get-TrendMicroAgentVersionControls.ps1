<#
.Synopsis
    Lists all agent version control profiles.   

.EXAMPLE 
    Get-TrendMicroAgentVersionControls -SecretKey "Secret Key" -AgentVersionControlProfileID "ProfileID"

.NOTES
    Modified by: Derek Hartman
    Date: 8/31/2023

#>
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Function Get-TrendMicroAgentVersionControls {
    [CmdletBinding()]

    param(
        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            HelpMessage = "Enter your Secret Key.")]
        [string]$SecretKey,
        
        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            HelpMessage = "Enter your Agent Version Control Profile ID.")]
        [string]$AgentVersionControlProfileID     
    )

    $Uri = "https://app.deepsecurity.trendmicro.com:443/api/agentversioncontrolprofiles/$($AgentVersionControlProfileID)/agentversioncontrols"

    $Header = @{
        'api-secret-key' = "$SecretKey";
        'api-version'    = "v1";
        'Content-Type'   = "application/json";
    }  

    $Response = Invoke-RestMethod -Method Get -Uri $Uri -Headers $Header
    Write-Output $Response.agentVersionControls
}