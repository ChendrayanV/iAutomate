Start-PodeServer {
    Add-PodeEndpoint -Address * -Port 3000 -Protocol Http

    Add-PodeRoute -Method Post -Path '/process' -ScriptBlock {
        Write-PodeHost -Object $(($WebEvent.Request.Body | ConvertFrom-Json).data)
    }
} -DisableTermination