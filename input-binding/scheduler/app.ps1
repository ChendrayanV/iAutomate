Start-PodeServer {
    Add-PodeEndpoint -Address * -Port 3000 -Protocol Http 

    Add-PodeRoute -Method Post -Path '/schedule' -ScriptBlock {
        $response = [PSCustomObject]@{
            Name = 'Chendrayan Venkatesan'
            Time = $(Get-Date).ToShortTimeString()
        }
        Write-PodeHost -Object $($response)
    }
} -DisableTermination