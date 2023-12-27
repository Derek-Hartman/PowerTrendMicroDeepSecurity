﻿<#
.Synopsis
    Lists all scheduled tasks.  

.EXAMPLE 
    Get-TrendMicroScheduledTasks -SecretKey "Secret Key"

.NOTES
    Modified by: Derek Hartman
    Date: 8/31/2023

#>
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Function Get-TrendMicroScheduledTasks {
    [CmdletBinding()]

    param(
        [Parameter(Mandatory = $True,
            ValueFromPipeline = $True,
            HelpMessage = "Enter your Secret Key.")]
        [string]$SecretKey     
    )

    $Uri = "https://app.deepsecurity.trendmicro.com:443/api/scheduledtasks"

    $Header = @{
        'api-secret-key' = "$SecretKey";
        'api-version'    = "v1";
        'Content-Type'   = "application/json";
    }  

    $Response = Invoke-RestMethod -Method Get -Uri $Uri -Headers $Header
    Write-Output $Response.scheduledTasks
}