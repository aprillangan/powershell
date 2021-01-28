$now = Get-Date
$shortDate = $now.toString('yyyyMMdd')

$grpSearch = "UG-AGPMAdmins" 
$outputFile = "C:\Work\" + $grpSearch + "-Recursive_" + $shortDate + ".csv"

Get-ADGroupMember -Identity $grpSearch  -Recursive | export-csv $outputFile -Append -NoTypeInformation -Force
$grps = $_.MemberOf | Get-AdGroup -Properties CanonicalName | ForEach-Object{$CN = ($_.CanonicalName -Split "/"); "{0}\{1}" -f $CN[-2],$CN[-1]}

### OR ####


$grpUsers = Get-ADGroupMember -Identity $grpSearch | Where-Object { $_.objectClass -eq 'user' } |
Select-Object -Property @{N="SamAccountName";E={$_.SamAccountName}},@{N="InheritedFromGroup";E={"No"}} | 
export-csv $outputFile -Append -NoTypeInformation -Force
# $grpUsers.count

$grpGroups = Get-ADGroupMember -Identity $grpSearch | Where-Object { $_.objectClass -eq 'group' } 
# $grpGroups.count

foreach($grpGroup in $grpGroups){
    $grpInherited = Get-ADGroupMember -Identity $grpGroup.Name | Where-Object { $_.objectClass -eq 'user' } | 
    Select-Object -Property @{N="SamAccountName";E={$_.SamAccountName}},@{N="InheritedFromGroup";E={$grpGroup.Name}} | 
    export-csv $outputFile -Append -NoTypeInformation -Force
    
}


<#
Comment box
#>

### SANDBOX
Get-ADGroupMember -Identity $grpSearch  | Select-Object -ExpandProperty distinguishedName | ForEach-Object{$CN = ($_.distinguishedName -Split "/"); "{0}\{1}" -f $CN[-2],$CN[-1]}

$grpRecurse = Get-ADGroupMember -Identity $grpSearch  -Recursive | export-csv $outputFile -Append -NoTypeInformation -Force
 