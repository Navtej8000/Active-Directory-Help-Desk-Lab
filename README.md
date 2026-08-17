# Active Directory Help Desk Lab
Hands-on Active Directory Help Desk lab using Windows Server, Windows 11, AD DS, Group Policy, user and group management, password policies, account lockout, and troubleshooting

## Project Overview

This project documents a hands-on Active Directory home lab built to develop practical skills for Help Desk and IT Support roles.

The lab simulates a small business Windows domain environment where I configured a Windows Server domain controller, joined a Windows 11 workstation to the domain, created and managed users and security groups, configured Group Policy security settings, and tested common account and authentication scenarios.

## Lab Environment

| Component         | Configuration                               |
| ----------------- | ------------------------------------------- |
| Virtualization    | Oracle VirtualBox                           |
| Server            | Windows Server 2016                        |
| Domain Controller | DC01                                        |
| Domain            | corp.navtejlab.com                          |
| Client            | Windows 11 Pro - CLIENT01                       |
| Directory Service | Active Directory Domain Services (AD DS)    |
| Management        | Active Directory Users and Computers (ADUC) |
| Policy Management | Group Policy Management                     |

## Skills Demonstrated

* Windows Server administration
* Active Directory Domain Services (AD DS)
* Active Directory Users and Computers (ADUC)
* Domain user account administration
* Organizational Unit (OU) management
* Security group creation and membership management
* Windows 11 domain joining
* Group Policy configuration
* Password policy administration
* Account lockout policy configuration
* Domain authentication testing
* Basic Active Directory troubleshooting
* Help Desk account and login troubleshooting

## Active Directory Configuration

### Domain Controller

Configured **DC01** as the Windows Server domain controller for:

`corp.navtejlab.com`

Active Directory Domain Services was used to centrally manage users, computers, groups, and security policies within the lab environment.

### Organizational Unit and User Management

Created an **Employees** Organizational Unit (OU) and created test domain users including:

* Sarah Johnson
* Mike Brown

This provided hands-on practice with user provisioning and Active Directory account administration commonly performed by Help Desk and IT Support technicians.

### Security Group Management

Created an **IT-Support** security group and added Sarah Johnson as a member.

This demonstrated the use of Active Directory groups to organize users and manage access based on job roles.

### Windows 11 Domain Join

Configured **CLIENT01** as a Windows 11 workstation and joined it to the `corp.navtejlab.com` domain.

This demonstrated how endpoint computers are connected to a centralized Active Directory environment and authenticated using domain accounts.

## Group Policy and Account Security

### Password Policy

Configured domain password security settings including:

* Minimum password length: **12 characters**
* Password complexity: **Enabled**
* Password history: **24 passwords remembered**
* Minimum password age: **1 day**
* Maximum password age: **90 days**
* Reversible encryption: **Disabled**

Applied the updated policies using:

`gpupdate /force`

Password-policy enforcement was then tested using a domain user account.

### Account Lockout Policy

Configured an account lockout policy to help protect domain accounts from repeated unsuccessful login attempts:

* Account lockout threshold: **5 failed attempts**
* Account lockout duration: **15 minutes**
* Reset account lockout counter after: **15 minutes**

The policy was tested by intentionally generating failed authentication attempts and verifying that the domain account was locked as expected.

## Help Desk Troubleshooting Scenario

Practiced troubleshooting a common Help Desk scenario where a user cannot sign in using their domain account.

The troubleshooting workflow included:

1. Confirming the username and identifying the exact login error.
2. Checking network and domain connectivity.
3. Checking the user's Active Directory account status.
4. Determining whether the account was locked, disabled, or affected by password expiration.
5. Unlocking or resetting the account when appropriate.
6. Testing the user's domain login from the client workstation.
7. Verifying successful access and documenting the resolution.

## Screenshots

Screenshots documenting the configuration and testing process will be included throughout this repository as evidence of the hands-on lab work.

## Next Steps

The lab will continue to expand with additional Help Desk and Windows administration tasks, including:

* DNS configuration and troubleshooting
* Reverse Lookup Zones and PTR records
* Additional Group Policy configurations
* Common Windows client troubleshooting
* PowerShell administration
* Additional real-world Help Desk scenarios

## What I Learned

This project strengthened my practical understanding of how Active Directory is used in a Windows business environment to centrally manage users, computers, groups, authentication, and security policies.

It also provided hands-on experience with common Help Desk responsibilities such as user account administration, domain login troubleshooting, password resets, account lockouts, security group membership, Group Policy, and Windows domain connectivity.
