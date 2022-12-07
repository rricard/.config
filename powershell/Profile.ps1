# 1. External dependencies
$poshGitModule = Get-Module posh-git -ListAvailable | Sort-Object Version -Descending | Select-Object -First 1
if ($poshGitModule) {
    $poshGitModule | Import-Module
} else {
	echo "Install posh-git: https://github.com/dahlbyk/posh-git#installation"
}

# 2. Load alias config data
$aliasFiles = Get-ChildItem $env:XDG_CONFIG_HOME/aliases/*.csv
foreach ($aliasFile in $aliasFiles) {
  $aliases = Import-Csv $aliasFile -Header "name","command"
  foreach ($alias in $aliases) {
    $fn_name = "AliasFunction$($alias.name)"
    $invoke = "function $fn_name(`$0) { $($alias.command) `$0 }"
    echo "$invoke"
    Invoke-Expression "$invoke"
    Set-Alias -Name $alias.name -Value $fn_name
  }
}