# ==============================================================================
# Script: Import-CorpUsers.ps1
# Description: Automates bulk ingestion of corporate users from mock_users.csv
#              into target Organizational Units (OUs) based on Department.
# ==============================================================================

# 1. Define Paths and Variables
$csvPath = "C:\Path\To\Your\mock_users.csv" # <-- CHANGE THIS to your actual CSV path
$domainDN = "DC=corp,DC=local"
$parentOU = "OU=Corp-Departments,$domainDN"
$defaultPassword = "WelcomeToCorp2026!"

# Check if CSV exists before proceeding
if (-not (Test-Path $csvPath)) {
    Write-Error "[!] Error: The CSV file at '$csvPath' was not found. Please verify the path."
    Exit
}

# 2. Import CSV and Loop
$users = Import-Csv -Path $csvPath

foreach ($user in $users) {
    # Extract properties
    $firstName  = $user.FirstName
    $lastName   = $user.LastName
    $username   = $user.Username
    $email      = $user.Email
    $dept       = $user.Department # Expecting "IT", "HR", or "Finance"
    
    # Format the full Display Name
    $displayName = "$firstName $lastName"
    
    # Dynamically determine the Target OU Path
    $targetOUPath = "OU=$dept,$parentOU"
    
    # Generate User Principal Name (UPN)
    $upn = "$username@corp.local"
    
    # 3. Create Secure String Password
    $securePassword = ConvertTo-SecureString $defaultPassword -AsPlainText -Force
    
    # 4. Check if User Already Exists to prevent errors
    $existingUser = Get-ADUser -Filter "SamAccountName -eq '$username'"
    
    if ($existingUser) {
        Write-Host "[-] User '$username' already exists in AD. Skipping..." -ForegroundColor Yellow
    } else {
        try {
            # 5. Execute User Provisioning Command
            New-ADUser -Name $displayName `
                       -GivenName $firstName `
                       -Surname $lastName `
                       -SamAccountName $username `
                       -UserPrincipalName $upn `
                       -EmailAddress $email `
                       -Department $dept `
                       -Path $targetOUPath `
                       -AccountPassword $securePassword `
                       -ChangePasswordAtLogon $true `
                       -Enabled $true
            
            Write-Host "[+] Successfully provisioned: $displayName ($username) -> OU=$dept" -ForegroundColor Green
        }
        catch {
            Write-Host "[!] Failed to create user $displayName. Error: $_" -ForegroundColor Red
        }
    }
}
