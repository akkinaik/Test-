Param(
    [string] $bcContainerHelperVersion = "latest",
    [string] $genericImageName = ""
)

Write-Host "======================================"
Write-Host " Installing BcContainerHelper Module"
Write-Host "======================================"

# Ensure TLS 1.2 is used (required for PowerShell Gallery in some agents)
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Ensure NuGet provider exists
if (-not (Get-PackageProvider -Name NuGet -ErrorAction SilentlyContinue)) {
    Write-Host "Installing NuGet provider..."
    Install-PackageProvider -Name NuGet -Force -Scope CurrentUser
}

# Handle dev or latest versions
if ($bcContainerHelperVersion -eq "latest" -or $bcContainerHelperVersion -eq "dev") {
    Write-Host "Installing latest BcContainerHelper"
    Install-Module -Name BcContainerHelper -Force -AllowClobber -Scope CurrentUser
}
else {
    Write-Host "Installing BcContainerHelper version $bcContainerHelperVersion"
    Install-Module -Name BcContainerHelper -RequiredVersion $bcContainerHelperVersion -Force -AllowClobber -Scope CurrentUser
}

# Import module
Import-Module BcContainerHelper -Force

Write-Host "BcContainerHelper module loaded successfully"

# Optional: configure generic image
if ($genericImageName) {
    Write-Host "Setting generic image: $genericImageName"
    $bcContainerHelperConfig.genericImageName = $genericImageName
}

# Enable telemetry (optional)
$bcContainerHelperConfig.UseExtendedTelemetry = $true

Write-Host "======================================"
Write-Host " Environment ready for BC pipeline"
Write-Host "======================================"