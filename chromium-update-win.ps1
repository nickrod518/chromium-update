Param(
    # directory to install chromium
    [string]$installDir = "C:\Program Files (x86)",
    # disable to leave source zip in downloads
    [bool]$clean = $true
)

$user = [Environment]::UserName
$source = "https://download-chromium.appspot.com/dl/Win"
$shell_app = new-object -com shell.application
$installDir = $shell_app.namespace($installDir)
$zip = "C:\Users\$user\Downloads\chrome-win32.zip"

# download chromium nightly from https://download-chromium.appspot.com/dl/Win
# alternative sites that take more work to acquire the current nightly from:
# https://storage.googleapis.com/chromium-browser-continuous/Win_x64/346679/chrome-win32.zip
# https://sites.google.com/a/chromium.org/chromedriver/downloads
$client = new-object System.Net.WebClient
$client.DownloadFile($source, $zip)

# unzip the download into the install directory
$installDir.Copyhere($shell_app.namespace($zip).items(), 0x14)

# clean up
if ($clean) { Remove-Item $zip }

exit 0