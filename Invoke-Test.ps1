
<#PSScriptInfo

.VERSION 1.0

.GUID eef73233-86d1-4564-8cfd-1495effdad75

.AUTHOR jdfen

.COMPANYNAME

.COPYRIGHT

.TAGS

.LICENSEURI

.PROJECTURI

.ICONURI

.EXTERNALMODULEDEPENDENCIES

.REQUIREDSCRIPTS

.EXTERNALSCRIPTDEPENDENCIES

.RELEASENOTES


.PRIVATEDATA

#>

<#

.DESCRIPTION
 Invoke ctags and compare expected tags file.

#>
Param()

$PathCtags = Get-Item -Path "$PSScriptRoot\ctags.d"
$PathTest = Get-ChildItem -Path "$PSScriptRoot\tests\*.md"

foreach ($item in $PathTest) {
    $TagsOut = "$($item.Directory)\$($item.BaseName)"
    ctags --verbose -o "$TagsOut.tags" $item 2> "$TagsOut.out"
    $ReferenceObject = Get-Content -Path "$TagsOut.tags"
    $DifferenceObject = Get-Content -Path "$TagsOut.expectedtags"
    Compare-Object -ReferenceObject $ReferenceObject -DifferenceObject $DifferenceObject
}
