
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

$ctags_exe = Get-Command 'ctags'
$readtags_exe = Get-Command 'readtags'

$PathCtags = Get-Item -Path "$PSScriptRoot\ctags.d"
$PathTest = Get-ChildItem -Path "$PSScriptRoot\tests\*.md"

$Parameters = @(
        "--options=$PathCtags",
        "--sort=no"
        )

$ReadTags_Parameters = @(
    "--list",
    "--extension-fields",
    "--line-number"
    )
foreach ($item in $PathTest) {
    $TagsOut = "$($item.Directory)\$($item.BaseName)"
    &$ctags_exe $Parameters -o "$TagsOut.tags" $item 2> "$TagsOut.out"
    $DifferenceObject = &$readtags_exe --tag-file "$TagsOut.tags" $ReadTags_Parameters
    $ReferenceObject = &$readtags_exe --tag-file "$TagsOut.expectedtags" $ReadTags_Parameters
    Write-Verbose "${TagsOut}.tags"
    Write-Verbose "${TagsOut}.expectedtags"
    Compare-Object -ReferenceObject $ReferenceObject -DifferenceObject $DifferenceObject
}
