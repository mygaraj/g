<#
    .SYNOPSIS
        Install 'G' as Powershell Module
    .DESCRIPTION
        Install create new module g copy the module files. Copy file with locations if not exists.        
    .LINK
        about_Modules
#>
[CmdletBinding()]
Param()

$gModuleDir = Join-Path ( $env:PSModulePath -Split ';')[0] 'g'
$gModule = Join-Path $gModuleDir g.psm1
$gFiles = Join-Path $gModuleDir g.txt


if(-not (Test-Path $gModuleDir))
{
    New-Item -Type Directory -Path $gModuleDir | Out-Null
}

copy g.psm1 $gModuleDir -Force

if( -not (Test-Path $gFiles))
{
    copy g.txt $gFiles
}

if( (Test-Path $gModuleDir) -and (Test-Path $gModule) -and (Test-Path $gFiles) -and (-not( compare ( cat g.psm1) (cat $gModule))))
{
   Write-Verbose "install ok"
} else 
{
   Write-Error "install went wrong"
}