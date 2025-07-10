#code to install "company" app in program files.  Set location to share with the .msi.  Use msiexec to install and use special installation switches provided by devs.
Set-Location \\fs01\msiinstallers
msiexec /i CompanyAppInstaller.msi ALLUSERS=1 INSTALLUPDATER=1 /quiet
