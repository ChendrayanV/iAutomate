Start-PodeServer {
    Add-PodeEndpoint -Address * -Port 3000 -Protocol Http 

    Add-PodeRoute -Method Post -Path '/servicebus' -ScriptBlock {
        $response = [PSCustomObject]@{
            Name      = 'Chen'
            TimeStamp = $(Get-Date)
            Data      = $($WebEvent.Request.Body)
        }
        Write-PodeHost -Object $($response)
    }
} -DisableTermination