$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName            = 'syncovery'
  fileType               = 'exe'
  url                    = 'https://www.syncovery.com/release/Syncovery64Setup.exe'
  url64bit               = 'https://www.syncovery.com/release/SyncoverySetup.exe'
  checksum               = 'eef9570fc9be53aa025f39ef6997c4802769d19d95c056b6978b8e1d87d4479c'
  checksum64             = 'ce27356c2d7741889f8d2a7a33caba69e163947e2a1de85acb3774ea5bbdbf37'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  silentArgs             = '/VERYSILENT'
  validExitCodes         = @(0)
  softwareName           = 'syncovery*'
}
Install-ChocolateyPackage @packageArgs
