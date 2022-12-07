# 1. External dependencies
$poshGitModule = Get-Module posh-git -ListAvailable | Sort-Object Version -Descending | Select-Object -First 1
if ($poshGitModule) {
    $poshGitModule | Import-Module
} else {
	echo "Install posh-git: https://github.com/dahlbyk/posh-git#installation"
}

# 2. Load env config data
#   a. Set env vars
$setEnvFiles = Get-ChildItem $env:XDG_CONFIG_HOME/env/set-*.csv
foreach ($setEnvFile in $setEnvFiles) {
	$setEnvs = Import-Csv $setEnvFile -Header "name","value"
	foreach ($setEnv in $setEnvs) {
		Set-Item -Path "env:$($setEnv.name)" -Value $setEnv.value
	}
}
#   b. Append env vars
$appendEnvFiles = Get-ChildItem $env:XDG_CONFIG_HOME/env/append-*.csv
foreach ($appendEnvFile in $appendEnvFiles) {
	$appendEnvs = Import-Csv $appendEnvFile -Header "name","value"
	foreach ($appendEnv in $appendEnvs) {
		$envPath = "env:$($appendEnv.name)"
		$cur = Get-Item -Path $envPath -ErrorAction SilentlyContinue
		Set-Item -Path $envPath -Value "$($cur.value);$($appendEnv.value)"
	}
}

# 3. Load alias config data
$aliasFiles = Get-ChildItem $env:XDG_CONFIG_HOME/aliases/*.csv
foreach ($aliasFile in $aliasFiles) {
	$aliases = Import-Csv $aliasFile -Header "name","command"
	foreach ($alias in $aliases) {
		$fn_name = "AliasFunction$($alias.name)"
		$invoke = "function $fn_name(`$0) { $($alias.command) `$0 }"
		Invoke-Expression "$invoke"
		Set-Alias -Name $alias.name -Value $fn_name
	}
}
