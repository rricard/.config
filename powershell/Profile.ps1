# 1. External dependencies
$poshGitModule = Get-Module posh-git -ListAvailable | Sort-Object Version -Descending | Select-Object -First 1
if ($poshGitModule) {
    $poshGitModule | Import-Module
} else {
	echo "Install posh-git: https://github.com/dahlbyk/posh-git#installation"
}