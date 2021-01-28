# Add SPO modules to PS session
$Env:path = $env:path + ";C:\Program Files\SharePoint Online Management Shell"
Import-Module 'C:\Program Files\SharePoint Online Management Shell\Microsoft.Online.SharePoint.PowerShell'

# connect using credentials and org name
$adminUPN="username@xxx.onmicrosoft.com"
$orgName="xxx"
$userCredential = Get-Credential -UserName $adminUPN -Message "Type the password."
Connect-SPOService -Url https://$orgName-admin.sharepoint.com -Credential $userCredential


# OneDrive path to modify
$oneDriveUserPath = "https://xxx-my.sharepoint.com/personal/username_xxx_onmicrosoft_com"
$newQuota = 5242880 # 1TB = 1048576  5TB = 5242880 


Set-SPOSite -Identity $oneDriveUserPath  -StorageQuota $newQuota

Get-SPOSite $oneDriveUserPath # -Detailed  # | select url, storageusagecurrent, Owner