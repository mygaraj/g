New-Variable -Name p -Value ( Get-Content ( Join-Path ($env:PSModulePath -Split ';')[0] 'g\g.txt' )) -Scope Global -Force

function g
{
    param(
    [Parameter(Mandatory=$true, HelpMessage="Write the index")]
    [int]$i
    )
    
    cd $p[$i]
}

function gg
{
    param([switch]$g)
    if($g)
    {
        $p = ( Get-Content ( Join-Path ($env:PSModulePath -Split ';')[0] 'g\g.txt' ))
    }

    $p | Select-Object @{ n = 'Index'; e = { $p.IndexOf($_) }}, @{ n = 'Path' ; e = { $_ } } | Format-Table -HideTableHeaders      
}

function ggg
{  
    Invoke-Item -LiteralPath (Join-Path ($env:PSModulePath -Split ';')[0] 'g\g.txt')
}

