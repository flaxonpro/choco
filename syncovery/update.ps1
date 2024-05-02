import-module au

$releases = 'https://www.syncovery.com/download/windows/'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*url64bit\s*=\s*)('.*')"   = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    $url64   = $download_page.links | ? href -match '.exe$' | % href | select -First 1
    $url32   = $url64 -replace '64Setup.exe$', 'Setup.exe'
    $version = $download_page.ParsedHtml.getElementsByTagName("span") | ? innerHTML -match '^Download Syncovery' | % innerHTML | select -First 1 | %{$_.Split(" ")} | select -Index 3
	$version = $version -split "(?:(?i)(?<=^|\d)(?=[a-z])|(?<=[a-z])(?=$|\d))"
	$version = $version[0] + "." + [byte][char]$version[1]

    @{
        URL32   = 'https://www.syncovery.com' + $url32
        URL64   = 'https://www.syncovery.com' + $url64
        Version = $version
    }
}

update
