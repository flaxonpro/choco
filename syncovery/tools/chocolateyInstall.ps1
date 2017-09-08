$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName            = 'syncovery'
  fileType               = 'exe'
  url                    = 'https://www.syncovery.com/release/SyncoverySetup.exe'
  url64bit               = 'https://www.syncovery.com/release/Syncovery64Setup.exe'
  checksum               = 'a4d91c73ad8720ae47a4d001fef3b9d103c53a15720c5c88c4890f031b80f7b6'
  checksum64             = 'd2d6f45216cf188be167d4d0cb0c605bbd6d0202425177fa85f3cffea9b304a6'
  checksumType           = 'sha256'
  checksumType64         = 'sha256'
  silentArgs             = '/VERYSILENT'
  validExitCodes         = @(0)
  softwareName           = 'syncovery*'
}
Install-ChocolateyPackage @packageArgs
