FROM mcr.microsoft.com/powershell:latest

WORKDIR /usr/src/app/

COPY . .    

RUN pwsh -c "Install-Module 'Pode' , 'PSHTML' -Force -AllowClobber"

CMD [ "pwsh", "-c", "cd /usr/src/app; ./employee.ps1" ]