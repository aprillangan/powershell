# install-module -Name AzureAD
# Connect-AzureAD
# Connect-MsolService
# Get-AzureADSubscribedSku | Select SkuPartNumber | 
$allSKUs=Get-AzureADSubscribedSku
$licArray = @()
    for($i = 0; $i -lt $allSKUs.Count; $i++)
    {
        $licArray += "Service Plan: " + $allSKUs[$i].SkuPartNumber
        $licArray +=  Get-AzureADSubscribedSku -ObjectID $allSKUs[$i].ObjectID | Select -ExpandProperty ServicePlans
        $licArray +=  ""
    }
$licArray

# Get-MsolAccountSku
# (Get-MsolAccountSku | where {$_.AccountSkuId -eq 'xxx:POWER_BI_PRO'}).ServiceStatus


$userAccountUPN="Professor.McGonagal@xxx.com"
$AllLicenses=(Get-MsolUser -UserPrincipalName $userAccountUPN).Licenses
$licArrayUser = @()
    for($i = 0; $i -lt $AllLicenses.Count; $i++)
    {
        $licArrayUser += "License: " + $AllLicenses[$i].AccountSkuId
        $licArrayUser +=  $AllLicenses[$i].ServiceStatus
        $licArrayUser +=  ""
    }
$licArrayUser


Get-AzureADSubscribedSku | where {$_.ServicePlans -like "*bi*"}
Get-AzureADSubscribedSku | Select -Property Sku*,ConsumedUnits -ExpandProperty PrepaidUnits | where {$_.SkuPartNumber -like "*BI*"}
Get-AzureADSubscribedSku | Select  -ExpandProperty ServicePlans | where {$_.ServicePlanName -like "*BI*"}

$userAccountUPN = "april.langan@outlook.com"
Get-MsolUser -UserPrincipalName $userAccountUPN.Licenses