function Set-Predefined-Locations
{
    $LocationsFile = Join-Path ($env:PSModulePath -Split ';')[0] 'g\g.txt'   
    New-Variable -Name p -Value (Get-Content $LocationsFile ) -Scope Global -Force
}

Set-Predefined-Locations

function g
{
    
    [Cmdletbinding()]
    param(
    [Parameter(Mandatory=$true, HelpMessage="Provide the index of path. Use gg to get all the paths.")]
    [int]$i
    )
    
    Push-Location $p[$i] -StackName p
}

function gg
{
    param([switch]$g)
    if($g)
    {
       Set-Predefined-Locations
    }

    $p | Select-Object @{ n = 'Index'; e = { $p.IndexOf($_) }}, @{ n = 'Path' ; e = { $_ } },@{ n = 'Index2'; e = { $p.IndexOf($_) }} 
}

function ggg
{
    
}

function gggg
{  
    Invoke-Item -LiteralPath (Join-Path ($env:PSModulePath -Split ';')[0] 'g\g.txt')
}

