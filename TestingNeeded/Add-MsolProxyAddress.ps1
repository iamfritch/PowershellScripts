<#
.SYNOPSIS
Add ProxyAddress to all users.

.DESCRIPTION
Adds the specified Proxy address to all users as long as it's not already added to that user.

.PARAMETER addressToAdd
Required, and used to specify the address to add.

.EXAMPLE
Add-MsolProxyAddress.ps1 -ass
#>

param (
    [Parameter(Mandatory=$true)]
    [string]$addressToAdd
)

Foreach ($user in Get-Mailbox) {
    Write-Output "Adding $($addressToAdd) as a secondary for user $($user.UserPrincipalName)"
    Set-Mailbox -Identity $user.UserPrincipalName -EmailAddresses @{add="$($user.Alias)@$($addressToAdd)"}
}