# ============================================================
# Active Directory New User Onboarding Automation
# Help Desk / IT Support Home Lab
# Domain: corp.navtejlab.com
# ============================================================

Import-Module ActiveDirectory

# -----------------------------
# Collect new employee details
# -----------------------------

$FirstName = Read-Host "Enter first name"
$LastName  = Read-Host "Enter last name"
$Username  = Read-Host "Enter username"

# Securely request temporary password
$Password = Read-Host "Enter temporary password" -AsSecureString

# Active Directory settings
$Domain = "corp.navtejlab.com"
$OUPath = "OU=Employees,DC=corp,DC=navtejlab,DC=com"
$Group  = "IT-Support"

# -----------------------------
# Check for existing account
# -----------------------------

$ExistingUser = Get-ADUser -Filter "SamAccountName -eq '$Username'"

if ($ExistingUser) {

    Write-Host ""
    Write-Host "ERROR: User $Username already exists."
    Write-Host "No account was created."

}
else {

    # -----------------------------
    # Create Active Directory user
    # -----------------------------

    New-ADUser `
        -Name "$FirstName $LastName" `
        -GivenName $FirstName `
        -Surname $LastName `
        -SamAccountName $Username `
        -UserPrincipalName "$Username@$Domain" `
        -Path $OUPath `
        -AccountPassword $Password `
        -Enabled $true `
        -ChangePasswordAtLogon $true

    # -----------------------------
    # Add user to security group
    # -----------------------------

    Add-ADGroupMember `
        -Identity $Group `
        -Members $Username

    # -----------------------------
    # Verify onboarding
    # -----------------------------

    $CreatedUser = Get-ADUser `
        -Identity $Username `
        -Properties Enabled

    Write-Host ""
    Write-Host "=========================================="
    Write-Host " NEW USER ONBOARDING COMPLETED"
    Write-Host "=========================================="
    Write-Host "Name:       $($CreatedUser.Name)"
    Write-Host "Username:   $($CreatedUser.SamAccountName)"
    Write-Host "Enabled:    $($CreatedUser.Enabled)"
    Write-Host "OU:         Employees"
    Write-Host "Group:      $Group"
    Write-Host "Domain:     $Domain"
    Write-Host "Password:   Change required at first login"
    Write-Host "=========================================="
}
