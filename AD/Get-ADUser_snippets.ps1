get-aduser -identity mike.meyer_adm
$NAPDC="USNORTHDC001.north.xxx.com"
$NASearchBase="DC=north,DC=xxx,DC=com" # ex. AD domain north.xxx.com
$UPN="first.last@xxx.com"
get-aduser -LDAPFilter "(UserPrincipalName=$UPN)" -SearchBase $NASearchBase -Server $NAPDC

Get-ADUser -Filter "SamAccountName -like '*last*'"  #this works

$filterDate = (Get-Date).AddDays(-14)
Get-ADUser -Filter * -Property whenCreated | Where {$_.whenCreated -gt $filterDate} | FT Name, whenCreated -Autosize

get-aduser -filter "(SamAccountName -like '*first.last*') -And (Enabled -eq 'True')" -Properties * | Export-Csv -Path FileSystem::"C:\XXX_NA_IRT_Users.csv"
Get-ADUser -Filter "(UserPrincipalName -like '*adm@xxx.onmicrosoft.com*') -And (Enabled -eq 'True')" | Export-Csv -Path "C:\XXX_OnMicrosoftAdmins.csv" -NoTypeInformation

Get-ADUser -filter "(Enabled -eq 'True')"  -properties PhysicalDeliveryOfficeName | select PhysicalDeliveryOfficeName -Unique | Export-Csv "C:\Work\physicalDeliveryOfficeName.csv" -NoTypeInformation

Get-ADGroup -Identity "Group Name"

Get-ADGroupMember -Identity "UG-AGPMAdmins"

$UserId = (Get-AzureADUser -Filter "userPrincipalName eq 'april.langan@outlook.com'" | Select-Object -Property ObjectId)

$userProps = (Get-AzureADUser -Filter "userPrincipalName eq 'april.langan@outlook.com'" | Select -ExpandProperty ExtensionProperty)
$userEmpID = $userProps.employeeId

(Get-AzureADUser -Filter "userPrincipalName eq 'april.langan@outlook.com'")


-Property Name, @{
    label='FreeSpace'
    expression={($_.FreeSpace/1GB).ToString('F2')}
  }