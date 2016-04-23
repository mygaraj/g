[CmdletBinding()]
Param()

$gModuleDir = Join-Path ( $env:PSModulePath -Split ';')[0] 'g'

if(Test-Path $gModuleDir)
{
    ri $gModuleDir -Recurse -Force
    if(Test-Path $gModuleDir)
    {
        Write-Verbose "Uninstall failed"
    } else
    {
        Write-Verbose "Uninstall ok"
    }
}
else
{
    Write-Verbose "Uninstalled earier"
}