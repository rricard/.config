# 1. External dependencies
$poshGitModule = Get-Module posh-git -ListAvailable | Sort-Object Version -Descending | Select-Object -First 1
if ($poshGitModule) {
    $poshGitModule | Import-Module
} else {
	echo "Install posh-git: https://github.com/dahlbyk/posh-git#installation"
}

# 2. Load env config data
$envFiles = Get-ChildItem $env:XDG_CONFIG_HOME/env/*.csv
foreach ($envFile in $envFiles) {
	$envSetters = Import-Csv $envFile -Header "action","name","value"
	foreach ($envSetter in $envSetters) {
		$envPath = "env:$($envSetter.name)"
		$setValue = Invoke-Expression "`"$($envSetter.value)`""
		$cur = (Get-Item -Path $envPath -ErrorAction SilentlyContinue).value
		if ( $envSetter.action -eq "set" ) {
			Set-Item -Path $envPath -Value $envSetter.value
		} elseif ( $envSetter.action -eq "append" ) {
			Set-Item -Path $envPath -Value "$cur;$setValue"
		} elseif ( $envSetter.action -eq "prepend" ) {
			Set-Item -Path $envPath -Value "$setValue;$cur"
		} else {
			throw "Unknown env action: $($envSetter.action)"
		}
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
