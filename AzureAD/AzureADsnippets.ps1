#Connect to Azure AD
Connect-AzureAD

Get-AzureADUser -ObjectId a9f92fc8-02d9-461d-9b97-2363c447b8f8 | Select-Object -ExpandProperty * -Property accountEnabled,dirSyncEnabled,city,country,companyName,department,displayName,employeeId,facsimileTelephoneNumber,givenName,jobTitle,mail,mailNickName,mobile,objectId,onPremisesSecurityIdentifier,passwordPolicies,physicalDeliveryOfficeName,postalCode,preferredLanguage,sipProxyAddress,state,streetAddress,surname,telephoneNumber,usageLocation,userPrincipalName,userType,otherMails,@{N="proxyAddresses";E={$_.proxyAddresses -join ","}}  | Export-Csv "C:\Work\AAD_attribs.csv" -Append -NoTypeInformation 

Get-AzureADUser -Filter "PhysicalDeliveryOfficeName eq 'Hong Kong Office'"

Get-AzureADUser -SearchString "Morrisville"

Get-AzureADUser -Filter "userPrincipalName eq 'april.langan@outlook.com'" | Select-Object -Property *

