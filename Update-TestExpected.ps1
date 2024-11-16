
<#PSScriptInfo

.VERSION 1.0

.GUID 2226393d-20b7-4def-9645-d4a1d85e870b

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
 Invoke ctags to generate expected tags files.

#>
[CmdletBinding()]
Param()

$exe = Get-Command 'ctags'

$PathCtags = (Get-Item -Path "$PSScriptRoot\ctags.d")
$PathTest = Get-ChildItem -Path "$PSScriptRoot\tests\*.md"

$Parameters = @(
        "--options=$PathCtags",
        "--sort=no"
        )

foreach ($item in $PathTest) {
    $TagsOut = "$($item.Directory)\$($item.BaseName)"
    $Outfile = "${TagsOut}.expectedtags"
    Remove-Item $Outfile -ErrorAction SilentlyContinue
    Write-Verbose $item
    Write-Verbose $Outfile
    &$exe $Parameters -o "$Outfile" "$item"
}
