Start-PodeServer {
    Add-PodeEndpoint -Address * -Port 3000 -Protocol Http 

    Add-PodeRoute -Method Post -Path '/order' -ScriptBlock {
        $order = [PSCustomObject]@{
            Name = Value
        } | ConvertTo-Json
        $data = [PSCustomObject]@{
            key   = $([string]::Concat('Client Request', '-', (Get-Random -Minimum 1 -Maximum 100)))
            value = $($order)
        }
        $response = Invoke-RestMethod -Uri 'http://localhost:3500/v1.0/publish/pubsub/order' -Body $data -Method Post -ContentType 'application/json'
        Write-PodeHost -Object ($response)
    }
} -DisableTermination