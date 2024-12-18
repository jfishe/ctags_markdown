
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

$exe = Get-Command 'ctags'

$PathCtags = Get-Item -Path "$PSScriptRoot\ctags.d"
$PathTest = Get-ChildItem -Path "$PSScriptRoot\tests\*.md"

$Parameters = @(
        "--options=$PathCtags",
        "--sort=no"
        )

foreach ($item in $PathTest) {
    $TagsOut = "$($item.Directory)\$($item.BaseName)"
    &$exe $Parameters -o "$TagsOut.tags" $item 2> "$TagsOut.out"
    $ReferenceObject = Get-Content -Path "$TagsOut.tags"
    $DifferenceObject = Get-Content -Path "$TagsOut.expectedtags"
    Write-Verbose "${TagsOut}.tags"
    Write-Verbose "${TagsOut}.expectedtags"
    Compare-Object -ReferenceObject $ReferenceObject -DifferenceObject $DifferenceObject
}
