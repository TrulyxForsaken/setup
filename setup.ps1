Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions
#Enable-RemoteDesktop

function Install-NeededFor {
param([string]$packageName = '')
  if ($packageName -eq '') {return $false}

  $yes = '6'
  $no = '7'
  $msgBoxTimeout='-1'

  $answer = $msgBoxTimeout
  try {
    $timeout = 10
    $question = "Do you need to install $($packageName)? Defaults to 'Yes' after $timeout seconds"
    $msgBox = New-Object -ComObject WScript.Shell
    $answer = $msgBox.Popup($question, $timeout, "Install $packageName", 0x4)
  }
  catch {
  }

  if ($answer -eq $yes -or $answer -eq $msgBoxTimeout) {
    write-host 'returning true'
    return $true
  }
  return $false
}

#install chocolatey
if (Install-NeededFor 'chocolatey') {
  iex ((new-object net.webclient).DownloadString('http://bit.ly/psChocInstall')) 
}

# install nuget, ruby.devkit, and ruby if they are missing
cinstm nuget.commandline

if (Install-NeededFor 'ruby / ruby devkit') {
  cinstm ruby.devkit
  #cinstm ruby #devkit install will automatically install ruby
}

#perform ruby updates and get gems
gem update --system
gem install rake
gem install bundler

choco feature enable -n allowGlobalConfirmation
choco install chocolatey-core.extension
choco install jre8 -y
choco install conemu
choco install firefox
choco install notepadplusplus.install
choco install git.install
choco install sysinternals
choco install 7zip.install
choco install filezilla
choco install chocolatey-nexus-repo
choco install python3
choco install git-credential-manager-for-windows
choco install gitextensions
choco install vscode-prettier
choco install editorconfig.vs
choco install vscode-intellicode
choco install chocolatey-vscode
choco install git-cola
choco install ethanbrown.gitconfiguration
choco install oh-my-posh
choco install boxstarter.chocolatey
choco install hot-chocolatey
choco install chocolatey-isomount.extension
choco install choco-shortcuts-winconfig
choco install chocomon
choco install IIS-WebServerRole --source windowsfeatures
choco install zip.template
choco install curl
choco install chocolatey-appstore-chrome
choco install chocomaint
choco install chocolatey-vscode
choco install chocomaint
choco install nodejs
choco install choco-package-list-backup
choco install choco-install-packages-from-web-winconfig
choco install ccleaner
choco install chocolatey-dotnetfx.extension
choco install silverlight
choco install python2
choco install IISExpress --source webpi
choco install chocolatey-visualstudio.extension
choco install sysinternals
choco install bash --source cygwin
choco install notepadplusplus googlechrome atom 7zip
choco install notepadplusplus --force --force-dependencies
choco install notepadplusplus googlechrome atom 7zip -dvfy
choco install git -y --params="'/GitAndUnixToolsOnPath /NoAutoCrlf'"
choco install git -y --params="'/GitAndUnixToolsOnPath /NoAutoCrlf'" --install-args="'/DIR=C:\git'"
# Params are package parameters, passed to the package
# Install args are installer arguments, appended to the silentArgs
#  in the package for the installer itself


choco install malwarebytes

choco install powershell
choco install putty.install

cinst fiddler4
cinst git-credential-winstore
cinst console-devel
cinst sublimetext2
cinst poshgit
cinst dotpeek


cinst Microsoft-Hyper-V-All -source windowsFeatures
cinst IIS-WebServerRole -source windowsfeatures
