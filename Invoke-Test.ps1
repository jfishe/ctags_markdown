
<#PSScriptInfo

.VERSION 1.0

.GUID eef73233-86d1-4564-8cfd-1495effdad75

.AUTHOR jdfenw@gmail.com

.COMPANYNAME John D. Fisher

.COPYRIGHT 2024 John D. Fisher

.TAGS

.LICENSEURI https://github.com/jfishe/ctags_markdown/blob/main/LICENSE

.PROJECTURI https://github.com/jfishe/ctags_markdown

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
[CmdletBinding()]
Param()

$PathCtags = (Get-Item -Path "$PSScriptRoot\ctags.d").ToString()
$Length = $PathCtags.Length - 1
$PathCtags = $PathCtags.Substring(0,$Length)
$PathTest = Get-ChildItem -Path "$PSScriptRoot\tests\*.md"

$Options = "--verbose --options=$PathCtags --sort=no"

foreach ($item in $PathTest) {
    $TagsOut = "$($item.Directory)\$($item.BaseName)"
    ctags $Options -o "$TagsOut.tags" $item 2> "$TagsOut.out"
    $ReferenceObject = Get-Content -Path "$TagsOut.tags"
    $DifferenceObject = Get-Content -Path "$TagsOut.expectedtags"
    Write-Verbose "${TagsOut}.tags"
    Write-Verbose "${TagsOut}.expectedtags"
    Compare-Object -ReferenceObject $ReferenceObject -DifferenceObject $DifferenceObject
}
