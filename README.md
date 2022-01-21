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
- [Dapr Official YouTube Channel](https://www.youtube.com/channel/UCtpSQ9BLB_3EXdWAUQYwnRA)

***Subscribe to my YouTube Channel***

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/BrEgBBBCLGA/0.jpg)](https://www.youtube.com/watch?v=BrEgBBBCLGA)

## Dapr'ize PowerShell Pode Application

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/TtaOfeUaNHM/0.jpg)](https://www.youtube.com/watch?v=TtaOfeUaNHM)

## Input Binding (Cron Schedule)

- [Cron Scheduler Doc](https://docs.dapr.io/reference/components-reference/supported-bindings/cron/)
- [Azure Service Bus Queue](https://docs.dapr.io/reference/components-reference/supported-bindings/servicebusqueues/)

```PowerShell
dapr run --log-level debug --app-id schedule --app-port 3000 --dapr-http-port 3500 --dapr-grpc-port 60002 --components-path .\components\  -- pwsh .\input-binding\scheduler\app.ps1
# Output
# == APP == @{Name=Chendrayan Venkatesan; Time=13:59}
```

## Input Binding (Azure Service Bus)

```PowerShell
dapr run --log-level debug --app-id servicebus --app-port 3000 --dapr-http-port 3500 --dapr-grpc-port 60002 --components-path .\components\  -- pwsh .\input-binding\azure-service-bus\app.ps1
```

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/Eeg9TFKBw08/0.jpg)](https://www.youtube.com/watch?v=Eeg9TFKBw08)

## Publish - Subscribe

- [Publish and subscribe overview](https://docs.dapr.io/developing-applications/building-blocks/pubsub/pubsub-overview/)

```PowerShell
dapr run --app-id sub-app-a --app-port 3000 --dapr-http-port 3500 -d .\components\ -- pwsh .\publish-subscribe\sub-app-a.ps1
dapr run --app-id pub-app-a --app-port 3001 -d .\components\ -- pwsh .\publish-subscribe\pub-app-a.ps1
```

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/xF8x9HoFYSs/0.jpg)](https://www.youtube.com/watch?v=xF8x9HoFYSs)

## Service To Service Invocation

- [Service Invocation Overview](https://docs.dapr.io/developing-applications/building-blocks/service-invocation/service-invocation-overview/)

> Open a `PowerShell` console host

```PowerShell
dapr run --app-id order --app-port 6001 --dapr-http-port 3601 --dapr-grpc-port 60001 -- pwsh .\service-to-service-invocation\order\app.ps1
```

> run the below command in another `PowerShell` console host

```PowerShell
dapr run --app-id checkout --app-port 6002 --dapr-http-port 3602 --dapr-grpc-port 60002 -- pwsh .\service-to-service-invocation\checkout\app.ps1
```

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/804U-u0gx84/0.jpg)](https://www.youtube.com/watch?v=804U-u0gx84)

## State Store (Azure Table Storage)

Assuming you have an Azure Storage Table in place. If not, create one using the [quick start guide](https://docs.microsoft.com/en-us/azure/storage/tables/table-storage-quickstart-portal).

> Replace the value in statestore.yaml (components/) file

```PowerShell
dapr run --log-level debug --app-id outputbinding --app-port 3000 --dapr-http-port 3500 --dapr-grpc-port 60002 --components-path .\components\ -- pwsh .\output-binding\app\app.ps1
```

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/2bdYO89usmE/0.jpg)](https://www.youtube.com/watch?v=2bdYO89usmE)

## BICEP TEMPLATE FOR AZURE CONTAINER APPS

- [BICEP TEMPLATE FOR AZURE CONTAINER APPS](https://about-powershell.com/blog/bicep-template-for-azure-container-apps/)
- Source Code and pipeline is available under template folder

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/tcFBzkf3hLo/0.jpg)](https://www.youtube.com/watch?v=tcFBzkf3hLo)


## Azure Container Apps - (End to End Automation using PowerShell & Bicep)

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/YMCJzQAfYh4/0.jpg)](https://www.youtube.com/watch?v=YMCJzQAfYh4)