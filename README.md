# iAutomate

This repository shares the DAPR demo applications built using the PowerShell modules #Pode and #PSHTML. 


## Credits 

- [Stephane Van Gulick](https://github.com/Stephanevg) - Author of PSHTML module. 
- [Matthew Kelly](https://github.com/Badgerati) - Author of Pode module. 
- [Doug Finke](https://github.com/dfinke) - One who triggered me to think deep on Microservices, through the [blog](https://dfinke.github.io/powershell,%20docker,%20pode/2020/08/01/PowerShell-Microservice-Hello-World.html)
- Maintainers of Polaris module. If I know something in the web framework, that is because of the Polaris module. 
    - [Tyler Leonhardt](https://twitter.com/TylerLeonhardt)
    - [Micah Rairdon](https://twitter.com/tiberriver256)

## References

- [Pode](https://github.com/Badgerati/Pode)
- [Polaris](https://github.com/powershell/polaris)
- [PSHTML](https://github.com/Stephanevg/PSHTML)
- [Dapr Docs](https://dapr.io/)
- [Install the Dapr CLI](https://docs.dapr.io/getting-started/install-dapr-cli/)
- [Azure Container Apps](https://azure.microsoft.com/en-in/pricing/details/container-apps/)

***Subscribe to my YouTube Channel***

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/BrEgBBBCLGA/0.jpg)](https://www.youtube.com/watch?v=BrEgBBBCLGA)

## Dapr'ize PowerShell Pode Application

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/TtaOfeUaNHM/0.jpg)](https://www.youtube.com/watch?v=TtaOfeUaNHM)

## Output Binding (Azure Table Storage)

Assuming you have an Azure Storage Table in place. If not, create one using the [quick start guide](https://docs.microsoft.com/en-us/azure/storage/tables/table-storage-quickstart-portal).

> Replace the value in statestore.yaml (output-binding/components/) file

```PowerShell
dapr run --log-level debug --app-id outputbinding --app-port 3000 --dapr-http-port 3500 --dapr-grpc-port 60002 --components-path .\output-binding\components\ -- pwsh .\output-binding\app\app.ps1
```

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/2bdYO89usmE/0.jpg)](https://www.youtube.com/watch?v=2bdYO89usmE)

## BICEP TEMPLATE FOR AZURE CONTAINER APPS

- [BICEP TEMPLATE FOR AZURE CONTAINER APPS](https://about-powershell.com/blog/bicep-template-for-azure-container-apps/)

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/tcFBzkf3hLo/0.jpg)](https://www.youtube.com/watch?v=tcFBzkf3hLo)

